﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using DAL.Data.Entities;
using DAL.EF;
using DAL.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace OnlineStore.Areas.Identity.Pages.Account.Manage
{
    public class AddressBookModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly ILogger<ChangePasswordModel> _logger;
        private readonly IAddressRepository _addressRepository;
        private readonly IDefaultAddressRepository _defaultAddressRepository;

        public AddressBookModel(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            ILogger<ChangePasswordModel> logger,
            IAddressRepository addressRepository,
            IDefaultAddressRepository defaultAddressRepository)
        {
            _userManager = userManager;
            _defaultAddressRepository = defaultAddressRepository;
            _addressRepository = addressRepository;
            _signInManager = signInManager;
            _logger = logger;
        }

        [BindProperty]
        public InputModel Input { get; set; }
        [BindProperty]
        public List<Address> Addresses { get; set; }
        [BindProperty]
        public DefaultAddress DefaultAddress { get; set; }
        [TempData]
        public string StatusMessage { get; set; }

        public class InputModel
        {
            public string RecipientName { get; set; }
            public string PhoneNumber { get; set; }
            public string Detail { get; set; }
            public string Region { get; set; }
            //[Required]
            //[DataType(DataType.Password)]
            //[Display(Name = "Current password")]
            //public string OldPassword { get; set; }

            //[Required]
            //[StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
            //[DataType(DataType.Password)]
            //[Display(Name = "New password")]
            //public string NewPassword { get; set; }

            //[DataType(DataType.Password)]
            //[Display(Name = "Confirm new password")]
            //[Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
            //public string ConfirmPassword { get; set; }
        }

        public async Task<IActionResult> OnGetAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            //var hasPassword = await _userManager.HasPasswordAsync(user);
            //if (!hasPassword)
            //{
            //    return RedirectToPage("./SetPassword");
            //}
            Addresses = _addressRepository.GetSome(x => x.CustomerId == user.Id && x.IsDeleted == false && x.ShowRoomAddressId == null).ToList();
            DefaultAddress = _defaultAddressRepository.GetSome(da => da.CustomerId == user.Id && da.IsDeleted == false).FirstOrDefault();
            return Page();
        }

        public async Task<IActionResult> OnGetById(int id)
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            //var hasPassword = await _userManager.HasPasswordAsync(user);
            //if (!hasPassword)
            //{
            //    return RedirectToPage("./SetPassword");
            //}
            var address = _addressRepository.GetSome(x => x.CustomerId == user.Id && x.IsDeleted == false && x.Id == id).FirstOrDefault();
            //DefaultAddress = _defaultAddressRepository.GetSome(da => da.CustomerId == user.Id && da.IsDeleted == false).FirstOrDefault();
            return new OkObjectResult(address);
            //return Page();
        }

        public async Task<IActionResult> OnPostUpdateDefaultAddress([FromBody] Address address)
        {
            if (!ModelState.IsValid)
            {
                return new BadRequestResult();
            }

            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                //return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
                return new BadRequestResult();
            }

            //var defaultAddress = _defaultAddressRepository.GetSome(x => x.CustomerId == user.Id && x.AddressId == address.Id && x.IsDeleted == false).FirstOrDefault();
            var defaultAddresses = _defaultAddressRepository.GetSome(x => x.CustomerId == user.Id);
            if (defaultAddresses?.Any() == true)
            {
                _defaultAddressRepository.DeleteRangeForever(defaultAddresses);
            }

            _defaultAddressRepository.Add(new DefaultAddress()
            {
                AddressId = address.Id,
                CustomerId = user.Id,
                DateCreated = DateTime.Now,
                DateModified = DateTime.Now,
                IsDeleted = false
            });


            //var changePasswordResult = await _userManager.ChangePasswordAsync(user, Input.OldPassword, Input.NewPassword);
            //if (!changePasswordResult.Succeeded)
            //{
            //    foreach (var error in changePasswordResult.Errors)
            //    {
            //        ModelState.AddModelError(string.Empty, error.Description);
            //    }
            //    return Page();
            //}

            //await _signInManager.RefreshSignInAsync(user);
            //_logger.LogInformation("User changed their password successfully.");
            //StatusMessage = "Your password has been changed.";

            //return RedirectToPage();
            return new OkResult();
        }
    }
}
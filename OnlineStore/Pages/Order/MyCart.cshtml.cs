﻿using System.Collections.Generic;
using DAL.Models;
using DAL.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using OnlineStore.Extensions;
using OnlineStore.Models.ViewModels;

namespace OnlineStore.Pages.Order
{
    public class MyCartModel : PageModel
    {
        //private readonly ICartDetailRepository _cartDetailRepository;
        //private readonly ICartRepository _cartRepository;
        //private readonly IItemRepository _itemRepository;
        //public IList<CustomerCartViewModel> CustomerCartViewModel { get; set; }

        //public MyCartModel(ICartDetailRepository cartDetailRepository, ICartRepository cartRepository, IItemRepository itemRepository)
        //{
        //    _cartDetailRepository = cartDetailRepository;
        //    _cartRepository = cartRepository;
        //    _itemRepository = itemRepository;
        //    CustomerCartViewModel = new List<CustomerCartViewModel>();
        //}

        //public IActionResult OnGet()
        //{
        //    Customer cus = HttpContext.Session.Get<Customer>("Customer");
        //    if (cus == null)
        //    {
        //        return RedirectToPage("/Home/Index");
        //    }
        //    DAL.Models.Cart cart = _cartRepository.GetCartByCustomerId(cus.Id);
        //    IEnumerable<CartDetail> cartItems = _cartDetailRepository.GetItems(c => c.CartId == cart.Id);
        //    foreach (CartDetail itemInCart in cartItems)
        //    {
        //        Item item = _itemRepository.Find(itemInCart.ItemId);
        //        CustomerCartViewModel customerCart = new CustomerCartViewModel()
        //        {
        //            CartId = cart.Id,
        //            Image = item.Image,
        //            ItemId = item.Id,
        //            ItemName = item.Name,
        //            Price = item.Price,
        //            Quantity = itemInCart.Quantity,
        //        };
        //        customerCart.Subtotal = customerCart.Quantity * customerCart.Price;
        //        CustomerCartViewModel.Add(customerCart);
        //    }
        //    return Page();
        //}

        //public IActionResult OnPost()
        //{

        //}
    }
}
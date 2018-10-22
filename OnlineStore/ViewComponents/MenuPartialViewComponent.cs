﻿using DAL.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace OnlineStore.ViewComponents
{
    public class MenuPartialViewComponent : ViewComponent
    {
        private readonly IItemRepository _itemRepository;

        public MenuPartialViewComponent(IItemRepository itemRepository)
        {
            _itemRepository = itemRepository;
        }

        public IViewComponentResult Invoke()
        {
            //Truy vấn lấy về 1 list các sản phẩm
            var lstSP = _itemRepository.GetAll();
            //var lstSP = _itemRepository. db.SANPHAMs;
            return View("Default", lstSP);
        }
    }
}

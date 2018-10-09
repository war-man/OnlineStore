﻿using System;
using System.Collections.Generic;

namespace OnlineStore.Models
{
    public partial class LineItem
    {
        public int OrderId { get; set; }
        public int ItemId { get; set; }
        public int? Quantity { get; set; }
        public byte[] Timestamp { get; set; }
        public decimal? Amount { get; set; }

        public Item Item { get; set; }
        public Order Order { get; set; }
    }
}
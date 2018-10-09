﻿using System;
using System.Collections.Generic;

namespace OnlineStore.Models
{
    public partial class Order
    {
        public Order()
        {
            LineItem = new HashSet<LineItem>();
        }

        public int Id { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public decimal? Bonus { get; set; }
        public int? EmployeeId { get; set; }
        public int? CustomerId { get; set; }
        public decimal? ShippingFee { get; set; }
        public int? Status { get; set; }
        public byte[] Timestamp { get; set; }

        public User Customer { get; set; }
        public ICollection<LineItem> LineItem { get; set; }
    }
}
﻿using System;
using System.Collections.Generic;

namespace OnlineStore.Models
{
    public partial class Comment
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public int? ItemId { get; set; }
        public int? Evaluation { get; set; }

        public Item Item { get; set; }
    }
}
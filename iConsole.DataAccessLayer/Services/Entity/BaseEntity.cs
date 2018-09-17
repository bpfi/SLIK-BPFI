﻿using System.Collections.Generic;

namespace iConsole.DataAccessLayer.ApiServices.Entity
{
    public class BaseEntity
    {
        public bool lastPage { get; set; }
       
        public int numberOfElements { get; set; }
       
        public string sort { get; set; }
       
        public int totalElements { get; set; }
       
        public bool firstPage { get; set; }
       
        public int number { get; set; }
       
        public int size { get; set; }
    }
}
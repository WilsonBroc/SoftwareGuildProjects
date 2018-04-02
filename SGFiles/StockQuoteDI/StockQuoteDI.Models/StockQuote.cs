using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockQuoteDI.Models
{
    public class StockQuote
    {
        public string Symbol { get; set; }
        public string CompanyName { get; set; }
        public decimal StockPrice { get; set; }
    }
}

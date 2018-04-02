using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.Models;

namespace StockQuoteDI
{
    public static class DisplayScreens
    {
        public static void DisplayQuotes(List<StockQuote> quotes)
        {
            Console.Clear();
            Console.WriteLine("Stock Data");
            Console.WriteLine("--------------------------------");
            foreach (var stockQuote in quotes)
            {
                Console.WriteLine("{0} {1} - {2}", stockQuote.Symbol, 
                    stockQuote.CompanyName, stockQuote.StockPrice);
            }
        }
    }
}

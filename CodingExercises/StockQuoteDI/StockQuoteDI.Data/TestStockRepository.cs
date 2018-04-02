using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.Models;

namespace StockQuoteDI.Data
{
    public class TestStockRepository : IStockRepository
    {
        public List<StockQuote> GetStockQuoteInformation(string symbols)
        {
            var results = new List<StockQuote>();

            var rng = new Random();
            var stockSymbols = symbols.Split(' ');

            foreach (var s in stockSymbols)
            {
                results.Add(new StockQuote()
                {
                    Symbol = s,
                    CompanyName = s + " Company",
                    StockPrice = rng.Next(1,1001)
                });
            }

            return results;
        }
    }
}

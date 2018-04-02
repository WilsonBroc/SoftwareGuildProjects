using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.Models;

namespace StockQuoteDI.Data
{
    public static class StockRepositoryFactory
    {
        public static IStockRepository CreateStockRepository(string type)
        {
            switch (type.ToUpper())
            {
                case "G":
                    return new GoogleStockRepository();
                case "Y":
                    return new YahooStockRepository();
                default:
                    return new TestStockRepository();
            }
        }
    }
}

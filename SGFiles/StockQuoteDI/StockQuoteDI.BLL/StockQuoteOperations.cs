using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.Data;
using StockQuoteDI.Models;

namespace StockQuoteDI.BLL
{
    public class StockQuoteOperations
    {
        private IStockRepository _repo;

        public StockQuoteOperations(string type)
        {
            _repo = StockRepositoryFactory.CreateStockRepository(type);
        }

        public List<StockQuote> RetrieveQuotes(string symbols)
        {
            return _repo.GetStockQuoteInformation(symbols);
        }
    }
}

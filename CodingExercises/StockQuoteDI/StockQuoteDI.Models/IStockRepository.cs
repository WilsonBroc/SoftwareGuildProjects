using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockQuoteDI.Models
{
    public interface IStockRepository
    {
        List<StockQuote> GetStockQuoteInformation(string symbols);
    }
}

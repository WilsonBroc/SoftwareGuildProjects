using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.Models;

namespace StockQuoteDI.Data
{
    public class GoogleStockRepository : IStockRepository
    {
        public List<StockQuote> GetStockQuoteInformation(string symbols)
        {
            var results = new List<StockQuote>();
            var allSymbols = symbols.Split(' ');

            foreach (var s in allSymbols)
            {
                results.Add(FetchQuote(s));
            }

            return results;
        }

        private StockQuote FetchQuote(string symbol)
        {
            string url = "http://finance.google.com/finance/info?client=ig&q=" + symbol;

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse resp = (HttpWebResponse)req.GetResponse();

            StreamReader sr = new StreamReader(resp.GetResponseStream());
            string data = sr.ReadToEnd();
            sr.Close();

            var result = new StockQuote();
            int start = data.IndexOf("\"l\" : \"") + 7;
            int end = (data.IndexOf("\"l_fix\"") - 3) - start;
            string price = data.Substring(start, end);
            result.CompanyName = symbol;
            result.Symbol = symbol;
            result.StockPrice = decimal.Parse(price);

            return result;
        }
    }
}

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
    public class YahooStockRepository : IStockRepository
    {
        public List<StockQuote> GetStockQuoteInformation(string symbols)
        {
            var results = new List<StockQuote>();

            string url = "http://finance.yahoo.com/d/quotes.csv?s=" + symbols.Replace(' ', '+') + "&f=sna";

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse resp = (HttpWebResponse)req.GetResponse();

            StreamReader sr = new StreamReader(resp.GetResponseStream());
            string data = sr.ReadToEnd();
            sr.Close();

            string[] lines = data.Split('\n');
            foreach (var line in lines)
            {
                if (line.Length > 0)
                {
                    var lineData = line.Split(',');

                    try
                    {
                        results.Add(new StockQuote
                        {
                            Symbol = lineData[0],
                            CompanyName = lineData[1],
                            StockPrice = decimal.Parse(lineData[2])
                        });
                    }
                    catch
                    {
                        Console.WriteLine("Error loading symbol: {0}", lineData[0]);
                    }
                }
            }

            return results;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StockQuoteDI.BLL;
using StockQuoteDI.Models;

namespace StockQuoteDI.Workflows
{
    public class StockQuoteWorkflow
    {
        public void Execute()
        {
            string type = UserPrompts.PromptForType();
            string symbols = UserPrompts.PromptForSymbols();

            StockQuoteOperations ops = new StockQuoteOperations(type);

            List<StockQuote> quotes = ops.RetrieveQuotes(symbols);
            DisplayScreens.DisplayQuotes(quotes);

            Console.ReadLine();
        }

        
    }
}

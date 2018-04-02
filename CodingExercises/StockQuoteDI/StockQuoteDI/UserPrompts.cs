using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockQuoteDI
{
    public static class UserPrompts
    {
        public static string PromptForType()
        {
            Console.WriteLine("Select Provider - (G)oogle, (Y)ahoo, or (T)est");
            Console.Write("Provider: ");
            return Console.ReadLine();
        }

        public static string PromptForSymbols()
        {
            Console.WriteLine("Enter company symbols seperated by a space");
            Console.Write("Symbols: ");
            return Console.ReadLine();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factorizor.BLL;
using Factorizor.Models;

namespace Factorizor.UI.Workflows
{
    public class FactorWorkflow
    {
        public void Execute()
        {
            Console.WriteLine("*****  Factorizor App  *********\n");
            Console.WriteLine("Enter a number: ");
            int number = int.Parse(Console.ReadLine());

            FactorChecker checker = new FactorChecker();
            Factors result = checker.CheckFactors(number);

            PrintResults(result);
            Console.ReadLine();
        }

        private void PrintResults(Factors factors)
        {
            Console.Clear();
            Console.WriteLine("************ Results **************");
            Console.WriteLine("\n\nThe factors of {0} are:", factors.Number);
            foreach (int num in factors.MyFactors)
            {
                Console.WriteLine("{0}", num);
            }
            Console.WriteLine("\n{0} is perfect: {1}", factors.Number, factors.IsPerfect);
            Console.WriteLine("\n{0} is prime: {1}", factors.Number, factors.IsPrime);
        }
    }
}

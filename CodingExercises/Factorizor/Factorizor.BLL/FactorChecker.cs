using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factorizor.Models;

namespace Factorizor.BLL
{
    public class FactorChecker
    {
        public Factors CheckFactors(int number)
        {
            Factors result = new Factors();

            result.Number = number;
            result.MyFactors = GetFactors(number);
            result.IsPerfect = CheckIsPerfect(result);
            result.IsPrime = result.MyFactors.Count == 1;

            return result;
        }

        private bool CheckIsPerfect(Factors factors)
        {
            int sum = 0;
            foreach (int number in factors.MyFactors)
            {
                sum += number;
            }
            return sum == factors.Number;
        }

        private List<int> GetFactors(int number)
        {
            List<int> result = new List<int>();

            for (int i = 1; i < number; i++)
            {
                if (number%i == 0)
                {
                    result.Add(i);
                }
            }

            return result;
        }
    }
}

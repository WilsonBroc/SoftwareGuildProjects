using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringCalculatorKata
{
    public class Calculator
    {
        public int Add(string numbers)
        {
            if (string.IsNullOrEmpty(numbers))
            {
                return 0;
            }
            else
            {
                if (numbers.Contains(","))
                {
                    string[] splitNumbers = numbers.Split(',');

                    int sum = 0;

                    for (int i = splitNumbers.Length-1; i >= 0; i--)
                    {
                        sum += int.Parse(splitNumbers[i]);
                    }

                    return sum;
                }
                return int.Parse(numbers);                
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicIO
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("***** Basic Console I/O *****");
            GetUserData();
            Console.ReadLine();
            Console.Clear();

            // John says...
            Console.WriteLine("{0}, Number {0}, Number {0}", 9);

            // Prints: 20, 10, 30
            Console.WriteLine("{1}, {0}, {2}", 10, 20, 30);
            Console.ReadLine();
            Console.Clear();

            DemonstrateAlignment();

            Console.ReadLine();
            Console.Clear();

            FormatNumericalData();

            Console.ReadLine();
        }

        static void GetUserData()
        {
            // Get name and age.
            Console.Write("Please enter your name: ");
            string userName = Console.ReadLine();

            Console.Write("Please enter your age: ");
            string userAge = Console.ReadLine();

            // Change echo color, just for fun.
            ConsoleColor prevColor = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Yellow;

            // Echo to the console.
            Console.WriteLine("Hello {0}!  You are {1} years old.",
              userName, userAge);

            // Restore previous color.
            Console.ForegroundColor = prevColor;

        }

        static void DemonstrateAlignment()
        {
            LeftAlign();
            RightAlign();
        }

        static void LeftAlign()
        {
            string lineOutputFormat = "{0,-15} {1,-2} {2,-5}";
            Console.WriteLine(lineOutputFormat, "John Doe", "OH", "44113");
            Console.WriteLine(lineOutputFormat, "Jane Doe", "NY", "12065");
            Console.WriteLine(lineOutputFormat, "Cheech Marin", "CA", "90210");
            Console.ReadLine();
            Console.Clear();
        }

        static void RightAlign()
        {
            Console.WriteLine("Account Balances");
            string lineOutputFormat = "{0,-15} {1,15:C}";
            Console.WriteLine(lineOutputFormat, "A12345678", 5302.327);
            Console.WriteLine(lineOutputFormat, "A392848293", 27.32);
            Console.WriteLine(lineOutputFormat, "A20859329", 32706.00); // this one will overflow
            Console.ReadLine();
            Console.Clear();

        }

        static void FormatNumericalData()
        {
            Console.WriteLine("The value of 99999 in various formats");
            Console.WriteLine("c format: {0:c}", 99999);
            Console.WriteLine("d9 format: {0:d9}", 99999);
            Console.WriteLine("f3 format: {0:f3}", 99999);

            Console.WriteLine("E format: {0:E}", 99999);
            Console.WriteLine("e format: {0:e}", 99999);
            Console.WriteLine("X format: {0:X}", 99999);
            Console.WriteLine("x format: {0:x}", 99999);
        }
    }
}

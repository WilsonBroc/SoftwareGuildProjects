using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IComparableExample
{
    class Program
    {
        static void Main(string[] args)
        {
            var ints = new int[] {5, 3, 17, 4, 3, 25, 1};

            Array.Sort(ints);

            foreach (var i in ints)
            {
                Console.WriteLine(i);
            }


            var temps = new Temperature[]
            {
                new Temperature() {Fahrenheit = 32},
                new Temperature() {Fahrenheit = 212},
                new Temperature() {Fahrenheit = 100},
                new Temperature() {Fahrenheit = 50},
                new Temperature() {Fahrenheit = 45}

            }; 

            Array.Sort(temps);

            Console.WriteLine("\n\nTemps:");
            foreach (var temperature in temps)
            {
                Console.WriteLine($"{temperature.Fahrenheit} - F = {temperature.Celsius} - C");
            }

            Console.ReadLine();
        }
    }
}

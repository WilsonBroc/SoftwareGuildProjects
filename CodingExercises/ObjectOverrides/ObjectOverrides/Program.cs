using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectOverrides
{
    class Program
    {
        static void Main(string[] args)
        {
            Point p1 = new Point(1,4);

            Console.WriteLine(p1.ToString());

            Point p2 = new Point(1,3);

            Console.WriteLine(p2.ToString());

            Console.WriteLine(object.Equals(p1,p2));

            Point p3 = new Point(1,3);

            Console.WriteLine(p3.ToString());

            Console.WriteLine(object.Equals(p2, p3));

            Console.ReadLine();
        }
    }
}

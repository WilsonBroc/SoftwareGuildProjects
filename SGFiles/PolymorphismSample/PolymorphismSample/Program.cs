using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Shape> shapes = new List<Shape>();
            shapes.Add(new Shape());
            shapes.Add(new Square());
            shapes.Add(new Triangle());
            shapes.Add(new Diamond());
            shapes.Add(new Circle() {Radius = 10.5m});


            foreach (var s in shapes)
            {
                Console.WriteLine(s.Draw());
                if (s is Circle)
                {
                    Console.WriteLine("\tThe Radius is {0}", ((Circle)s).Radius);
                }
                if (s is Diamond)
                {
                    ((Diamond)s).DoSomething();
                }
            }

            Console.ReadLine();
        }
    }
}

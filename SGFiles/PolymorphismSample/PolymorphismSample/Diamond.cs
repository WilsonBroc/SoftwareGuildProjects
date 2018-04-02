using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    public class Diamond : Shape
    {
        public void DoSomething()
        {
            Console.WriteLine("You just called the DoSomething method!");
        }
    }
}

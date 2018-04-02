using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    public class Yorkie : IDog
    {
        public void Bark()
        {
            Console.WriteLine("Yip");
        }

        public void GoForAWalk()
        {
            Console.WriteLine("Go for a short walk!");
        }
    }
}

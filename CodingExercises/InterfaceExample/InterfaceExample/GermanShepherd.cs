using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    public class GermanShepherd : IDog
    {
        public void Bark()
        {
            Console.WriteLine("WOOF!");
        }

        public void GoForAWalk()
        {
            Console.WriteLine("Go for a long walk!");
        }

        public void SniffForDrugs()
        {
            Console.WriteLine("Dog is getting a little high!");
        }
    }
}

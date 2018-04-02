using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfaceExample
{
    class Program
    {
        static void Main(string[] args)
        {
            GermanShepherd bigDog = new GermanShepherd();
            Yorkie smallDog = new Yorkie();

            GiveTreat(bigDog);
            GiveTreat(smallDog);

            Console.ReadLine();
        }

        static void GiveTreat(IDog dog)
        {
            if (dog is GermanShepherd)
            {
                ((GermanShepherd)dog).SniffForDrugs();
            }
            dog.Bark();
        }

    }
}

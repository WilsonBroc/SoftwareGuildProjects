using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ValueTypesVsReferenceTypes
{
    class Program
    {
        static void Main(string[] args)
        {
            //DemonstrateValueType();
            DemonstrateReferenceType();
            Console.ReadLine();
        }

        static void DemonstrateReferenceType()
        {
            Person myPerson = new Person();
            myPerson.Name = "John Smith";

            ManipulatePerson(myPerson);

            Console.WriteLine("The person's name is {0}", myPerson.Name);
        }

        static void ManipulatePerson(Person person)
        {
            person.Name = "Jane Doe";
        }

        static void DemonstrateValueType()
        {
            int x = 5;

            ManipulateInt(x);

            Console.WriteLine("The value of x is: {0}", x);
        }

        static void ManipulateInt(int x)
        {
            x = 10;
        }
    }

}

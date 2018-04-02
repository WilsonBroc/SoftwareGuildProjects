using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicInheritance
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("***** Basic Inheritance *****");
            Car myCar = new Car();
            Car myCar2 = new Car(95);

            Console.WriteLine("Car1 max {0}, Car2 max {1}", myCar._maxSpeed, myCar2._maxSpeed);

            myCar.Speed = 75;
            myCar2.Speed = 75;

            Console.WriteLine("Car1 current speed {0}, Car2 current speed {1}", myCar.Speed, myCar2.Speed);


            MiniVan myVan = new MiniVan();
            myVan.Speed = 10;
            Console.WriteLine("My van is going {0} MPH", myVan.Speed);

            myVan.Speed = 55;

            Console.WriteLine("My van is going {0} MPH", myVan.Speed);

            MiniVan myVan2 = new MiniVan(100);
            myVan2.Speed = 95;

            Console.WriteLine("My van is going {0} MPH", myVan2.Speed);

            List<Car> theCars = new List<Car>();
            for (int i = 40; i < 100; i += 10)
            {
                theCars.Add(new MiniVan(i));
            }

            foreach (var theCar in theCars)
            {
                Console.WriteLine("The van has a max speed of {0}", theCar._maxSpeed);
            }

            Console.ReadLine();
        }

        
    }
}

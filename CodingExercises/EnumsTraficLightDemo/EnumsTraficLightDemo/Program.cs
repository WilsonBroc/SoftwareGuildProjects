using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnumsTraficLightDemo
{
    class Program
    {
        static void Main(string[] args)
        {

            TrafficLight light = new TrafficLight();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);

            Console.ReadLine();

        }

        static void PrintValue(TrafficLight light)
        {
            Console.WriteLine("The light has a value of {0} which is the color {1}",
                (int)light.CurrentColor,
                Enum.GetName(typeof(TrafficLightColor), (int)light.CurrentColor));
        }
    }
}

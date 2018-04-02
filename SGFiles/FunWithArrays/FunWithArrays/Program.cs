using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace FunWithArrays
{
    class Program
    {
        static void Main(string[] args)
        {
            SimpleArrays();
            ArrayInitialization();
            DecalareImplicitArrays();
            ArrayOfObjects();
            RectMultiDimensionalArray();
        }

        static void SimpleArrays()
        {
            Console.WriteLine("=> Simple Arrays");

            int[] myInts = new int[3];
            myInts[0] = 100;
            myInts[2] = 300;

            foreach (int num in myInts)
            {
                Console.WriteLine(num);
            }
            Console.ReadLine();
        }

        static void ArrayInitialization()
        {
            Console.Clear();
            Console.WriteLine("=> Array Initializaiton");

            string[] stringArray = new string[] {"one", "two", "three"};
            Console.WriteLine("stringArray has {0} elements", stringArray.Length);

            bool[] boolArray = {false, false, true};
            Console.WriteLine("boolArray has {0} elements", boolArray.Length);

            int[] intArray = new int[4] {20,22,23,14};
            Console.WriteLine("intArray has {0} elements", intArray.Length);

            Console.ReadLine();
        }

        static void DecalareImplicitArrays()
        {
            Console.Clear();
            Console.WriteLine("=> Implicit Array Initialization");

            var a = new[] {1, 10, 100, 1000};
            Console.WriteLine("a is a: {0}", a.ToString());

            var b = new[] {1, 1.5, 2, 2.5};
            Console.WriteLine("b is a: {0}", b.ToString());

            var c = new[] {"hello", null, "world"};
            Console.WriteLine("c is a: {0}", c.ToString());
            Console.ReadLine();
        }

        static void ArrayOfObjects()
        {
            Console.Clear();
            Console.WriteLine("=> Array of Objects");
            object[] myObjects = new object[4];
            myObjects[0] = 10;
            myObjects[1] = false;
            myObjects[2] = new DateTime(1969, 3, 24);
            myObjects[3] = "Some string text for storage.";

            foreach (object obj in myObjects)
            {
                Console.WriteLine("Type: {0}, Value: {1}",
                    obj.GetType(), obj);
            }

            Console.ReadLine();
        }

        static void RectMultiDimensionalArray()
        {
            Console.Clear();
            Console.WriteLine("=> Rect Multidimensional array");

            int[,] myMatrix;
            myMatrix = new int[6,6];

            for (int i = 0; i < 6; i++)
            {
                for (int j = 0; j < 6; j++)
                {
                    myMatrix[i, j] = i*j;
                }
            }

            for (int i = 0; i < 6; i++)
            {
                for (int j = 0; j < 6; j++)
                {
                    Console.Write(myMatrix[i,j] + "\t");
                }
                Console.WriteLine();
            }

            Console.ReadLine();
        }
    }
}

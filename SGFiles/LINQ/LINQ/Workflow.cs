using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace LINQ
{
    public class Workflow
    {

        private Exercises _exercises;

        public Workflow()
        {
            _exercises = new Exercises();
        }

        public void Execute()
        {

            string userInput = "";
            do
            {
                Console.Clear();
                Console.WriteLine("*********  LINQ Exercises *********");
                Console.Write("\nEnter an exercise number or Q to quit: ");
                userInput = Console.ReadLine();
                if (userInput.Substring(0, 1).ToUpper() == "Q")
                    break;

                Console.WriteLine();
                RunMethod(userInput);

                Console.WriteLine("\n Press any key to continue...");
                Console.ReadKey();
            } while (true);

            Console.Clear();
            Console.WriteLine("Thank You!  Good Bye!");
            Thread.Sleep(1500);
        }

        private void RunMethod(string exercise)
        {
            switch (exercise)
            {
                case "1":
                    _exercises.Ex01();
                    break;
                case "2":
                    _exercises.Ex02();
                    break;
                case "3":
                    _exercises.Ex03();
                    break;
                case "4":
                    _exercises.Ex04();
                    break;
                case "5":
                    _exercises.Ex05();
                    break;
                case "6":
                    _exercises.Ex06();
                    break;
                case "7":
                    _exercises.Ex07();
                    break;
                case "8":
                    _exercises.Ex08();
                    break;
                case "9":
                    _exercises.Ex09();
                    break;
                case "10":
                    _exercises.Ex10();
                    break;
                case "11":
                    _exercises.Ex11();
                    break;
                case "12":
                    _exercises.Ex12();
                    break;
                case "13":
                    _exercises.Ex13();
                    break;
                case "14":
                    _exercises.Ex14();
                    break;
                case "15":
                    _exercises.Ex15();
                    break;
                case "16":
                    _exercises.Ex16();
                    break;
                case "17":
                    _exercises.Ex17();
                    break;
                case "18":
                    _exercises.Ex18();
                    break;
                case "19":
                    _exercises.Ex19();
                    break;
                case "20":
                    _exercises.Ex20();
                    break;
                case "21":
                    _exercises.Ex21();
                    break;
                case "22":
                    _exercises.Ex22();
                    break;
                case "23":
                    _exercises.Ex23();
                    break;
                case "24":
                    _exercises.Ex24();
                    break;
                case "25":
                    _exercises.Ex25();
                    break;
                case "26":
                    _exercises.Ex26();
                    break;
                case "27":
                    _exercises.Ex27();
                    break;
                case "28":
                    _exercises.Ex28();
                    break;
                case "29":
                    _exercises.Ex29();
                    break;
                case "30":
                    _exercises.Ex30();
                    break;
                case "31":
                    _exercises.Ex31();
                    break;
                case "32":
                    _exercises.Ex32();
                    break;
                case "33":
                    _exercises.Ex33();
                    break;
                case "34":
                    _exercises.Ex34();
                    break;
                case "35":
                    _exercises.Ex35();
                    break;
                case "36":
                    _exercises.Ex36();
                    break;
                case "37":
                    _exercises.Ex37();
                    break;
                case "38":
                    _exercises.Ex38();
                    break;
                case "39":
                    _exercises.Ex39();
                    break;
                case "40":
                    _exercises.Ex40();
                    break;
                default:
                    Console.WriteLine("Your selection was not valid!");
                    break;
            }
        }
    }
}

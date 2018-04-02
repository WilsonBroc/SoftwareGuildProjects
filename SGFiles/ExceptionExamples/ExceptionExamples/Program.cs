using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace ExceptionExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //CauseException();
            //HandleException();
            //HandleSpecificExceptions();
            //DisplayException();
            //CallStackExample();
            //ThrowExceptionExample();
            ThrowCustomException();

            Console.ReadLine();
        }

        static void ThrowCustomException()
        {
            try
            {
                throw new MySpecificException("my exception message...");
            }
            catch (MySpecificException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.HelpLink);
                Console.WriteLine(ex.StackTrace);
            }
        }

        static void ThrowExceptionExample()
        {
            try
            {
                Console.WriteLine("Starting Sample");
                throw new NullReferenceException();
                Console.WriteLine("After the throw");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception thrown: {0}", ex.Message);
            }
            finally
            {
                Console.WriteLine("finally block");
            }
            Console.WriteLine("After finally");
        }

        static void CallStackExample()
        {
            try
            {
                Method1();
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("Catch clause in CallStackExample method");
            }
            finally
            {
                Console.WriteLine("Finally clause in CallStackExample method");
            }
        }

        static void Method1()
        {
            try
            {
                Method2();
            }
            catch (NullReferenceException)
            {
                Console.WriteLine("Catch clause in method 1");
            }
            finally
            {
                Console.WriteLine("Finally clause in method 1");
            }
        }

        static void Method2()
        {
            int x = 10;
            int y = 0;

            try
            {
                Console.WriteLine(x/y);
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Catch clause in method 2");
            }
            finally
            {
                Console.WriteLine("Finally clause in method 2");
            }
            Console.WriteLine("This is after the finally in method 2");
        }

        static void DisplayException()
        {
            try
            {
                Divide(5, 0);
            }
            catch (Exception ex)
            {
                Console.WriteLine("The following error occurred");
                Console.WriteLine("-------------------------");
                Console.WriteLine(ex.Message);
                Console.WriteLine("Source: {0}", ex.Source);
                Console.WriteLine();
                Console.WriteLine("Help info: {0}", ex.HelpLink);
                Console.WriteLine();
                Console.WriteLine("It happened here");
                Console.WriteLine("-------------------------");
                Console.WriteLine(ex.StackTrace);
            }
        }

        static int Divide(int x, int y)
        {
            return x/y;
        }

        static void HandleSpecificExceptions()
        {
            try
            {
                Console.WriteLine("Before the exception");
                int[] ints = new int[2];
                ints[50] = 20;

                ints[0] = 5;
                Console.WriteLine("After the exception");
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("You tried to divide by zero");
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Index was out of range!!");
            }
            Console.WriteLine("I kept running!");

        }

        static void HandleException()
        {
            try
            {
                int x = 5;
                int y = 0;

                Console.WriteLine(x/y);
            }
            catch
            {
                Console.WriteLine("You did something wrong!");
            }
            Console.WriteLine("I kept running!");
            Console.ReadLine();
        }

        static void CauseException()
        {
            int x = 5;
            int y = 0;

            Console.WriteLine(x/y);
        }
    }
}

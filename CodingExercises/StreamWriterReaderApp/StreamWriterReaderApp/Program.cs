using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StreamWriterReaderApp
{
    class Program
    {
        static void Main(string[] args)
        {
            using (StreamWriter writer = File.CreateText("reminders.txt"))
            {
                writer.WriteLine("Don't Forget Mothers day this year!");
                writer.WriteLine("Don't forget my wife's birthday ");
                writer.Write("or aniversary ");
                writer.Write("or you will sleep on the couch!");
                for (int i = 0; i < 10; i++)
                {
                    writer.Write(i+ " ");
                }
                writer.Write(writer.NewLine);
            }

            Console.WriteLine("Created a file and wrote some notes");

            using (StreamReader sr = File.OpenText("reminders.txt"))
            {
                string input = null;
                while ((input = sr.ReadLine()) != null)
                {
                    Console.WriteLine(input);
                }
            }

            Console.ReadLine();
        }
    }
}

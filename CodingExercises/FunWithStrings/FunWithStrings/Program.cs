using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace FunWithStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("******** Fun With Strings ********");
            //BasicStringFunctionality();
            //StringConcatenation();
            //EscapeCharacters();
            //StringEquality();
            //StringsAreImmutable();
            StringBuilderExample();
        }

        static void StringBuilderExample()
        {
            Console.WriteLine("String Builder Example");

            StringBuilder sb = new StringBuilder();

            sb.Append("List of movies");
            sb.Append("\nShawshank Redemption");
            sb.Append("\nGroundhog day");
            sb.Append("\nIron Man");
            sb.Append("\nStar Wars");
            Console.WriteLine(sb);
            Console.ReadLine();
        }

        static void StringsAreImmutable()
        {
            string s1 = "This is my string";
            Console.WriteLine("s1 = {0}", s1);

            string upperString = s1.ToUpper();
            Console.WriteLine("upperString = {0}", upperString);

            Console.WriteLine("s1 = {0}", s1);
            Console.ReadLine();
        }

        static void StringEquality()
        {
            Console.WriteLine("=> String Equality");
            string s1 = "Hello!";
            string s2 = "Yo";
            string s3 = "Yo";
            Console.WriteLine("s1 = {0}", s1);
            Console.WriteLine("s2 = {0}", s2);
            Console.WriteLine();

            // Test these strings for equality
            Console.WriteLine("s1 == s2: {0}", s1 == s2);
            Console.WriteLine("s1 == Hello!: {0}", s1 == "Hello!");
            Console.WriteLine("s1 == HELLO!: {0}", s1 == "HELLO!");
            Console.WriteLine("s1.Equals(s2): {0}", s1.Equals(s2));
            Console.WriteLine("s2.Equals(s3): {0}", s2.Equals(s3));
            Console.ReadLine();
        }

        #region Basic String Functionality
        static void BasicStringFunctionality()
        {
            Console.WriteLine("=> Basic String Functionality");
            string firstName = "Freddy";
            Console.WriteLine($"Value of firstName: {firstName}");
            Console.WriteLine($"firstName has {firstName.Length} characters.");
            Console.WriteLine("firstName in uppercase: {0}", firstName.ToUpper());
            Console.WriteLine("firstName in lowercase: {0}", firstName.ToLower());
            Console.WriteLine("firstName contains the letter y? {0}",
                firstName.Contains("y"));
            Console.WriteLine("firstName after replace: {0}", 
                firstName.Replace("dy", ""));
            Console.ReadLine();
            Console.Clear();
        }
        #endregion

        #region String Concatenation

        static void StringConcatenation()
        {
            Console.WriteLine("=> String Concatenation");
            string s1 = "This is the first ";
            string s2 = "part of the string";
            string s3 = string.Concat(s1, s2);
            string s4 = s1 + s2;
            Console.WriteLine(s3);
            Console.WriteLine(s4);
            Console.ReadLine();
            Console.Clear();
        }

        #endregion

        static void EscapeCharacters()
        {
            Console.WriteLine("=> Escape characters:\a");
            string strWithTabs = "Model\tColor\tSpeed\tPet Name\a";
            Console.WriteLine(strWithTabs);
            Console.ReadLine();
            
            Console.WriteLine("Everyone loves \"Hello World\"");
            Console.WriteLine("C:\\MyApp\\bin\\Debug\\somefile.txt");

            Console.WriteLine(@"C:\MyApp\bin\Debug\somefile.txt");

            Console.WriteLine(@"Dave wrote the ""Hello World""");

            Console.ReadLine();
        }
    }
}

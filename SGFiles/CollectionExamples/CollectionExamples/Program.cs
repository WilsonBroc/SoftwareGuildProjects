using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CollectionExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //ShowArrayList();
            //ShowHashTable();
            //ShowStack();
            //ShowQueue();

            //ShowGenericList();
            ShowDictionary();
        }

        static void ShowHashTable()
        {
            Hashtable applicationMap = new Hashtable();

            applicationMap.Add("txt", "notepad.exe");
            applicationMap.Add("bmp", "paint.exe");
            applicationMap.Add("jpg", "paint.exe");
            applicationMap.Add("docx", "word.exe");

            Console.WriteLine("Enter an extension: ");
            string extension = Console.ReadLine();

            Console.WriteLine("We would open extension {0} with {1}",
                extension, applicationMap[extension]);

            Console.WriteLine("\nEnter a new extension: ");
            extension = Console.ReadLine();

            Console.WriteLine("Enter a new app: ");
            string application = Console.ReadLine();

            if (applicationMap.ContainsKey(extension))
            {
                Console.WriteLine("That key already exists!");
            }
            else
            {
                applicationMap.Add(extension, application);
            }

            Console.WriteLine("\nPrint all values\n_________________");
            foreach (var key in applicationMap.Keys)
            {
                Console.WriteLine(applicationMap[key]);
            }

            Console.ReadLine();
            Console.Clear();

        }

        private static void ShowArrayList()
        {
            ArrayList intList = new ArrayList();

            intList.Add(1);
            intList.Add(5);
            intList.Add(10);
            intList.Add(4);

            int sum = 0;

            foreach (object o in intList)
            {
                sum += (int)o;
            }

            Console.WriteLine("The sum of the arraylist is {0}", sum);
            Console.ReadLine();
            Console.Clear();
        }

        static void ShowStack()
        {
            Stack myStack = new Stack();
            myStack.Push("Hello");
            myStack.Push("World");
            myStack.Push("!");

            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine(myStack.Pop());
            }

            Console.ReadLine();
            Console.Clear();
        }

        static void ShowQueue()
        {
            Queue myQueue = new Queue();
            myQueue.Enqueue("Hello");
            myQueue.Enqueue("World");
            myQueue.Enqueue("!");

            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine(myQueue.Dequeue());
            }

            Console.ReadLine();
            Console.Clear();
        }

        static void ShowGenericList()
        {
            List<Person> people = new List<Person>()
            {
                new Person {FirstName = "Dave", LastName = "Smith", Age = 21},
                new Person {FirstName = "Fred", LastName = "Flinstone", Age = 3200}
            };

            foreach (var person in people)
            {
                Console.WriteLine("{0}, {1} is {2} years old.", person.LastName, 
                    person.FirstName, person.Age);
            }

            Console.WriteLine("\nEnter a first name: ");
            string firstName = Console.ReadLine();
            Console.WriteLine("Enter a last name: ");
            string lastName = Console.ReadLine();
            Console.WriteLine("Enter an age: ");
            int age = int.Parse(Console.ReadLine());

            //people.Add(new Person { FirstName = firstName, LastName = lastName, Age = age });

            Person p = new Person();
            p.Age = age;
            p.FirstName = firstName;
            p.LastName = lastName;
            people.Add(p);

            foreach (var person in people)
            {
                Console.WriteLine("{0}, {1} is {2} years old.", person.LastName,
                    person.FirstName, person.Age);
            }

            Console.ReadLine();


        }

        static void ShowDictionary()
        {
            Dictionary<int, Person> people = new Dictionary<int, Person>();

            Person p1 = new Person() {FirstName = "Homer", LastName = "Simpson", Age = 42, PersonId = 1};
            Person p2 = new Person() {FirstName = "Marge", LastName = "Simpson", Age = 40, PersonId = 2};
            Person p3 = new Person() {FirstName = "Lisa", LastName = "Simpson", Age = 12, PersonId = 3};
            Person p4 = new Person() {FirstName = "Bart", LastName = "Simpson", Age = 9, PersonId = 4};

            people.Add(p1.PersonId, p1);
            people.Add(p2.PersonId, p2);
            people.Add(p3.PersonId, p3);
            people.Add(p4.PersonId, p4);

            foreach (var key in people.Keys)
            {
                PrintPerson(people[key]);
            }

            Console.WriteLine("\n\n => {0} {1} {2}", people[3].FirstName, people[3].LastName, people[3].Age);

            Console.ReadLine();


        }

        static void PrintPerson(Person p)
        {
            Console.WriteLine("{0} {1} {2}", p.FirstName, p.LastName, p.Age);
        }

    }
}

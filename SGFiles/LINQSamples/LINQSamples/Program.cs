using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQSamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //ShowAnonymousTypes();
            //Console.ReadLine();

            //Console.Clear();
            //ShowLinqJoins();
            //Console.ReadLine();

            Console.Clear();
            ShowLinqGrouping();
            Console.ReadLine();

        }

        static void ShowLinqGrouping()
        {
            List<Student> students = new List<Student>()
            {
                new Student() {LastName = "Sandler", Major = "Computer Science"},
                new Student() {LastName = "Martin", Major = "History"},
                new Student() {LastName = "Murphy", Major = "English"},
                new Student() {LastName = "Pacino", Major = "Computer Science"},
                new Student() {LastName = "Candy", Major = "History"}
            };

            var result = students.GroupBy(student => student.Major);

            foreach (var group in result)
            {
                Console.WriteLine(group.Key);

                foreach (var student in group)
                {
                    Console.WriteLine("\t{0}", student.LastName);
                }
            }
        }

        static void ShowLinqJoins()
        {
            List<Student> students = new List<Student>()
            {
                new Student() {LastName = "Wise", StudentID = 1},
                new Student() {LastName = "Ward", StudentID = 2}
            };

            List<StudentCourse> courses = new List<StudentCourse>()
            {
                new StudentCourse() {StudentID = 1, CourseName = "C# Fundamentals"},
                new StudentCourse() {StudentID = 1, CourseName = "Asp.Net Fundamentals"},
                new StudentCourse() {StudentID = 2, CourseName = "Java Fundamentals"},
                new StudentCourse() {StudentID = 2, CourseName = "CSS and HTML"}
            };


            var results = from student in students
                join course in courses
                    on student.StudentID equals course.StudentID
                select new {StudentName = student.LastName, course.CourseName};
                      //select new {course, student};

                      Console.WriteLine("Student Courses:");
            foreach (var result in results)
            {
                Console.WriteLine("{0,-10} {1}", result.StudentName, result.CourseName);
            }

        }

        static void ShowAnonymousTypes()
        {
            Console.WriteLine("***** Show Anonymous Types *****");
            List<Person> people = MakePeople();

            var ladies = from p in people
                where p.Gender == 'F'
                select new {Name = p.LastName + ", " + p.FirstName, p.Age};
                        //select p;

            Console.WriteLine("The type of ladies is {0}", ladies.ToString());
            foreach (var lady in ladies)
            {
                Console.WriteLine($"{lady.Name} Age = {lady.Age}");
            }

        }

        static List<Person> MakePeople()
        {
            return new List<Person>()
            {
                new Person {FirstName = "Homer", LastName = "Simpson", Age = 40, Gender = 'M'},
                new Person {FirstName = "Marge", LastName = "Simpson", Age = 36, Gender = 'F'},
                new Person {FirstName = "Lisa", LastName = "Simpson", Age = 10, Gender = 'F'},
                new Person {FirstName = "Bart", LastName = "Simpson", Age = 12, Gender = 'M'},
                new Person {FirstName = "Maggie", LastName = "Simpson", Age = 1, Gender = 'F'}
            };
        }
    }
}

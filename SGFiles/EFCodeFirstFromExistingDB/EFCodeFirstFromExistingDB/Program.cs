using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFCodeFirstFromExistingDB.Models;

namespace EFCodeFirstFromExistingDB
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new TimeContext())
            {
                var emp = new Employee()
                {
                    FirstName = "Joe",
                    LastName = "Smith",
                    YearlySalarhy = 75000m
                };
                context.Employees.Add(emp);
                context.SaveChanges();

                Console.WriteLine($"New Employee ID:  {emp.EmployeeID}");
                Console.ReadLine();
            }
        }
    }
}

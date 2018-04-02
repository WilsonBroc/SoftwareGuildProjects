using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Northwind.DataLayer.Config;
using Northwind.DataLayer.Models;
using NUnit.Framework;

namespace Northwind.DataLayer
{
    public class Queries
    {

        [Test]
        public void RunSelectQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("Select * from employees").ToList();

                Assert.AreEqual(9, employees.Count);
            }
        }

        [Test]
        public void RunInVariableParameterizedQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@EmployeeID", 5);
                var employees = cn.Query<Employee>("Select * from Employees WHERE EmployeeID > @EmployeeID", p).ToList();

                Assert.AreEqual(4, employees.Count);
            }
        }

        [Test]
        public void CanGetJustOneRecord()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@EmployeeID", 5);

                var employee = cn.Query<Employee>("Select * from Employees WHERE EmployeeID = @EmployeeID", p).FirstOrDefault();

                Assert.IsNotNull(employee);
            }
        }
    }
}

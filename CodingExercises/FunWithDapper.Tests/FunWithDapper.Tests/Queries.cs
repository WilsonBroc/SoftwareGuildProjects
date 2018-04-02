using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using FunWithDapper.Tests.Config;
using FunWithDapper.Tests.Models;
using NUnit.Framework;

namespace FunWithDapper.Tests
{
    [TestFixture]
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
        public void RunInlineParameterizedQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("Select * from Employees WHERE EmployeeId > @EmployeeId",
                    new {EmployeeId = 5}).ToList();

                Assert.AreEqual(4, employees.Count);
            }
        }

        [Test]
        public void RunVariableParameterizedQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("EmployeeId", 5);
                var employees = cn.Query<Employee>("Select * from Employees WHERE EmployeeId > @EmployeeId",
                    p).ToList();

                Assert.AreEqual(4, employees.Count);
            }
        }

        [Test]
        public void CanGetJustOneRecord()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("EmployeeId", 5);
                var employee =
                    cn.Query<Employee>("Select * from Employees WHERE EmployeeId = @EmployeeId", p).FirstOrDefault();

                Assert.IsNotNull(employee);
            }
        }

        [Test]
        public void NotFoundReturnsNull()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("EmployeeId", 25);
                var employee =
                    cn.Query<Employee>("Select * from Employees WHERE EmployeeId = @EmployeeId", p).FirstOrDefault();

                Assert.IsNull(employee);
            }
        }
    }
}

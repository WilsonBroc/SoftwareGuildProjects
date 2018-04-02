using System;
using System.Collections.Generic;
using System.Data;
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
    public class StoredProcedures
    {
        [Test]
        public void CanExecuteStoredProcedure()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("EmployeeGetAll", 
                    commandType: CommandType.StoredProcedure).ToList();

                Assert.AreEqual(9, employees.Count);
            }
        }

        [Test]
        public void CanRetrieveOutputParameter()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("RegionDescription", "Daves New Region");
                p.Add("RegionId", DbType.Int32, direction:ParameterDirection.Output);

                cn.Execute("RegionInsert", p, commandType: CommandType.StoredProcedure);

                int regionId = p.Get<int>("RegionId");

                Assert.AreNotEqual(0, regionId);
            }

                

            
        }
    }

}

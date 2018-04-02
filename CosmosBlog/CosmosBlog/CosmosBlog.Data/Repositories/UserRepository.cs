using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Interfaces;
using CosmosBlog.Models;
using Dapper;

namespace CosmosBlog.Data.Repositories
{
    public class UserRepository : iUserRepositories
    {
        private SqlConnection cn = new SqlConnection(Settings.ConnectionString);

        public List<User> GetAllUsers()
        {
            using (cn)
            {
                var users = cn.Query<User>("GetAllUsers", commandType: CommandType.StoredProcedure).ToList();
                return users;
            }
        }

        public User GetOneUser(int id)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", id);
                var user = cn.Query<User>("GetOneUser", p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return user;
            }
        }

        public void AddNewUser(User newUser)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@UserName", newUser.UserName);

                cn.Execute("AddUser", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void DeleteUser(User userToDelete)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", userToDelete.UserID);

                cn.Execute("DeleteUser", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void EditUser(User user)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", user.UserID);
                p.Add("@UserName", user.UserName);

                cn.Execute("EditUser", p, commandType: CommandType.StoredProcedure);
            }
        }
    }
}

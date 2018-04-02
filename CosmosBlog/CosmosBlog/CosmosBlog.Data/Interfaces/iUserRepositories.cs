using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Models;

namespace CosmosBlog.Data.Interfaces
{
    public interface iUserRepositories
    {
        List<User> GetAllUsers();
        User GetOneUser(int id);
        void AddNewUser(User newUser);
        void DeleteUser(User oldUser);
        void EditUser(User user);
    }
}

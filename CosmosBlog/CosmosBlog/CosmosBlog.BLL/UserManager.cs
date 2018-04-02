using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Repositories;
using CosmosBlog.Models;

namespace CosmosBlog.BLL
{
    public class UserManager
    {
        private UserRepository _userRepo = new UserRepository();

        public List<User> GetAllUsers()
        {
            return _userRepo.GetAllUsers();
        }

        public User GetUser(int id)
        {
            return _userRepo.GetOneUser(id);
        }

        public void AddNewUser(User newUser)

        {
            _userRepo.AddNewUser(newUser);
        }

        public void DeleteUser(User userToDelete)
        {
            _userRepo.DeleteUser(userToDelete);
        }

        public void EditUser(User user)
        {
            _userRepo.EditUser(user);
        }
    }
}

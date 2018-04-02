using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;
using SGBank.UI.Utilities;

namespace SGBank.UI.Workflows
{
    public class CreateAccountWorkflow
    {
        private Account _currentAccount;

        public void Execute()
        {
            Console.Clear();
            CreateAndSaveAccount(); 
                  
            Console.Clear();
            Console.WriteLine("Here are your new account details: \n");
            AccountScreens.PrintAccountDetails(_currentAccount);
            AccountOptionsMenu.DisplayLookupMenu(_currentAccount);

            Console.ReadLine();
        }

        private void CreateAndSaveAccount()
        {
            Account newAccount = new Account();
            newAccount.FirstName = UserPrompts.GetStringFromUser("Enter the First Name of the new account holder:");
            newAccount.LastName = UserPrompts.GetStringFromUser("Enter the Last Name of the new account holder:");
            newAccount.Balance = UserPrompts.GetDecimalFromUser("How much would you like to deposit to start the account?");

            AccountManager manager = new AccountManager();
            newAccount.AccountNumber = manager.GenerateNewAccountNumber();
            manager.SaveNewAccount(newAccount);
            _currentAccount = newAccount;
        }
    }
}

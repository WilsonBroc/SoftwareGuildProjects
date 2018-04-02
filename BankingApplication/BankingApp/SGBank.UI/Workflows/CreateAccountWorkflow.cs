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
        public void Execute()
        {
            Console.Clear();
           
            Account newAccount = new Account();
            newAccount.FirstName = UserPrompts.GetStringFromUser("Enter the First Name of the new account holder:");
            newAccount.LastName = UserPrompts.GetStringFromUser("Enter the Last Name of the new account holder:");
            newAccount.Balance = UserPrompts.GetDecimalFromUser("How much would you like to deposit to start the account?");

            AccountManager manager = new AccountManager();
            newAccount.AccountNumber = manager.GenerateNewAccountNumber();
            manager.SaveNewAccount(newAccount);

            Console.Clear();
            Console.WriteLine("Here are your new account details: \n");
            AccountScreens.PrintAccountDetails(newAccount);            
            Console.ReadLine();
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;
using SGBank.UI.Utilities;

namespace SGBank.UI.Workflows
{
    public class DeleteAccountWorkFlow
    {
        private Account _currentAccount;

        public void Execute()
        {
            Console.Clear();
            int accountNumber = UserPrompts.GetIntFromUser("Enter the account number that you would like to delete: ");
            DisplayAccountInformation(accountNumber);
        }

        private void DisplayAccountInformation(int accountNumber)
        {           
            var manager = new AccountManager();          
            var result = manager.GetAccount(accountNumber);

            Console.Clear();

            if (result.Success)
            {
                Account _currentAccount = result.Data;               
                AccountScreens.PrintAccountDetails(_currentAccount);
                DisplayDeleteMenu(_currentAccount, accountNumber);
            }
            else
            {
                AccountScreens.WorkflowErrorScreen(result.Message);
            }
        }

        private void DisplayDeleteMenu(Account account, int accountNumber)
        {
            do
            {
                Console.WriteLine("\n1. Process Delete Request");
                Console.WriteLine("2. Cancel Delete Request");
                Console.WriteLine("\n(Q) to return to main menu");

                string input = UserPrompts.GetStringFromUser("\nEnter choice: ");

                if (input.Substring(0, 1).ToUpper() == "Q")
                {
                    break;
                }
                ProcessInput(input, accountNumber);

            } while (true);

            Console.Clear();
        }

        private void ProcessInput(string choice, int accountNumber)
        {
            switch (choice)
            {
                case "1":
                    AccountManager manager = new AccountManager();
                    manager.DeleteAccount(accountNumber);
                    break;


            }
        }
    }
}

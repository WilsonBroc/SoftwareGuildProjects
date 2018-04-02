using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;
using SGBank.UI.Utilities;

namespace SGBank.UI.Workflows
{
    public class LookupWorkflow
    {
        private Account _currentAccount;

        public void Execute()
        {
            int accountNumber = UserPrompts.GetIntFromUser("Please provide account number: ");
            DisplayAccountInformation(accountNumber);
        }

        private void DisplayAccountInformation(int accountNumber)
        {
            var manager = new AccountManager();
            var result = manager.GetAccount(accountNumber);

            Console.Clear();
            if (result.Success)
            {
                _currentAccount = result.Data;
                AccountScreens.PrintAccountDetails(_currentAccount);
                AccountOptionsMenu.DisplayLookupMenu(_currentAccount);
            }
            else
            {
                AccountScreens.WorkflowErrorScreen(result.Message);
            }

            
        }
    }
}

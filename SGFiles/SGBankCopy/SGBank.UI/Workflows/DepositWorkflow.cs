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
    public class DepositWorkflow
    {
        public void Execute(Account account)
        {
            Console.Clear();

            decimal amount = UserPrompts.GetDecimalFromUser($"Make a deposit to Account #{account.AccountNumber}" +
                                                            $"\n===============================================================" +
                                                            $"\nCurrent Account Balance: {account.Balance:C}" +
                                                            $"\nHow much would you like to deposit? Please enter decimal amount.");

            var manager = new AccountManager();
            var response = manager.Deposit(amount, account);

            if (response.Success)
            {
                AccountScreens.DepositDetails(response.Data);
            }
            else
            {
                AccountScreens.WorkflowErrorScreen(response.Message);
            }
        }
    }
}

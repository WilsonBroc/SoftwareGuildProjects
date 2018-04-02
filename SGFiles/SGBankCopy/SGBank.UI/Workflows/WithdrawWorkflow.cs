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
    public class WithdrawWorkflow
    {
        public void Execute(Account currentAccount)
        {
            Console.Clear();

            decimal amount = UserPrompts.GetDecimalFromUser($"Make a withdrawal from Account #{currentAccount.AccountNumber}" +
                                                            $"\n===============================================================" +
                                                            $"\nCurrent Account Balance: {currentAccount.Balance:C}" +
                                                            $"\nHow much would you like to withdraw? Please enter decimal amount.");


            AccountManager manager = new AccountManager();
            var response = manager.Withdraw(amount, currentAccount);

            if (response.Success)
            {
                AccountScreens.WithdrawalDetails(response.Data);
            }
            else
            {
                AccountScreens.WorkflowErrorScreen(response.Message);
            }


        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.Models;

namespace SGBank.UI.Utilities
{
    public static class AccountScreens
    {
        public static void PrintAccountDetails(Account account)
        {
            Console.WriteLine("Account Information");
            Console.WriteLine("===============================");
            Console.WriteLine($"Account Number {account.AccountNumber}");
            Console.WriteLine($"Name {account.FirstName} {account.LastName}");
            Console.WriteLine($"Account Balance {account.Balance:c}");
        }

        public static void WorkflowErrorScreen(string message)
        {
            Console.Clear();
            Console.WriteLine("An error occured. {0}", message);
            UserPrompts.PressKeyForContinue();
        }

        public static void DepositDetails(TransactionReciept reciept)
        {
            Console.Clear();
            Console.WriteLine("Deposited {0:c} to account {1}.", 
                reciept.TransactionAmount,
                reciept.AccountNumber);
            Console.WriteLine("New Balance is {0}", reciept.NewBalance);
            UserPrompts.PressKeyForContinue();
        }

        public static void WithdrawalDetails(TransactionReciept response)
        {
            Console.Clear();
            Console.WriteLine("Withdrew {0:c} to account {1}.",
                response.TransactionAmount,
                response.AccountNumber);
            Console.WriteLine("New Balance is {0}", response.NewBalance);
            UserPrompts.PressKeyForContinue();
        }
    }
}

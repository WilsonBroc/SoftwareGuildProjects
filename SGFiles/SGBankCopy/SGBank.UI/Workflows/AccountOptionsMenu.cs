using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.Models;
using SGBank.UI.Utilities;

namespace SGBank.UI.Workflows
{
    public static class AccountOptionsMenu
    {
        public static void DisplayLookupMenu(Account account)
        {
            do
            {
                Console.WriteLine("\n1. Deposit");
                Console.WriteLine("2. Withdraw");
                Console.WriteLine("3. Transfer");
                Console.WriteLine("\n(Q) to return to main menu");

                string input = UserPrompts.GetStringFromUser("\nEnter Choice: ");

                if (input.Substring(0, 1).ToUpper() == "Q")
                    break;

                ProcessChoice(input, account);

            } while (true);

        }

        private static void ProcessChoice(string choice, Account account)
        {
            switch (choice)
            {
                case "1":
                    DepositWorkflow depositWorkflow = new DepositWorkflow();
                    depositWorkflow.Execute(account);
                    break;
                case "2":
                    WithdrawWorkflow withdrawWorkflow = new WithdrawWorkflow();
                    withdrawWorkflow.Execute(account);
                    break;


            }
        }
    }
}

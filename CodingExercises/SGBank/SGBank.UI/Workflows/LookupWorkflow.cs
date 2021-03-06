﻿using System;
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
                DisplayLookupMenu();
            }
            else
            {
                AccountScreens.WorkflowErrorScreen(result.Message);
            }
        }

        private void DisplayLookupMenu()
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

                ProcessChoice(input);

            } while (true);
        }

        private void ProcessChoice(string choice)
        {
            switch (choice)
            {
                case "1":
                    DepositWorkflow depositWorkflow = new DepositWorkflow();
                    depositWorkflow.Execute(_currentAccount);
                    break;
            }
        }
    }
}

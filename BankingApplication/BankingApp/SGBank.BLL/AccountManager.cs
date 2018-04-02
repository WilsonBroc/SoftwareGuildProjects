using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.Data;
using SGBank.Models;

namespace SGBank.BLL
{
    public class AccountManager
    {
        public Response<Account> GetAccount(int accountNumber)
        {
            var repo = new AccountRepository();
            var result = new Response<Account>();

            try
            {
                var account = repo.LoadAccount(accountNumber);

                if (account == null)
                {
                    result.Success = false;
                    result.Message = "Account was not found.";
                }
                else
                {
                    result.Success = true;
                    result.Data = account;
                }

            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Message = "There was an error. Please try again later.";
                //log.logError(ex.Message);
            }

            return result;
        }

        public Response<DepositReciept> Deposit(decimal amount, Account account)
        {
            var response = new Response<DepositReciept>();

            try
            {
                if (amount <= 0)
                {
                    response.Success = false;
                    response.Message = "Must provide a positive value.";
                }
                else
                {
                    account.Balance += amount;
                    var repo = new AccountRepository();
                    repo.UpdateAccount(account);

                    response.Success = true;
                    response.Data = new DepositReciept();
                    response.Data.AccountNumber = account.AccountNumber;
                    response.Data.DepositAmount = amount;
                    response.Data.NewBalance = account.Balance;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = "Account is no longer valid.";
                //log.logError(ex.Message);
            }

            return response;
        }

        public int GenerateNewAccountNumber()
        {
            AccountRepository repo = new AccountRepository();

            var newNumber = repo.GetAllAccounts().Max(a => a.AccountNumber);
            int accountNumber = newNumber +=1;
            return accountNumber;
        }

        public void SaveNewAccount(Account newAccount)
        {
           
            AccountRepository repo = new AccountRepository();
            List<Account> accounts = repo.GetAllAccounts();
            repo.SaveAccount(newAccount, accounts);
        }

        public void DeleteAccount(int accountNumber)
        {
            AccountRepository repo = new AccountRepository();
            List<Account> accounts = repo.GetAllAccounts();
            repo.Delete(accountNumber, accounts);

            Console.ReadLine();
        }
    }
}

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
        private IAccountRepository _repo;

        public AccountManager()
        {
            _repo = AccountRepositoryFactory.GetAccountRepository();
        }

        public Response<Account> GetAccount(int accountNumber)
        {

            var result = new Response<Account>();

            try
            {
                var account = _repo.LoadAccount(accountNumber);

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
                //log.logError(ex.Message);  <-  If I had a logging solution
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
                    _repo.UpdateAccount(account);

                    response.Success = true;
                    response.Data = new DepositReciept
                    {
                        AccountNumber = account.AccountNumber,
                        DepositAmount = amount,
                        NewBalance = account.Balance
                    };
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = "Account is no longer valid.";
                //log.logError(ex.Message);  <-  If I had a logging solution
            }

            return response;
        }
    }
}

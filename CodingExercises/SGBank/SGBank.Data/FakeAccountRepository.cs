using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.Models;

namespace SGBank.Data
{
    public class FakeAccountRepository : IAccountRepository
    {
        private static List<Account> accounts;

        public FakeAccountRepository()
        {
            accounts = new List<Account>();

            if (accounts.Count == 0)
            {
                accounts = new List<Account>()
                {
                    new Account() {AccountNumber = 1, FirstName = "Dave", LastName = "Balzer", Balance = 5000.00m},
                    new Account() {AccountNumber = 2, FirstName = "Jim", LastName = "Brown", Balance = 2500.00m},
                    new Account() {AccountNumber = 2, FirstName = "Sara", LastName = "Smith", Balance = 10.00m},
                    new Account() {AccountNumber = 2, FirstName = "Judy", LastName = "Green", Balance = 525.00m}
                };
            }
        }

        public List<Account> GetAllAccounts()
        {
            return accounts;
        }

        public Account LoadAccount(int accountNumber)
        {
            return accounts.FirstOrDefault(a => a.AccountNumber == accountNumber);
        }

        public void UpdateAccount(Account account)
        {
            var accountToUpdate = accounts.First(a => a.AccountNumber == account.AccountNumber);
            accountToUpdate.FirstName = account.FirstName;
            accountToUpdate.LastName = account.LastName;
            accountToUpdate.Balance = account.Balance;
        }
    }
}

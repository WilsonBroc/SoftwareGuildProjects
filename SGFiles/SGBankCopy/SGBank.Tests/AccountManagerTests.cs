using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using SGBank.BLL;

namespace SGBank.Tests
{
    [TestFixture]
    public class AccountManagerTests
    {
        [Test]
        public void FoundAccountReturnsSuccess()
        {
            var manager = new AccountManager();
            var response = manager.GetAccount(1);

            Assert.IsTrue(response.Success);
            Assert.AreEqual(1, response.Data.AccountNumber);
            Assert.AreEqual("Mary", response.Data.FirstName);
        }

        [Test]
        public void NotFoundAccountReturnsFail()
        {
            var manager = new AccountManager();
            var response = manager.GetAccount(9999);
            Assert.IsFalse(response.Success);
        }

        [Test]
        public void CanWithdrawFunds()
        {
            var manager = new AccountManager();
            var test = manager.GetAccount(1);
            manager.Withdraw(47, test.Data);

            var result = test.Data.Balance;
            Assert.AreEqual(300, result);
        }

        [Test]
        public void CanDeleteAccount()
        {
            var manager = new AccountManager();            
            manager.DeleteAccount(1);
            var result = manager.GetAccount(1);
            Assert.AreEqual(null, result.Data);
        }
    }
}

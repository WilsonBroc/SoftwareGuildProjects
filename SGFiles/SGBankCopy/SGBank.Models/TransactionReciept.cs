using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGBank.Models
{
    public class TransactionReciept
    {
        public int AccountNumber { get; set; }
        public decimal TransactionAmount { get; set; }
        public decimal NewBalance { get; set; }
    }
}

namespace EFCodeFirstFromExistingDB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmployeeProjectTime")]
    public partial class EmployeeProjectTime
    {
        public int EmployeeProjectTimeID { get; set; }

        public int EmployeeID { get; set; }

        public int ProjectID { get; set; }

        [Column(TypeName = "date")]
        public DateTime DateWorked { get; set; }

        public decimal HoursWorked { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Project Project { get; set; }
    }
}

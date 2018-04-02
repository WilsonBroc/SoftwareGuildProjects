namespace EFCodeFirstFromExistingDB.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TimeContext : DbContext
    {
        public TimeContext()
            : base("name=TimeContext")
        {
        }

        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<EmployeeProjectTime> EmployeeProjectTimes { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Project> Projects { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>()
                .HasMany(e => e.Projects)
                .WithMany(e => e.Clients)
                .Map(m => m.ToTable("ClientsProjects").MapLeftKey("ClientID").MapRightKey("ProjectID"));

            modelBuilder.Entity<EmployeeProjectTime>()
                .Property(e => e.HoursWorked)
                .HasPrecision(4, 2);

            modelBuilder.Entity<Employee>()
                .Property(e => e.YearlySalarhy)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.EmployeeProjectTimes)
                .WithRequired(e => e.Employee)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Projects)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.ProjectManagerID);

            modelBuilder.Entity<Project>()
                .HasMany(e => e.EmployeeProjectTimes)
                .WithRequired(e => e.Project)
                .WillCascadeOnDelete(false);
        }
    }
}

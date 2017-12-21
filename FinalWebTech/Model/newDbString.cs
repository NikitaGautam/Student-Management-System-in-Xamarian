using System;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace FinalWebTech.Model
{
	public class newDbString : DbContext
	{

		public DbSet<StudentPersonal> StudentPersonal { get; set; }
		public DbSet<StudentMarks> StudentMarks { get; set; }
		public DbSet<StudentRegistration> StudentRegistration { get; set; }
	}
}

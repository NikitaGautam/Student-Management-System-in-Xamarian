using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalWebTech.Model
{
	public class StudentPersonal
	{
			[DatabaseGenerated(DatabaseGeneratedOption.Identity)] //For making unique primary key
			public int ID { get; set; }
			public int RollNo { get; set; }
			public string FirstName { get; set; }
			public string LastName { get; set; }
			public string Class { get; set; }
			public string Section { get; set; }
			public StudentMarks Marks { get; set; }

	}
}

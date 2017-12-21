using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalWebTech.Model
{
	public class StudentMarks
	{
		[Key, ForeignKey("StudentPersonal")]
		public int ID { get; set; }
		public float Physics { get; set; }
		public float Chemistry { get; set; }
		public float Mathematics { get; set; }
		public float Computing { get; set; }
		public float English { get; set; }
		public StudentPersonal StudentPersonal { get; set; }
	}
}

using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;


namespace FinalWebTech
{
	public partial class MarksViewer : System.Web.UI.Page
	{


		public void rmSession_Click(object sender, EventArgs args)
		{
			Session.Remove("userName");
			Response.Redirect("Default.aspx");
		}


		public void viewTopStudentList(object sender, EventArgs args)
		{
			 List<int> totalMarks = new List<int>();
		     List<String> stdName = new List<String>();
			Model.StdMarksRepo repo = new Model.StdMarksRepo();
			List<Model.StudentMarks> marks = repo.GetStudentsMarks();
			Dictionary<Model.StudentPersonal, int> tlMarks = new Dictionary<Model.StudentPersonal, int>();
			foreach (var item in marks)
			{
				if (item.Chemistry > 40 && item.Computing > 40 && item.English > 40 && item.Mathematics > 40 && item.Physics > 40)
				{
					tlMarks.Add(item.StudentPersonal, (int)(item.Chemistry + item.Computing + item.English + item.Mathematics + item.Physics));

				}
			}

			foreach (var item in tlMarks)
			{
				totalMarks.Add(item.Value);
			}
			totalMarks.Sort();
			totalMarks.Reverse();

			var i = 0; 			List<Model.StudentPersonal> stdId = new List<Model.StudentPersonal>();
			var count = 0; 			if (totalMarks.Count >= 3)
			{
				count = 3;
			}
			else {
				count = totalMarks.Count;
			} 			while (i < count) 				{
				foreach (var item in tlMarks)
				{
					if (!totalMarks[i].Equals(null))
					{
						if (item.Value == totalMarks[i])
						{
							stdId.Add(item.Key);
							Console.WriteLine(stdId[i]);
						}
					}

				}
				i++;  			   }

			List<Model.StudentPersonal> stdPer = repo.GetStudents(); 			int index = 0; 			while (index < stdId.Count) 			{ 				foreach (var st in stdPer) 				{
					if (st == stdId[index])
					{
						stdName.Add(st.FirstName + " " + st.LastName);
						Console.WriteLine(stdName[index]);
					}


				} 				index++;  			}  			headerStu.InnerText = "Top 3 Students";  			TableRow tr; 			TableCell tc; 			TableCell tc1;
			TableCell tc2; 			TableHeaderRow th = new TableHeaderRow(); 			TableHeaderCell thc = new TableHeaderCell(); 			TableHeaderCell thc1 = new TableHeaderCell();
			TableHeaderCell thc2 = new TableHeaderCell(); 			thc.Text = "Student Name"; 			th.Cells.Add(thc); 			thc1.Text = "Obtained Marks"; 			th.Cells.Add(thc1); 			thc2.Text = "Total Marks";
			th.Cells.Add(thc2); 			tblSample.Rows.Add(th);    			for (int a = 0; a < stdName.Count; a++) 			{ 				tr = new TableRow(); 				tc = new TableCell(); 				tc1 = new TableCell();
				tc2 = new TableCell(); 				tc.Text = stdName[a]; 				tr.Cells.Add(tc); 				tc1.Text = totalMarks[a].ToString(); 				tr.Cells.Add(tc1);
				tc2.Text = "500";
				tr.Cells.Add(tc2); 				tblSample.Rows.Add(tr);  			}  
 


		}



	}


}

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace FinalWebTech
{
	public partial class StudentViewHome : System.Web.UI.Page
	{
		public void rmSession_Click(object sender, EventArgs args)
		{
			Session.Remove("userName");
			Response.Redirect("Default.aspx");
		}

		private void InsertStudent(int rollNo, string firstName, string lastName, string ClassName, String section)
		{
			Model.StdMarksRepo student = new Model.StdMarksRepo();
			student.AddStudent(rollNo, firstName, lastName, ClassName, section);

		}


		public void btnAddStudent_Click(object sender, EventArgs args)
		{
			InsertStudent(Int32.Parse(tbRollNo.Text),
						  tbFirstName.Text,
						  tbLastName.Text,
						  tbClass.Text,
						  tbSection.Text);

			Response.Redirect("StudentViewHome.aspx");

		}

		public void btnAddMarks_Click(object sender, EventArgs args)
		{


			InsertMarks(Int32.Parse(tbHiddenId.Value),
						float.Parse(tbPhysics.Text),
						float.Parse(tbChemistry.Text),
						float.Parse(tbMathematics.Text),
						float.Parse(tbComputing.Text),
						float.Parse(tbEnglish.Text));
			Response.Redirect("MarksViewer.aspx?roll=" + Int32.Parse(tbDisabledRoll.Text));
		}

		public void InsertMarks(int Id, float physics, float chemistry, float mathematics, float computing, float english)
		{
			Model.StdMarksRepo marks = new Model.StdMarksRepo();
			marks.AddMark(Id, physics, chemistry, mathematics, computing, english);

		}



	

	}
}

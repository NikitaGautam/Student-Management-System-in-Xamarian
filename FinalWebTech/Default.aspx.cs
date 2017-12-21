using System;
using System.Web;
using System.Web.UI;

namespace FinalWebTech
{

	public partial class Default : System.Web.UI.Page
	{
		public void loginEvent(object sender, EventArgs args)
		{
			if (tbluname.Text != null || tblpassword.Text != null)
			{
				Model.StdMarksRepo user = new Model.StdMarksRepo();
				Model.StudentRegistration check = user.ValidateUser(tbluname.Text, tblpassword.Text);

				if (check != null)
				{
					Session["userName"] = check.FullName;
					Session["userInfo"] = check;
					Response.Redirect("StudentViewHome.aspx");
				}
				else {
					Response.Redirect("Default.aspx");
				}
			}
			else {
				Response.Redirect("Default.aspx");
			}
	

		}


		private void InsertUser(string fullName, string userName, string password, string email)
		{
			Model.StdMarksRepo user = new Model.StdMarksRepo();
			user.AddUser(fullName, userName, password, email);
			Model.StudentRegistration check = user.ValidateUser(tbluname.Text, tblpassword.Text);

			if (check != null)
			{
				Session["userName"] = check.FullName;
				Session["userInfo"] = check;
				Response.Redirect("StudentViewHome.aspx");
			}
			else {
				Response.Redirect("Default.aspx");
			}

		}


		public void btnAddUser_Click(object sender, EventArgs args)
		{
			InsertUser(tbFullName.Text,
						 tbUsername.Text,
						  tbPassword.Text,
							tbEmail.Text);

		}
	}
}

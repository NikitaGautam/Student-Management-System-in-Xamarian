using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;

namespace FinalWebTech.Model
{
	public class StdMarksRepo
	{
		newDbString _Context = new newDbString();

		public void AddUser(string FullName, string Username, string Password, string Email)
		{
			StudentRegistration user = new StudentRegistration();
			user.FullName = FullName;
			user.Username = Username;
			user.Password = Password;
			user.Email = Email;
			_Context.StudentRegistration.Add(user);
			_Context.SaveChanges();
		}

		public StudentRegistration ValidateUser(string username, string password)
		{
			StudentRegistration user = _Context.StudentRegistration.Where(s => s.Username.Equals(username) && s.Password.Equals(password)).FirstOrDefault();

			if (user != null)
			{
				return user;
			}
			else {
				return null;
				//throw new ApplicationException("Cannot find the user.");
			}
		}

		public List<StudentPersonal> GetStudents()
		{
			return (from e in _Context.StudentPersonal.Include("Marks")
					select e).ToList();

		}

		public List<StudentMarks> GetStudentMarks(int id)
		{
			return (from e in _Context.StudentPersonal where e.ID == id select e.Marks).ToList();
		}

		public List<StudentMarks> GetStudentsMarks()
		{
			return (from e in _Context.StudentMarks.Include("StudentPersonal")select e).ToList();

		}


		public void AddStudent(int RollNo, string FirstName, string LastName, string Class, string Section)
		{

			StudentPersonal student = new StudentPersonal();
			student.RollNo = RollNo;
			student.FirstName = FirstName;
			student.LastName = LastName;
			student.Class = Class;
			student.Section = Section;
			_Context.StudentPersonal.Add(student);
			_Context.SaveChanges();

		}



		public void DeleteStudent(int id)
		{
			StudentPersonal student = _Context.StudentPersonal.SingleOrDefault(s => s.ID == id);
			if (student != null)
			{
				_Context.StudentPersonal.Remove(student);
				_Context.SaveChanges();
			}
			else {
				throw new ApplicationException("Cannot find the student.");
			}
		}

		public void EditStudent(int RollNo, string FirstName, string LastName, string Class, string Section, int ID)
		{
			StudentPersonal student = _Context.StudentPersonal.SingleOrDefault(s => s.ID == ID);
			if (student != null)
			{
				student.RollNo = RollNo;
				student.FirstName = FirstName;
				student.LastName = LastName;
				student.Class = Class;
				student.Section = Section;
				_Context.SaveChanges();
			}
			else
			{
				throw new ApplicationException("Cannot find the student.");
			}
		}

		public void AddMark(int Id, float physics, float chemistry, float mathematics, float computing, float english)
		{

			StudentMarks mark = new StudentMarks();
			mark.ID = Id;
			mark.Physics = physics;
			mark.Chemistry = chemistry;
			mark.Mathematics = mathematics;
			mark.Computing = computing;
			mark.English = english;
			_Context.StudentMarks.Add(mark);
			_Context.SaveChanges();

		}

		public void DeleteMark(int id)
		{
			StudentMarks mark = _Context.StudentMarks.SingleOrDefault(s => s.ID == id);
			if (mark != null)
			{
				_Context.StudentMarks.Remove(mark);
				_Context.SaveChanges();
			}
			else {
				throw new ApplicationException("Cannot find the marks.");
			}
		}

		public void EditMark(float physics, float chemistry, float mathematics, float computing, float english, int ID)
		{


			StudentMarks mark = _Context.StudentMarks.SingleOrDefault(s => s.ID == ID);
			if (mark != null)
			{
				mark.Physics = physics;
				mark.Chemistry = chemistry;
				mark.Mathematics = mathematics;
				mark.Computing = computing;
				mark.English = english;
				_Context.SaveChanges();
			}
			else
			{
				throw new ApplicationException("Cannot find the marks.");
			}
		}

	}
}

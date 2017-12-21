<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMainPage.Master" AutoEventWireup="true" CodeBehind="StudentViewHome.aspx.cs" Inherits="FinalWebTech.StudentViewHome" %>

<asp:Content id="head" ContentPlaceHolderID="StyleSection" runat="server">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css">
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
	<style>
	.ui-dialog
{
    z-index: 101;
}
	.GridViewEditRow input[type=text] {width:92px;} /* size textboxes */

		form .error {
  color: #ff0000;
}
	</style>
</asp:Content>


<asp:Content id="link" ContentPlaceHolderID="LinkSection" runat="server"> 
		<li class="active"><a href="StudentViewer.aspx">Student Details</a></li>
        <li><a href="MarksViewer.aspx">Student Marks</a></li>
          <ul class="nav navbar-nav navbar-right" style="margin-right: -190%">
     </ul>

</asp:Content>



<asp:Content id="content" ContentPlaceHolderID="ContentSection" runat="server">
	
<form runat="server" id="studentMain">

	   <asp:Button id="logoutButton" runat="server" OnClick="rmSession_Click" Text="Logout" Style="float: right;" class="btn btn-danger"></asp:Button>		
		<li class="btn btn-info btn" data-toggle="modal" data-target="#stdAddModal" style="margin-right: 1%; float: right;">Add Student</li>
		
	<h3>Welcome <%= Session["userName"]%></h3>
		
<!--Grid view for students-->
<asp:GridView ID="StudentsGridView" RowStyle-Wrap="true" AutoGenerateColumns="false"  AllowPaging="true" DataSourceID="infoDataSource" 
 CssClass="gvv" runat="server" DataKeyNames="ID" HeaderStyle-BackColor="DarkSlateBlue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
  <EditRowStyle CssClass="GridViewEditRow" /> 
			<Columns>

				<asp:BoundField DataField="RollNo" HeaderText="Roll No" 
                    SortExpression="RollNo" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
						
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
				
                <asp:BoundField DataField="Class" HeaderText="Class" 
                  SortExpression="Class"   ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top" />
					   <asp:BoundField DataField="Section" HeaderText="Section" 
                    SortExpression="Section" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>

				  <asp:TemplateField ShowHeader="True" HeaderText="Actions"  ItemStyle-Width="15%" >


					<EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="False" CommandName="Update"
                            Text="Update"  CSSClass="btn btn-info"></asp:LinkButton>
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"  CSSClass="btn btn-danger"></asp:LinkButton>
                    </EditItemTemplate>

					
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" 
                            Text='Edit'  CSSClass="btn btn-primary"></asp:LinkButton>
						 <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text='Delete'  CSSClass="btn btn-danger"></asp:LinkButton>
						
							 <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False"
                            Text='View Marks'  CSSClass="btn btn-primary" href='<%# "MarksViewer.aspx?roll=" + Eval("RollNo") %>' Visible='<%# Convert.ToInt32(Eval("Marks.ID")) != 0 %>'></asp:LinkButton>
                             <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False"
                            Text="Insert Marks" CSSClass="btn btn-primary" OnClientClick='<%# "return showMarksDialog("+ Eval("ID") + "," + Eval("RollNo") + ");" %>' CommandName="AddMarks" Visible='<%# Convert.ToInt32(Eval("Marks.ID")) == 0 %>'></asp:LinkButton>

					</ItemTemplate>
                </asp:TemplateField>

            </Columns>
				
			</asp:GridView>
		<asp:ObjectDataSource ID="infoDataSource" TypeName="FinalWebTech.Model.StdMarksRepo" SelectMethod="GetStudents" 
		DeleteMethod="DeleteStudent" UpdateMethod="EditStudent" runat="server"></asp:ObjectDataSource>
  		

		
<!--Modal for  students info add	-->
 <div class="modal fade" id="stdAddModal" role="dialog" style="display:none">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add New Student </h4>
        </div>
        <div class="modal-body" >


		<div class="form-group" >
 		 <label for="usr">Roll Number:</label>
		    <asp:TextBox ID="tbRollNo" runat="server" class="form-control" />
		</div>

							<div class="form-group">
 		 <label for="usr">First Name:</label>
		    <asp:TextBox ID="tbFirstName" runat="server" class="form-control" />
		</div>
							<div class="form-group">
 		 <label for="usr">Last Name:</label>
		    <asp:TextBox ID="tbLastName" runat="server" class="form-control" />
		</div>
							<div class="form-group">
 		 <label for="usr">Class:</label>
		    <asp:TextBox ID="tbClass" runat="server" class="form-control" />
		</div>

							<div class="form-group">
 		 <label for="usr">Section:</label>
		    <asp:TextBox ID="tbSection" runat="server" class="form-control" />
		</div>
    <br/>
    <asp:Label ID="lblMessage" runat="server" />
    <br/>
  		<asp:Button ID="btnAddStudent" runat="server" class="btn btn-primary" Style="width:50%; margin-left:20%" Text="Add" OnClick="btnAddStudent_Click" OnClientClick="return validate_Personal();" />
   </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!--Student modal close-->

		
  <!-- Marks add Modal -->
  <div class="modal fade" id="addMarksModal" role="dialog" style="display:none">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Insert Marks</h4>
        </div>
        <div class="modal-body">

		<div class="form-group" >
 		 <label for="usr">Physics:* </label>
		    <asp:TextBox ID="tbPhysics" runat="server" class="form-control" />
		</div>

			<div class="form-group" >
 		 <label for="usr">Chemistry:* </label>
		    <asp:TextBox ID="tbChemistry" runat="server" class="form-control" />
		</div>

							<div class="form-group" >
 		 <label for="usr">Mathematics:* </label>
		    <asp:TextBox ID="tbMathematics" runat="server" class="form-control" />
		</div>
							<div class="form-group" >
 		 <label for="usr">English:* </label>
		    <asp:TextBox ID="tbEnglish" runat="server" class="form-control" />
		</div>
							<div class="form-group" >
 		 <label for="usr">Computing:* </label>
		    <asp:TextBox ID="tbComputing" runat="server" class="form-control" />
		</div>

											<div class="form-group" >
 		 <label for="usr">Roll No:* </label>
		    <asp:TextBox ID="tbDisabledRoll" runat="server" class="form-control" ReadOnly="true"/>
		</div>
		<asp:HiddenField ID="tbHiddenId" runat="server" />
						
    <asp:Button ID="btnAddMarks" runat="server" Text="Add" class="btn btn-primary" Style="width:50%; margin-left:20%;" OnClick="btnAddMarks_Click" OnClientClick="return validate_marks();"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
     
    </div>
  </div>	
		</form>
	
</asp:Content>




<asp:Content id="script" ContentPlaceHolderID="ScriptSection" runat="server">
	
 <script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>

	
	<script>
		$(document).ready( function () {

		
    var dtable = $(".gvv").prepend( $("<thead></thead>").append( $(this).find("tr:first") ) ).dataTable({
		"aaSorting": [],
		fixedHeader: {
            header: true,
            footer: true
        }
		});
			$('<button ID="btnShowAllItems" class="btn btn-default" style="padding: 5px 10px;  display: inline-block; margin:7px; height:30px" >Show All</button>').appendTo('div.dataTables_filter');

		$("#btnShowAllItems").click(function() {
    
		 oTable.fnFilter('');
		 return false;
	});


});


	function showMarksDialog(id, roll) {
		$("#<%=tbHiddenId.ClientID%>").val(id);
		$("#<%=tbDisabledRoll.ClientID%>").val(roll);
		$("#addMarksModal").modal({backdrop: true});
 		 return false;

        }

	function validate_marks(){
					var physics = document.getElementById("ctl00_ContentSection_tbPhysics").value;
					var chemistry = document.getElementById("ctl00_ContentSection_tbChemistry").value;
		    		var maths  = document.getElementById("ctl00_ContentSection_tbMathematics").value;
					var computing = document.getElementById("ctl00_ContentSection_tbComputing").value;
					var english = document.getElementById("ctl00_ContentSection_tbEnglish").value;
				if (physics.length == 0 || chemistry.length == 0 || maths.length == 0 || computing.length == 0 || english.length == 0)  
				{  
					alert("Error!Marks field is required.");  
					return false;  
				}  
			   if (isNaN(physics) || isNaN(chemistry) ||  isNaN(maths) || isNaN(computing) || isNaN(english)) {

					alert("Error!Marks can only be numeric value");
					return false;
				} 
				if (physics > 100 || chemistry > 100 || maths > 100 || computing > 100 || english > 100)  
				{  
					alert("Error!Marks should not be greater than 100");  
					return false;  
		
				}
				return true;  
			}

		
			function validate_Personal(){
				var roll = document.getElementById("ctl00_ContentSection_tbRollNo").value;
		   		var firstName = document.getElementById("ctl00_ContentSection_tbFirstName").value;
				var lastName = document.getElementById("ctl00_ContentSection_tbLastName").value;
				var class_name = document.getElementById("ctl00_ContentSection_tbClass").value;
				var section = document.getElementById("ctl00_ContentSection_tbSection").value;
				if(roll.length == 0){
					alert("Error! Roll number cannot be empty.");  
					return false; 
				}
				else if (roll.length!=3)  
					{  
					alert("Error! Roll number should be of length 3.");  
					return false;  
				}
				else if(isNaN(roll)){
						alert("Error! Roll Number should be numeric.");
						return false;
				}
				if (firstName.length == 0){
					alert("Error! First Name cannot be empty.");
					return false;
				}
				if(lastName.length == 0){
					alert("Error! Last Name cannot be empty.");
					return false;
				}
				if (class_name.length == 0){
					alert("Error! Class cannot be empty.");
					return false;
				}
				else if(isNaN(class_name)){
						alert("Error! Class should be numeric.");
						return false;
				}
				if (section.length == 0){
					alert("Error! Section cannot be empty.");
					return false;
				}
				else if (section.length != 1)  
					{  
					alert("Error! Section should be of length 1.");  
					return false;  
				}

			return true;  
		}

		


</script>

	

</asp:Content>



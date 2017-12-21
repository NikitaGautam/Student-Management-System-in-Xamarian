<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMainPage.Master" AutoEventWireup="true" CodeBehind="MarksViewer.aspx.cs" Inherits="FinalWebTech.MarksViewer" %>
<asp:Content id="head" ContentPlaceHolderID="StyleSection" runat="server">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css">
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

	<style>
		.ui-dialog
{
    z-index: 101;
}
		.fail {
    background-color: #f46e42 !important;
}

		
		.GridViewEditRow input[type=text] {width:70px;} /* size textboxes */



		.studentTable {
       border-collapse: collapse;
	   width: 50%;	
		margin-left:25%;
}

   th,td {
    text-align: left;
    padding: 8px;
}
		

tr:nth-child(even){background-color: #f2f2f2}

		th {
    background-color: DarkSlateBlue;
    color: white;
}
	</style>
</asp:Content>

<asp:Content id="link" ContentPlaceHolderID="LinkSection" runat="server">
				<li><a href="StudentViewHome.aspx">Student Details</a></li>
        <li class="active"><a href="MarksViewer.aspx">Student Marks</a></li>
	  
</asp:Content>


<asp:Content id="body" ContentPlaceHolderID="ContentSection" runat="server">	
		<form runat="server">
	
		
		<asp:Button id="tpStd" runat="server" OnClick="viewTopStudentList" Text="View Top 3 Students" Style="float: left;" class="btn btn-info"></asp:Button>

	
		<asp:Button id="logoutButton" runat="server" OnClick="rmSession_Click" Text="Logout" Style="float: right;" class="btn btn-danger"></asp:Button>	


		<input type="button" onclick="printDiv('marksDiv')" value="Print Marksheet" style="margin-left: 30% "  class="btn btn-primary" />
<div id="marksDiv">
<asp:GridView ID="GridView3" runat="server" DataKeyNames="ID" AutoGenerateColumns="false" 
         AllowSorting="true"   DataSourceID="MarksDataSource" AllowPaging="true" CssClass="marksViewer" HeaderStyle-BackColor="DarkSlateBlue"  HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" OnRowDataBound="marksDataBound">
              <EditRowStyle CssClass="GridViewEditRow" /> 
			<Columns>

				<asp:TemplateField HeaderText="Roll No">
  <ItemTemplate>
      <asp:Label ID="RollNo" runat="server" Text='<%# Eval("StudentPersonal.RollNo") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
				
					<asp:TemplateField HeaderText="First Name">
  <ItemTemplate>
      <asp:Label ID="FirstName" runat="server" Text='<%# Eval("StudentPersonal.FirstName") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
					<asp:TemplateField HeaderText="LastName">
  <ItemTemplate>
      <asp:Label ID="LastName" runat="server" Text='<%# Eval("StudentPersonal.LastName") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
   <asp:BoundField DataField="Physics" HeaderText="Physics" 
                    SortExpression="Physics" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
				<asp:BoundField DataField="Chemistry" HeaderText="Chemistry" 
                    SortExpression="Chemistry" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
                <asp:BoundField DataField="Mathematics" HeaderText="Mathematics" 
                    SortExpression="Mathematics" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
						
                <asp:BoundField DataField="Computing" HeaderText="Computing" 
                    SortExpression="Computing" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
                <asp:BoundField DataField="English" HeaderText="English" 
                  SortExpression="English"   ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top" />
				
				  <asp:TemplateField ShowHeader="True" HeaderText="Actions"  ItemStyle-Width="15%" >

                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text='Edit'  CSSClass="btn btn-primary"></asp:LinkButton>
						 <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text='Delete'  CSSClass="btn btn-danger"></asp:LinkButton>
					</ItemTemplate>

					<EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="False" CommandName="Update"
                            Text="Update"  CSSClass="btn btn-primary"></asp:LinkButton>
                        <asp:LinkButton ID="LnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"  CSSClass="btn btn-danger"></asp:LinkButton>
                    </EditItemTemplate>

					
                </asp:TemplateField>
               
            </Columns>
				</asp:GridView>
				</div>

		
			<asp:ObjectDataSource ID="MarksDataSource" runat="server" SelectMethod="GetStudentsMarks"  DeleteMethod="DeleteMark"
				UpdateMethod="EditMark" TypeName="FinalWebTech.Model.StdMarksRepo">
			</asp:ObjectDataSource>


<div style="height: 80px"></div>	
<h3 runat="server" id="headerStu" style="margin-left: 40%; color: Blue;"></h3>
<asp:Table class="table" id="tblSample" runat="server" CssClass="studentTable">
			
</asp:Table>

</form>	

	



</asp:Content>
<asp:Content id="script" ContentPlaceHolderID="ScriptSection" runat="server">

<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>
    <script runat="server">
		
    void marksDataBound(Object sender, GridViewRowEventArgs e)
  {
  		   if (e.Row.RowType == DataControlRowType.DataRow)
        {
		 if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
            {
 				for(int i=3;i<8;i++){ 						 if (Convert.ToInt32(e.Row.Cells[i].Text) <40){                         e.Row.Cells[i].BackColor = System.Drawing.Color.Red; 						e.Row.Cells[i].ForeColor = System.Drawing.Color.White;	 		     			 } 						else { 								e.Row.Cells[i].BackColor = System.Drawing.Color.Green; 								e.Row.Cells[i].ForeColor = System.Drawing.Color.White;	 							} 				}
		
			
		}
		}
    
  }
	</script>
	
<script>

     function printDiv(divName){
     	var printContents=document.getElementById(divName).innerHTML;
		var originalContents=document.body.innerHTML;
		document.body.innerHTML=printContents;
		window.print();
		document.body.innerHTML=originalContents;
		}
		

			$(document).ready( function () {

		
		   var searchQuery;
          var oTable = $(".marksViewer").prepend( $("<thead></thead>").append( $(this).find("tr:first") ) ).dataTable({
		"aaSorting": [],
		fixedHeader: {
            header: true,
            footer: true
        }
		});

		$('<button ID="btnShowAll" class="btn btn-default" style="padding: 5px 10px;  display: inline-block; margin:7px; height:30px" >Show All</button>').appendTo('div.dataTables_filter');

		$("#btnShowAll").click(function() {
         oTable.fnFilter('', 0);
		 oTable.fnFilter('');
		window.location.href =  "MarksViewer.aspx";
		return false;
	   });


			var queryParam = getUrlVars();
			
		if (queryParam.roll){
			searchQuery = queryParam.roll;
			oTable.fnFilter("^"+searchQuery+"$", 0, true, false);
		}else{
			
		}

		function getUrlVars()
	{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
	}

		
	   	
});

	
		
	


	
</script>

	
</asp:Content>
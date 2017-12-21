<%@ Page Language="C#" Inherits="FinalWebTech.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
	<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="Scripts/jquery-1.9.1.min.js" type="text/javascript" />	
</head>
<body>
	<br><br>
			
	<div class="container"> 

				<form runat="server">
						<nav class="navbar navbar-inverse">
 			 <div class="container-fluid">
   			 <div class="navbar-header">
      		<a class="navbar-brand" href="#"></a>
   			 </div>
    		<ul class="nav navbar-nav">
      
   		 </ul>
  			</div>
		</nav>
				</form>
			<form runat="server">
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>  Username</span>
                                      <asp:TextBox id="tbluname" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>  Password</span>
                                          <asp:TextBox id="tblpassword" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                   
           
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <asp:Button ID="btnLoginUser" runat="server" class="btn btn-primary" Style="width:50%; float: center;" Text="Login" OnClick="loginEvent" OnClientClick="return validate_Login();"/>
 							     </div>
                                </div>
                                <br><br>

                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                     



                        </div>                     
                    </div>  
        </div>

		</form>
		<form runat="server">	
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <div class="form-horizontal">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                                <div class="form-group">
                                    <label for="tbFullName" class="col-md-3 control-label">Full Name</label>
                                    <div class="col-md-9">
										<asp:TextBox id="tbFullName" Text="" class="form-control"  runat="server"></asp:TextBox>
                           
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="tbUsername" class="col-md-3 control-label">Username Name</label>
                                    <div class="col-md-9">
                                       	<asp:TextBox id="tbUsername" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                </div>
                        
                                <div class="form-group">
                                    <label for="tbPassword" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                      	<asp:TextBox id="tbPassword" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                </div>

                              
								     <div class="form-group">
                                    <label for="tbEmail" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                      	<asp:TextBox id="tbEmail" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                </div>

								 <!--    <div class="form-group">
                                    <label for="tbEmail" class="col-md-3 control-label">Role</label>
                                    <div class="col-md-9">
                                      	<asp:TextBox id="tbRole" Text="" class="form-control"  runat="server"></asp:TextBox>
                                    </div>
                                </div>-->
                      

                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                       <!-- <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>
                                    -->   <asp:Button ID="btnAddUserReg" runat="server" class="btn btn-primary" Style="width:50%; float: center;" Text="Register" OnClick="btnAddUser_Click"  OnClientClick="return validate_Registration();"/>
 
                                    </div>
                                </div>
                                
                                <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">
      
                                </div>
                
                         </div>
                    </div>
						</div>
               
                
         </div>
	  </form>
    </div>
    	<script>

				function validate_Registration(){
					var fullname = document.getElementById("tbFullName").value;
					var username = document.getElementById("tbUsername").value;
		    		var password  = document.getElementById("tbPassword").value;
					var email = document.getElementById("tbEmail").value;
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					var regularEx = /^(?=.*[\d])(?=.*[!@#$%^&*])[\w!@#$%^&*]{6,16}$/;
				if (fullname.length == 0)  
				{  
					alert("Error! Fullname field is required.");  
					return false;  
				} 
				if (username.length == 0)  
				{  
					alert("Error! Username field is required.");  
					return false;  
				} 
				if (password.length == 0)  
				{  
					alert("Error! Password field is required.");  
					return false;  
				} else if(regularEx.test(password) == false){
					
					alert("Error! Password should contain atleast one number and atleast one speical character (Minimun length 6 and maximum length 16).");  
					return false; 
				}
			
				if (email.length == 0)  
				{  
					alert("Error! Email field is required.");  
					return false;  
				} 
				else if(re.test(email) == false){
					alert("Error! Email should be in correct format.");  
					return false;  
				}
				
			 
				return true;  
			}


			function validate_Login(){
					var username = document.getElementById("tbluname").value;
					var password = document.getElementById("tblpassword").value;

		    	
				if (username.length == 0)  
				{  
					alert("Error! Username is required.");  
					return false;  
				} 
				if (password.length == 0)  
				{  
					alert("Error! Password is required.");  
					return false;  
				} 
			   
			
			}
			
			



		</script>
</body>
</html>

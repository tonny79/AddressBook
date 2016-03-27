<%@ page import="zhulin.project.Address"%>
<jsp:useBean id="addressManager" scope="session" class="zhulin.project.AddressManager" />

<html>
  <head>
    <title>VR 715 Address Book</title>
    <STYLE>BODY {
	FONT-SIZE: 14px; COLOR: black; FONT-FAMILY: Tahoma,Arial,sans-serif; BACKGROUND-COLOR: white
}
H1 {
	FONT-SIZE: 22px; COLOR: white; FONT-FAMILY: Tahoma,Arial,sans-serif; BACKGROUND-COLOR: #525d76
}
TD {
	FONT-SIZE: 14px; COLOR: black; FONT-FAMILY: Tahoma,Arial,sans-serif; BACKGROUND-COLOR: white
}
TH {
	FONT-WEIGHT: bold; FONT-SIZE: 14px
}
PRE {
	BORDER-RIGHT: #525d76 1px dotted; BORDER-TOP: #525d76 1px dotted; FONT-SIZE: 14px; BORDER-LEFT: #525d76 1px dotted; BORDER-BOTTOM: #525d76 1px dotted
}
TT {
	BORDER-RIGHT: #525d76 1px dotted; BORDER-TOP: #525d76 1px dotted; FONT-SIZE: 14px; BORDER-LEFT: #525d76 1px dotted; BORDER-BOTTOM: #525d76 1px dotted
}
A {
	COLOR: black
}
A.name {
	COLOR: black
}

INPUT{
	FONT-SIZE: 14px; COLOR: black; FONT-FAMILY: Tahoma,Arial,sans-serif; BACKGROUND-COLOR: white
}
</STYLE>
  </head>
  <body>
    <%
      String password=request.getParameter("password");
      addressManager.Login(password);
    %>
    <% if(!addressManager.isLogin()){ %>
    <h1>Password</h1>
    <form action="am.jsp" method="post">
       <input type="password" name="password" size="20" />
       <input type="submit" value="Submit!" />
    </form>
    <% 
    }else{
          String name=request.getParameter("name");
          String phone=request.getParameter("phone");
          String email=request.getParameter("email");
          String company=request.getParameter("company");
          String lover=request.getParameter("lover");
          String child1=request.getParameter("child1");
          String child2=request.getParameter("child2");
          if(name!=null&&!name.trim().equals("")){
        	//Create a new address or update an existed address
    	      addressManager.addAddress(name,phone,email,company,lover,child1,child2);
          }
    %>
    <!-- Display AddressBook -->
    <h1>Welcome to VR 715 AddressBook!</h1>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Company</th>
        <th>Spouse</th>
        <th>Child 1</th>
        <th>Child 2</th>
        <th>Created Date</th>
      </tr>
      <%
         Address[] addresses=addressManager.getAddresses();
         for(int i=0;i<addresses.length;i++){
        	 //String dateText=DateFormat.getDateInstance(DateFormat.FULL,Locale.CHINA).format(addresses[i].getCreatedDate());
      %>  
      <tr>
        <td align="left"><%=addresses[i].getId()%></td>
        <td align="left"><a href="amedit.jsp?id=<%=addresses[i].getId()%>"><%=addresses[i].getName()%></a></td>
        <td align="left"><%=addresses[i].getPhone()%></td>
        <td align="left"><%=addresses[i].getEmail()%></td>
        <td align="left"><%=addresses[i].getCompany()%></td>
        <td align="left"><%=addresses[i].getLover()%></td>
        <td align="left"><%=addresses[i].getChild1()%></td>
        <td align="left"><%=addresses[i].getChild2()%></td>
        <td align="left"><%=addresses[i].getCreatedDate()%></td>
      </tr>
      <%
        }
      %>
    </table>
    <p />
    <a href="amadd.jsp">Register!</a>
    <p />
    <img src="sh2016.jpg" alt="VR715 Latest Picture" />
    <%
     }
    %>
  </body>
</html>
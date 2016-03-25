<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DateFormat" %>
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
    <% }else{ %>
    <h1>Input your info below.Don't use IE please</h1>
    <%
      String name=request.getParameter("name");
      String phone=request.getParameter("phone");
      String email=request.getParameter("email");
      String company=request.getParameter("company");
      String lover=request.getParameter("lover");
      String child1=request.getParameter("child1");
      String child2=request.getParameter("child2");
      if(name!=null&&!name.trim().equals("")){
    	  addressManager.addAddress(name,phone,email,company,lover,child1,child2);
      }
    %>
    <form action="am.jsp" method="post">
      <table border="0">
        <tr>
          <td align="left">Name:</td>
          <td align="left"><input type="text" name="name" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Spouse:</td>
          <td align="left"><input type="text" name="lover" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Phone:</td>
          <td align="left"><input type="text" name="phone" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Email:</td>
          <td align="left"><input type="text" name="email" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Child 1:</td>
          <td align="left"><input type="text" name="child1" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Child 2:</td>
          <td align="left"><input type="text" name="child2" size="20" /></td>
        </tr>
        <tr>
          <td align="left">Company:</td>
          <td align="left"><input type="text" name="company" size="20" /></td>
        </tr>
        <tr>
           <td />
           <td align="left"><input type="submit" value="Submit!" /></td>
        </tr>
      </table>
    </form>
    <p />
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Created Date</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Company</th>
        <th>Spouse</th>
        <th>Child 1</th>
        <th>Child 2</th>
      </tr>
      <%
         Address[] addresses=addressManager.getAddresses();
         for(int i=0;i<addresses.length;i++){
        	 //String dateText=DateFormat.getDateInstance(DateFormat.FULL,Locale.CHINA).format(addresses[i].getCreatedDate());
      %>  
      <tr>
        <td align="left"><%=addresses[i].getId()%></td>
        <td align="left"><%=addresses[i].getCreatedDate()%></td>
        <td align="left"><%=addresses[i].getName()%></td>
        <td align="left"><%=addresses[i].getPhone()%></td>
        <td align="left"><%=addresses[i].getEmail()%></td>
        <td align="left"><%=addresses[i].getCompany()%></td>
        <td align="left"><%=addresses[i].getLover()%></td>
        <td align="left"><%=addresses[i].getChild1()%></td>
        <td align="left"><%=addresses[i].getChild2()%></td>
      </tr>
      <%
        }
      %>
      <%
        }
      %>
    </table>
  </body>
</html>
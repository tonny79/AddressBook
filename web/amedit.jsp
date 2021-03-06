<%@ page import="zhulin.project.Address"%>
<jsp:useBean id="addressManager" scope="session" class="zhulin.project.AddressManager" />

<html>
  <head>
    <title>Edit an address</title>
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
    <form action="amedit.jsp" method="post">
       <input type="password" name="password" size="20" />
       <!-- Pass the id parameter  -->
       <input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
       <input type="submit" value="Submit!" />
    </form>
    <% 
    }else{
      String id=request.getParameter("id");
      Address address=addressManager.getAddress(Integer.parseInt(id));
      
      if(address!=null){ //Find the existed address, update!
    %>
    <h1>Update an address.Don't use IE please</h1>
    <form action="am.jsp" method="post">
      <table border="0">
        <tr>
          <td align="left">Name:</td>
          <td align="left"><input type="text" name="name" size="20" value="<%=address.getName()%>" readonly="readonly" /></td>
        </tr>
        <tr>
          <td align="left">Spouse:</td>
          <td align="left"><input type="text" name="lover" size="20" value="<%=address.getLover()%>" /></td>
        </tr>
        <tr>
          <td align="left">Phone:</td>
          <td align="left"><input type="text" name="phone" size="20" value="<%=address.getPhone()%>" /></td>
        </tr>
        <tr>
          <td align="left">Email:</td>
          <td align="left"><input type="text" name="email" size="20" value="<%=address.getEmail() %>" /></td>
        </tr>
        <tr>
          <td align="left">Child 1:</td>
          <td align="left"><input type="text" name="child1" size="20" value="<%=address.getChild1() %>" /></td>
        </tr>
        <tr>
          <td align="left">Child 2:</td>
          <td align="left"><input type="text" name="child2" size="20" value="<%=address.getChild2() %>" /></td>
        </tr>
        <tr>
          <td align="left">Company:</td>
          <td align="left"><input type="text" name="company" size="20" value="<%=address.getCompany() %>" /></td>
        </tr>
        <tr>
           <td align="center"><input type="submit" value="Update!" /></td>
           <td align="center"><a href="am.jsp">Cancel</a></td>
        </tr>
      </table>
    </form>
    <%
      }else{
    %>
    <b>Can't find the address whose id="<%=id%>"!</b>
    <%
      }
    }
    %>
  </body>
</html>
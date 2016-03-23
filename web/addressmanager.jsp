<%@ page import="zhulin.project.Address"%>
<jsp:useBean id="addressManager" scope="session" class="zhulin.project.AddressManager" />

<html>
  <head>
    <meta charset="utf-8" />
    <title>西安交通大学715教研室通讯录</title>
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
    <h1>欢迎使用VR715通讯录!</h1>
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
    <form action="addressmanager.jsp" method="post">
      <table border="0">
        <tr>
          <td align="left">姓名:</td>
          <td align="left"><input type="text" name="name" size="20" /></td>
          <td align="left">爱人名:</td>
          <td align="left"><input type="text" name="lover" size="20" /></td>
        </tr>
        <tr>
          <td align="left">电话:</td>
          <td align="left"><input type="text" name="phone" size="20" /></td>
          <td align="left">邮件:</td>
          <td align="left"><input type="text" name="email" size="20" /></td>
        </tr>
        <tr>
          <td align="left">大娃名:</td>
          <td align="left"><input type="text" name="child1" size="20" /></td>
          <td align="left">二娃名:</td>
          <td align="left"><input type="text" name="child2" size="20" /></td>
        </tr>
        <tr>
          <td align="left">公司:</td>
          <td align="left"><input type="text" name="company" size="100" /></td>
          <td/>
          <td/>
        </tr>
        <tr>
           <td />
           <td />
           <td />
           <td align="left"><input type="submit" value="Submit!" /></td>
        </tr>
      </table>
    </form>
    <p />
    <table border="1">
      <tr>
        <td><b>ID</b></td>
        <td>Created Date</td>
        <td>Name</td>
        <td>Phone</td>
        <td>Email</td>
        <td>Company</td>
        <td>Lover</td>
        <td>Child 1</td>
        <td>Child 2</td>
      </tr>
      <%
         Address[] addresses=addressManager.getAddresses();
         for(int i=0;i<addresses.length;i++){
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
    </table>
  </body>
</html>
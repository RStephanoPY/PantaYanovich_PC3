<%-- 
    Document   : Editar
    Created on : 02/02/2018, 03:33:51 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/crudweb";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from habitacion where id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("id")%>"/>
                 Tipo de habitacion:
                <input type="text" name="txtNombre" class="form-control" value="<%= rs.getString("Tipoha")%>"/><br>
                Camas:
                <input type="text" name="txtNombre" class="form-control" value="<%= rs.getString("Camas")%>"/><br>
                Capacidad:
                <input type="text" name="txtNombre" class="form-control" value="<%= rs.getString("Capacidad")%>"/><br>
                Costo:
                <input type="text" name="txtCosto" class="form-control" value="<%= rs.getString("Costo")%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="index.jsp">Regresar</a><br>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String costo, nombre;
       costo=request.getParameter("txtCosto");
       nombre=request.getParameter("txtNombre");
       if(nombre!=null && costo!=null){
           ps=con.prepareStatement("update persona set nombre='"+nombre+"', costo='"+costo+"'where id="+id);
           ps.executeUpdate();
           response.sendRedirect("index.jsp");
       }
       
       
%>

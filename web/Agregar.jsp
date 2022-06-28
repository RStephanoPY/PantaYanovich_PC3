

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
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
        <div class="container">
            <h1>Agregar Habitación</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Tipo de Habitación:
                <input type="text" name="txtTHabitacion" class="form-control"/><br>
                Camas:
                <input type="text" name="txtcama" class="form-control"/><br>
                Capacidad:
                <input type="text" name="txtcapacidad" class="form-control"/><br>
                Costo:
                <input type="text" name="txtcosto" class="form-control"/><br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>
<%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/crudweb";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       String costo, capacidad,tipo,camas;
       tipo=request.getParameter("txtTHabitacion");
       camas=request.getParameter("txtcama");
       capacidad=request.getParameter("txtcapacidad");
       costo=request.getParameter("txtcosto");
       if(tipo!=null && costo!=null && camas!=null && capacidad!=null){
           ps=con.prepareStatement("insert into (id, Costo, Camas, Capacidad, Tipoha)values('"+costo+"','"+camas+"','"+capacidad+"','"+tipo+"')");
           ps.executeUpdate();
           JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
           response.sendRedirect("index.jsp");
           
       }
       
       
%>
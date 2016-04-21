<%-- 
    Document   : update
    Created on : 03-sep-2015, 23:45:50
    Author     : Cristian RD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar usuario</title>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Style.css">
        <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'> <!-- cursiva y negrita -->
        <link href='https://fonts.googleapis.com/css?family=Lora' rel='stylesheet' type='text/css'> <!-- Lora -->
    </head>
    <body>
        <header class="header cursive tamaño-medio">
            <nav>
                <ul>
                    <li class="col-md-3"><a href="create.jsp">create</a></li>
                    <li class="col-md-3"><a href="read.jsp">read</a></li>
                    <li class="col-md-3"><a href="update.jsp">update</a></li>
                    <li class="col-md-3"><a href="delete.jsp">delete</a></li>
                </ul>
            </nav>  
        </header>
        <section>
                <header>
                    <h1 class="cursive tamaño-grande">Editar un usuario</h1>
                </header>
                <div class="content lora tamaño-medio">
<%! int clave=0; %>
<%
// codigo del evento BUSQUEDA y recordar construir una nueva forma dinamica
if(request.getParameter("BUSCAR") != null)
{
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb","root","crd3194");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
clave = Integer.parseInt(request.getParameter("user_id"));
String q="select * from users where user_id="+clave;
try { tabla = instruccion.executeQuery(q);
tabla.next();
out.println("<FORM ACTION=update.jsp METHOD=POST>");
out.println("USERNAME: <INPUT Style=color:black  TYPE=TEXT NAME=username size=10 VALUE= "+ tabla.getString(2)+ "><BR><BR>");
out.println("PASSWORD: <INPUT Style=color:black TYPE=TEXT NAME=pasword  size=10 VALUE= "+ tabla.getString(3)+ "><BR><BR>");
out.println("FULLNAME: <INPUT Style=color:black TYPE=TEXT NAME=fullname size=30 VALUE= "+ tabla.getString(4)+ "><BR><BR>");
out.println("EMAIL: <INPUT Style=color:black TYPE=TEXT NAME=email  size=40 VALUE= "+ tabla.getString(5)+ "><BR><BR>");
out.println("<INPUT Style=color:black TYPE=SUBMIT NAME=EDITAR VALUE=EDITAR><BR>");
tabla.close();instruccion.close();canal.close();
} catch(SQLException e) {} catch(Exception ex){};
}; // fin evento buscar
// codigo de evento EDICION
String temp2=request.getParameter("EDITAR");
if(temp2==null)temp2=" ";
if(temp2.compareTo("EDITAR")==0)
{
String username,q,pasword,fullname,email;
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb","root","crd3194");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
try {
tabla = instruccion.executeQuery("select * from users");
} catch(SQLException e) {};

username = request.getParameter("username");
pasword = request.getParameter("pasword");
fullname = request.getParameter("fullname");
email = request.getParameter("email");


q = "UPDATE users SET "+ "username='"+ username+ "',pasword='"+ pasword+"',fullname='"+fullname+"',email='"+email+"' WHERE user_id='" + clave+"';";
try{instruccion.executeUpdate(q); }catch(SQLException e) {};
try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};
out.println("<p Style=color:red>REGISTRO EDITADO</p>");
}; // fin evento editar
// construyendo forma dinamica
out.println("<FORM ACTION=update.jsp METHOD=post>");
out.println("ID A EDITAR: <INPUT Style=color:black  TYPE=TEXT NAME=user_id><BR>");
out.println("<INPUT Style=color:black  TYPE=SUBMIT NAME=BUSCAR VALUE=BUSCAR ><BR>");
out.println("</FORM>");
%>
       </div>
        </section>
        <footer class="footer cursive tamaño-medio">
            <p>&copy; 2015 Crud Web</p> 
        </footer>
    </body>
</html>

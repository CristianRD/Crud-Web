<%-- 
    Document   : read
    Created on : 03-sep-2015, 23:44:20
    Author     : Cristian RD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver los usuarios</title>
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
                    <h1 class="cursive tamaño-grande"> Mostrar contenido de la tabla</h1>
                </header>
                <div class="lora tamaño-medio">
<%
// declarando y creando objetos globales
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;
if(request.getParameter("OK") != null)
{
// abriendo canal o enlace en su propio try-catch
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb","root","crd3194");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
//leyendo tabla en disco y pasandola al resultset
try { tabla = instruccion.executeQuery("select * from users");
// mandando resultset a una tabla html
out.println("<TABLE class=tabla Border=5 CellPadding=5><TR>");
out.println("<th bgcolor=gray>USER_ID</th><th bgcolor=gray>USERNAME</th><th bgcolor=gray>PASSWORD</th>"
        + "<th bgcolor=gray>FULLNAME</th><th bgcolor=gray text-align:center>EMAIL</th></TR>");
// ciclo de lectura del resultset
while(tabla.next()) {
out.println("<TR>");
out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("<TD>"+tabla.getString(4)+"</TD>");
out.println("<TD>"+tabla.getString(5)+"</TD>");
out.println("</TR>"); }; // fin while
out.println("</TABLE></CENTER></DIV></HTML><br>");
// cerrando resultset
tabla.close(); instruccion.close();canal.close();} //fin try no usar ; al final de dos o mas catchs
catch(SQLException e) {};
};
// construyendo forma dinamica

out.println("<FORM ACTION=read.jsp METHOD=post>");
out.println("<INPUT Style=color:black TYPE=SUBMIT NAME=OK VALUE=CONSULTA><BR>");
out.println("</FORM>");
        
%>
       </div>
        </section>
<footer class="footer cursive tamaño-medio">
            <p>&copy; 2015 Crud Web</p> 
        </footer>
    </body>
</html>

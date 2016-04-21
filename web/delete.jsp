<%-- 
    Document   : delete
    Created on : 03-sep-2015, 23:46:05
    Author     : Cristian RD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar un usuario</title>
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
                    <h1 class="cursive tamaño-grande"> Eliminar un usuario</h1>
                </header>
                <div class="content lora tamaño-medio">
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
// preparando condicion de eliminacion
int clave = Integer.parseInt(request.getParameter("user_id"));
// construyendo select con condicion eliminacion SQL DELETE
String q="delete from users where user_id = "+clave;
// mandando SQL a tabla en disco
try { instruccion.executeUpdate(q);
// avisando
out.println("<P Style=color:red>REGISTRO ELIMINADO</P>");
} //fin try no usar ; al final de dos o mas catchs
catch(SQLException e) {}
catch(java.lang.NullPointerException e){};
try {
// no ocupa cerrar tabla(), no se leyo (select) un resultset
// la eliminacion fue directa en disco
instruccion.close();canal.close();} catch(SQLException e) {};
};
// construyendo forma dinamica
out.println("<FORM ACTION=delete.jsp METHOD=post>");
out.println("ID A ELIMINAR: <INPUT Style=color:black  TYPE=TEXT NAME=user_id><BR>");
out.println("<INPUT Style=color:black TYPE=SUBMIT NAME=OK VALUE=ELIMINAR><BR>");
out.println("</FORM>");
%>
 </div>
        </section>
        <footer class="footer cursive tamaño-medio">
            <p>&copy; 2015 Crud Web</p> 
        </footer>
    </body>
</html>

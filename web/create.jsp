<%-- 
    Document   : create
    Created on : 03-sep-2015, 23:44:01
    Author     : Cristian RD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear nuevo usuario</title>
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
                    <h1 class="cursive tamaño-grande"> Insertar nuevo usuario </h1>
                </header>
                <div class="content lora tamaño-medio">
                    <%
                        if (request.getParameter("GRABAR") != null) {
             // objetos de enlace
                            Connection canal = null;
                            ResultSet tabla = null;
                            Statement instruccion = null;

             // abriendo canal o enlace en su propio try-catch
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                canal = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb", "root", "crd3194");
                                instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                        ResultSet.CONCUR_UPDATABLE);
                            } catch (java.lang.ClassNotFoundException e) {
                            } catch (SQLException e) {
                            };
             //cargando los campos a grabar
             // excepto clave porque en mysql es de tipo auto-increment

                            String user_id = request.getParameter("user_id");
                            String username = request.getParameter("username");
                            String pasword = request.getParameter("pasword");
                            String fullname = request.getParameter("fullname");
                            String email = request.getParameter("email");

             // insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);
                            String q = "insert into users(user_id,username,pasword,fullname,email) values('" + user_id + "','" + username + "','" + pasword + "','" + fullname + "','" + email + "'); ";
                            try {
             // agregando renglon (insert)
                                int n = instruccion.executeUpdate(q);
             //avisando que se hizo la instruccion
                                out.println("<p Style=color:red>REGISTRO INSERTADO</p>");
                            } catch (SQLException e) {
                                out.println(e);
                            };
                            try {
             // tabla.close();
                                instruccion.close();
                                canal.close();
                            } catch (SQLException e) {
                                out.println(e);
                            };
                        };
             // construyendo forma dinamica
                        out.println("<FORM ACTION=create.jsp METHOD=post>");
                        out.println("USER_ID : <INPUT Style=color:black  TYPE=TEXT NAME=user_id size=5><BR><br>");
                        out.println("USERNAME: <INPUT Style=color:black  TYPE=TEXT NAME=username size=10><BR><br>");
                        out.println("PASSWORD: <INPUT Style=color:black TYPE=TEXT NAME=pasword size=10><BR><br>");
                        out.println("FULLNAME: <INPUT Style=color:black TYPE=TEXT NAME=fullname size=30><BR><br>");
                        out.println("EMAIL: <INPUT Style=color:black TYPE=TEXT NAME=email size=40><BR><br>");
                        out.println("<INPUT Style=color:black TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");
                        out.println("</FORM>");
                    %>
                </div>
        </section>
        <footer class="footer cursive tamaño-medio">
            <p>&copy; 2015 Crud Web</p> 
        </footer>
    </body>
</html>

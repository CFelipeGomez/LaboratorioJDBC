<%-- 
    Document   : crear
    Created on : 2/11/2022, 9:19:31 p. m.
    Author     : fepip
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class=form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="nacimiento">Fecha de nacimiento</label>
                            <input type="text" class=form-control" id="nacimiento" name="nacimiento" placeholder="AAAA/DD/MM" required="required">
                        </div>

                        <button type="submit" name="enviar">GUARDAR</button>
                    </form>
                </div>  
            </div>    
        </div> 
        <%
            if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("nombre");
                String nacimiento = request.getParameter("nacimiento");
               
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("insert into persona (nombre,nacimiento) values('" + nombre + "','" + nacimiento + "');");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

    </body>
</html>
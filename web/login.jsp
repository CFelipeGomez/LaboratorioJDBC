<%-- 
    Document   : login
    Created on : 2/11/2022, 9:36:23 p. m.
    Author     : fepip
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INGRESAR</title>
    </head>
    <body>
         <p>USER AND PASSSWORD = admin </p> 
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="login.jsp">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <label>Constraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login">Login</button>
                    </form> 
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            //propiedad jsp para generar un login
                            HttpSession sesion = request.getSession();
                            if (user.equals("admin") && password.equals("admin")) {
                                sesion.setAttribute("logeado", "1");
                                sesion.setAttribute("user", user);
                                response.sendRedirect("index.jsp");
                            } else {
                                out.print("revisa tu contraseña o usuario");

                            }
                        }

                    %>
                </div>
            </div>
        </div>
    </body>
</html>
<%@ page language="java" %>
    <%@ page import="java.util.*" %>
        <%@ page import="WekaSolution.Transformation" %>

            <html>

            <head>
                <title>JSP Templates</title>
            </head>

            <body>
                <h2>PBI</h2>

                <% 
                Transformation.RunTransformation("/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/TASKDATA1.ktr");
                    %>
            </body>

            </html>
<%@ page language="java" %>
    <%@ page import="java.util.List , WekaSolution.WekaApriori, weka.associations.AssociationRule" %>

<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>PBI2</title>
</head>


<body>
    <h1>PBI2 - Regras de associacao</h1>
    
    <% 
    String path = "/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/test_conv/";
    WekaApriori apriori = new WekaApriori();
    List<AssociationRule> rules1 = apriori.RunAlgorithmToFile(path + "TASKDATA1.arff");
    List<AssociationRule> rules2 = apriori.RunAlgorithmToFile(path + "TASKDATA2.arff");
    List<AssociationRule> rules3 = apriori.RunAlgorithmToFile(path + "TASKDATA3.arff");
    List<AssociationRule> rules4 = apriori.RunAlgorithmToFile(path + "TASKDATA3.arff");
    List<AssociationRule> rules5 = apriori.RunAlgorithmToFile(path + "TASKDATA5.arff");
    List<AssociationRule> rules6 = apriori.RunAlgorithmToFile(path + "TASKDATA6.arff");
    %>

    <% 
    out.println("<h3>TASKDATA 1 - Cliente que compra um produto tambem compra outro produto em 2004</h3>");    
        out.println("<ul>");
        for (AssociationRule item : rules1) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
        out.println("<h3>TASKDATA 2 - Cliente que compra uma linha de produtos tambem compra outra linha de produtos nos EUA</h3>");
    out.println("<ul>");
        for (AssociationRule item : rules2) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
        out.println("<h3>TASKDATA 3 - Clientes com credito limite elevado realizam compras com valores mais elevados na NA</h3>");
    out.println("<ul>");
        for (AssociationRule item : rules3) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
        out.println("<h3>TASKDATA 4 - ...</h3>");
    out.println("<ul>");
        for (AssociationRule item : rules4) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
        out.println("<h3>TASKDATA 5 - Clientes com limite de credito superior a 100.000 que compram uma linha de produtos tambem compram outra linha de produtos</h3>");
    out.println("<ul>");
        for (AssociationRule item : rules5) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
    out.println("<h3>TASKDATA 6 - Clientes que realizam mais de 5 compras numa dada linha de produtos realizam menos de compras noutra linha de produtos.</h3>");
        out.println("<ul>");
        for (AssociationRule item : rules6) {
            out.println("<li>" + item + "</li>");
        }
        out.println("</ul>");
    %>
    

</body>

</html>

<style>
    h1{
        text-align: center;
    }
    h3{
        margin-top: 30px;
    }
</style>
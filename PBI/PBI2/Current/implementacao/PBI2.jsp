<%@ page language="java" %>
    <%@ page import="java.util.List , WekaSolution.WekaApriori, weka.associations.AssociationRule" %>

<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>PBI2</title>
</head>


<body>    
    <% 
    String path = "/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/";
    WekaApriori apriori = new WekaApriori();
    double[] conf = {0.9, 0.9, 0.9, 0.9, 0.9, 0.6};
    double[] sup = {0.1, 0.1, 0.1, 0.1, 0.1, 0.1};
    List<AssociationRule> rules1 = apriori.RunAlgorithmToFile(path + "TASKDATA1.arff", conf[0], sup[0]);
    List<AssociationRule> rules2 = apriori.RunAlgorithmToFile(path + "TASKDATA2.arff", conf[1], sup[1]);
    List<AssociationRule> rules3 = apriori.RunAlgorithmToFile(path + "TASKDATA3.arff", conf[2], sup[2]);
    List<AssociationRule> rules4 = apriori.RunAlgorithmToFile(path + "TASKDATA4.arff", conf[3], sup[3]);
    List<AssociationRule> rules5 = apriori.RunAlgorithmToFile(path + "TASKDATA5.arff", conf[4], sup[4]);
    List<AssociationRule> rules6 = apriori.RunAlgorithmToFile(path + "TASKDATA6.arff", 0.60, sup[5]);
    %>

    <div class="container">
    
    <div class="item">  
        <%
        out.println("<h3>TASKDATA 1 - Cliente que compra um produto tambem compra outro produto em 2004</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules1) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[0] + "; Minimum Support = " + sup[0] + " </h4>");        
        %>
    </div>
    <div class="item">  
    <% 
        out.println("<h3>TASKDATA 2 - Cliente que compra uma linha de produtos tambem compra outra linha de produtos nos EUA</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules2) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[1] + "; Minimum Support = " + sup[1] + " </h4>");   
    %>
    </div>  
    <div class="item">  
    <% 
        out.println("<h3>TASKDATA 3 - Clientes com credito limite elevado realizam compras com valores mais elevados na NA</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules3) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[2] + "; Minimum Support = " + sup[2] + " </h4>");   
    %>
    </div>
    <div class="item">  
    <% 
        out.println("<h3>TASKDATA 4 - Clientes de um territorio compram brinquedos numa escala maior que noutro territorio</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules4) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[3] + "; Minimum Support = " + sup[3] + " </h4>");   
    %>
    </div>
    <div class="item">  
    <% 
        out.println("<h3>TASKDATA 5 - Clientes com limite de credito superior a 100.000 que compram uma linha de produtos tambem compram outra linha de produtos</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules5) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[4] + "; Minimum Support = " + sup[4] + " </h4>");   
    %>
    </div>
    <div class="item">  
    <% 
        out.println("<h3>TASKDATA 6 - Clientes que realizam mais de 5 compras numa dada linha de produtos realizam menos de compras noutra linha de produtos.</h3>");
        out.println("<table><tr><th>Premise</th><th>Consequence</th><th>Confidence</th></tr>");
        for (AssociationRule item : rules6) {
            out.println("<tr><td>" + item.getPremise() + "</td><td>" + item.getConsequence() + "</td><td>"+ Math.round(item.getPrimaryMetricValue() * 100) + "%</td></tr>");
        }
        out.println("</table>");
        out.println("<h4>Minimum Confidence = " + conf[5] + "; Minimum Support = " + sup[5] + " </h4>");   
    %>
    </div>

</div>
</body>

</html>

<style>
    body {
        padding: 20px;
        background: rgb(240, 240, 240)
    }

    h1 {
        text-align: center;
    }

    h3 {
        font-size: 1em;
        min-height: 40px;
    }
    h4 {
        font-size: .8em;
        text-align: end;
    }
    table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border: 1px solid #ddd;
        font-size: .8em;
    }

    td, th {
        text-align: left;
        padding: 8px;
    }

    tr {
        background-color: #ffffff;
    }

    tr:nth-child(even) {
        background-color: #eeeeee;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .item {
        margin-top: 30px;
        width: 48%;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 6px;
        box-shadow: 0 0 10px 0 rgba(223, 223, 223, 0.3);
        box-sizing: border-box;
    }

    @media (max-width: 1000px) {
        .item{
            width: 100%;
        }   
    }

</style>
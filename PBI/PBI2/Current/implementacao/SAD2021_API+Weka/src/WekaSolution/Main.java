/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

import java.util.Scanner;

/**
 *1
 * @author tadeu
 */


public class Main {
    
     public static void main(String[] args) throws Exception{
         Scanner scan = new Scanner(System.in);
         Boolean running = true;
        while(running){
            DisplayOption();
            int i = scan.nextInt();
            switch (i){
                case 1:
                    CSVtoARFF.ConvertFiles();
                    break;
                case 2:
                    WekaApriori.RunAlgorithm();
                    break;
                case 3:
                    Transformation.RunTransformations();
                    break;
                case 4:
                    running = false;
                    break;
                case 5:
                    Transformation.RunTransformation("/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/TASKDATA1.ktr");
                    break;
                case 6:
                    WekaApriori.RunAlgorithmToFile("/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/test_conv/TASKDATA1.arff");
                    break;
                default:
                    System.out.println("Keep runing");
            }
        }
    }

    private static void DisplayOption() {
        System.out.println("1- Convert Files");
        System.out.println("2- Apriori Algorithm");
        System.out.println("3- Run Kettle Transformations");
        System.out.println("4- Exit");
        System.out.println("5- Single trans");
        System.out.println("6- Apriori to file");
    }
}

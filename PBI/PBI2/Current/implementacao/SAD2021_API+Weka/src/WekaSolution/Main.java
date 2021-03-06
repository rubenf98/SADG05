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
                    runApriori();
                    break;
                case 3:
                    Transformation.RunTransformations();
                    break;
                case 4:
                    running = false;
                    break;
                default:
                    System.out.println("Keep runing");
            }
        }
    }

    private static void DisplayOption() {
        System.out.println("1- Convert Filess");
        System.out.println("2- Apriori Algorithm");
        System.out.println("3- Run Kettle Transformations");
        System.out.println("4- Exit");
    }
    
    private static void runApriori() throws Exception{
        Scanner scan = new Scanner(System.in);
        double sup = -1;
        while (sup<0 || sup>1){
            System.out.println("Chose minimum suport between 0 and 1");
             sup = scan.nextDouble();
        }
        
        double conf = -1;
        while (conf<0 || conf>1){
            System.out.println("Chose minimum conf between 0 and 1");
              conf = scan.nextDouble();
        }
           
        
        WekaApriori.RunAlgorithm(sup, conf);
    }
}

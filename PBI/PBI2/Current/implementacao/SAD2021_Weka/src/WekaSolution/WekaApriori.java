package WekaSolution;

// Weka

import weka.core.Instances;
import weka.associations.Apriori;

// Java
import weka.associations.FPGrowth;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
/**
 *
 * @author tadeu
 */

public class WekaApriori {
   
    public static void RunAlgorithm() throws FileNotFoundException, IOException, Exception  {
        
        String folderPath = "../";
        ArrayList<String> arffFilesList = Utils.GetCSVFilesList(folderPath,"arff",4);
        
        for (int i = 0; i < arffFilesList.size(); i++){
            String fileName = arffFilesList.get(i);
            fileName = fileName.substring(0,fileName.length()-4);
            
            String filePath = folderPath + fileName +"arff";
            
            // Carrega dados dos ficheiros
            BufferedReader bf= new BufferedReader(new FileReader(filePath));
            Instances data = new Instances(bf);

            // Apriori
            Apriori model = new Apriori();
            model.buildAssociations(data);
            System.out.println("---------------------------------------------------------------------------------");
            System.out.println(fileName);
            System.out.println(model);
            System.out.println("---------------------------------------------------------------------------------");
            data.clear();
            bf.close();  
            
        }
	
    }   
}

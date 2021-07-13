package WekaSolution;

// Weka

import weka.core.Instances;
import weka.associations.Apriori;
import weka.associations.AssociationRule;
// Java
import weka.associations.FPGrowth;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
/**
 *
 * @author tadeu
 */

public class WekaApriori {
    public WekaApriori(){}
   
     public static void RunAlgorithm(double conf, double sup) throws FileNotFoundException, IOException, Exception  {
        
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
            model.setMinMetric(conf);
            model.setLowerBoundMinSupport(sup);
            model.buildAssociations(data);
            System.out.println("---------------------------------------------------------------------------------");
            System.out.println(fileName);
            System.out.println(model);
            System.out.println("---------------------------------------------------------------------------------");
            data.clear();
            bf.close();  
            
        }
     }

    public static List<AssociationRule> RunAlgorithmToFile(String filePath, double minConfidence, double minSupport) throws Exception  {        
	// load data
        Instances data = new Instances(new BufferedReader(new FileReader(filePath)));
        
	// build model
	Apriori model = new Apriori();
        model.setMinMetric(minConfidence);
        model.setLowerBoundMinSupport(minSupport);
        model.buildAssociations(data);
        

        return model.getAssociationRules().getRules();
    }   
}

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
/**
 *
 * @author tadeu
 */

public class WekaApriori {
    public WekaApriori(){}
   
    public static void RunAlgorithm() throws FileNotFoundException, IOException, Exception  {
        
        String filePath = "../test_conv/TASKDATA1.arff";
        
	// Carrega dados dos ficheiros
        Instances data = new Instances(new BufferedReader(new FileReader(filePath)));
        
	// Apriori
	Apriori model = new Apriori();
	model.buildAssociations(data);
	System.out.println(model);
	
        /*
	FPGrowth fpgModel = new FPGrowth();
	fpgModel.buildAssociations(data);
	System.out.println(fpgModel);
        */
    }   
}

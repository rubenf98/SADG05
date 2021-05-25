package WekaSolution;

// Weka

import weka.core.Instances;
import weka.associations.Apriori;

// Java
import weka.associations.FPGrowth;
import java.io.BufferedReader;
import java.io.FileReader;
/**
 *
 * @author tadeu
 */

public class WekaApriori {
    /*
    public static void main(String args[]) throws Exception {
        
        String filePath = "C:\\Users\\tadeu\\Desktop\\SAD2021\\SADG05\\PBI\\PBI2\\Current\\implementacao\\TASKDATA1.arff";
        
	// load data
        Instances data = new Instances(new BufferedReader(new FileReader(filePath)));
        
        System.out.println(data);
	// build model
	Apriori model = new Apriori();
	model.buildAssociations(data);
	System.out.println(model);
	
	FPGrowth fpgModel = new FPGrowth();
	fpgModel.buildAssociations(data);
	System.out.println(fpgModel);
    }
    */
}

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
/**
 *
 * @author tadeu
 */

public class WekaApriori {
    public WekaApriori(){}
   
    public static void RunAlgorithm() throws FileNotFoundException, IOException, Exception  {
        
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

    public static List<AssociationRule> RunAlgorithmToFile(String filePath) throws Exception  {        
	// load data
        Instances data = new Instances(new BufferedReader(new FileReader(filePath)));
        
	// build model
	Apriori model = new Apriori();
        model.buildAssociations(data);
        System.out.println(model);
        return model.getAssociationRules().getRules();
    }   
}

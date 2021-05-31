/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

// Weka
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.core.converters.ArffSaver;

// Java
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


/**
 *
 * @author tadeu
 */
public class CSVtoARFF {
    
    /**
     * @param args the command line arguments
     * @throws java.lang.Exception
    */
    
    public CSVtoARFF() {
    }

    public static void ConvertFiles() {
        String folderPath = "C:\\Users\\tadeu\\Desktop\\SAD2021\\SADG05\\PBI\\PBI2\\Current\\implementacao\\";
        
        ArrayList<String> csvFilesList = GetCSVFilesList(folderPath);
        for (int i = 0; i < csvFilesList.size(); i++){
            String fileName = csvFilesList.get(i);
            fileName = fileName.substring(0,fileName.length()-4);
            
            String filePath = folderPath + fileName;
            
            ConvertCSVtoARFF(filePath, fileName);
        }
        return;
    }
    
    private static ArrayList<String> GetCSVFilesList(String path) {
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        
        ArrayList<String> result = new ArrayList<String>();
        
        for(int i = 0; i < listOfFiles.length; i++){
            String fileName = listOfFiles[i].getName();
            String fileExtension = fileName.substring(fileName.length()-3);
            
            if( fileExtension.equals("csv")){
                result.add(fileName);
            }
        }
        
        return result;
    }
    
    private static void ConvertCSVtoARFF(String filePath, String fileName){
        try{
            //Load CSV
            CSVLoader loader = new CSVLoader();
            loader.setSource(new File(filePath+".csv"));
            Instances data = loader.getDataSet();

            System.out.println(data.size());

            // Save ARFF
            ArffSaver saver = new ArffSaver();
            saver.setInstances(data);

            // Save as ARFF
            saver.setFile(new File("C:\\Users\\tadeu\\Desktop\\SAD2021\\SADG05\\PBI\\PBI2\\Current\\implementacao\\"+fileName+".arff"));
            saver.writeBatch();
            System.out.println("SUCCESS: File Created");
        }
        catch(IOException E){
            System.out.println("ERROR: The File "+ fileName +" cannot be converted");
            System.out.println(E);
        }
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

// Weka
import java.io.BufferedWriter;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.core.converters.ArffSaver;

// Java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;


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
        String folderPath = "C:\\Users\\tadeu\\Desktop\\SAD2021\\SADG05\\PBI\\PBI2\\Current\\implementacao\\test_conv\\";
        
        ArrayList<String> csvFilesList = GetCSVFilesList(folderPath);
        for (int i = 0; i < csvFilesList.size(); i++){
            String fileName = csvFilesList.get(i);
            fileName = fileName.substring(0,fileName.length()-4);
            
            String filePath = folderPath + fileName;
            
            ConvertCSVtoARFF(filePath, fileName);
        }
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
            ModifyCSVFile(filePath);
            
            //Load CSV
            CSVLoader loader = new CSVLoader();
            loader.setSource(new File(filePath+"_mod.csv"));
            Instances data = loader.getDataSet();
            
            // Save ARFF
            ArffSaver saver = new ArffSaver();

            // Save as ARFF
            saver.setInstances(data);
            saver.setFile(new File("C:\\Users\\tadeu\\Desktop\\SAD2021\\SADG05\\PBI\\PBI2\\Current\\implementacao\\test_conv\\"+fileName+".arff"));
            saver.writeBatch();
            System.out.println("SUCCESS: File Created -> "+fileName);
        }
        catch(IOException E){
            System.out.println("ERROR: The File "+ fileName +" cannot be converted");
            System.out.println(E);
        }
    }

    private static void ModifyCSVFile(String filePath) throws IOException {
       File csvFile = new File(filePath+".csv");
        
        try {
            
            BufferedWriter bw = new BufferedWriter(new FileWriter(filePath+"_mod.csv"));
            
            Scanner csvFileScanner = new Scanner(csvFile);
            csvFileScanner.useDelimiter("\n");
            
            while(csvFileScanner.hasNext()){
                String data = csvFileScanner.next();
                data = data.trim();
                data = data.replaceAll(" ","_");
                data = data.replaceAll("'","_");
                bw.write(data);
                bw.newLine();
            }
            bw.close();
            csvFileScanner.close();            
        } catch (FileNotFoundException ex) {
            //Se der erro
            System.out.println(ex);
        }
    }

}

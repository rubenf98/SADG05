/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

// Weka
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import java.io.BufferedWriter;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.core.converters.ArffSaver;

// Java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
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
        String folderPath = "../test_conv/";
        
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
            saver.setFile(new File("../test_conv/"+fileName+".arff"));
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
       
       List<String> headers = getheaders(csvFile);
       
        try {
            
            BufferedWriter bw = new BufferedWriter(new FileWriter(filePath+"_mod.csv"));
            
            bw.write(headers.toString().replace("[", "").replace("]", "").replace(" ", ""));
            bw.newLine();
            
            Scanner csvFileScanner = new Scanner(csvFile);
            csvFileScanner.useDelimiter("\n");
            
            // SKIP Header
            csvFileScanner.next();
            
            while(csvFileScanner.hasNext()){
                String data = csvFileScanner.next();
                
                data = data.replace("\"", "");
                String[] rowProducts = data.split(", ");
                
                List<String> row = new ArrayList<>();
                
                for (String header : headers) {
                    boolean exist = false;
                    for (String rowProduct : rowProducts) {
                        rowProduct = rowProduct.replace(" ","_").replace("'","_").trim();
                        if (header.equals(rowProduct)){
                            exist = true;
                            break;
                        }
                    }
                    if(exist){
                        row.add("y");   
                    }
                    else{
                        row.add("?");
                    }
                }
                System.out.println(row.size());
                bw.write(row.toString().replace("[", "").replace("]", "").replace(" ", ""));
                bw.newLine();
            }
            
            bw.close();
            csvFileScanner.close();            
        } catch (FileNotFoundException ex) {
            //Se der erro
            System.out.println(ex);
        }
    }
    
    private static List<String> getheaders(File csvFile){
        try{
            CSVReader reader = new CSVReader(new FileReader(csvFile));
            String[] nextline;
            // SKIP HEADER
            reader.readNext();
            
            List<String> headers = new ArrayList<>();

            while((nextline=reader.readNext()) != null){
                if(nextline != null){
                    String[] rowProducts = nextline[0].split(", ");
                    for (String rowProduct : rowProducts) {
                        rowProduct = rowProduct.replace(" ", "_").replace("'", "_");
                        if(!(headers.contains(rowProduct))){
                            headers.add(rowProduct);
                        }
                    }
                }
            }
            
            return headers;
        }catch(CsvValidationException | IOException e){
            System.out.println("ERROR: "+ e);
        }
        return null;
    }

}

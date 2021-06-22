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
import weka.core.converters.ConverterUtils;


/**
 *
 * @author tadeu
 */
public class CSVtoARFF {
    
    public CSVtoARFF() {
    }
   
    public static void ConvertFiles() {
        String folderPath = "../";
        
        ArrayList<String> csvFilesList = Utils.GetCSVFilesList(folderPath,"csv",3);
        for (int i = 0; i < csvFilesList.size(); i++){
            String fileName = csvFilesList.get(i);
            fileName = fileName.substring(0,fileName.length()-4);
            
            String filePath = folderPath + fileName;
            ConvertCSVtoARFF(filePath, fileName);
        }
        
        Utils.cleanDirectoryTempFiles(folderPath);
    }
    
    private static void ConvertCSVtoARFF(String filePath, String fileName){
        
        try{
            ModifyCSVFile(filePath);
            
            //Load CSV
            CSVLoader loader = new CSVLoader();
            File file = new File(filePath+"_mod.csv");
            loader.setSource(file);
            Instances data = loader.getDataSet();
            
            // Save ARFF
            ArffSaver saver = new ArffSaver();
            // Save as ARFF
            saver.setInstances(data);
            saver.setFile(new File("../"+fileName+".arff"));
            saver.writeBatch();
            System.out.println("SUCCESS: File Created -> "+fileName);
            
            // Necessário para retirar os ficheiros de utilização
            saver = null;
            data =null;
            loader =null;
            // Garbage Colector serve para eliminar todas as variaveis que não estão em utilização
            System.gc();
            
            
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
            FileWriter fw = new FileWriter(filePath+"_mod.csv");
            BufferedWriter bw = new BufferedWriter(fw);
            
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
                bw.write(row.toString().replace("[", "").replace("]", "").replace(" ", ""));
                bw.newLine();
            }
            
            bw.flush();
            bw.close();
            fw.close();
            csvFileScanner.close();    
               
        } catch (FileNotFoundException ex) {
            System.out.println(ex);
        }
    }
    
    private static List<String> getheaders(File csvFile){
        try{
            FileReader fr = new FileReader(csvFile);
            CSVReader reader = new CSVReader(fr);
            String[] nextline;
            // Salta o HEADER
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
            reader.close();
            fr.close();
            return headers;
        }catch(CsvValidationException | IOException e){
            System.out.println("ERROR: "+ e);
        }
        return null;
    }
    
    
        
}


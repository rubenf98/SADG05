/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

import java.io.File;
import java.util.ArrayList;

/**
 *
 * @author tadeu
 */
public class Utils {
     static ArrayList<String> GetCSVFilesList(String path, String extension, int extensionSize) {
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        
        ArrayList<String> result = new ArrayList<String>();
        
        for(int i = 0; i < listOfFiles.length; i++){
            String fileName = listOfFiles[i].getName();
            String fileExtension = fileName.substring(fileName.length()-extensionSize);
            
            if( fileExtension.equals(extension)){
                result.add(fileName);
            }
        }
        
        return result;
    }
    
    static void cleanDirectoryTempFiles(String path) {
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        
        for(int i = 0; i < listOfFiles.length; i++){
            String fileName = listOfFiles[i].getName();
            if(fileName.length() > 8){
                String fileExtension = fileName.substring(fileName.length()-8);
                if( fileExtension.equals("_mod.csv")){
                    File file = new File(path + fileName);

                    if(file.delete())
                    {
                        System.out.println("File deleted: "+file);
                    }
                }
            }
        }
    }
}

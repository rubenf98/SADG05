package WekaSolution;

import java.io.File;
import java.util.ArrayList;
import org.pentaho.di.core.KettleEnvironment;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.logging.LogLevel;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ruben
 */
public class Transformation {

    static void RunTransformations() throws KettleException {
        
        File folder = new File("/home/ruben/Documents/UMa/Apoio a Decisao/SADG05/PBI/PBI2/Current/implementacao/");
        File[] listOfFiles = folder.listFiles();
        
        KettleEnvironment.init();
        
        for (File listOfFile : listOfFiles) {
            String fileName = listOfFile.getName();
            String fileExtension = fileName.substring(fileName.length()-3);
            if( fileExtension.equals("ktr")){

                TransMeta transMeta = new TransMeta("../" + fileName);
                Trans trans = new Trans(transMeta);
                trans.setLogLevel(LogLevel.ERROR);
                trans.execute(null);
                trans.waitUntilFinished();
                
                if(trans.getErrors() > 0){
                    System.out.println("Some errors ocurred");
                }
            }
        }     
    }

    public static void RunTransformation(String path) throws KettleException {
        
        KettleEnvironment.init();
        
        TransMeta transMeta = new TransMeta(path);
        Trans trans = new Trans(transMeta);
        trans.setLogLevel(LogLevel.ERROR);
        trans.execute(null);
        trans.waitUntilFinished();

        if(trans.getErrors() > 0){
            System.out.println("Some errors ocurred");
        } 
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany;

import org.pentaho.di.core.KettleEnvironment;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;

/**
 *
 * @author ruben
 */
public class RunTransformation {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        // TODO code application logic here
        
        try {
            System.out.println("1");
            KettleEnvironment.init();
            System.out.println("2");
            TransMeta transMeta = new TransMeta("TASKDATA1.ktr");
            Trans t = new Trans(null, transMeta);
            t.execute(null);
            t.waitUntilFinished();
            
            if (t.getErrors() > 0) {
                System.out.println("Error Executing Transformation");
            }

         } catch (KettleException e) {
            e.printStackTrace();
         }
    }
}

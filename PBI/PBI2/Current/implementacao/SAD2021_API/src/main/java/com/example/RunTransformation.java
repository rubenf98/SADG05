/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example;

import org.pentaho.di.core.KettleEnvironment;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.logging.LogLevel;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;

/**
 *
 * @author ruben
 */
public class RunTransformation {
    public static void main(String[] args) throws KettleException {

        KettleEnvironment.init();
        TransMeta transMeta = new TransMeta("../TASKDATA1.ktr");
        Trans trans = new Trans(transMeta);
        trans.setLogLevel(LogLevel.ERROR);
        trans.execute(null);
        trans.waitUntilFinished();

        if(trans.getErrors() > 0){
            System.out.println("Some errors ocurred");
        }

    }
    
    
}

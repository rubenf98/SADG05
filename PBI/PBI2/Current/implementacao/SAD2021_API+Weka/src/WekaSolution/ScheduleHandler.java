/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

import org.pentaho.di.core.exception.KettleException;

/**
 *
 * @author tadeu
 */
public class ScheduleHandler {
    public void excute() throws KettleException, Exception{
        Transformation.RunTransformations();
        CSVtoARFF.ConvertFiles();
        WekaApriori.RunAlgorithm(0.1, 0.6);
    }
}

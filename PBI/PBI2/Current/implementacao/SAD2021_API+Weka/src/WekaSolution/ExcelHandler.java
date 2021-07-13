/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import weka.associations.AssociationRule;
/**
 *
 * @author Franco
 */
public class ExcelHandler {
    public static void createSheet(List<AssociationRule> AssociationRules, String fileName) throws IOException{
        fileName= fileName.substring(0, fileName.length()-1);
        
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("TaskData Books");
        
        Object[][]bookdata = {{"Premise", "Consequence", "Confidence"}};
        
        int rowCount = 0;
        
        for (Object[] aBook: bookdata){
            Row row = sheet.createRow(rowCount);
            rowCount++;
            
            int columnCount = 0;
            
            for (Object field: aBook){
                Cell cell = row.createCell(columnCount);
                columnCount++;
                if (field instanceof String){
                    cell.setCellValue((String) field);
                }
                else if (field instanceof Integer){
                    cell.setCellValue((Integer) field);
                }
            }
            
            for (AssociationRule rule: AssociationRules){
                row = sheet.createRow(rowCount);
                
                Cell cell = row.createCell(0);
                cell.setCellValue((String) rule.getPremise().toString());
                cell = row.createCell(1);
                cell.setCellValue((String) rule.getConsequence().toString());
                cell = row.createCell(2);
                int conf = (int) Math.round(rule.getPrimaryMetricValue()*100);
                String displayConf = conf + "%";
                cell.setCellValue((String) displayConf );
                
                //Next Rule
                rowCount++;
            }
            
        }
        
        try (FileOutputStream outputStream = new FileOutputStream ("../RULES - " + fileName + ".xls")){
            workbook.write(outputStream);
        }
    }
}

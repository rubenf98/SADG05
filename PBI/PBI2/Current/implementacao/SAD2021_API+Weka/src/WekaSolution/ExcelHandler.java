/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WekaSolution;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 *
 * @author Franco
 */
public class ExcelHandler {
    public static void createSheet(String[] args) throws IOException{
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("TaskData Books");
        
        Object[][]bookdata = {{"Premise", "Consequence", "Confidence"}};
        
        int rowCount = 0;
        
        for (Object[] aBook: bookdata){
            Row row = sheet.createRow(++rowCount);
            
            int columnCount = 0;
            
            for (Object field: aBook){
                Cell cell = row.createCell(++columnCount);
                if (field instanceof String){
                    cell.setCellValue((String) field);
                }
                else if (field instanceof Integer){
                    cell.setCellValue((Integer) field);
                }
            }
            
        }
        
        try (FileOutputStream outputStream = new FileOutputStream ("TaskdataBooks.xlsx")){
            workbook.write(outputStream);
        }
    }
}

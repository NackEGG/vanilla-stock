package com.vs.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;


public class StockDataUtil {
    public static void main(String[] args) {
    	//클론한 경로
    	String basePath = "C:\\SpringWork\\otherside\\Korea_Stocks\\Korea_Stocks_Full";
    	File path = new File(basePath) ;
    	File[] list2 = path.listFiles();

    	System.out.println("시작");
    	BufferedWriter bufWriter = null;
        try{
	        //출력 스트림 생성(내보낼 경로지정)
	        bufWriter = Files.newBufferedWriter(Paths.get("C:\\SpringWork\\yenaNackEGG\\Resource\\StockData\\MergedStockData.csv"),Charset.forName("UTF-8"));

        	for(File file : list2) {
	    		if(file.isFile()) {
			    	String fileName=file.getName().substring(0,6);
			    	String targetPath = basePath + "\\" + fileName + ".csv";
		            
		            BufferedReader br = null;
		                        	        
		            try{
		    	        br = Files.newBufferedReader(Paths.get(targetPath));
		        		
		                Charset.forName("UTF-8");
		                String line = "";
		                
		                boolean is2016 = false;
		                while((line = br.readLine()) != null){
		                	if(false == is2016) {
		                		if(line.startsWith("2016-")){
		                			is2016 = true;
		                		}else {
		                			continue;
		                		}
		                	}
		                    //기존 데이터 + 기업코드
		                	bufWriter.write(line + "," + fileName);
			                //개행코드추가
			                bufWriter.newLine();
		                }
		            }catch(FileNotFoundException e){
		                e.printStackTrace();
		            }catch(IOException e){
		                e.printStackTrace();
		            }finally{
		                try{
		                    if(br != null){
		                        br.close();
		                    }
		                }catch(IOException e){
		                    e.printStackTrace();
		                }
		            }
		    	}
            }
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(bufWriter != null){
                    bufWriter.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
        System.out.println("");
        System.out.println("merge complete");
    }
}

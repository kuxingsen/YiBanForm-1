package sust.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

public class WordUtil {

	/*
	 * 将request的简直对转化取出
	 */
	public Map<String, Object> transToMAP(Map<String, String[]> map) {
		// 返回值Map
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Iterator<Entry<String, String[]>> entries = map.entrySet().iterator();
		Entry<String, String[]> entry;
		String name = "";
		String value = "";
		while (entries.hasNext()) {
			entry = entries.next();
			name = entry.getKey();
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, value);
			//printfMap(returnMap);
		}
		return returnMap;
	}
 
	/*
	 * 打印Map
	 */
	public void printfMap(Map<String, Object> returnMap) {
		System.out.println("通过Map.entrySet遍历key和value");
		for (Entry<String, Object> entry : returnMap.entrySet()) {
			System.out.println("key= " + entry.getKey() + "      value= " + entry.getValue());
		}
	}
	
    public String getFileName(String file){
    	String filename = "";
    	if(file.equals("DSI")){
    		filename="陕西省高校家庭经济困难学生认定申请表";
    	}
    	if(file.equals("AFSG")){
    		filename="陕西省高等学校国家助学金申请表";
    	}
    	if(file.equals("SOSAF")){
    		filename="高等学校学生及家庭情况调查表";
    	}
    	if(file.equals("SOSAFI")){
    		filename="高等学校学生及家庭情况调查表(说明)";
    	}
    	if(file.equals("POPF")){
    		filename="高等学校建档立卡贫困户子女情况证明表";
    	}
    	return filename;
    }
	
	
	/**
	 * 用一个docx文档作为模板，然后替换其中的内容，再写入目标文档中。
	 * @param outpath 
	 * @param path 
	 * @throws Exception
	 */
	public String[] testTemplateWrite(Map<String, Object> params, String filename, String path, String outpath) {

		String outfilePath = "";
		String outfilename = "";
		try {
			NameFirst nf =new NameFirst();
			String perName =nf.getAllFirstLetter((String) params.get("name"));
			outfilePath = outpath+"\\"+perName+"_"+ filename+".docx";
			outfilename = perName+"_"+ filename+".docx";
	        String inpfilePath = path+"\\"+filename+".docx";
	        //System.out.println("inpfilePath:   "+inpfilePath+"\noutfilename:   "+outfilename+"\noutfilePath:   "+outfilePath);
			
			InputStream is = null;
			try {
				is = new FileInputStream(inpfilePath);
			} catch (FileNotFoundException e1) {
				System.out.println("读入docx错误！");
				e1.printStackTrace();
			}
			XWPFDocument doc = null;
			try {
				doc = new XWPFDocument(is);
			} catch (IOException e1) {
				System.out.println("解析出错！");			
				e1.printStackTrace();
			}
			// 替换段落里面的变量
			try {
				replaceInPara(doc, params);
				System.out.println("开始查null");
				replacenull(doc);
				System.out.println("null查完了");	
				// 替换表格里面的变量
				// replaceInTable(doc, params);
			} catch (Exception e) {
				System.out.println("替换出错！");
			}		
		
			OutputStream os = null;
			try {
				os = new FileOutputStream(outfilePath);
				doc.write(os);
			} catch (IOException e) {
				System.out.println("输出出错！");
				e.printStackTrace();
			}
			this.close(os);
			this.close(is);	
		} catch (Exception e) {
			System.out.println("testTemplateWrite出错");
		}
		String outFin[] = { outfilename, outfilePath };
		return outFin;
	}

	/**
	 * 替换段落里面的变量
	 * 
	 * @param doc  要替换的文档
	 * @param params 参数
	 */
	private void replaceInPara(XWPFDocument doc, Map<String, Object> params) {
		Iterator<XWPFParagraph> iterator = doc.getParagraphsIterator();
		XWPFParagraph para;
		while (iterator.hasNext()) {
			para = iterator.next();
			this.replaceInPara(para, params);
		}

		this.replaceInTable(doc, params);

	}

	/**
	 * 替换段落里面的变量
	 * @param para      要替换的段落
	 * @param params         参数
	 */
	private void replaceInPara(XWPFParagraph para, Map<String, Object> params) {
		try {
			List<XWPFRun> runs;
			Matcher matcher;
			System.out.println(para.getParagraphText());
//			if (this.matcher(para.getParagraphText()).find()) {
//				System.out.println("成功拼配到了表达式");
//			}
			if (this.matcher(para.getParagraphText()).find()) {
				runs = para.getRuns();
				for (int i = 0; i < runs.size(); i++) {
					XWPFRun run = runs.get(i);
					String runText = run.toString();
					matcher = this.matcher(runText);
					//System.out.println("现在的runText是：" + runText);
					if (matcher.find()) {

						while ((matcher = this.matcher(runText)).find()) {
							//System.out.println("找到的runtext----" + String.valueOf(params.get(matcher.group(1))));
							runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
						}
						// 直接调用XWPFRun的setText()方法设置文本时，在底层会重新创建一个XWPFRun，把文本附加在当前文本后面，
						// 所以我们不能直接设值，需要先删除当前run,然后再自己手动插入一个新的run。
						para.removeRun(i);
						XWPFRun now = para.insertNewRun(i);

						now.setText(runText);
						now.setFontSize(12);

					}
				}
			}else{
				System.out.println(para.getParagraphText()+"没有找到");
			}
		} catch (Exception e) {
			System.out.println("replaceInPara匹配出错");
		}	
	}

	/**
	 * 替换表格里面的变量 
	 * @param doc      要替换的文档
	 * @param params   参数
	 */
	private void replaceInTable(XWPFDocument doc, Map<String, Object> params) {
		Iterator<XWPFTable> iterator = doc.getTablesIterator();
		XWPFTable table;
		List<XWPFTableRow> rows;
		List<XWPFTableCell> cells;
		List<XWPFParagraph> paras;
		while (iterator.hasNext()) {
			table = iterator.next();
			rows = table.getRows();
			for (XWPFTableRow row : rows) {
				cells = row.getTableCells();
				for (XWPFTableCell cell : cells) {
					paras = cell.getParagraphs();
					for (XWPFParagraph para : paras) {
						// System.out.print(para.getParagraphText()+"\n");

						this.replaceInPara(para, params);
					}
				}
			}
		}
	}

	private void replacenull(XWPFDocument doc) {
		try {
			Iterator<XWPFTable> iterator = doc.getTablesIterator();
			XWPFTable table;
			List<XWPFRun> runs;
			Matcher matchers;
			List<XWPFTableRow> rows;
			List<XWPFTableCell> cells;
			List<XWPFParagraph> paras;
			while (iterator.hasNext()) {
				table = iterator.next();
				rows = table.getRows();
				for (XWPFTableRow row : rows) {
					cells = row.getTableCells();
					for (XWPFTableCell cell : cells) {
						paras = cell.getParagraphs();
						for (XWPFParagraph para : paras) {
							// System.out.print(para.getParagraphText()+"\n");
							if (this.matchers(para.getParagraphText()).find()) {/////////////////////////////////
								runs = para.getRuns();
								for (int i = 0; i < runs.size(); i++) {
									XWPFRun run = runs.get(i);
									String runText = run.toString();
									matchers = this.matchers(runText);
									//System.out.println("现在的runText是：" + runText);
									if (matchers.find()) {

										while ((matchers = this.matchers(runText)).find()) {
											//System.out.println("替换null");
										}
										// 直接调用XWPFRun的setText()方法设置文本时，在底层会重新创建一个XWPFRun，把文本附加在当前文本后面，
										// 所以我们不能直接设值，需要先删除当前run,然后再自己手动插入一个新的run。
										para.removeRun(i);
										para.insertNewRun(i).setText("");

									}
								}
							}
						}
					}
				}			
			}
		} catch (Exception e) {
			System.out.println("替换null出错");
		}
	}

	/**
	 * 正则匹配字符串 
	 * @param str
	 * @return
	 */
	private Matcher matcher(String str) {
		Pattern pattern = Pattern.compile("\\$\\{(.+?)\\}", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(str);
		return matcher;
	}

	private Matcher matchers(String str) {
		Pattern pattern = Pattern.compile("null", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(str);
		return matcher;
	}

	/**
	 * 关闭输入流
	 * @param is
	 */
	private void close(InputStream is) {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭输出流
	 * @param os
	 */
	private void close(OutputStream os) {
		if (os != null) {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
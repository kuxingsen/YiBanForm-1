package src.sust.util;

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
	 * ��request�ļ�ֱ��ת��ȡ��
	 */
	public Map<String, Object> transToMAP(Map<String, String[]> map) {
		// ����ֵMap
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
	 * ��ӡMap
	 */
	public void printfMap(Map<String, Object> returnMap) {
		System.out.println("ͨ��Map.entrySet����key��value");
		for (Entry<String, Object> entry : returnMap.entrySet()) {
			System.out.println("key= " + entry.getKey() + "      value= " + entry.getValue());
		}
	}
	
    public String getFileName(String file){
    	String filename = "";
    	if(file.equals("DSI")){
    		filename="����ʡ��У��ͥ��������ѧ���϶������";
    	}
    	if(file.equals("AFSG")){
    		filename="����ʡ�ߵ�ѧУ������ѧ�������";
    	}
    	if(file.equals("SOSAF")){
    		filename="�ߵ�ѧУѧ������ͥ��������";
    	}
    	if(file.equals("SOSAFI")){
    		filename="�ߵ�ѧУѧ������ͥ��������(˵��)";
    	}
    	if(file.equals("POPF")){
    		filename="�ߵ�ѧУ��������ƶ������Ů���֤����";
    	}
    	return filename;
    }
	
	
	/**
	 * ��һ��docx�ĵ���Ϊģ�壬Ȼ���滻���е����ݣ���д��Ŀ���ĵ��С�
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
				System.out.println("����docx����");
				e1.printStackTrace();
			}
			XWPFDocument doc = null;
			try {
				doc = new XWPFDocument(is);
			} catch (IOException e1) {
				System.out.println("��������");			
				e1.printStackTrace();
			}
			// �滻��������ı���
			try {
				replaceInPara(doc, params);
				System.out.println("��ʼ��null");
				replacenull(doc);
				System.out.println("null������");	
				// �滻�������ı���
				// replaceInTable(doc, params);
			} catch (Exception e) {
				System.out.println("�滻����");
			}		
		
			OutputStream os = null;
			try {
				os = new FileOutputStream(outfilePath);
				doc.write(os);
			} catch (IOException e) {
				System.out.println("�������");
				e.printStackTrace();
			}
			this.close(os);
			this.close(is);	
		} catch (Exception e) {
			System.out.println("testTemplateWrite����");
		}
		String outFin[] = { outfilename, outfilePath };
		return outFin;
	}

	/**
	 * �滻��������ı���
	 * 
	 * @param doc  Ҫ�滻���ĵ�
	 * @param params ����
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
	 * �滻��������ı���
	 * @param para      Ҫ�滻�Ķ���
	 * @param params         ����
	 */
	private void replaceInPara(XWPFParagraph para, Map<String, Object> params) {
		try {
			List<XWPFRun> runs;
			Matcher matcher;
			System.out.println(para.getParagraphText());
//			if (this.matcher(para.getParagraphText()).find()) {
//				System.out.println("�ɹ�ƴ�䵽�˱��ʽ");
//			}
			if (this.matcher(para.getParagraphText()).find()) {
				runs = para.getRuns();
				for (int i = 0; i < runs.size(); i++) {
					XWPFRun run = runs.get(i);
					String runText = run.toString();
					matcher = this.matcher(runText);
					//System.out.println("���ڵ�runText�ǣ�" + runText);
					if (matcher.find()) {

						while ((matcher = this.matcher(runText)).find()) {
							//System.out.println("�ҵ���runtext----" + String.valueOf(params.get(matcher.group(1))));
							runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
						}
						// ֱ�ӵ���XWPFRun��setText()���������ı�ʱ���ڵײ�����´���һ��XWPFRun�����ı������ڵ�ǰ�ı����棬
						// �������ǲ���ֱ����ֵ����Ҫ��ɾ����ǰrun,Ȼ�����Լ��ֶ�����һ���µ�run��
						para.removeRun(i);
						XWPFRun now = para.insertNewRun(i);

						now.setText(runText);
						now.setFontSize(12);

					}
				}
			}else{
				System.out.println(para.getParagraphText()+"û���ҵ�");
			}
		} catch (Exception e) {
			System.out.println("replaceInParaƥ�����");
		}	
	}

	/**
	 * �滻�������ı��� 
	 * @param doc      Ҫ�滻���ĵ�
	 * @param params   ����
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
									//System.out.println("���ڵ�runText�ǣ�" + runText);
									if (matchers.find()) {

										while ((matchers = this.matchers(runText)).find()) {
											//System.out.println("�滻null");
										}
										// ֱ�ӵ���XWPFRun��setText()���������ı�ʱ���ڵײ�����´���һ��XWPFRun�����ı������ڵ�ǰ�ı����棬
										// �������ǲ���ֱ����ֵ����Ҫ��ɾ����ǰrun,Ȼ�����Լ��ֶ�����һ���µ�run��
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
			System.out.println("�滻null����");
		}
	}

	/**
	 * ����ƥ���ַ��� 
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
	 * �ر�������
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
	 * �ر������
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
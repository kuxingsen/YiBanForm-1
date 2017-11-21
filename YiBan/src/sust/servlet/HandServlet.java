package sust.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sust.util.WordUtil;

public class HandServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		WordUtil util = new WordUtil();
		//获取对应的请求参数
        String method = request.getParameter("method");
        String filename = request.getParameter("filename");
        String path = request.getSession().getServletContext().getRealPath("/template");
        String outpath = request.getSession().getServletContext().getRealPath("/Result");
        System.out.println("*****************    "+method+"\n"+filename+"\n"+path+"\n"+outpath);
        String[] result = null;
        
        try {
        	result = util.testTemplateWrite(util.transToMAP(request.getParameterMap()), filename,path,outpath);
 
		} catch (Exception e) {
			System.out.println("合成失败！");
			e.printStackTrace();
		}
        
        System.out.println("1.文件名："+result[0]+"\n2.文件路径："+result[1]);
        request.getSession().setAttribute("fileName", result[0]); 
        request.getSession().setAttribute("filePath", result[1]); 
        request.getRequestDispatcher("./download.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
		
}

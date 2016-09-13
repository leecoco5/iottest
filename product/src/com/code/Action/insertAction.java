package com.code.Action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.config.SqlConfig;
import com.code.vo.codeVO;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Servlet implementation class insertAction
 */
@WebServlet("/code/insert.go")
public class insertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		codeVO cv=new codeVO();
		int num=Integer.parseInt(request.getParameter("num"));
		String name=request.getParameter("productname");
			cv.setProductnum(num);
			cv.setProducttype(request.getParameter("producttype"));
			cv.setProductname(name);
			cv.setPrice(Integer.parseInt(request.getParameter("price")));
			cv.setColor(request.getParameter("color"));
			cv.setPhoto(request.getParameter("photo"));
			cv.setCount(Integer.parseInt(request.getParameter("count")));
			cv.setComments(request.getParameter("comments"));
	      
	      SqlMapClient sqlmap=SqlConfig.getSqlMapInstance();
	      try {
	         sqlmap.insert("insertdata", cv);
	         request.setAttribute("num",num );
				RequestDispatcher rd = request.getRequestDispatcher("buy.go");
				rd.forward(request, response);
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

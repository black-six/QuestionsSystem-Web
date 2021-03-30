/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import SQL.MySQLLink;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author black
 */
@WebServlet(name = "deleteQuestionServlet", urlPatterns = {"/deleteQuestionServlet"})
public class deleteQuestionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try (PrintWriter out = response.getWriter()) {
	    //name,type,body,t_id
	    request.setCharacterEncoding("UTF-8");
	    System.out.println(request.getParameter("id"));
	    int qid = Integer.valueOf(request.getParameter("id"));
	    System.out.println(qid);
	    
	    MySQLLink sqlLink = MySQLLink.getMySQLLink();//调用数据库链接类
	    Connection conn = sqlLink.getConnection();//获取链接

	    //id,name,type,body,t_id,time
	    String sql = "delete from questions where id=?;";
	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, qid);
	    ps.executeUpdate();
	    out.print("<script language=\"javascript\">\n"
			+ "alert(\"删除试题成功！\");\n"
			+ "window.location.href='jsp/teacher/questions.jsp';\n"
			+ "</script>");
	    /*request.getSession().setAttribute("mass", "删除试题成功！");
	    response.sendRedirect("jsp/teacher/questions.jsp");*/
	} catch (SQLException ex) {
	    Logger.getLogger(deleteQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
	    response.getWriter().print("<script language=\"javascript\">\n"
			+ "alert(\"删除试题成功！\");\n"
			+ "window.location.href='jsp/teacher/questions.jsp';\n"
			+ "</script>");
	    /*request.getSession().setAttribute("mass", "删除试题失败！");
	    response.sendRedirect("jsp/teacher/questions.jsp");*/
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}

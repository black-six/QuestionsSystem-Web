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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author black
 */
@WebServlet(name = "upDataQuestionServlet", urlPatterns = {"/upDataQuestionServlet"})
public class upDataQuestionServlet extends HttpServlet {

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
	    int qid = Integer.valueOf(request.getParameter("id"));
	    String name = request.getParameter("q_name");
	    int type = Integer.valueOf(request.getParameter("q_type"));
	    String body = request.getParameter("q_body");
	    System.out.println("qid="+qid+"  name="+name+"  type="+type+"  body="+body);
	    
	    boolean flag = true;
	    if (type == 1 || type == 3) {
		if (body.matches(".*##.*")) {
		    if (type == 1) {
			int a = body.split("##")[1].split("#").length;
			if (!(a == 3 || a == 4)) {
			    flag = false;
			}
		    }
		} else {
		    flag = false;
		}
	    }
	    System.out.println(flag);
	    if (!flag) {
		request.getSession().setAttribute("mass", "数据格式不正确！请重新修改试题！");
		response.sendRedirect("jsp/teacher/upDataQuestion.jsp?id="+qid);
		return ;
	    }

	    MySQLLink sqlLink = MySQLLink.getMySQLLink();//调用数据库链接类
	    Connection conn = sqlLink.getConnection();//获取链接

	    //id,name,type,body,t_id,time
	    String sql = "update questions set name=?,type=?,body=? where id=?;";
	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setString(1, name);
	    ps.setInt(2, type);
	    ps.setString(3, body);
	    ps.setInt(4, qid);
	    ps.executeUpdate();
	    request.getSession().setAttribute("mass", "修改试题成功！");
	    response.sendRedirect("jsp/teacher/upDataQuestion.jsp?id="+qid);
	} catch (SQLException ex) {
	    Logger.getLogger(upDataQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
	    request.getSession().setAttribute("mass", "修改试题失败！");
	    response.sendRedirect("jsp/teacher/upDataQuestion.jsp?id="+request.getParameter("id"));
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

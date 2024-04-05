/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package actionServlets;

import dbConnection.ConnectionProvider;
import tableClasses.item;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author namee
 */
@WebServlet(name = "itemServlet", urlPatterns = {"/itemServlet"})
public class itemServlet extends HttpServlet {

       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           HttpSession session = request.getSession(true);
       if (session == null)
        {
       response.sendRedirect("http://localhost:8080/error.html");
        }
        
   // ArrayList list= (ArrayList)session.getAttribute("shoppingcart");
    String selectedCategory = request.getParameter("category").trim();
    
           
    try{
	ConnectionProvider conProvider = new ConnectionProvider();
	Connection con=conProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select iid, item_name, description, price from tech_trade_db.item where category = '"+selectedCategory+"' order by iid desc");
        
        ResultSetMetaData rsmd = rs.getMetaData();
        int column_count = rsmd.getColumnCount();
                
        ArrayList list = new ArrayList();
       
        item Item = new item();
        String name = "";
        String item_description = "";
        String item_price = "";
        while(rs.next())
	{
            name = rs.getString("item_name");
            item_description = rs.getString("description");
            item_price = rs.getString("price");

    Item = new item();
    Item.setName(name);
    Item.setDescription(item_description);
    Item.setPrice((new Float(item_price)).floatValue());
    
            list.add(Item);
        }
     	session.setAttribute("itemsList", list);
        session.setAttribute("selected", selectedCategory);
     //RequestDispatcher rd = getServletContext.d
     //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Shopping.jsp");
     //dispatcher.forward(request, response);
		response.sendRedirect("itemsList.jsp");
        }
    catch(Exception e)
    {
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=msg=error_itemServlet");
    }
   
    }

    
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

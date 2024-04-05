/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package actionServlets;

import dbConnection.ConnectionProvider;
import tableClasses.item;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import tableClasses.item;
import java.util.ArrayList;
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
@WebServlet(name = "myCart", urlPatterns = {"/myCart"})
public class myCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
            
         HttpSession session = request.getSession(true);
       if (session == null)
        {
       response.sendRedirect("http://localhost:8080/error.html");
        }
    ArrayList list= (ArrayList)session.getAttribute("shoppingcart");
    String action = request.getParameter("action").trim();
    
    
     if(action.equals("ADD")) 
     {
                  int index = Integer.parseInt(request.getParameter("addindex"));
                  ArrayList items_list= (ArrayList)session.getAttribute("itemsList");
                  
                  
                  item order = (item) items_list.get(index);
                  if(list==null)
      {
          
      list = new ArrayList();
      order.setQuantity(1);
      list.add(order);
      }
       else
      {
        boolean found = false; 
        String itemName = order.getName().trim();
        for(int i=0;i<list.size(); i++)
        {
          String name = ((item)list.get(i)).getName().trim();
          // Item anitem = (Item)list.get(i);
          if(itemName.equals(name))
          {  
              found = true;
               item anitem = (item)list.get(i);
            anitem.setQuantity(anitem.getQuantity()+ anitem.getQuantity());
          }
          }
        if(!found)
        {
            order.setQuantity(1);
            list.add(order);
        }
        
                  
      }
         session.setAttribute("shoppingcart", list);
           float total =0;
          for(int i=0;i<list.size(); i++)
        {
          
          item anitem = (item)list.get(i);
          total += anitem.getPrice()*anitem.getQuantity();
        }
          
         request.setAttribute("amount", String.valueOf(total));
         request.setAttribute("addMsg","1 item added.");
     //RequestDispatcher rd = getServletContext.d
     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
     dispatcher.forward(request, response); 
     //if add
     }
     else if(action.equals("DELETE"))
     {
         int index = Integer.parseInt(request.getParameter("deleteindex"));
           item anitem = (item)list.get(index);
            anitem.setQuantity(anitem.getQuantity()- 1);
                        
            if((anitem.getQuantity() == 0))
            {
            list.remove(index);
            }
            else
            {
            list.set(index, anitem);
            }
         session.setAttribute("shoppingcart", list);
           float total =0;
          for(int i=0;i<list.size(); i++)
        {
          
          anitem = (item)list.get(i);
          total += anitem.getPrice()*anitem.getQuantity();
        }
          
         request.setAttribute("amount", String.valueOf(total));
         request.setAttribute("deleteMsg","1 item deleted.");
     //RequestDispatcher rd = getServletContext.d
     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Cart.jsp");
     dispatcher.forward(request, response); 
     }
     
     else if(action.equals("CHECKOUT"))
     {
         
     float total =0;
          for(int i=0;i<list.size(); i++)
        {
          
          item anitem = (item)list.get(i);
          total += anitem.getPrice()*anitem.getQuantity();
        }
          
         request.setAttribute("amount", String.valueOf(total));
         
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Checkout.jsp");
     dispatcher.forward(request, response);  
     }
     
     }//end method
    private void insertOrderDB() {
   
    try{
	// Connect to DB to insert details in tables order, order_items, payment and
        // Update table inventory (update quantity)
}catch(Exception e)
{
	System.out.println(e);
	
	}

  }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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

package com.web.greenecoheaven.controller.user;

import com.web.greenecoheaven.DAL.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.web.greenecoheaven.model.orders;
import com.web.greenecoheaven.model.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
@WebServlet(name = "listOrderController", value = "/view/user/listorder")
public class listOrderController extends HttpServlet {

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
        String status = request.getParameter("od_status");
        HttpSession session = request.getSession();
        user user = (user) session.getAttribute("user");
        OrderDAO dao = new OrderDAO();
        List<orders> list_order_of_user = new ArrayList<>();//list order cua tung user
        if (status == null) {
            List<orders> list_order = dao.getOrder();//list order cua tat ca user
            for (orders order : list_order) {
                if (user.getUser_id() == order.getUser_id()) {
                    list_order_of_user.add(order);
                }
            }
        } else if (status.equals("0")) {
            List<orders> list_order = dao.getOrderbyStatus("0");
            for (orders order : list_order) {
                if (user.getUser_id() == order.getUser_id()) {
                    list_order_of_user.add(order);
                }
            }
        } else if (status.equals("1")) {
            List<orders> list_order = dao.getOrderbyStatus("1");
            for (orders order : list_order) {
                if (user.getUser_id() == order.getUser_id()) {
                    list_order_of_user.add(order);
                }
            }
        } else if (status.equals("2")) {
            List<orders> list_order = dao.getOrderbyStatus("2");
            for (orders order : list_order) {
                if (user.getUser_id() == order.getUser_id()) {
                    list_order_of_user.add(order);
                }
            }
        } else if (status.equals("3")) {
            List<orders> list_order = dao.getOrderbyStatus("3");
            for (orders order : list_order) {
                if (user.getUser_id() == order.getUser_id()) {
                    list_order_of_user.add(order);
                }
            }
        }
        List<orders> new_list_order = new ArrayList<>();//list order cua tung user nhung dao nguoc
        for (int i = list_order_of_user.size() - 1; 0 <= i; i--) {
            new_list_order.add(list_order_of_user.get(i));
        }

        request.setAttribute("listOrder", new_list_order);
        request.getRequestDispatcher("order-user.jsp").forward(request, response);
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

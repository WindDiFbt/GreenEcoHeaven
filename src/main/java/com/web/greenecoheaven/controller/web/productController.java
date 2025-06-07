/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.greenecoheaven.controller.web;

import com.web.greenecoheaven.DAL.CategoryDAO;
import com.web.greenecoheaven.DAL.ProductDAO;
import com.web.greenecoheaven.model.category;
import com.web.greenecoheaven.model.product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
@WebServlet(name = "productController", value = "/product")
public class productController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        //get all category
        List<category> listCategory = cdao.getAllCategory();
        request.setAttribute("listCategory", listCategory);
        int index;
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(indexPage);
        }
        int count = pdao.getTotalProduct();
        int endPage = count / 16;
        if (count % 16 != 0) {
            endPage++;
        }
        // get 20 product
        List<product> listProduct = pdao.getNext16Product(index);
        List<product> sale = new ArrayList<>();
        for (product object : listProduct) {
            if (object.getDiscount() != 0) {
                object.setPrice(object.getPrice() * (100 - object.getDiscount()) / 100);
                object.setName(object.getName() + " (-" + object.getDiscount() + "%)");
                sale.add(object);
            }
        }
        request.setAttribute("sale", sale);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("endP", endPage);
        request.getRequestDispatcher("/view/product.jsp").forward(request, response);
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

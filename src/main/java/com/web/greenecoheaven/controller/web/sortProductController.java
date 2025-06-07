/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.web.greenecoheaven.controller.web;

import com.web.greenecoheaven.DAL.CategoryDAO;
import com.web.greenecoheaven.DAL.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.web.greenecoheaven.model.category;
import com.web.greenecoheaven.model.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
@WebServlet(name = "sortProductController", value = "/sortproduct")
public class sortProductController extends HttpServlet {

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
        String sort = request.getParameter("sort");
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        
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
        List<product> listProduct = new ArrayList<>();
        List<product> sale = new ArrayList<>();
        
        if (sort.equals("asc")) {
            listProduct = pdao.getNext16ProductASC(index);
            for (product object : listProduct) {
                if (object.getDiscount() != 0) {
                    object.setPrice(object.getPrice() * (100 - object.getDiscount()) / 100);
                    object.setName(object.getName() + " (-" + object.getDiscount() + "%)");
                    sale.add(object);
                }
            }
            request.setAttribute("sale", sale);
            request.setAttribute("sortoption", "asc");
            request.setAttribute("listProduct", listProduct);
        }
        if (sort.equals("desc")) {
            listProduct = pdao.getNext16ProductDESC(index);
            for (product object : listProduct) {
                if (object.getDiscount() != 0) {
                    object.setPrice(object.getPrice() * (100 - object.getDiscount()) / 100);
                    object.setName(object.getName() + " (-" + object.getDiscount() + "%)");
                    sale.add(object);
                }
            }
            request.setAttribute("sale", sale);
            request.setAttribute("sortoption", "desc");
            request.setAttribute("listProduct", listProduct);
        }
        request.setAttribute("endS", endPage);
        request.getRequestDispatcher("/view/product.jsp").forward(request, response);
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

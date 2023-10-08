/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.CategoryDAO;
import dao.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/products"})
public class ProductsServlet extends HttpServlet {

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
        ProductsDAO prdao = new ProductsDAO();
        CategoryDAO catedao = new CategoryDAO();

        String action = request.getParameter("action");
        int page =1;
        if(request.getParameter("page")!=null){
            page = Integer.parseInt(request.getParameter("page"));
        }
//      Danh Sách Products
        if (action == null) {
            request.setAttribute("listP", prdao.getOfPage(page));
            request.setAttribute("listC", catedao.getAll());
            request.setAttribute("list06", prdao.findByCGIDTop3(1006));
            request.setAttribute("list07", prdao.findByCGIDTop3(1007));
            request.setAttribute("list08", prdao.findByCGIDTop3(1008));
            request.setAttribute("list09", prdao.findByCGIDTop3(1009));
            request.setAttribute("list10", prdao.findByCGIDTop3(1010));
            request.setAttribute("listprice", prdao.descToPrice());
            request.setAttribute("pages", prdao.CountOfPage());
            request.setAttribute("dem", prdao.countProduct());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } else if (action.equals("loaisp")) {
            int cgid = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("dem", prdao.countByCG(cgid));
            request.setAttribute("listP", prdao.findByCategoryID(cgid));
            request.setAttribute("listC", catedao.getAll());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }else if(action.equals("chitiet")){
            int idct = Integer.parseInt(request.getParameter("idct"));
            request.setAttribute("listP", prdao.getAll());
            request.setAttribute("listC", catedao.getAll());
            request.setAttribute("sp", prdao.findByIDCT(idct));
            request.getRequestDispatcher("details.jsp").forward(request, response);
        }else if(action.equals("hinhid")){
            int idct = Integer.parseInt(request.getParameter("idtid"));
            request.setAttribute("listP", prdao.getAll());
            request.setAttribute("listC", catedao.getAll());
            request.setAttribute("sp", prdao.findByIDCT(idct));
            request.getRequestDispatcher("details.jsp").forward(request, response);
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

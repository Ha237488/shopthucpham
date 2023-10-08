/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.CategoryDAO;
import dto.Categories;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {
     CategoryDAO dao = new CategoryDAO();

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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("btAction");
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        if (action == null) {
            List<Categories> kq = dao.getofpage(page);
            request.setAttribute("listCT", kq);
            request.setAttribute("pages", dao.CountPage());
            request.getRequestDispatcher("listCategoryAdmin.jsp").forward(request, response);
        }else if (action.equals("add")) {
            //request.setAttribute("listPhong", phongdao.getAll());
            request.getRequestDispatcher("adminaad.jsp").forward(request, response);
        }else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            List<Categories> kq = dao.getAll();
            request.setAttribute("listCT", kq);
            request.getRequestDispatcher("listCategoryAdmin.jsp").forward(request, response);
        }else if (action.equals("save")) {
            //code
            String name = request.getParameter("name");
            Boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
            String image = request.getParameter("image");

            Categories ct = new Categories();
            ct.setName(name);
            ct.setIsActive(isActive);
            ct.setImage(image);
            dao.insert(ct);
            List<Categories> kq = dao.getAll();
            request.setAttribute("listCT", kq);
            request.getRequestDispatcher("listCategoryAdmin.jsp").forward(request, response);

        }else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("ct", dao.find(id));
            request.getRequestDispatcher("editCategories.jsp").forward(request, response);
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

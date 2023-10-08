/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.CategoryDAO;
import dao.ProductsDAO;
import dto.Categories;
import dto.Products;
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
@WebServlet(name = "AdminProductServlet", urlPatterns = {"/AdminProductServlet"})
public class AdminProductServlet extends HttpServlet {

    CategoryDAO dao = new CategoryDAO();
    ProductsDAO prdao = new ProductsDAO();

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
            List<Products> kq = prdao.getofpage(page);
            request.setAttribute("listPR", kq);
            request.setAttribute("pages", prdao.CountPage());
            request.getRequestDispatcher("listProductAdmin.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            prdao.delete(id);
            List<Products> kq = prdao.getAll();
            request.setAttribute("listPR", kq);
            request.getRequestDispatcher("listProductAdmin.jsp").forward(request, response);
        } else if (action.equals("add")) {
            request.setAttribute("listCT", dao.getAll());
            request.getRequestDispatcher("addProductAdmin.jsp").forward(request, response);
        } else if (action.equals("save")) {
            //code
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            String image1 = request.getParameter("image1");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int purchasedCount = Integer.parseInt(request.getParameter("purchasedCount"));
            String description = request.getParameter("description");
            Boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));

            Products pr = new Products();
            pr.setName(name);
            pr.setPrice(price);
            pr.setImage1(image1);
            pr.setQuantity(quantity);
            pr.setPurchasedCount(purchasedCount);
            pr.setDescription(description);
            pr.setIsActive(isActive);

            // Tìm đối tượng Category theo categoryID
//            Categories category = dao.findCategoryById(categoryID);
//            if (category != null) {
//                pr.setCategoryID(category);
//            }
            Categories phong = dao.find(categoryID);
            pr.setCategoryID(phong);
            // Thêm sản phẩm vào CSDL bằng JPA
            prdao.insert(pr);
            List<Products> kq = prdao.getAll();
            request.setAttribute("listPR", kq);
            request.getRequestDispatcher("listProductAdmin.jsp").forward(request, response);

        } else if (action.equals("edit")) {

            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("pr", prdao.find(id));
            request.setAttribute("listCT", dao.getAll());
            request.getRequestDispatcher("editProductAdmin.jsp").forward(request, response);
        } else if (action.equals("update")) {

            String idParam = request.getParameter("id");
            int id = 0;
            
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    id = Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    request.getRequestDispatcher("loi.jsp").forward(request, response);
                }
            } 
            // Lấy ID sản phẩm cần cập nhật từ request
            //int id = Integer.parseInt(request.getParameter("id"));

            // Lấy thông tin sản phẩm mới từ request
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            String image1 = request.getParameter("image1");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int purchasedCount = Integer.parseInt(request.getParameter("purchasedCount"));
            String description = request.getParameter("description");
            Boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));

            // Tạo đối tượng Products mới với thông tin từ request
            Products updatedProduct = new Products();
            updatedProduct.setId(id); // Đặt ID của sản phẩm cần cập nhật (Không cần cập nhật ID)
            updatedProduct.setName(name);
            updatedProduct.setPrice(price);
            updatedProduct.setImage1(image1);
            updatedProduct.setQuantity(quantity);
            updatedProduct.setPurchasedCount(purchasedCount);
            updatedProduct.setDescription(description);
            updatedProduct.setIsActive(isActive);
            updatedProduct.setCategoryID(dao.find(categoryID));

            prdao.update(id, updatedProduct);
            List<Products> kq = prdao.getAll();
            request.setAttribute("listPR", kq);
            request.getRequestDispatcher("listProductAdmin.jsp").forward(request, response);
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

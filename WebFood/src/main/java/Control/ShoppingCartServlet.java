/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.CartDAO;
import dao.ProductsDAO;
import dto.CartIteam;
import dto.OrderDetails;
import dto.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/cart"})
public class ShoppingCartServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        CartDAO cadao = new CartDAO();
        int idcart = 1;
        if (request.getParameter("idcart") != null) {
            idcart = Integer.parseInt(request.getParameter("idcart"));
        }
        if (action != null) {
            HttpSession session = request.getSession();
            List<CartIteam> cart = (List<CartIteam>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<CartIteam>();
            }
            int dem = 0; //Khởi tạo biến đếm sản phẩm
            float totalPrice = 0; // Khởi tạo tổng tiền
            if (action.equals("addcart")) {
                // Tìm sản phẩm trong giỏ hàng
                CartIteam existingItem = null;
                for (CartIteam item : cart) {
                    if (item.getProduct().getId() == idcart) {
                        existingItem = item;
                        break;
                    }
                }
                if (existingItem != null) {
                    //Sản phẩm đã tồn tại trong giở hàng vì vậy tăng số lượng lên
                    existingItem.setQuantity(existingItem.getQuantity() + 1);
                    // Lấy giá của sản phẩm
                    float productPrice = existingItem.getProduct().getPrice();

                    // Tính toán tổng tiền cho sản phẩm cụ thể
                    float itemTotalPrice = existingItem.getQuantity() * productPrice;

                    // Cập nhật tổng tiền cho sản phẩm trong giỏ hàng
                    existingItem.setPrice((int) itemTotalPrice);
                    dem++;
                } else {
                    //Sản phẩm chưa tồn tại trong giỏ hàng vì vậy thêm mới
                    cart.add(new CartIteam(cadao.findByIDCT(idcart), 1, (int) cadao.findPriceByID(idcart)));
                    dem++;
                }
                // Tăng tổng tiền bằng giá của sản phẩm đã thêm vào
                for (CartIteam item : cart) {
                    totalPrice += item.getPrice();
                }

            } else if (action.equals("remove")) {
                CartIteam itemToRemove = null;
                for (CartIteam item : cart) {
                    if (item.getProduct().getId() == idcart) {
                        itemToRemove = item;
                        break;
                    }
                }
                // Nếu tìm thấy sản phẩm cần xóa, loại bỏ nó khỏi giỏ hàng
                if (itemToRemove != null) {
                    cart.remove(itemToRemove);
                }
                // Giảm tổng tiền bằng giá của sản phẩm đã xóa
                CartIteam removedItem = cart.get(cart.size() - 1); // Lấy sản phẩm cuối cùng đã xóa
                float productPrice = removedItem.getProduct().getPrice();
                totalPrice -= productPrice * removedItem.getQuantity();
            }
            session.setAttribute("cart", cart);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("dem", dem);
        }
        request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
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

package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Product> list = new ProductDAO().getAllProducts();
        request.setAttribute("products", list);
        request.getRequestDispatcher("/web/view/user/productList.jsp").forward(request, response);
    }
}

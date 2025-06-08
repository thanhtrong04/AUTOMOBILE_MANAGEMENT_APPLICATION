/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.dao.CarDAO;
import models.dto.CarDTO;
import services.CarsService;

/**
 *
 * @author Le Thanh Trong
 */
@WebServlet(name="CarsController", urlPatterns = {"/", "/home", "/create-new", "/delete"})
public class CarsController extends HttpServlet {
    
   private CarsService carsService = new CarsService();
   
    private final String CREATE_CAR_PAGE = "create-car.jsp";
    private final String HOME_PAGE = "index.jsp";
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        String path = req.getServletPath();
        if("/".endsWith(path) || "/home".endsWith(path)){
            loadCarList(req, resp);
        }else if("/create-new".endsWith(path)){
            req.getRequestDispatcher(CREATE_CAR_PAGE).forward(req, resp);
        }else if("/delete".endsWith(path)){
            deleteCarByID(req, resp);
        }
    }
    
    //Display List Car
    private void loadCarList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        List<CarDTO> cars = carsService.findAll();
        if(!cars.isEmpty()){
            req.setAttribute("listCar", cars);
        }
        
        req.getRequestDispatcher(HOME_PAGE).forward(req, resp);
    }
    
    //Delete Car By ID
    private void deleteCarByID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String carID = req.getParameter("id");
        String message;
        String type;

        if (carsService.deleteCarById(carID)) {
            message = "Delete Car Success!";
            type = "success";
        } else {
            message = "Delete Car Failed!";
            type = "danger";
        }

        resp.sendRedirect(req.getContextPath()
                + "/home?message="
                + java.net.URLEncoder.encode(message, "UTF-8")
                + "&type=" + type);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

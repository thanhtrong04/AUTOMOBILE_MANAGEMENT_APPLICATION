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
@WebServlet(name="CarsController", urlPatterns = {"/", "/home", "/create-new", "/delete", "/car-detail", "/update-car"})
public class CarsController extends HttpServlet {
    
    private CarsService carsService = new CarsService();
   
    private final String CREATE_CAR_PAGE = "create-car.jsp";
    private final String HOME_PAGE = "index.jsp";
    private final String CAR_DETAIL_PAGE = "car-detail.jsp";
    private final String UPDATE_CAR_PAGE = "update-car.jsp";
    
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
            loadCarList(req, resp);  //Load Car Detail
        }else if("/create-new".endsWith(path)){
            if ("GET".equalsIgnoreCase(req.getMethod())) {
                showCreateCarForm(req, resp); //Load Form Create Car
            } else if ("POST".equalsIgnoreCase(req.getMethod())) {
                createNewCar(req, resp); //Create New Car
            }
        }else if("/delete".endsWith(path)){
            deleteCarByID(req, resp); // Delete Car By ID
        }else if("/car-detail".endsWith(path)){
            loadCarDetail(req, resp, CAR_DETAIL_PAGE); // Load Car Detail By ID
        }else if("/update-car".endsWith(path)){
            if("GET".equalsIgnoreCase(req.getMethod())){
                loadCarDetail(req, resp, UPDATE_CAR_PAGE);
            } else if ("POST".equalsIgnoreCase(req.getMethod())){
                updateCar(req, resp);
            }
        }
    }
    
    //Display List Car
    private void loadCarList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        List<CarDTO> cars = carsService.findAll();
        String mess = null;
        String type = null;
        if(!cars.isEmpty()){
            req.setAttribute("listCar", cars);
        }else {
            mess = "No cars found!";
            type = "warning";
        }
        
        if (mess != null && type != null) {
            req.setAttribute("message", mess);
            req.setAttribute("type", type);
        }
        
        req.getRequestDispatcher(HOME_PAGE).forward(req, resp);
    }
    
    //Delete Car By ID
    private void deleteCarByID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String carID = req.getParameter("id");
        String message;
        String type;

        if (carsService.deleteCarById(carID)) {
            message = "Delete Car Success !";
            type = "success";
        } else {
            message = "Delete Car Failed !";
            type = "danger";
        }

        resp.sendRedirect(req.getContextPath()
                + "/home?message="
                + java.net.URLEncoder.encode(message, "UTF-8")
                + "&type=" + type);
    }
    
    //Load Form Create Car
    private void showCreateCarForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(CREATE_CAR_PAGE).forward(req, resp);
    }
    
    //Create New Car
    private void createNewCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       
        String txtCarId = req.getParameter("txtCarID");
        String txtCarName = req.getParameter("txtCarName");
        String txtManufacturer = req.getParameter("txtManufacturer");
        String txtPrice = req.getParameter("txtPrice");
        String txtReleasedYear = req.getParameter("txtReleasedYear");
        
        String mess = "";
        String type = "";
        
        if(carsService.addCar(txtCarId, txtCarName, txtManufacturer, txtPrice, txtReleasedYear)){
            mess = "Create New Car Suceess !";
            type = "success";
        }else{
            mess = "Create New Car Failed !";
            type = "danger";
        }
        
        resp.sendRedirect(req.getContextPath()
                + "/home?message="
                + java.net.URLEncoder.encode(mess, "UTF-8")
                + "&type=" + type);     
    }
    
    //Load Car Detail By ID
    private void loadCarDetail(HttpServletRequest req, HttpServletResponse resp, String page) throws ServletException, IOException{
        
        String txtId = req.getParameter("id");
        CarDTO carDTO = carsService.findByID(Integer.parseInt(txtId));
        if(carDTO != null){
            req.setAttribute("carDetail", carDTO);
            req.getRequestDispatcher(page).forward(req, resp);
        } 
        
        resp.sendRedirect(req.getContextPath()
                + "/home?message="
                + java.net.URLEncoder.encode("Cannot Load Car By ID: " + txtId, "UTF-8")
                + "&type=" + "danger");
    }
    
    //Update Car By ID
    private void updateCar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String txtCarID = req.getParameter("txtCarID");
        String txtCarName = req.getParameter("txtCarName");
        String txtManufacturer = req.getParameter("txtManufacturer");
        String txtPrice = req.getParameter("txtPrice");
        String txtReleasedYear = req.getParameter("txtReleasedYear");
        if (carsService.updateCar(txtCarID, txtCarName, txtManufacturer, txtPrice, txtReleasedYear)) {
            resp.sendRedirect(req.getContextPath()
                    + "/home?message="
                    + java.net.URLEncoder.encode("Update Car Success", "UTF-8")
                    + "&type=" + "success");
            return;
        }

        resp.sendRedirect(req.getContextPath()
                + "/home?message="
                + java.net.URLEncoder.encode("Update Car By ID: " + txtCarID + " Failed !", "UTF-8")
                + "&type=" + "danger");
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

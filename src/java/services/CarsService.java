/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.util.List;
import models.dao.CarDAO;
import models.dto.CarDTO;

/**
 *
 * @author Le Thanh Trong
 */
public class CarsService {
    
    private CarDAO carDAO = new CarDAO();
    
    public List<CarDTO> findAll(){
        return carDAO.findAll();
    }
    
    public boolean deleteCarById(String id){
        boolean isSuccess = false;
        try {
            int CarID = Integer.parseInt(id);
            if(carDAO.deleteById(CarID) > 0){
                isSuccess = true;
            }
        } catch (Exception e) {
            System.out.println("Error While Deleting Car By ID: " + e.getMessage());         
        }
        return isSuccess;
    }
    
}

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
    
    public CarDTO findByID(int id){
        return carDAO.findById(id);
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
    
    public boolean addCar(
            String txtCarId, 
            String txtCarName, 
            String txtManufacturer,
            String txtPrice,
            String txtReleasedYear){
        boolean isSuccess = false;
        try{
            CarDTO carDTO = new CarDTO();
            carDTO.setCarID(Integer.parseInt(txtCarId));
            carDTO.setCarName(txtCarName);
            carDTO.setManufacturer(txtManufacturer);
            carDTO.setPrice(Double.parseDouble(txtPrice));
            carDTO.setReleasedYear(Integer.parseInt(txtReleasedYear));
            if(carDAO.insertCar(carDTO) > 0){
                isSuccess = true;
            }
        }catch(Exception e){
            System.out.println("Error While Adding Car !");
        }
        return isSuccess;
    }
    
    public boolean updateCar(String txtCarID, String txtCarName, String txtManufacturer, String txtPrice, String txtReleasedYear){
        boolean isSuccess = false;
        try{
            CarDTO oldCar = findByID(Integer.parseInt(txtCarID));
            
            String newName = (txtCarName != null && !txtCarName.equals(oldCar.getCarName())) ? txtCarName : oldCar.getCarName();
            String newManufacturer = (txtManufacturer != null && !txtManufacturer.equals(oldCar.getManufacturer())) ? txtManufacturer : oldCar.getManufacturer();
            double newPrice = (txtPrice != null) ? Double.parseDouble(txtPrice) : oldCar.getPrice();
            int newYear = (txtReleasedYear != null) ? Integer.parseInt(txtReleasedYear) : oldCar.getReleasedYear();
            
            oldCar.setCarName(newName);
            oldCar.setManufacturer(newManufacturer);
            oldCar.setPrice(newPrice);
            oldCar.setReleasedYear(newYear);
            
            if(carDAO.updateById(oldCar) > 0){
                isSuccess = true;
            }
        }catch(Exception e){
            System.out.println("Error While Updating Car !");
        }
        return isSuccess;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.dto.CarDTO;
import utils.DbUtils;

/**
 *
 * @author admin
 */
public class CarDAO {
    
    public List<CarDTO> findAll(){
        String query = "SELECT * " +
                        "FROM cars";
        
        List<CarDTO> result = new ArrayList<>();
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
                ){
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                CarDTO carDTO = new CarDTO();
                carDTO.setCarID(rs.getInt("CarID"));
                carDTO.setCarName(rs.getString("CarName"));
                carDTO.setManufacturer(rs.getString("Manufacturer"));
                carDTO.setPrice(rs.getDouble("Price"));
                carDTO.setReleasedYear(rs.getInt("ReleasedYear"));
                result.add(carDTO);
            }
            
        }catch(Exception e){
            System.out.println("findAll: " + e.getMessage());
        }
        return result;
    }
    
    public CarDTO findById(int id){
        String query = "SELECT * FROM Cars WHERE CarID = ?";
        CarDTO carDTO = null;
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query)
            ){
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                carDTO = new CarDTO();
                carDTO.setCarID(rs.getInt("CarID"));
                carDTO.setCarName(rs.getString("CarName"));
                carDTO.setManufacturer(rs.getString("Manufacturer"));
                carDTO.setPrice(rs.getDouble("Price"));
                carDTO.setReleasedYear(rs.getInt("ReleasedYear"));
            }      
        }catch(Exception e){
            System.out.println("findById: " + e.getMessage());
        }
        return carDTO;
    }
    
    public int deleteById(int id){
        int rowDeleted = 0;
        String query = "DELETE FROM Cars WHERE CarID = ?";
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            ){
            statement.setInt(1, id);
            
            rowDeleted = statement.executeUpdate();
            
        }catch(Exception e){
            System.out.println("deleteById: " +  e.getMessage()); 
        }
        return rowDeleted;
    }
    
    public CarDTO findCarById(int id){
        String query = "SELECT * FROM Cars WHERE CarID = ?";
        CarDTO carDTO = null;
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            ){
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                carDTO.setCarID(rs.getInt("CarID"));
                carDTO.setCarName(rs.getString("CarName"));
                carDTO.setManufacturer(rs.getString("Manufacturer"));
                carDTO.setPrice(rs.getDouble("Price"));
                carDTO.setReleasedYear(rs.getInt("ReleasedYear"));
            }
        }catch(Exception e){
            System.out.println("findCarById: " + e.getMessage());
        }
        return carDTO;
    }
    
    public int insertCar(CarDTO car){
        String query = "INSERT INTO Cars (CarID, CarName, Manufacturer, Price, ReleasedYear) VALUES (?, ?, ?, ?, ?)";
        int rowInserted = 0;
        
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query)){
            
            statement.setInt(1, car.getCarID());
            statement.setString(2, car.getCarName());
            statement.setString(3, car.getManufacturer());
            statement.setDouble(4, car.getPrice());
            statement.setInt(5, car.getReleasedYear());
            
            rowInserted = statement.executeUpdate();
                    
        }catch(Exception e){
            System.out.println("insertCar: " + e.getMessage());
        }
        
        return rowInserted;
    }
    
    public int updateById(CarDTO car){
        String query = "UPDATE Cars SET CarName = ?, Manufacturer = ?, Price = ?, ReleasedYear = ? WHERE CarID = ?";
        int rowUpdated = 0;
        try(Connection connection = DbUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(query)){
            
            statement.setString(1, car.getCarName());
            statement.setString(2, car.getManufacturer());
            statement.setDouble(3, car.getPrice());
            statement.setInt(4, car.getReleasedYear());
            
            statement.setInt(5, car.getCarID());
            
            rowUpdated = statement.executeUpdate();
            
        }catch(Exception e){
            System.out.println("updateById: " + e.getMessage());
        }
        
        return rowUpdated;
    }
    
}

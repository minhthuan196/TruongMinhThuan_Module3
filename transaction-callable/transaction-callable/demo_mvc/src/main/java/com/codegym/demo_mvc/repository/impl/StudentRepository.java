package com.codegym.demo_mvc.repository.impl;

import com.codegym.demo_mvc.model.Student;
import com.codegym.demo_mvc.repository.BaseRepository;
import com.codegym.demo_mvc.repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL ="select * from student";
    private final String DELETE_BY_ID ="call delete_by_id(?);";
    private final String INSERT_INTO ="insert into student(name,gender,point,class_id) values(?,?,?,?);";
    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        // kết nối DB để lấy dữ liệu
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
           ResultSet resultSet=  preparedStatement.executeQuery();
           // xử lý kết quả
            while (resultSet.next()){
               int id  = resultSet.getInt("id");// tên giống cột bên table
               String name = resultSet.getString("name");
               boolean gender = resultSet.getBoolean("gender");
               int point = resultSet.getInt("point");
               int classId = resultSet.getInt("class_id");
               Student student = new Student(id, name,gender,point,classId);
               studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public boolean save(Student student) {

      Connection connection =BaseRepository.getConnectDB();
      int count =0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setFloat(3,student.getPoint());
            preparedStatement.setInt(4,student.getClassId());
             count = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (count==1);

    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
           return false;
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return true;
    }
}

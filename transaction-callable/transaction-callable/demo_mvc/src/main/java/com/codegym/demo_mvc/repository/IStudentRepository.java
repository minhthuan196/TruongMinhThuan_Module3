package com.codegym.demo_mvc.repository;

import com.codegym.demo_mvc.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    boolean save(Student student);
    boolean delete(int id);
}

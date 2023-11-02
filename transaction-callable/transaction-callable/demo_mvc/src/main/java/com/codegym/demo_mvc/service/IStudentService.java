package com.codegym.demo_mvc.service;

import com.codegym.demo_mvc.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    boolean save(Student student);
    boolean delete(int id);
}

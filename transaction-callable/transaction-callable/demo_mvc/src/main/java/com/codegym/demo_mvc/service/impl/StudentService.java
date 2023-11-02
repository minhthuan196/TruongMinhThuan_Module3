package com.codegym.demo_mvc.service.impl;

import com.codegym.demo_mvc.model.Student;
import com.codegym.demo_mvc.repository.IStudentRepository;
import com.codegym.demo_mvc.repository.impl.StudentRepository;
import com.codegym.demo_mvc.service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository =new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public boolean save(Student student) {
        // kiểm dữ liệu student có hợp lệ hay không thì mới cho thêm mới ( vaidate);
      return studentRepository.save(student);
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }
}

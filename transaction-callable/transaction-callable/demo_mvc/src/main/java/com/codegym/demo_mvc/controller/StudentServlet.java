package com.codegym.demo_mvc.controller;

import com.codegym.demo_mvc.model.Student;
import com.codegym.demo_mvc.service.IStudentService;
import com.codegym.demo_mvc.service.impl.StudentService;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Struct;
import java.util.List;
import java.util.Map;

@WebServlet(name = "studentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private IStudentService studentService= new StudentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                //trả lại form thêm mới
                showAddForm(req,resp);
                break;
            case "delete":
                break;
            default:
                showList(req,resp);

        }

    }
    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) {
     RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/student/add.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Student> studentList = studentService.findAll();
        req.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/student/list.jsp");
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                save(req,resp);
                break;
            case "delete":
                delete(req,resp);
                // xoá
                break;
            default:
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int deleteId= Integer.parseInt(req.getParameter("deleteId"));
        boolean check = studentService.delete(deleteId);
        try {
            resp.sendRedirect("/student?isDelete="+check);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//      int id = Integer.parseInt(req.getParameter("id"));
      String name  = req.getParameter("name");
      boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
      int point = Integer.parseInt(req.getParameter("point"));
      int classId = Integer.parseInt(req.getParameter("classId"));
      Student student = new Student(name,gender,point,classId);
      boolean check =studentService.save(student);
      resp.sendRedirect("/student?isCreated="+ check);

    }
}

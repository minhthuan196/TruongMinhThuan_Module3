package com.codegym.demo_mvc.config;

import com.codegym.demo_mvc.model.Student;
import com.codegym.demo_mvc.service.IStudentService;
import com.codegym.demo_mvc.service.impl.StudentService;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "studentAPI", value = "/api/students")
public class StudentAPI extends HttpServlet {
    private IStudentService studentService= new StudentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> studentList = studentService.findAll();
        Gson gson = new Gson();
        String json = gson.toJson(studentList);
        resp.setContentType("application/json");
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        StringBuilder requestBody = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }
        reader.close();
        // Xử lý dữ liệu trong phần thân của yêu cầu
        String jsonData = requestBody.toString();
        // ... Xử lý dữ liệu JSON hoặc dữ liệu trong định dạng khác
        Gson gson = new Gson();
        Student student = gson.fromJson(jsonData, Student.class);
        // Gửi phản hồi về cho client
        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write("Dữ liệu đã được xử lý");
    }
}

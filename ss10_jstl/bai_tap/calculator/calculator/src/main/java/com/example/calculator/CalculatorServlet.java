package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        try{
            float result = Calculator.calculate(firstOperand,secondOperand,operator);
            request.setAttribute("result",result);
            request.setAttribute("firstOperand",firstOperand);
            request.setAttribute("secondOperand",secondOperand);
            request.setAttribute("operator",operator);
        }catch (Exception ex){
            request.setAttribute("exception",ex.getMessage());
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/calculator.jsp");
        requestDispatcher.forward(request, response);
    }
}

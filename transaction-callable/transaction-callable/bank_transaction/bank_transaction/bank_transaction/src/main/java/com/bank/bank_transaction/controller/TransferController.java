package com.bank.bank_transaction.controller;

import com.bank.bank_transaction.model.TransferInfo;
import com.bank.bank_transaction.service.ITransferService;
import com.bank.bank_transaction.service.TransferService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;

@WebServlet(name = "transferController", value = "/transfer")
public class TransferController extends HttpServlet {
    private ITransferService transferService = new TransferService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("transfer.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      long accountTarget = Long.parseLong(req.getParameter("accountTarget"));
      long accountSource = Long.parseLong(req.getParameter("accountSource"));
      double moneyTransfer = Double.parseDouble(req.getParameter("moneyTransfer"));
      String content = req.getParameter("content");
      LocalTime time = LocalTime.from(LocalDateTime.now());
      TransferInfo transferInfo = new TransferInfo(accountSource,accountTarget,time,moneyTransfer,content);
      String message = transferService.transfer(transferInfo);
      req.setAttribute("message", message);
      req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}

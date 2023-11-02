package com.bank.bank_transaction.model;

import java.time.LocalTime;

public class TransferInfo {
    private int id;
    private long accountSource;
    private long accountTarget;
    private LocalTime time;
    private double moneyTransfer;
    private String content;

    public TransferInfo() {
    }

    public TransferInfo(int id, long accountSource, long accountTarget, LocalTime time, double moneyTransfer, String content) {
        this.id = id;
        this.accountSource = accountSource;
        this.accountTarget = accountTarget;
        this.time = time;
        this.moneyTransfer = moneyTransfer;
        this.content = content;
    }

    public TransferInfo(long accountSource, long accountTarget, LocalTime time, double moneyTransfer, String content) {
        this.accountSource = accountSource;
        this.accountTarget = accountTarget;
        this.time = time;
        this.moneyTransfer = moneyTransfer;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getAccountSource() {
        return accountSource;
    }

    public void setAccountSource(long accountSource) {
        this.accountSource = accountSource;
    }

    public long getAccountTarget() {
        return accountTarget;
    }

    public void setAccountTarget(long accountTarget) {
        this.accountTarget = accountTarget;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public double getMoneyTransfer() {
        return moneyTransfer;
    }

    public void setMoneyTransfer(double moneyTransfer) {
        this.moneyTransfer = moneyTransfer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

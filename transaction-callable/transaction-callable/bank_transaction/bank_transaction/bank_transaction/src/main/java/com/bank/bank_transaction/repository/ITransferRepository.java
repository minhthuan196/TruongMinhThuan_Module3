package com.bank.bank_transaction.repository;

import com.bank.bank_transaction.model.TransferInfo;

import java.sql.SQLException;

public interface ITransferRepository {
    String transfer(TransferInfo transferInfo);
}

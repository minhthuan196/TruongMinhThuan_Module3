package com.bank.bank_transaction.service;

import com.bank.bank_transaction.model.TransferInfo;

public interface ITransferService {
    String transfer(TransferInfo transferInfo);
}

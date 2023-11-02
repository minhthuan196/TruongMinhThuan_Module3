package com.bank.bank_transaction.service;

import com.bank.bank_transaction.model.TransferInfo;
import com.bank.bank_transaction.repository.ITransferRepository;
import com.bank.bank_transaction.repository.TransferRepository;

public class TransferService implements ITransferService{
    private ITransferRepository transferRepository =new TransferRepository();
    @Override
    public String transfer(TransferInfo transferInfo) {
        return transferRepository.transfer(transferInfo);
    }
}

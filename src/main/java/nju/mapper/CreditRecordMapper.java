package nju.mapper;

import nju.domain.CreditRecord;

import java.util.List;

public interface CreditRecordMapper {
    void addRecord(CreditRecord creditRecord);

    List<CreditRecord> findRecordByUserID(String userID);
}

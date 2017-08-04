package nju.mapper;

import nju.domain.FinancialRecord;

import java.util.List;

public interface FinancialRecordMapper {
    void addRecord(FinancialRecord record);

    List<FinancialRecord> findRecordByUserID(String user_id);
}

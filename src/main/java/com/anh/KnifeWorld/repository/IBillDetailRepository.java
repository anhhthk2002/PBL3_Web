package com.anh.KnifeWorld.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anh.KnifeWorld.entities.Bill;
import com.anh.KnifeWorld.entities.BillDetail;
import com.anh.KnifeWorld.entities.BillDetailPK;
@Repository
public interface IBillDetailRepository extends JpaRepository<BillDetail, BillDetailPK>{
	List<BillDetail> findByBill(Bill bill);
}

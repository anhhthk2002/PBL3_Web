package com.anh.KnifeWorld.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anh.KnifeWorld.entities.Bill;
import com.anh.KnifeWorld.entities.User;
@Repository
public interface IBillRepository extends JpaRepository<Bill, Integer>{
	Page<Bill> findByUser(User user,Pageable pageable);
}

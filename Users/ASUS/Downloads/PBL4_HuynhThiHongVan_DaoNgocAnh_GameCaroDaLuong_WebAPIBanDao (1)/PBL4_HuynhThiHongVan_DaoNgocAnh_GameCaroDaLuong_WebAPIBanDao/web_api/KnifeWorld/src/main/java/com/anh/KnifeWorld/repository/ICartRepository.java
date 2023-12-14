package com.anh.KnifeWorld.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anh.KnifeWorld.entities.Cart;
import com.anh.KnifeWorld.entities.CartPK;
import com.anh.KnifeWorld.entities.User;

@Repository
public interface ICartRepository extends JpaRepository<Cart,CartPK >{
	List<Cart> findByUser(User user);
}

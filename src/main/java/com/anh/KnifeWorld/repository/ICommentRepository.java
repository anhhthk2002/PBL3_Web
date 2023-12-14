package com.anh.KnifeWorld.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anh.KnifeWorld.entities.Comment;
import com.anh.KnifeWorld.entities.CommentPK;
import com.anh.KnifeWorld.entities.Product;
@Repository
public interface ICommentRepository extends JpaRepository<Comment, CommentPK>{
	List<Comment> findByProduct(Product product);
}

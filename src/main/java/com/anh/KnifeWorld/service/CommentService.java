package com.anh.KnifeWorld.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.anh.KnifeWorld.entities.Comment;
import com.anh.KnifeWorld.entities.Product;
import com.anh.KnifeWorld.repository.ICommentRepository;
@Service
public class CommentService {
	private ICommentRepository repository;

	public CommentService(ICommentRepository repository) {
		this.repository = repository;
	}
	public Comment save(Comment c) {
		return this.repository.save(c);
	}
	public List<Comment> getByProduct(Product p){
		return this.repository.findByProduct(p);
	}
}

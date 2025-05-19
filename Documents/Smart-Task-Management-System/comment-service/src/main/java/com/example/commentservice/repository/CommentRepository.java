package com.example.commentservice.repository;

import com.example.commentservice.model.Comment;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface CommentRepository extends MongoRepository<Comment, String> {
    List<Comment> findByTaskId(String taskId);
}

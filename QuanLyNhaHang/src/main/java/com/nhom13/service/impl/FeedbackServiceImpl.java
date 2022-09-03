package com.nhom13.service.impl;

import com.nhom13.pojo.Feedback;
import com.nhom13.repository.FeedbackRepository;
import com.nhom13.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    FeedbackRepository feedbackRepository;

    @Override
    public Feedback addFeedback(String content) {
        return this.feedbackRepository.addFeedback(content);
    }
}

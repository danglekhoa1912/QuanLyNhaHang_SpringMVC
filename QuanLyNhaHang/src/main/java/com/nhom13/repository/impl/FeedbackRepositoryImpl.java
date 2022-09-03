package com.nhom13.repository.impl;

import com.nhom13.pojo.Feedback;
import com.nhom13.repository.FeedbackRepository;
import com.nhom13.repository.UserRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FeedbackRepositoryImpl implements FeedbackRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private UserRepository userRepository;

    @Override
    public Feedback addFeedback(String content) {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Feedback f = new Feedback();
            f.setContent(content);
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            f.setUserId(this.userRepository.getUserByEmail(authentication.getName()));

            session.save(f);

            return f;
    }
}

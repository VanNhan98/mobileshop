package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.smartapple.appleshop.domain.User;

@Repository

public interface UserRepository extends JpaRepository<User, Long> {
    User findById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}

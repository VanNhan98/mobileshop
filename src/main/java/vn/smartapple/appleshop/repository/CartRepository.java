package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.smartapple.appleshop.domain.Cart;
import java.util.List;
import vn.smartapple.appleshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}

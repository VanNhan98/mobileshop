package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.smartapple.appleshop.domain.Cart;
import vn.smartapple.appleshop.domain.CartDetail;
import vn.smartapple.appleshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

}

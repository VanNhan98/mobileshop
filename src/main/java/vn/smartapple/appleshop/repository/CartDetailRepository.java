package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smartapple.appleshop.domain.CartDetail;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

}

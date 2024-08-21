package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smartapple.appleshop.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}

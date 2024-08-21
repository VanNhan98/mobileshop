package vn.smartapple.appleshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smartapple.appleshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
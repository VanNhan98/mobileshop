package vn.smartapple.appleshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.smartapple.appleshop.domain.Order;
import vn.smartapple.appleshop.domain.OrderDetail;
import vn.smartapple.appleshop.domain.User;
import vn.smartapple.appleshop.repository.OrderDetailRepository;
import vn.smartapple.appleshop.repository.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order handleSave(Order order) {
        return this.orderRepository.save(order);
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail cd : orderDetails) {
                this.orderDetailRepository.deleteById(cd.getId());

            }
        }
        this.orderRepository.deleteById(id);
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

}

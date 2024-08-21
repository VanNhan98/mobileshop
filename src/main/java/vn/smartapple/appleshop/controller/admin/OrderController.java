package vn.smartapple.appleshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.smartapple.appleshop.domain.Order;
import vn.smartapple.appleshop.service.OrderService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderService.fetchAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getDetailOrder(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        model.addAttribute("id", id);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrder(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id).get();
        model.addAttribute("newOrder", order);

        return "admin/order/update";

    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(Model model, @ModelAttribute("newOrder") Order order) {
        this.orderService.updateOrder(order);

        return "redirect:/admin/order";
    }

}

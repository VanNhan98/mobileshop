package vn.smartapple.appleshop.controller.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.smartapple.appleshop.domain.Product;
import vn.smartapple.appleshop.service.ProductService;

@Controller
public class HomePageController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/home";
    }

}

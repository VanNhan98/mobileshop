package vn.smartapple.appleshop.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.smartapple.appleshop.domain.Cart;
import vn.smartapple.appleshop.domain.CartDetail;
import vn.smartapple.appleshop.domain.Product;
import vn.smartapple.appleshop.domain.User;
import vn.smartapple.appleshop.service.ProductService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {
    @Autowired
    private ProductService productService;

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("id", id);

        return "client/product/detail";
    }

    @GetMapping("/products")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional,
            @RequestParam("name") Optional<String> nameOptional,
            @RequestParam("min-price") Optional<String> minOptional,
            @RequestParam("max-price") Optional<String> maxOptional,
            @RequestParam("factory") Optional<String> factoryOptional,
            @RequestParam("price") Optional<String> priceOptional,
            @RequestParam("sort") Optional<String> sortOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {

        }

        Pageable pageable = PageRequest.of(page - 1, 60);

        String name = nameOptional.isPresent() ? nameOptional.get() : "";
        Page<Product> prs = this.productService.getSixProductWithSpecAndPage(pageable, name);

        // double min = minOptional.isPresent() ? Double.parseDouble(minOptional.get())
        // : 0;
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, min);

        // double max = maxOptional.isPresent() ? Double.parseDouble(maxOptional.get())
        // : 0;
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, max);

        // String factory = factoryOptional.isPresent() ? factoryOptional.get() : "";
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, factory);

        // List<String> factory = Arrays.asList(factoryOptional.get().split(","));
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, factory);

        // String price = priceOptional.isPresent() ? priceOptional.get() : "";
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, price);

        // List<String> price = Arrays.asList(priceOptional.get().split(","));
        // Page<Product> prs =
        // this.productService.getSixProductWithSpecAndPage(pageable, price);
        List<Product> listProducts = prs.getContent();

        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        return "client/product/show";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(Model model, @PathVariable long id, HttpServletRequest request) {
        long productId = id;

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session, 1);

        return "redirect:/";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFormViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;

    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");

        currentUser.setId(id);
        Cart cart = this.productService.findCartByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        long cartDetailId = id;
        HttpSession session = request.getSession(false);
        session.getAttribute("id");
        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(Model model, @ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);

        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.findCartByUser(currentUser);
        List<CartDetail> cartDetail = cart == null ? new ArrayList<>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cd : cartDetail) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cartDetails", cartDetail);

        return "client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String postMethodName(HttpServletRequest request, @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        User user = new User();
        long id = (long) session.getAttribute("id");
        user.setId(id);
        this.productService.handleCheckOutCart(user, session, receiverName, receiverAddress, receiverPhone);

        return "redirect:/checkout";
    }

}

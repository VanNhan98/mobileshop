package vn.smartapple.appleshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.smartapple.appleshop.domain.Cart;
import vn.smartapple.appleshop.domain.CartDetail;
import vn.smartapple.appleshop.domain.Product;
import vn.smartapple.appleshop.domain.User;
import vn.smartapple.appleshop.repository.CartDetailRepository;
import vn.smartapple.appleshop.repository.CartRepository;
import vn.smartapple.appleshop.repository.ProductRepository;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private UserService userService;

    public Optional<Product> getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product saveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public void deleteUserById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // lay user, check user exists cart? save : new cart
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            // get cartDetail, save cartDetail
            // get product by id
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product currentProduct = productOptional.get();

                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, currentProduct);
                if (cartDetail == null) {
                    CartDetail newCartDetail = new CartDetail();
                    newCartDetail.setCart(cart);
                    newCartDetail.setProduct(currentProduct);
                    newCartDetail.setPrice(currentProduct.getPrice());
                    newCartDetail.setQuantity(1);
                    this.cartDetailRepository.save(newCartDetail);
                    // update sum cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    cart = this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(cartDetail);
                }

            }

        }

    }

    public Cart findCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }
}

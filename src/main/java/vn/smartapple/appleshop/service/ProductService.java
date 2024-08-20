package vn.smartapple.appleshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void handleAddProductToCart(String email, long productId) {
        // lay user, check user exists cart? save : new cart
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(1);
                cart = this.cartRepository.save(newCart);
            }

            // get cartDetail, save cartDetail
            // get product by id
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product currentProduct = productOptional.get();
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                ;
                cartDetail.setProduct(currentProduct);
                cartDetail.setPrice(currentProduct.getPrice());
                cartDetail.setQuantity(1);

                this.cartDetailRepository.save(cartDetail);

            }

        }

    }

}

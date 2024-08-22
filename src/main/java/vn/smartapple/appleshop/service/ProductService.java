package vn.smartapple.appleshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.smartapple.appleshop.domain.Cart;
import vn.smartapple.appleshop.domain.CartDetail;
import vn.smartapple.appleshop.domain.Order;
import vn.smartapple.appleshop.domain.OrderDetail;
import vn.smartapple.appleshop.domain.Product;
import vn.smartapple.appleshop.domain.User;
import vn.smartapple.appleshop.domain.dto.ProductCriteriaDTO;
import vn.smartapple.appleshop.repository.CartDetailRepository;
import vn.smartapple.appleshop.repository.CartRepository;
import vn.smartapple.appleshop.repository.OrderDetailRepository;
import vn.smartapple.appleshop.repository.OrderRepository;
import vn.smartapple.appleshop.repository.ProductRepository;
import vn.smartapple.appleshop.service.specification.ProductSpec;

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
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;

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

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
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
                    newCartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(newCartDetail);
                    // update sum cart
                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    cart = this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(cartDetail);
                }

            }

        }

    }

    public Cart findCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetaiLOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetaiLOptional.isPresent()) {
            CartDetail cartDetail = cartDetaiLOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cartdetail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            }

            else {
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }

        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handleCheckOutCart(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += (cd.getPrice() * cd.getQuantity());
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cartDetail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // step 3: update session
                session.setAttribute("sum", 0);
            }
        }

    }

    // panging
    // admin -> product
    public Page<Product> getAllProductsByPageable(Pageable page) {
        return this.productRepository.findAll(page);
    }

    // client -> product
    public Page<Product> fetchProductWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        Specification<Product> combineSpec = Specification.where(null);
        if (productCriteriaDTO.getFactory() == null && productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(page);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpec.matchListFactory(productCriteriaDTO.getFactory().get());
            combineSpec = combineSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpec.matchListTarget(productCriteriaDTO.getTarget().get());
            combineSpec = combineSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecs(productCriteriaDTO.getPrice().get());

            combineSpec = combineSpec.and(currentSpecs);
        }
        return this.productRepository.findAll(combineSpec, page);
    }

    public Specification<Product> buildPriceSpecs(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-toi-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-toi-25-trieu":
                    min = 15000000;
                    max = 25000000;
                    break;
                case "tren-25-trieu":
                    min = 25000000;
                    max = 40000000;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpec.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

}

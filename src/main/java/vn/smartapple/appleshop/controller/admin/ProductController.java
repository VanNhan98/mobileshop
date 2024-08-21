package vn.smartapple.appleshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.smartapple.appleshop.domain.Product;

import vn.smartapple.appleshop.service.ProductService;
import vn.smartapple.appleshop.service.UpLoadFileService;

@Controller
public class ProductController {
    @Autowired
    private UpLoadFileService upLoadFileService;

    @Autowired
    private ProductService productService;

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> list = this.productService.getAllProducts();
        model.addAttribute("products", list);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProductPage(Model model, @RequestParam("nameFile") MultipartFile file,
            @ModelAttribute("newProduct") @Valid Product product, BindingResult bindingResult) {

        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String avatar = this.upLoadFileService.handleSaveUploadFile(file, "product");
        product.setImage(avatar);
        this.productService.saveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("newProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postMethodName(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult, @RequestParam("nameFile") MultipartFile file) {
        // validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product productCurrent = this.productService.getProductById(product.getId()).get();
        if (productCurrent != null) {
            if (!file.isEmpty()) {
                productCurrent.setImage(product.getImage());
                String img = this.upLoadFileService.handleSaveUploadFile(file, "product");
                productCurrent.setImage(img);
            }
            productCurrent.setName(product.getName());
            productCurrent.setPrice(product.getPrice());
            productCurrent.setDetailDesc(product.getDetailDesc());
            productCurrent.setShortDesc(product.getShortDesc());
            productCurrent.setQuantity(product.getQuantity());
            productCurrent.setSize(product.getSize());

            this.productService.saveProduct(productCurrent);
        }

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteUserById(product.getId());
        return "redirect:/admin/product";
    }

}

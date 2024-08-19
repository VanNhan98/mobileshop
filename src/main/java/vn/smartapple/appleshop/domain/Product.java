package vn.smartapple.appleshop.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @NotNull
    @NotEmpty(message = "Name cannot be empty")
    String name;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Price must be greater than 0 ")
    double price;
    String image;

    @NotNull
    @NotEmpty(message = "DetailDesc cannot be empty")
    @Column(columnDefinition = "MEDIUMTEXT")
    String detailDesc;

    @NotNull
    @NotEmpty(message = "ShortDesc cannot be empty")
    String shortDesc;

    @NotNull
    @Min(value = 1, message = "Quantity must be greater than 1 ")
    long quantity;
    long sold;
    String factory;
    String size;
}

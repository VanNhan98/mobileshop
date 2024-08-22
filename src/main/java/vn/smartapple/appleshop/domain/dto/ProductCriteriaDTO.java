package vn.smartapple.appleshop.domain.dto;

import java.util.List;
import java.util.Optional;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCriteriaDTO {
    Optional<String> page;
    Optional<List<String>> factory;
    Optional<List<String>> target;
    Optional<List<String>> price;
    Optional<String> sort;

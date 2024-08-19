package vn.smartapple.appleshop.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import vn.smartapple.appleshop.service.validator.RegisterChecked;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@RegisterChecked
public class RegisterDTO {
    @Size(min = 2, message = "Invalid firstName ")
    String firstName;
    String lastName;

    @Email(message = "Invalid email", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    String email;

    @Size(min = 2, message = "Password 3 least characters")
    String password;
    String confirmPassword;

}

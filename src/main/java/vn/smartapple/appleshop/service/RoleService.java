package vn.smartapple.appleshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.smartapple.appleshop.domain.Role;
import vn.smartapple.appleshop.repository.RoleRepository;

@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}

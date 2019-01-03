package cz.jiripinkas.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cz.jiripinkas.jba.entity.Role;
import cz.jiripinkas.jba.entity.User;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findByName(String name);

}

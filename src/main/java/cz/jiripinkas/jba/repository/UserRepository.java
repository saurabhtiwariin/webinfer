package cz.jiripinkas.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cz.jiripinkas.jba.entity.Role;
import cz.jiripinkas.jba.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User findByName(String name);

	List<User> findBySponser(User user);

	User findByEmail(String email);

	User findByPanNo(String panNo);
	
	List<User> findByEnabled(boolean b);

	@Query("Select a.roles from User a where a.id = ?1")
	List<Role> findRoles(int id);
}

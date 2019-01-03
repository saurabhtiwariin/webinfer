package cz.jiripinkas.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cz.jiripinkas.jba.entity.Transaction;
import cz.jiripinkas.jba.entity.User;

public interface TransactionRepository extends JpaRepository<Transaction, Integer>{

	List<Transaction> findByUser(User user);
	//Role findByName(String name);

	@Query("Select a from Transaction a where a.user = ?1 and a.remark = ?2")
	List<Transaction> findByUser(User userMe,String remark);

}

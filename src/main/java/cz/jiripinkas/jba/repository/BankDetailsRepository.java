package cz.jiripinkas.jba.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cz.jiripinkas.jba.entity.BankDetails;

public interface BankDetailsRepository extends
		JpaRepository<BankDetails, Integer> {

	// Role findByName(String name);
	@Transactional
	@Modifying
	@Query(value = "update BankDetails b set b.bankName = ?1 where b.id = ?2")
	int updateBankName(String name, Integer id);

}

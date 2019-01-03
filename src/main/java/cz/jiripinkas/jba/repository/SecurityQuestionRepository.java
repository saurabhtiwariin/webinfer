package cz.jiripinkas.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cz.jiripinkas.jba.entity.SecurityQuestion;

public interface SecurityQuestionRepository extends
		JpaRepository<SecurityQuestion, Integer> {

	List<SecurityQuestion> findAll();


}

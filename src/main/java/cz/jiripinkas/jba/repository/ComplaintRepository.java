package cz.jiripinkas.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cz.jiripinkas.jba.entity.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, Integer>{

	//Role findByName(String name);

}

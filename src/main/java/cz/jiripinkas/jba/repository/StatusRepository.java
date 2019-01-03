package cz.jiripinkas.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cz.jiripinkas.jba.entity.Status;

public interface StatusRepository extends JpaRepository<Status, Integer> {

	Status findByName(String string);

}

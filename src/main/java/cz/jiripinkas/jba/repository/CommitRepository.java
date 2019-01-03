package cz.jiripinkas.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cz.jiripinkas.jba.entity.Accept;
import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.Status;
import cz.jiripinkas.jba.entity.User;

public interface CommitRepository extends JpaRepository<Commit, Integer>{

	List<Commit> findByUser(User user);

	List<Commit> findByUser_IdAndStatus_Id(Integer integer, Integer integer2);

	@Query("Select a from Commit a where a.user = ?1 and a.status = ?2")
	List<Commit> findByUserAndStatus(User commitor, Status status);

	List<Commit> findByAccept(Accept accept);

	List<Commit> findAllByOrderByUserAsc();

/*	List<Commit> findAllBySortByUserAsc();*/


}

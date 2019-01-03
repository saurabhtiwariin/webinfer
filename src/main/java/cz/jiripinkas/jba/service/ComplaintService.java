package cz.jiripinkas.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.Complaint;
import cz.jiripinkas.jba.repository.ComplaintRepository;

@Service
@Transactional
public class ComplaintService {

	private static final Logger logger = Logger
			.getLogger(ComplaintService.class);

	@Autowired
	private ComplaintRepository complaintRepository;

	public List<Complaint> getTableData(int page) {
		// TODO Auto-generated method stub
		logger.info("inside getTableData service");
		return complaintRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id")).getContent();
	}

	public void updateComplaintTable(Complaint tmp) {
		logger.info("inside updateComplaintTable service");

		Integer idtmp = tmp.getId();
		Complaint complaint = complaintRepository.findOne(idtmp);
		complaint.setMessage(tmp.getMessage());
		complaint.setSubject(tmp.getSubject());
		complaint.setContactNo(tmp.getContactNo());
		complaint.setStatus(tmp.getStatus());
		complaint.setUser(tmp.getUser());

		complaintRepository.save(complaint);
	}

	public List<Complaint> findAll() {
		// TODO Auto-generated method stub
		return complaintRepository.findAll();
	}

	public Complaint save(Complaint tmp) {
		// TODO Auto-generated method stub
		return complaintRepository.saveAndFlush(tmp);
	}

}

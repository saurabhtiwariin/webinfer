package cz.jiripinkas.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cz.jiripinkas.jba.entity.OTP;

public interface OTPRepository extends JpaRepository<OTP, Integer> {

    OTP findByOtp(String otp);

}
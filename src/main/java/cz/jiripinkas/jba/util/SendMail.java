package cz.jiripinkas.jba.util;

import java.util.List;

import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SendMail {
	private String message;
	private String error;

	public SendMail(final String message) {
		super();
		this.message = message;
	}

	public SendMail(final String message, final String error) {
		super();
		this.message = message;
		this.error = error;
	}

	public SendMail(final List<FieldError> fieldErrors,
			final List<ObjectError> globalErrors) {
		super();
		final ObjectMapper mapper = new ObjectMapper();
		try {
			this.message = mapper.writeValueAsString(fieldErrors);
			this.error = mapper.writeValueAsString(globalErrors);
		} catch (final JsonProcessingException e) {
			this.message = "";
			this.error = "";
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(final String message) {
		this.message = message;
	}

	public String getError() {
		return error;
	}

	public void setError(final String error) {
		this.error = error;
	}

	/*public static void main(String[] args) {
		System.out.println(Math.log10(16)/Math.log10(2));
	}*/
}

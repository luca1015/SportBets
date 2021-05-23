package sportbets.proyecto.controller.exception;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import sportbets.proyecto.model.*;

@ControllerAdvice
@Slf4j
public class ExceptionManager {

	@ExceptionHandler(Exception.class)
	public ResponseEntity<Object> genericError(Exception e) {
		log.error("Error no especificado");
		return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<String> validationError(MethodArgumentNotValidException e) {
		final List<FieldError> errors = e.getBindingResult().getFieldErrors();

		final ValidationErrors validationErrors = new ValidationErrors();
		Map errores = new HashMap<>();
		for (final FieldError error : errors) {
			final ValidationErrors.ErrorCustom custom = new ValidationErrors.ErrorCustom();
			custom.setField(error.getField());
			custom.setMessage(error.getDefaultMessage());
			errores.put(error.getField(),error.getDefaultMessage());
			validationErrors.getErrors().add(custom);
		}
		log.error("Error : {}",validationErrors.toString());
		return new ResponseEntity<String>(errores.toString(), HttpStatus.INTERNAL_SERVER_ERROR);

	}
}

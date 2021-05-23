package sportbets.proyecto.model;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ValidationErrors {

	@Data
	@Builder
	@NoArgsConstructor
	@AllArgsConstructor
	public static class ErrorCustom {
		private String field;
		private String message;
	}

	private List<ErrorCustom> errors = new ArrayList<>();

}

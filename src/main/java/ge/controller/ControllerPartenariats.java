package ge.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import ge.model.ModelPartenariats;
import ge.repository.RepositoryPartenariats;
import ge.utils.ResponseHandler;

@RestController
@CrossOrigin(origins = { "*" }, maxAge = 4800, allowCredentials = "false")
public class ControllerPartenariats {

	private final RepositoryPartenariats repository;
	ResponseHandler responseHandler = new ResponseHandler();

	ControllerPartenariats(RepositoryPartenariats repository) {
		this.repository = repository;
	}

	@GetMapping("/allPartenariats")
	ResponseEntity<Object> all() {
		try {
			return responseHandler.generateResponse(HttpStatus.OK, repository.findAll());
		} catch (Exception e) {
			return responseHandler.generateResponse(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}

	@PostMapping("/addPartenariats")
	ResponseEntity<Object> add(@RequestBody ModelPartenariats model) {
		try {
			return responseHandler.generateResponse(HttpStatus.OK, repository.save(model));
		} catch (Exception e) {
			return responseHandler.generateResponse(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}

	@GetMapping("/onePartenariats/{id}")
	ResponseEntity<Object> one(@PathVariable Long id) {
		try {
			return responseHandler.generateResponse(HttpStatus.OK, repository.findById(id));
		} catch (Exception e) {
			return responseHandler.generateResponse(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}

	@GetMapping("/deletePartenariats/{id}")
	ResponseEntity<Object> delete(@PathVariable Long id) {
		try {
			repository.deleteById(id);
			return responseHandler.generateResponse(HttpStatus.OK, "");
		} catch (Exception e) {
			return responseHandler.generateResponse(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}
	
	@PostMapping("/updatePartenariats")
	ResponseEntity<Object> update(@RequestBody ModelPartenariats model) {
		try {
			return responseHandler.generateResponse(HttpStatus.OK,
					repository.findById(model.getIdPartenariats()).map(newModel -> {
						newModel.setNaturePartenariat(model.getNaturePartenariat());
						newModel.setLibellePartenariatCourte(model.getLibellePartenariatCourte());
						newModel.setLibellePartenariatLong(model.getLibellePartenariatLong());
						newModel.setDescription(model.getDescription());
						newModel.setDateDebutPartenariat(model.getDateDebutPartenariat());
						newModel.setDateFinPartenariat(model.getDateFinPartenariat());
						return responseHandler.generateResponse(HttpStatus.NOT_FOUND, repository.save(newModel));
					}));
		} catch (Exception e) {
			return responseHandler.generateResponse(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}

}

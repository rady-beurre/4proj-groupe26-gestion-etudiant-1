package ge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositoryProjet extends JpaRepository<ge.model.ModelProjet, Long> {

}

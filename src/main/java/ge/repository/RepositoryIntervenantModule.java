package ge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositoryIntervenantModule extends JpaRepository<ge.model.ModelIntervenantModule, Long> {

}

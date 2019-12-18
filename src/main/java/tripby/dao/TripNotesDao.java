package tripby.dao;

import java.util.List;
import tripby.domain.TripNotes;

public interface TripNotesDao {
  int insert(TripNotes tripNotes) throws Exception;
  List<TripNotes> findALl() throws Exception;
  TripNotes findBy(int tripNotesNo) throws Exception;
  TripNotes findWithFilesBy(int tripNotesNo) throws Exception;
  int update(TripNotes tripNotes) throws Exception;
  int delete(int tripNotesNo) throws Exception;
  int increaseViewCount(int tripNotesNo) throws Exception;
}

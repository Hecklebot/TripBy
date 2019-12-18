package tripby.dao;

import java.util.List;
import tripby.domain.TripNotesPic;

public interface TripNotesPicDao {
  int insert(TripNotesPic tripNotesPic) throws Exception;
  List<TripNotesPic> findAll(int tripNotesNo) throws Exception;
  int deleteAll(int trioNotesNo) throws Exception;
}

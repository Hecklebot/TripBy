package tripby.service;

import java.util.List;
import tripby.domain.TripNotes;

public interface TripNotesService {
  List<TripNotes> list() throws Exception;
  TripNotes get(int tripNotesNo) throws Exception;
  void insert(TripNotes tripNotes) throws Exception;
  void update(TripNotes tripNotes) throws Exception;
  void delete(int tripNotesNo) throws Exception;
  
  
  
  
  
}

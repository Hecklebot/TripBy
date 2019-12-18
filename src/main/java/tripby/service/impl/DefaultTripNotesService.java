package tripby.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tripby.dao.TripNotesDao;
import tripby.dao.TripNotesPicDao;
import tripby.domain.TripNotes;
import tripby.domain.TripNotesPic;
import tripby.service.TripNotesService;

@Service
public class DefaultTripNotesService implements TripNotesService {
  
  @Resource private TripNotesDao tripNotesDao;
  @Resource private TripNotesPicDao tripNotesPicDao;
  
  @Override
  public List<TripNotes> list() throws Exception {
    return tripNotesDao.findALl();
  }
  
  @Override
  public TripNotes get(int tripNotesNo) throws Exception {
    TripNotes tripNotes = tripNotesDao.findWithFilesBy(tripNotesNo);
    if(tripNotes == null) {
      throw new Exception("해당 번호의 데이터가 없습니다.");
    }
    tripNotesDao.increaseViewCount(tripNotesNo);
    return tripNotes;
  }
  
  @Transactional
  @Override
  public void insert(TripNotes tripNotes) throws Exception {
   if(tripNotes.getFiles().size() == 0) {
     throw new Exception ("사진 파일 없음");
   }
   tripNotesDao.insert(tripNotes);
   for(TripNotesPic file : tripNotes.getFiles()) {
     file.setTripNotesNo(tripNotes.getTripNotesNo());
     tripNotesPicDao.insert(file);
   }
  }
  
  @Transactional
  @Override
  public void update(TripNotes tripNotes) throws Exception {
    if(tripNotes.getFiles().size() == 0) {
      throw new Exception("사진 파일 없음");
    }
    
    tripNotesDao.update(tripNotes);
    tripNotesPicDao.deleteAll(tripNotes.getTripNotesNo());
    for(TripNotesPic file : tripNotes.getFiles()) {
      file.setTripNotesNo(tripNotes.getTripNotesNo());
      tripNotesPicDao.insert(file);
    }
  }
  
  @Transactional
  @Override
  public void delete(int tripNotesNo) throws Exception {
    if(tripNotesDao.findBy(tripNotesNo) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    tripNotesPicDao.deleteAll(tripNotesNo);
    tripNotesDao.delete(tripNotesNo);
  }

}

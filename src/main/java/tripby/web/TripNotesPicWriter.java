package tripby.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import tripby.domain.TripNotesPic;

@Component
public class TripNotesPicWriter {

  String uploadDir;

  public TripNotesPicWriter(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/tripNotes");
  }
  
  public List<TripNotesPic> getPhotoFiles(MultipartFile[] filePath) throws Exception {
   List<TripNotesPic> photoFiles = new ArrayList<>();
   for(MultipartFile file : filePath) {
     if(file.isEmpty())
       continue;
     String filename = UUID.randomUUID().toString();
     file.transferTo(new File(uploadDir + "/" + filename));
     TripNotesPic tripNotesPic = new TripNotesPic();
     tripNotesPic.setTripNotesPicName(filename);
     photoFiles.add(tripNotesPic);
   }
   return photoFiles;
  }
}

package tripby.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import lombok.Data;

@Data
public class TripNotes implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int tripNotesNo;
  private int tripPlanNo;
  private String tripNotesTitle;
  private String tripNotesContent;
  private Date tripNotesCreatedDate;
  private int tripNotesViewCount;
  private boolean publicStatus;
  private Date tripDay;
  private List<TripNotesPic> files;
  
  
  
  
  
}

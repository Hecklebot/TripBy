package tripby.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class TripNotesPic implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int tripNotesPicNo;
  private int tripNotesNo;
  private String tripNotesPicName;
  
}

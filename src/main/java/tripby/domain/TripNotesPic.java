package tripby.domain;

import java.io.Serializable;

public class TripNotesPic implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int tripNotesPicNo;
  private int tripNotesNo;
  private String tripNotesPicName;
  
  public int getTripNotesPicNo() {
    return tripNotesPicNo;
  }
  public void setTripNotesPicNo(int tripNotesPicNo) {
    this.tripNotesPicNo = tripNotesPicNo;
  }
  public int getTripNotesNo() {
    return tripNotesNo;
  }
  public void setTripNotesNo(int tripNotesNo) {
    this.tripNotesNo = tripNotesNo;
  }
  public String getTripNotesPicName() {
    return tripNotesPicName;
  }
  public void setTripNotesPicName(String tripNotesPicName) {
    this.tripNotesPicName = tripNotesPicName;
  }
  
 
  
}

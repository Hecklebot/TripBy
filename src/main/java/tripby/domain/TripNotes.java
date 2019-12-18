package tripby.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class TripNotes implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int tripNotesNo;
  private int tripPlanNo;
  private String tripNotesTitle;
  private String tripNotesContent;
  private Date tripNotesCreatedDate;
  private int tripNotesViewCount;
  private boolean publicStatus;
  private List<TripNotesPic> files;
  
  public int getTripNotesNo() {
    return tripNotesNo;
  }
  public void setTripNotesNo(int tripNotesNo) {
    this.tripNotesNo = tripNotesNo;
  }
  public int getTripPlanNo() {
    return tripPlanNo;
  }
  public void setTripPlanNo(int tripPlanNo) {
    this.tripPlanNo = tripPlanNo;
  }
  public String getTripNotesTitle() {
    return tripNotesTitle;
  }
  public void setTripNotesTitle(String tripNotesTitle) {
    this.tripNotesTitle = tripNotesTitle;
  }
  public String getTripNotesContent() {
    return tripNotesContent;
  }
  public void setTripNotesContent(String tripNotesContent) {
    this.tripNotesContent = tripNotesContent;
  }
  public Date getTripNotesCreatedDate() {
    return tripNotesCreatedDate;
  }
  public void setTripNotesCreatedDate(Date tripNotesCreatedDate) {
    this.tripNotesCreatedDate = tripNotesCreatedDate;
  }
  public int getTripNotesViewCount() {
    return tripNotesViewCount;
  }
  public void setTripNotesViewCount(int tripNotesViewCount) {
    this.tripNotesViewCount = tripNotesViewCount;
  }
  public boolean isPublicStatus() {
    return publicStatus;
  }
  public void setPublicStatus(boolean publicStatus) {
    this.publicStatus = publicStatus;
  }
  public List<TripNotesPic> getFiles() {
    return files;
  }
  public void setFiles(List<TripNotesPic> files) {
    this.files = files;
  }
  
  
}

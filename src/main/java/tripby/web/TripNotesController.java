package tripby.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import tripby.domain.TripNotes;
import tripby.service.TripNotesService;

@Controller
@RequestMapping("/tripnotes")
public class TripNotesController {

  @Resource private TripNotesPicWriter tripNotesPicWriter;
  @Resource private TripNotesService tripNotesService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(
      HttpServletRequest request,
      TripNotes tripNotes,
      MultipartFile[] filePath) throws Exception{
    tripNotes.setFiles(tripNotesPicWriter.getPhotoFiles(filePath));
    tripNotesService.insert(tripNotes);
    return "redirect:list";
  }
    
  @GetMapping("delete")
  public String delete(int tripNotesNo) throws Exception {
    tripNotesService.delete(tripNotesNo);
    
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int tripNotesNo) throws Exception {
    TripNotes tripNotes = tripNotesService.get(tripNotesNo);
    model.addAttribute("tripNotes", tripNotes);
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<TripNotes> tripNotes = tripNotesService.list();
    model.addAttribute("tripNotes", tripNotes);
  }
  
  @PostMapping("update")
  public String update(HttpServletRequest request,
      TripNotes tripNotes,
      MultipartFile[] filePath) throws Exception {
    tripNotes.setFiles(tripNotesPicWriter.getPhotoFiles(filePath));
    tripNotesService.update(tripNotes);
    
    return "redirect:list";
  }
  
}

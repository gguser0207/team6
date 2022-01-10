package dev.mvc.movie;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
  private int mno;
  private String title = "";
  private String director = "";
  private String act = "";
  private String plot = "";

  public int getMno() {
    return mno;
  }

  public void setMno(int mno) {
    this.mno = mno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public String getAct() {
    return act;
  }

  public void setAct(String act) {
    this.act = act;
  }

  public String getPlot() {
    return plot;
  }

  public void setPlot(String plot) {
    this.plot = plot;
  }

public String getContent() {
    // TODO Auto-generated method stub
    return null;
}

public void setContent(String content) {
    // TODO Auto-generated method stub
    
}

public long getSize1() {
    // TODO Auto-generated method stub
    return 0;
}

public void setSize1_label(String unit) {
    // TODO Auto-generated method stub
    
}

}







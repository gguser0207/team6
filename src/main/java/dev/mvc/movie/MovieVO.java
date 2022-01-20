package dev.mvc.movie;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	  private int mno;
	  private String title = "";
	  private String director = "";
	  private String actor = "";
	  private String plot = "";
	  private int score;
	  private String word = "";
	  private String file1 = "";
	  private String file1saved = "";
	  private String thumb1 = "";
	  private String passwd = "";
	  private long size2;
	  private String release = "";
	  private String price = "";
      private MultipartFile file1MF;


	/**
     * 파일 크기 단위 출력
     */
      private String size1_label;

    public MultipartFile getFile1MF() {
		return file1MF;
	}

	public void setFile1MF(MultipartFile file1mf) {
		file1MF = file1mf;
	}

	public String getSize1_label() {
		return size1_label;
	}
    public void setSize1_label(String size1_label) {
		this.size1_label = size1_label;
	}
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile1saved() {
		return file1saved;
	}

	public void setFile1saved(String file1saved) {
		this.file1saved = file1saved;
	}

	public String getThumb1() {
		return thumb1;
	}

	public long getSize2() {
		return size2;
	}

	public void setSize2(long size2) {
		this.size2 = size2;
	}

	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}

	public String getRelease() {
		return release;
	}

	public void setRelease(String release) {
		this.release = release;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
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

  public String getActor() {
    return actor;
  }

  public void setActor(String actor) {
    this.actor = actor;
  }

  public String getPasswd() {
	return passwd;
}

public void setPasswd(String passwd) {
	this.passwd = passwd;
}

public String getPlot() {
    return plot;
  }

  public void setPlot(String plot) {
    this.plot = plot;
  }

}







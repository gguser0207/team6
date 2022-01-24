package dev.mvc.movie;

import java.io.File;

public class Movie {
  /** 페이지당 출력할 레코드 갯수 */
  public static int RECORD_PER_PAGE = 7;
  
  /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
  public static int PAGE_PER_BLOCK = 5;

  /** 목록 파일명 */
  public static String LIST_FILE = "list_by_search_paging.do"; 
  

  // Windows, VMWare, AWS cloud 절대 경로 설정
  public static synchronized String getPath() {
      String path = "";
      if (File.separator.equals("\\")) {
          // System.out.println("Windows 10");
          // path = "C:/workspace/deploy/team6_v2sbm3c/movie/storage/";
          path = "C:/workspace/java_workspace/team6_v2sbm3c/src/main/resources/static/movie/images/";
      } else {
          System.out.println("Linux");
          path = "/home/ubuntu/deploy/team6_v2sbm3c/movie/storage/";
      }
      return path;
  }
}
 
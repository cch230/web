package model;

public class Root {
   private String id;
   private String pw;
   
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public Root(){
      super();
      
   }
   public Root(String id, String pw) {
      super();
      this.id = id;
      this.pw = pw;
   }
   @Override
   public String toString() {
      return " [id=" + id + ", pw=" + pw + "]";
   }
}

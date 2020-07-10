package test;

import ITS.*;
import java.util.*;

public class testPlatform {
  public testPlatform() {
  }

  public static void main(String[] args) {
    testPlatform testplatform = new testPlatform();

    Platform p = new Platform();
    Set arr_p = p.getAllPlatform();
    for( Iterator<Platform> i = arr_p.iterator(); i.hasNext();){
     System.out.println(i.next().getName());
   }
   p.setPlatformID(1);
   p.load();
   System.out.println(p.getName());
  }
}

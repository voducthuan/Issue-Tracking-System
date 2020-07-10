package test;

import ITS.*;
import java.util.*;

public class testDepartment {
  public testDepartment() {
  }

  public static void main(String[] args) {
    testDepartment testdepartment = new testDepartment();
    /*testdepartment.printArrDep();
    Department d = new Department();
    d.setDescription("dep5");
    d.add();
    testdepartment.printArrDep();*/
    Department d = new Department();
    User u = new User();
    u.setUserID(2);
    d.getUserDepartment(u);
    System.out.println(d.getDescription());

    d.setDepartmentID(1);
    Set uc = d.getUserList();
  }

  private void printArrDep()
  {
    System.out.println("---------------------------------");
    Department d = new Department();
    Set arr_d = d.getAllDepartment();
    for( Iterator<Department> i = arr_d.iterator(); i.hasNext();){
       System.out.println(i.next().getDescription());
     }
  }
}

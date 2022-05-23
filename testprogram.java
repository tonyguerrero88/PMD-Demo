public class Foo {
    private void foo() {
      for (String s : listOfStrings()) {
        s = s.trim(); // OK, when foreachReassign is "firstOnly" or "allow"
        doSomethingWith(s);
  
        s = s.toUpper(); // OK, when foreachReassign is "allow"
        doSomethingElseWith(s);
      }
  
      for (int i=0; i < 10; i++) {
        if (check(i)) {
          i++; // OK, when forReassign is "skip" or "allow"
        }
  
        i = 5;  // OK, when forReassign is "allow"
  
        doSomethingWith(i);
      }
    }
  }
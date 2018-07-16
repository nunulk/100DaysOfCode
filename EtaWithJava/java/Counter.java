package counter;

public class Counter {

  private int counter;

  public Counter() {}

  public void increment() {
    this.counter++;
  }

  public int getValue() {
  	return this.counter;
  }
}

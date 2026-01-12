class CounterRepository {
  int _value = 0;

  int increment(){
    _value++;
    return _value;
  }

  int decrement(){
    _value--;
    return _value;
  }
  
}
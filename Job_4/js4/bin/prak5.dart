void main(List<String> args) {
  var record = 'first' ,a:2, b:true ,'last';
  print(record);
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
  
}


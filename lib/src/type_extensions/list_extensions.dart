extension ListExtension on List {
  String charArrayToString() {
    assert(runtimeType == List<int>, "List must be of type List<int>");
    return String.fromCharCodes(this as List<int>);
  }
}

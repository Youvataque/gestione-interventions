
class ChantierData {
  String date;
  String uidi;
  String title;
  String com;
  List<String> task;
  List<bool> taskStatut;
  List<Map<String, String>> usersCom;
  ChantierData({
    this.date = "",
    this.uidi = "",
    this.title = "",
    this.com = "",
    this.task = const [],
    this.taskStatut = const [],
    this.usersCom = const [{"idClient" : "Commencement chantier"}],
  });
}
// A MODIFIER SELON LE BESOIN DE L'APPLICATION
class ActivityModel {
  String title;
  String lieu;

  ActivityModel({this.title, this.lieu});

  factory ActivityModel.fromJSON(Map<String, dynamic> json) {
    return ActivityModel(
      title: json["title"],
      lieu: json["lieu"],
    );
  }

  Map<String, dynamic> toJSON() {
    return {"title": title, "lieu": lieu};
  }
}

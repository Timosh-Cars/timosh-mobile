import 'self.dart';

class Links {
  List<Self> self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null)
      data['self'] = this.self.map((v) => v.toJson()).toList();

    return data;
  }
}
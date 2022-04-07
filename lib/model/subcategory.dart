class SubCategory {
  int? id;
  String? name;
  Null image;
  int? parent;

  SubCategory({this.id, required this.name, this.image, this.parent});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['parent'] = this.parent;
    return data;
  }
}

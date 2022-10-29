class FruitsModel {
  int? id;
  String fruitName;
  String quantity;

  FruitsModel({this.id, required this.fruitName, required this.quantity});

  FruitsModel fromJson(json) {
    return FruitsModel(
        id: json['id'],
        fruitName: json['fruitName'],
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'fruitName': fruitName, 'quantity': quantity};
  }
}

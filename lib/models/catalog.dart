class CatalogModel {
  static List<Item>? items;
}

class Item {
  final String id;
  final String name;
  final String desc;
  final int price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> mp) => Item(
        id: mp["id"],
        name: mp["name"],
        desc: mp["desc"],
        price: mp["price"],
        image: mp["image"],
      );

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}

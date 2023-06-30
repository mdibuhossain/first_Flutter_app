class CatalogModel {
  static final items = [
    Item(
      id: "1",
      name: "iPhone 13 Pro MAX",
      desc: "This is the most expensive phone in the world",
      price: 999.99,
      imageURL:
          "https://www.apple.com/v/iphone-14-pro/h/images/key-features/compare/compare_iphone_14_pro__dny32075a7ki_large.jpg",
    )
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final double price;
  final String imageURL;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.imageURL});
}

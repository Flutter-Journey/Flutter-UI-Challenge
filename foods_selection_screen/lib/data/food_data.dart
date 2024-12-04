class Item {
  final String image;
  final String title;
  final String description;
  final bool isBestSeller;
  final String price;

  Item(this.image, this.title, this.description, this.isBestSeller, this.price);
}

List<Item> items = [
  Item("assets/0002624_seafood-pesto_300.png", "Pizza Hải Sản Pesto Xanh",
      "Tôm, thanh cua, mực và bông cải xanh tươi ngon trên nền sốt Pesto Xanh", true, "169.000"),
  Item("assets/0002212_sf-cocktail-test_300.png", "Pizza Tôm Cocktail",
      "Tôm với nấm, dứa, cà chua và sốt Thousand Island.", false, "159.000"),
  Item("assets/0002211_tropical-sf-test_300.png", "Pizza Hải Sản Nhiệt Đới",
      "Tôm, nghêu, mực cua, dứa với sốt Thousand Island.", true, "159.000"),
  Item("assets/0002218_sup-deluxe_300.png", "Pizza Hải Sản Cao Cấp",
      "Tôm, cua, mực và nghêu với sốt Marinara.", false, "159.000"),
  Item("assets/0002219_meat-deluxe_300.png", "Pizza 5 Loại Thịt Đặc Biệt Và Rau Củ",
      "Xúc xích bò, giăm bông, thịt xông khói,...và cả thế giới rau phong phú.", true, "149.000"),
  Item("assets/0003536_aloha_300.png", "Pizza Aloha",
      "Thịt nguội, xúc xích và dứa hòa quyện với sốt Thousand Island.", false, "149.000"),
  Item("assets/0002221_bacon-sup_300.png", "Pizza Thịt Xông Khói",
      "Thịt giăm bông, thịt xông khói và hai loại rau của ớt xanh, cà chua.", false, "149.000"),
  Item("assets/0002222_ca-bacon_300.png", "Pizza Thịt Nguội Kiểu Canada",
      "Sự kết hợp giữa thịt nguội và bắp ngọt.", true, "149.000"),
  Item("assets/0002223_ck-trio_300.png", "Pizza Gà Nướng 3 Vị",
      "Gà nướng, gà bơ tỏi và gà ướp sốt nấm.", false, "149.000"),
  Item("assets/0002228_ck-caldo_300.png", "Pizza Gà Nướng Dứa", "Thịt gà mang vị ngọt của dứa.",
      false, "139.000"),
];

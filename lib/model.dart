class ItemData{
  String name;
  String image;
  String price;
  String time;
  ItemData({required this.name, required this.image, required this.price, required this.time});
}

class ItemsByDate{
  String date;
  List<ItemData> data;
  ItemsByDate({required this.date, required this.data});
}
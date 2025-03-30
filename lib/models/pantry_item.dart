class PantryItem {
  String name;
  DateTime purchaseDate;
  int shelfLifeDays;

  PantryItem({required this.name, required this.purchaseDate, required this.shelfLifeDays});

  int get daysLeft => shelfLifeDays - DateTime.now().difference(purchaseDate).inDays;
}

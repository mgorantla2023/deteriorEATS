import 'package:flutter/material.dart';
import '../models/pantry_item.dart';
import '../utils/constants.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PantryItem> _pantry = [];
  String _selectedFood = 'Apple';

  final Map<String, int> foodShelfLife = {
    'Apple': 14, 'Banana': 7, 'Milk': 10,
    'Bread': 5, 'Eggs': 21, 'Lettuce': 5, 'Tomato': 7,
  };

  void addItem() {
    setState(() {
      _pantry.add(
        PantryItem(
          name: _selectedFood,
          purchaseDate: DateTime.now(),
          shelfLifeDays: foodShelfLife[_selectedFood]!,
        ),
      );
    });
  }

  Color getItemColor(int daysLeft) {
    if (daysLeft <= 3) return AppColors.dangerRed;
    if (daysLeft <= 10) return AppColors.moderateYellow;
    return AppColors.safeGreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Digital Pantry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedFood,
                    items: foodShelfLife.keys
                        .map((food) => DropdownMenuItem(value: food, child: Text(food)))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedFood = val!),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Grocery Item',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: addItem, child: const Text('Add')),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: _pantry.isEmpty
                ? const Center(child: Text('Your pantry is empty!'))
                : ListView.builder(
              itemCount: _pantry.length,
              itemBuilder: (context, index) {
                final item = _pantry[index];
                final daysLeft = item.daysLeft;
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: getItemColor(daysLeft),
                    border: daysLeft <= 3 ? Border.all(color: Colors.red, width: 2) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text('Expires in $daysLeft days'),
                    trailing: Text(
                        'Bought: ${item.purchaseDate.month}/${item.purchaseDate.day}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

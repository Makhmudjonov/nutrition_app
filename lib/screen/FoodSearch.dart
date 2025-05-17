import 'package:flutter/material.dart';
import 'package:nutrition_app/screen/addFood.dart';

class FoodSearchScreen extends StatefulWidget {
  const FoodSearchScreen({super.key});

  @override
  _FoodSearchScreenState createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends State<FoodSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF), // Set the background color
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFF5FAFF), // Set the app bar color
      //   elevation: 0, // Remove shadow
      //   title: const Text(
      //     'Nonushta', // Title of the screen
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 18,
      //     ),
      //   ),
      //   centerTitle: false, // Align title to the left
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ), // Back button
      //     onPressed: () {
      //       Navigator.pop(context); // Navigate back
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ovqatni qidirish', // Placeholder text
                prefixIcon: const Icon(Icons.search), // Search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  borderSide: BorderSide.none, // Remove border
                ),
                filled: true,
                fillColor: Colors.white, // Background color of search bar
              ),
            ),
            const SizedBox(height: 20),
            // Tabs Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabButton(text: 'Hammasi', isSelected: true), // All tab
                  _buildTabButton(
                    text: 'Mening ovqatim',
                    isSelected: false,
                  ), // My food tab
                  _buildTabButton(text: 'Energiya sarfi', isSelected: false),
                  _buildTabButton(text: 'Diagramma', isSelected: false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Scanner buttons
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NutritionScreen();
                        },
                      ),
                    );
                  },
                  child: _buildScannerButton(
                    icon: Icons.camera_alt,
                    text: 'Ovqatni skanerlash',
                  ),
                ),
                const SizedBox(width: 12),
                _buildScannerButton(
                  icon: Icons.barcode_reader, // Use a package: barcode_widget
                  text: 'Shtrix-kodni skanerlash',
                ),
              ],
            ),
            const SizedBox(height: 20),
            // History Text
            const Text(
              'Tarix', // History title
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // History List
            Expanded(
              child: ListView(
                children: [
                  _buildHistoryItem(
                    name: 'Tuxum',
                    grams: '3 dona',
                    calories: '273 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Tovuq go\'shti',
                    grams: '1 porsiya',
                    calories: '273 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Oq non',
                    grams: '100 g',
                    calories: '243 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Qora qahva',
                    grams: '1 stakan',
                    calories: '74 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Guruch (pishirilgan)',
                    grams: '100 g',
                    calories: '243 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Choy',
                    grams: '1 stakan',
                    calories: '64 kal',
                  ),
                  _buildHistoryItem(
                    name: 'Guruch (pishirilgan)',
                    grams: '100 g',
                    calories: '243 kal',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab button widget
  Widget _buildTabButton({required String text, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color:
            isSelected
                ? Colors.blue
                : Colors.transparent, // активный tab - синий
        borderRadius: BorderRadius.circular(16), //закругленные края
      ),
      child: Text(
        text,
        style: TextStyle(
          color:
              isSelected
                  ? Colors.white
                  : Colors.black, // White для активного, черный для неактивного
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Scanner button widget
  Widget _buildScannerButton({required IconData icon, required String text}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.447,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white, // Белый фон
        borderRadius: BorderRadius.circular(12), // Закругленные края
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Тень
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // Смещение тени
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 40), // Синий значок
          const SizedBox(width: 8),
          SizedBox(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 12),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ],
      ),
    );
  }

  // History item widget
  Widget _buildHistoryItem({
    required String name,
    required String grams,
    required String calories,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  grams,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            calories,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12), // Add some space
          const Icon(Icons.add_circle, color: Colors.blue),
        ],
      ),
    );
  }
}

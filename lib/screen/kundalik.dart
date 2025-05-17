import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

// Helper class for meal items
class MealItem {
  final String name;
  final String grams;
  final int calories;

  MealItem({required this.name, required this.grams, required this.calories});
}

class KundalikScreen extends StatefulWidget {
  const KundalikScreen({super.key});

  @override
  _KundalikScreenState createState() => _KundalikScreenState();
}

class _KundalikScreenState extends State<KundalikScreen> {
  int _selectedIndex = 1; // Start at 'Dairy'
  final PageController _pageController = PageController(initialPage: 1);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300), // Add smooth transition
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF), // Set background color
      // appBar: _buildAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildNutritionPage(), // Nutrition Page
          _buildDairyPage(), // Dairy Page
        ],
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF5FAFF),
      elevation: 0,
      title: const Text(
        'Kundalik',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Handle menu
          },
        ),
      ],
    );
  }

  // Виджет для страницы "Питание"
  Widget _buildNutritionPage() {
    return const Center(
      child: Text('Nutrition Page Content'), // Replace with your actual content
    );
  }

  // Виджет для страницы "Дневник"
  Widget _buildDairyPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateNavigation(),
            const SizedBox(height: 16),
            _buildCalorieSummary(),
            const SizedBox(height: 24),
            _buildMealSection(
              title: 'Nonushta',
              icon: Icons.coffee,
              items: [
                MealItem(
                  name: 'Large Size Egg',
                  grams: '3 eggs',
                  calories: 273,
                ),
                MealItem(name: 'Chicken Breast', grams: '100 g', calories: 273),
                MealItem(name: 'Blueberries', grams: '100 g', calories: 92),
              ],
            ),
            const SizedBox(height: 16),
            _buildMealReminderSection(
              title: 'Lunch',
              icon: Icons.lunch_dining,
              reminder: 'Reminder to have Lunch',
            ),
            const SizedBox(height: 16),
            _buildMealReminderSection(
              title: 'Dinner',
              icon: Icons.dinner_dining,
              reminder: 'Reminder to have Dinner',
            ),
            const SizedBox(height: 16),
            _buildMealSection(title: 'Snacks', icon: Icons.fastfood, items: []),
          ],
        ),
      ),
    );
  }

  // Date Navigation Row
  Widget _buildDateNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            // Handle previous day
          },
        ),
        const Text(
          'Bugun',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 20),
          onPressed: () {
            // Handle next day
          },
        ),
      ],
    );
  }

  // Calorie Summary Card
  Widget _buildCalorieSummary() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light background
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Calorie left',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '75%', // Dynamic value
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], // Or a color indicating progress
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.75, // Dynamic value
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green[700]!),
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem(label: 'Goal', value: '1,750'),
              const Text('-', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildSummaryItem(label: 'Food', value: '1500'),
              const Text('+', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildSummaryItem(label: 'Exercise', value: '500'),
              const Text('=', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildSummaryItem(label: 'Remaining', value: '750'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for Calorie Summary items
  Widget _buildSummaryItem({required String label, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  // Meal Section Card
  Widget _buildMealSection({
    required String title,
    required IconData icon,
    required List<MealItem> items,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.orange[700]),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '0 of 500 Cal', // Dynamic value
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    // Handle add
                  },
                ),
              ],
            ),
            if (items.isNotEmpty) const Divider(height: 24),
            Column(
              children: items.map((item) => _buildMealItemRow(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Meal Item Row
  Widget _buildMealItemRow(MealItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  item.grams,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            '${item.calories} cals',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
    );
  }

  // Meal Reminder Section
  Widget _buildMealReminderSection({
    required String title,
    required IconData icon,
    required String reminder,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.orange[700]),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '0 of 500 Cal', // Dynamic
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    // Handle add
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(reminder, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

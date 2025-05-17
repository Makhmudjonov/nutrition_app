import 'package:flutter/material.dart';
import 'package:nutrition_app/screen/FoodSearch.dart';
import 'package:nutrition_app/screen/kundalik.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeCalories extends StatefulWidget {
  const HomeCalories({super.key});

  @override
  State<HomeCalories> createState() => _HomeCaloriesState();
}

class _HomeCaloriesState extends State<HomeCalories> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FAFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5FAFF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bugun",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage("assets/logo.png"), height: 20),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      body:
          selectedIndex == 0
              ? SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Kaloriya",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 50),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 117,
                              child: Image.asset("assets/1.png"),
                            ),
                            SizedBox(
                              height: 150,
                              child: Image.asset("assets/2.png"),
                            ),
                            Text(
                              "1500",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildEnergyItem(
                              title: "Iste'mol qilingan\nenergiya",
                              color: Colors.blue,
                              value: '1500',
                            ),
                            _buildEnergyItem(
                              title: "Sarflangan\nenergiya",
                              color: Colors.orange,
                              value: '300',
                            ),
                            _buildEnergyItem(
                              title: "Qoldiq\nenerdiya",
                              color: Colors.redAccent,
                              value: '30',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              // Top Row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _infoCard(
                                    Icons.water_drop,
                                    "64 . oz\nSuv iste’moli",
                                    Colors.blue,
                                  ),
                                  _infoCard(
                                    Icons.directions_walk,
                                    "7,550\nQadamlar soni",
                                    Colors.orange,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),

                              // Exercise Card
                              Container(
                                height: 135,
                                width: double.infinity,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    stops: [
                                      0.0,
                                      0.35,
                                    ], // 0% -> blue, 10% dan boshlab -> white
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(
                                        255,
                                        229,
                                        160,
                                        231,
                                      ), // pastki rang (light cyan)
                                      Color(0xFFffffff), // yuqori rang (white)
                                    ],
                                  ),
                                  // color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [Text("Exercise")]),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.fitness_center,
                                            color: Colors.red,
                                            size: 65,
                                          ),
                                          SizedBox(width: 25),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "30 daqiqa",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text("350 sarflangan energiya"),
                                            ],
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.add_circle,
                                            size: 40,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),

                              // Tana vazni card
                              Container(
                                height: 135,
                                width: double.infinity,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage("assets/1.png"),
                                      height: 65,
                                    ),
                                    SizedBox(width: 25),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "70 kg",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Tana vazni",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.add_circle,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),

                              // Ikki ustunli kartalar
                              GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                children: [
                                  _gridCard(
                                    "Recipes",
                                    "Cook, eat, log, repeat",
                                    Icons.restaurant_menu,
                                  ),
                                  _gridCard(
                                    "Workouts",
                                    "Sweating is self-care",
                                    Icons.fitness_center,
                                  ),
                                  _gridCard(
                                    "Friends",
                                    "Your support squad",
                                    Icons.people,
                                  ),
                                  _gridCard(
                                    "Community",
                                    "Food and fitness info",
                                    Icons.group,
                                  ),
                                  _gridCard(
                                    "Sync up!",
                                    "Connect 35+ health...",
                                    Icons.sync,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              : selectedIndex == 1
              ? KundalikScreen()
              : FoodSearchScreen(),
      bottomNavigationBar: SlidingClippedNavBar(
        inactiveColor: Color(0xFFBFC5FD),
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOutQuad,
          );
        },
        iconSize: 30,
        activeColor: Color(0xFF0066EE),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(icon: Icons.home, title: 'Bosh sahifa'),
          BarItem(icon: Icons.note, title: 'Qaydlar'),
          BarItem(icon: Icons.calculate, title: 'Hisobchi'),
          BarItem(icon: Icons.menu, title: 'Menyu'),
          // BarItem(icon: Icons.search_rounded, title: 'Search'),

          /// Add more BarItem if you want
        ],
      ),
    );
  }

  Widget _buildEnergyItem({
    required String title,
    required Color color,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 13)),
        SizedBox(height: 6),
        Row(
          children: [
            Container(width: 12, height: 12, color: color),
            SizedBox(width: 6),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _infoCard(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 6),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _gridCard(String title, String subtitle, IconData icon) {
    return Container(
      height: 106,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // soyaning rangi
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // pastga siljish
          ),
        ],

        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 6),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

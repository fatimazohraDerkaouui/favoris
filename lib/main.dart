import 'package:flutter/material.dart';

void main() {
  runApp(FoodFavoritesApp());
}

class FoodFavoritesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favoris',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: FavoritesPage(),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(
      type: 'Starter',
      title: 'Tom Yum Soup',
      description:
          'A famous Thai hot and sour soup made with ingredients like mushrooms, tomatoes, lemongrass, kaffir lime leaves, galangal, chili, and cilantro.',
      imageUrl: 'assets/images/tom_yum.jpg',
    ),
    FoodItem(
      type: 'Starter',
      title: 'Cesar Salad',
      description:
          'Made of grilled chicken, fresh greens, feta, olives, hummus, and Mediterranean flavors.',
      imageUrl: 'assets/images/cesar_salad.jpg',
    ),
    FoodItem(
      type: 'Main course',
      title: 'Grilled Steak Skewers',
      description:
          'Tender steak marinated in herbs and grilled to perfection on skewers, smoky and savory in every bite. 40 min!',
      imageUrl: 'assets/images/steak.jpg',
    ),
    FoodItem(
      type: 'Dessert',
      title: 'Mini Lemon Cheesecakes',
      description:
          'Creamy lemon cheesecake on a crunchy graham cracker crust, perfectly tangy and sweet in every bite. Ideal for any occasion!',
      imageUrl: 'assets/images/mini_cheesecake.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Favoris',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return FoodCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 28),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String type;
  final String title;
  final String description;
  final String imageUrl;

  FoodItem({
    required this.type,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              item.imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.type,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.star_border, size: 18, color: Colors.orange),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.edit, size: 18, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.close, size: 18, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

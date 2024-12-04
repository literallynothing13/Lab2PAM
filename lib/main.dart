import 'package:flutter/material.dart';

void main() {
  runApp(DrinkStoreApp());
}

class DrinkStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drink Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WineScreen(),
    );
  }
}

class WineScreen extends StatelessWidget {
  // Lista de vinuri cu imagini și prețuri
  final List<Map<String, String>> wines = [
    {
      'name': 'Ozone Rosso',
      'image': 'assets/images/OzoneRosso.png',
      'price': '\$15.99',
    },
    {
      'name': 'Chablis 2018',
      'image': 'assets/images/Chablis2018.png',
      'price': '\$23.50',
    },
    {
      'name': 'Pinot Noir',
      'image': 'assets/images/PinotNoir.png',
      'price': '\$19.99',
    },
    {
      'name': 'Rosé Sparkling',
      'image': 'assets/images/RoseSparkling.png',
      'price': '\$12.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink Store'),
        actions: [
          // Pictograma notificărilor
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Aici poți adăuga o acțiune pentru notificări
              print("Notificări apăsate");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar sub AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search wines...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Lista de vinuri
          Expanded(
            child: ListView.builder(
              itemCount: wines.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                        wines[index]['image']!), // Afișează imaginea vinului
                    title: Text(wines[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(wines[index]['price']!),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Aici poți adăuga o acțiune pentru favorite
                        print("${wines[index]['name']} favorizat");
                      },
                    ),
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

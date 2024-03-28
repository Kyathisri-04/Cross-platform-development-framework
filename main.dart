import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/horizontal_view.dart';
import 'components/products.dart';
import 'package:projectfinal/pages/cart.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: [
        'images/products/hyd.jpeg',
        'images/products/banglore.jpeg',
        'images/products/delhi.jpeg',
        'images/products/dhera.jpeg',
        'images/products/sriranganadth.jpeg',
      ].map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset(item, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );

    Widget radioButtons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.blue : Colors.grey,
            ),

          ),
        );
      }),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.green,
        title: Text('TRAVEL MATE✈️ ENJOY THE JOURNEY WITH US AROUND THE INDIA🛫'),
        actions: [



        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Kyathisri'),
              accountEmail: Text('Kyathisri@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.green),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.green),
              ),
            ),


            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.green
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.green),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Assuming imageCarousel is a built widget
          imageCarousel,

          // Assuming radioButtons is another widget
          radioButtons,

          // Add padding if needed (adjust EdgeInsets values)
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Text('Categories'),
          ),
          HorizontalList(),
          Padding(padding: const EdgeInsets.all(20.0),
          child: Text('Recent Intems'),),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),

    );
  }
}

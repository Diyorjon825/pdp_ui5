import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Hotel> hotels = [
  Hotel('Hotel 1', 'assets/images/ic_hotel1.jpg'),
  Hotel('Hotel 2', 'assets/images/ic_hotel2.jpg'),
  Hotel('Hotel 3', 'assets/images/ic_hotel3.jpg'),
  Hotel('Hotel 4', 'assets/images/ic_hotel4.jpg'),
  Hotel('Hotel 5', 'assets/images/ic_hotel5.jpg'),
];

class Hotel {
  String name, image;
  Hotel(this.name, this.image);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headWidget(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Business Hotels',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: hotels
                          .map((element) => hotestScroll(element))
                          .toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hotestScroll(Hotel hotel) {
    return AspectRatio(
      aspectRatio: 0.96 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(hotel.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hotel.name,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headWidget() {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/ic_header.jpg'),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Best Hotels Ever',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 30,
              ),
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for hotels...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

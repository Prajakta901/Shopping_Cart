import 'package:Katty/profile.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'CartPg.dart';
import 'explore.dart';
import 'detail.dart' as detail_page;
import 'login.dart';


class HomePg extends StatefulWidget {
  const HomePg({super.key, required this.thng});
  final List<din> thng;

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
    int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: PreferredSize(
  preferredSize: Size.fromHeight(100.0), // Set your custom height
  child: AppBar(
    backgroundColor: Color(0xFFE3F2FD), // Soft pastel blue
    title: Text('Home Page', style: TextStyle(color: Colors.black)),
    actions: [
      IconButton(
        icon: Icon(Icons.account_circle, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => profile()),
          );
        },
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    ),
  ),
),
              // SizedBox(height: 20),
              // Container(
              //   height: 40,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       prefixIcon: Icon(Icons.search),
              //       border: InputBorder.none,
              //       contentPadding: EdgeInsets.symmetric(vertical: 10),
              //     ),
              //   ),
           
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'lib/h.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15,left: 8.0, right: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.thng.map((itm) {
                  return Container(
                    color: const Color.fromARGB(179, 255, 255, 255),
                    width: 400,
                    height: 650,
                    margin: EdgeInsets.all(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itm.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detail_page.DetailScreen(
                                  detail: detail_page.Detail(
                                    itm.name,
                                    itm.img,
                                    itm.des,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: itm.img,
                            child: Image.asset(
                              itm.img,
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(itm.des, style: TextStyle(fontSize: 16)),
                        GestureDetector(
                          onTap: () {
                            cartItm.add(itm);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartPg()),
                            );
                          },
                          child: Container(
                            color: Colors.amber,
                            child: Text(
                              "Buy now",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 3, 19, 57),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPg()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParallaxRecipe()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => profile()),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

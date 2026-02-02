import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.detail});
  final Detail detail;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                    
                     Container(
                      width: 900,
                      height: 500,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.detail.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  
                  
               

                  Container(
                    width: 900,
                    height: 460,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(212, 10, 1, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.detail.name + '\n' + widget.detail.des,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail {
  final String name;
  final String img;
  final String des;
  // int quantity;

  Detail(this.name, this.img, this.des);
}

final List<Detail> cartItm = [
  Detail("Pizza", "lib/asset/aa.jpeg", "Delicious cheese pizza"),
  Detail("Burger", "lib/asset/bb.jpeg", "Juicy  burger"),
  Detail("Pasta", "lib/asset/cc.jpeg", "Italian pasta with sauce"),
  Detail("Nashta", "lib/asset/dd.jpeg", "Italian pasta with sauce"),
  Detail("Dhokla", "lib/asset/ee.jpeg", "Italian pasta with sauce"),
  Detail("Kadhi", "lib/asset/ff.jpeg", "Italian pasta with sauce"),
  Detail("Mango", "lib/asset/ii.jpeg", "Italian pasta with sauce"),
  Detail("Strawberry", "lib/asset/jj.jpeg", "Italian pasta with sauce"),
];

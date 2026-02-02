import 'package:flutter/material.dart';

import 'main.dart';

class CartPg extends StatefulWidget {
  const CartPg({super.key});

  @override
  State<CartPg> createState() => _CartPgState();
}

int quantity = 1;

class _CartPgState extends State<CartPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: SingleChildScrollView(
        child: Column(
          children: cartItm.map((item) {
            return Dismissible(
              key: Key(item.name),
              onDismissed: (direction) {
                setState(() {
                  cartItm.remove(item);
                });
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Image.asset(item.img, width: 50, height: 50),
                title: Text(item.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (item.quantity > 1) {
                            item.quantity--;
                          }
                        });
                      },
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          
        ),
      ),
    );
  }
}

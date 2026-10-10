import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CartPg extends StatefulWidget {
  const CartPg({super.key});





  @override
  State<CartPg> createState() => _CartPgState();
}

int quantity = 1;

class _CartPgState extends State<CartPg> {
  Future<void> _placeOrder(BuildContext context) async {
    if (cartItm.isEmpty) return;

    final orderedItems = List.from(cartItm);

    final orderData = {
      'userId': FirebaseAuth.instance.currentUser?.uid ?? 'guest',
      'items': cartItm.map((item) => {
        'name': item.name,
        'img': item.img,
        'quantity': item.quantity,
      }).toList(),
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance.collection('orders').add(orderData);

    setState(() {
      cartItm.clear();
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Order Placed!'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: orderedItems.map((item) {
              return ListTile(
                leading: Image.asset(item.img, width: 50, height: 50),
                title: Text(item.name),
                trailing: Text('x${item.quantity}'),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cartItm.map((item) {
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _placeOrder(context),
                child: Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
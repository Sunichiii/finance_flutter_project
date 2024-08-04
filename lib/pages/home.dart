import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import '../widgets/credit_card.dart';
import '../widgets/transaction_list.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 80, 98),
      body : SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome back!",
                        style: TextStyle(color: Colors.white),),
                      Text("Antonio Von",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),)
                    ],
                  ),
                  const Spacer(),
                  IconButton.outlined(onPressed: () {},

                      icon: const Icon(Icons.notifications, color: Colors.white,)),
                ],
              ),
            ),
            Expanded(child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 167),
                  color: Colors.white,
                  child: const Column(
                    children: [
                      SizedBox(height: 110),

                      //actions button
                      ActionButtons(),
                      const SizedBox(height: 30,),
                      //transaction list
                      TransactionList()
                    ],
                  ),
                ),
                const Positioned(
                    top: 20,
                    right: 25,
                    left: 25,
                    child: CreditCard())
              ],
            ))
          ],
        ),
      ),

    );
  }
}


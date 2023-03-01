import 'package:flutter/material.dart';
import 'package:voom_task/Shared/Lists.dart';
import 'package:voom_task/Shared/MyAuctionItems.dart';

class MyAuctionScreen extends StatefulWidget {
  const MyAuctionScreen({super.key});

  @override
  State<MyAuctionScreen> createState() => _MyAuctionScreenState();
}

class _MyAuctionScreenState extends State<MyAuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 225),
      appBar: AppBar(
        title: Text("Your Auctions"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: SingleChildScrollView(
          // reverse: true,
          child: Column(children: myAuction),
        ),
      ),
    );
  }
}

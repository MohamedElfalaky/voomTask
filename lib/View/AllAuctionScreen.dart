import 'package:flutter/material.dart';

class AllAuctionScreen extends StatefulWidget {
  const AllAuctionScreen({super.key});

  @override
  State<AllAuctionScreen> createState() => _AllAuctionScreenState();
}

class _AllAuctionScreenState extends State<AllAuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Auctions"),
      ),
    );
  }
}

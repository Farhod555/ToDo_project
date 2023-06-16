import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String name;
  DetailPage({required this.name, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
        title: Text(widget.name, style: TextStyle(color: Colors.black),),
      ),
    );
  }
}

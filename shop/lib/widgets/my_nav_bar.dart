// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
    List<IconData> data = [
      Icons.home_outlined,
      Icons.search,
      Icons.add_box_outlined,
      Icons.favorite_outline_sharp,
      Icons.person_outline_sharp
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: 35,
                  decoration: BoxDecoration(
                    border: i == selectedIndex
                        ? Border(
                            top: BorderSide(width: 3.0, color: Colors.white))
                        : null,
                    gradient: i == selectedIndex
                        ? LinearGradient(
                            colors: [Colors.grey.shade800, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        : null,
                  ),
                  child: Icon(
                    data[i],
                    size: 35,
                    color: i == selectedIndex
                        ? Colors.white
                        : Colors.grey.shade800,
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

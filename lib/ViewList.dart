import 'dart:math';

import 'package:flutter/material.dart';

class ViewList extends StatefulWidget {
  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  final List<Friend> myFriends = [//list
    Friend(name: 'Dandy', color: 0xff738f66),
    Friend(name: 'Lucifer', color: 0xff5e5e5e),
    Friend(name: 'Chloe', color: 0xffff9190),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 2,
        centerTitle: false,
        leading: null,
        title: Text('Looping dan List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.color_lens),
        onPressed: () {
          myFriends.forEach((friend) {//looping(foreach)
            friend.color = (Random().nextDouble() * 0xFFFFFFFF).toInt();
          });
          setState(() {});
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Klik pada tombol untuk mengubah warna latar belakang'),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: myFriends.length,
              itemBuilder: (context, int index) {
                return Container(
                  color: Color(myFriends[index].color),
                  child: ListTile(
                    title: Text(
                      myFriends[index].name,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Friend {
  String name;
  int color;

  Friend({this.name, this.color});
}
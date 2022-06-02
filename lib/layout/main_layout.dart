import 'package:flutter/material.dart';
import 'package:howon_project/component/main_drawer.dart';
import 'package:howon_project/const/colors.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const MainLayout({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('호원대학교 시설 예약 프로그램'),
        centerTitle: true,
        elevation: 0.0,
        //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        backgroundColor: PRIMARY_COLOR,
      ),
      drawer: MainDrawer(),
      body: body,
    );
  }
}

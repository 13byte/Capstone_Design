import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/screen/library_placement1.dart';
import 'package:howon_project/screen/reservation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);vv
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'title',
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 24),
                    child: RichText(
                        text: TextSpan(
                      text: '정택현',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ' 님 반갑습니다.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    )),
                    //Text('김명준 님 반갑습니다.', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                physics: new NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(2.0),
                crossAxisCount: 2,
                //childAspectRatio: (itemWidth / itemHeight),
                children: [
                  _buttonBox(
                      text: '좌석배정',
                      iconData: Icons.chair_alt_outlined,
                      onTap: GoLibrary1),
                  _buttonBox(
                      text: '배정/\n예약현황', iconData: Icons.receipt_outlined),
                  _buttonBox(
                      text: '시설예약',
                      iconData: Icons.today_outlined,
                      onTap: GoReservationScreen1),
                  //_buttonBox(text: '알림'),
                  _buttonBox(text: '졸업시뮬', iconData: Icons.school_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void GoReservationScreen1() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ReservationScreen();
        },
      ),
    );
  }

  void GoLibrary1() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LibraryPlacement1();
        },
      ),
    );
  }
}

class _buttonBox extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final IconData? iconData;

  const _buttonBox({
    required this.text,
    this.onTap,
    this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1.0),
        ),
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              iconData != null ? Icon(iconData, size: 50.0) : SizedBox.shrink(),
              SizedBox(width: 8.0),
              Text(
                '$text',
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/screen/library_placement1.dart';
import 'package:howon_project/screen/reservation_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: PRIMARY_COLOR,

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // 현재 계정 이미지 set
                //backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('정택현 '),
              accountEmail: Text('11615032'),
              decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('도서관 예약'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryPlacement1()

                  )
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('운동장 예약'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationScreen()

                    )
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('체육관 예약'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationScreen()

                    )
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('고객 센터'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageView4()

                    )
                );
              },
            ),
          ],
        ),
      );
  }
}
class PageView1 extends StatelessWidget {
  const PageView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서관 에약'),
      ),
    );
  }
}
class PageView2 extends StatelessWidget {
  const PageView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('운동장 예약'),
      ),
    );
  }
}
class PageView3 extends StatelessWidget {
  const PageView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체육관 예약'),
      ),
    );
  }
}
class PageView4 extends StatelessWidget {
  const PageView4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고객 센터'),
      ),
    );
  }
}

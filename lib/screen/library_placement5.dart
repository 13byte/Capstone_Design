import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:howon_project/component/assignment_bottom_sheet.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/screen/home_screen.dart';
import 'package:time_pickerr/time_pickerr.dart';

class LibraryPlacement5 extends StatefulWidget {
  const LibraryPlacement5({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement5> createState() => _LibraryPlacement5State();
}

class _LibraryPlacement5State extends State<LibraryPlacement5> {
  var list = new List<String>.generate(50, (i) => (i + 1).toString());
  var list2 = new List<String>.generate(50, (i) => (i < 15 ? 0 : 1).toString())
    ..shuffle();
  //var list3 = new Map<String, String>();

  @override
  Widget build(BuildContext context) {
    var list3 = Map<String, String>.fromIterables(list, list2);
    return MainLayout(
      title: 'title',
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _TopBanner0(),
                  _TopBanner1(),

                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen()),
                                (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          '메인으로 넘어가기',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBanner0 extends StatelessWidget {
  const _TopBanner0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                '예약 완료',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            Text(
              '좌석 번호 : 12',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '예약 날짜 : 2022 . 04 . 20',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '시작 시간 : 16:00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '종료 시간 : 18:00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '총 시간     : 02시간 00분',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBanner1 extends StatelessWidget {
  const _TopBanner1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Text('안내사항'),
            Text('※사용시간은 1회 최대 4시간입니다.'),
            SizedBox(height: 16),
            Text('※사용이 끝나면 다른사람을 배려해 퇴실처리를 해 주시기 바랍니다.'),
          ],
        ),
      ),
    );
  }
}

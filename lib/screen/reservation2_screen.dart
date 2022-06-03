import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/screen/reservation3_screen.dart';

class Reservation2Screen extends StatefulWidget {
  const Reservation2Screen({Key? key}) : super(key: key);

  @override
  State<Reservation2Screen> createState() => _Reservation2ScreenState();
}

class _Reservation2ScreenState extends State<Reservation2Screen> {
  List data = [
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "title",
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TopBanner1(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  DataTable(
                    //columnSpacing: 10,
                    headingRowHeight: 32.0,
                    headingRowColor: MaterialStateColor.resolveWith(
                            (states) => PRIMARY_COLOR),
                    columns: [
                      DataColumn(
                        label: _label(
                          data: '시간',
                        ),
                      ),
                      DataColumn(
                        label: _label(
                          data: '예약현황',
                        ),
                      ),
                    ],
                    rows: data.asMap().entries.map((entry) {
                      final index = entry.key;
                      final value = entry.value;
                      return DataRow(
                        cells: [
                          DataCell(
                            Center(
                                child: Text(
                                  '${(6 + index ~/ 2).toString().padLeft(2, '0')} : ${(index % 2 * 30).toString().padLeft(2, '0')}',
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '${value}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              onPressed(index);
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: PRIMARY_COLOR,
                  ),
                  onPressed: () {},
                  child: Text('예약')),
            ),
          ],
        ),
      ),
    );
  }

  onPressed(selected) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0.0,
          //contentPadding: EdgeInsets.zero,
          title: new Text("※ 배정정보"),
          content: new Text(
              "좌석 번호 : 12\n"
                  "배정 날짜 : 2022 . 04 . 20\n"
                  "시작 시간 : 16 : 00\n"
                  "종료 시간 : 18 : 00\n"
                  "총 시간     : 02시간 00분"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "뒤로가기",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text(
                "예약하기",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Reservation3Screen();
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _label extends StatelessWidget {
  final String data;

  const _label({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          children: [
            Icon(Icons.menu_book_outlined, color: PRIMARY_COLOR),
            SizedBox(width: 16.0),
            Text(
              '시설예약',
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 24.0),
              //textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

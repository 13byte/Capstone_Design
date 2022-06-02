import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:howon_project/component/assignment_bottom_sheet.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/main.dart';
import 'package:howon_project/screen/library_placement5.dart';
//import 'package:time_pickerr/time_pickerr.dart';
import 'package:howon_project/component/time_picker.dart';

class LibraryPlacement4 extends StatefulWidget {
  const LibraryPlacement4({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement4> createState() => _LibraryPlacement4State();
}

class _LibraryPlacement4State extends State<LibraryPlacement4> {
  var list = new List<String>.generate(50, (i) => (i + 1).toString());
  var list2 = new List<String>.generate(50, (i) => (i < 15 ? 0 : 1).toString())
    ..shuffle();

  //var list3 = new Map<String, String>();

  @override
  Widget build(BuildContext context) {
    var list3 = Map<String, String>.fromIterables(list, list2);
    //print(list3);

    final box = Hive.box(testBox);
    // 데이터를 생성하거나
    // 업데이트할때
    box.put('readingroom_datetime', DateTime(1, 1, 1, 04, 00));
    print('keys : ${box.keys.toList()}');
    print('values : ${box.values.toList()}');

    return MainLayout(
      title: 'title',
      body: SafeArea(
        child: Container(
          color: Colors.lightGreen[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TopBanner1(),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(height: 1.0, width: 500.0, color: Colors.grey),
              ),

              /*Row(
                children: [
                  Text(
                    '${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일',
                  ),
                  Text(
                      '${DateTime.now().toUtc().add(Duration(hours: 12)).hour}:${DateTime.now().minute}:${DateTime.now().second}'),
                ],
              ),*/
              /*Container(
                //color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      '총좌석 40 사용중 25 사용가능 15',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),*/
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 16,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightGreen[200],
                        border:
                            Border.all(color: Colors.lightGreen, width: 2.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('배정가능좌석'),
                    SizedBox(width: 8),
                    Container(
                      width: 16,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[400],
                        border: Border.all(color: Colors.grey, width: 2.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('사용중'),
                    SizedBox(width: 8),
                    Container(
                      width: 16,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black38,
                        border: Border.all(color: Colors.black38, width: 2.0),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('사용불가'),
                    //Text('장애인석'),
                    //Text('수리중'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          _TimeTable(seatList: list3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: Text('좌석배치도 보기'),
              ),
              SizedBox(height: 8),
              //ElevatedButton(onPressed: () {}, child: Text('좌석배정')),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeTable extends StatelessWidget {
  final Map<String, String> seatList;
  //final List<String> reservList;

  const _TimeTable({
    required this.seatList,
    //required this.reservList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(testBox);
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 2;

    return GridView.count(
      shrinkWrap: true,
      primary: false,
      physics: new NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2.0),
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      crossAxisCount: 5,
      childAspectRatio: (itemWidth / itemHeight),
      children: seatList.entries
          .map(
            (a) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  showDialog<void>(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        elevation: 0.0,
                        //contentPadding: EdgeInsets.zero,
                        title: new Text("※ 배정정보"),
                        content: new Text(
                            "좌석 번호 : ${a.key}\n배정 날짜 : ${DateTime.now().year} . ${DateTime.now().month.toString().padLeft(2, '0')} "
                                ". ${DateTime.now().day.toString().padLeft(2, '0')}\n시작 시간 : ${DateTime.now().hour.toString().padLeft(2, '0')} "
                                ": ${DateTime.now().minute.toString().padLeft(2, '0')}\n종료 시간 : ${DateTime.now().add(new Duration(hours: box.get('readingroom_datetime').hour, minutes: box.get('readingroom_datetime').minute)).hour.toString().padLeft(2, '0')} "
                                ": ${(DateTime.now().add(new Duration(hours: box.get('readingroom_datetime').hour, minutes: box.get('readingroom_datetime').minute)).minute).toString().padLeft(2, '0')}\n총 시간     :"
                                " ${box.get('readingroom_datetime').hour.toString().padLeft(2, '0')}시간 ${box.get('readingroom_datetime').minute.toString().padLeft(2, '0')}분"),
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
                                    return LibraryPlacement5();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: _time(
                  text: '${a.key}',
                  isReserved: a.value == '1' ? true : false,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _time extends StatelessWidget {
  final String text;
  final bool isReserved;
  final Color? color = Colors.lightGreen[200];
  _time({
    required this.text,
    required this.isReserved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isReserved ? Colors.grey[400] : color,
        border: Border.all(
            color: isReserved ? Colors.grey : Colors.lightGreen, width: 2.0),
      ),
      height: 50.0,
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

class _TopBanner1 extends StatefulWidget {
  const _TopBanner1({Key? key}) : super(key: key);

  @override
  State<_TopBanner1> createState() => _TopBanner1State();
}

class _TopBanner1State extends State<_TopBanner1> {
  final box = Hive.box(testBox);

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
            Text(
              '안내사항',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
            Text('※사용시간은 1회 최대 4시간입니다.'),
            Text('※사용이 끝나면 다른사람을 배려해 퇴실처리를 해 주시기 바랍니다.'),
            Container(
              //height: 70,
              child: ValueListenableBuilder<Box>(
                valueListenable: Hive.box(testBox).listenable(),
                builder: (context, box, widget) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onPressed,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('사용 시간', style: TextStyle(fontSize: 20.0),),
                                  ),
                                  //SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                      //padding: EdgeInsets.all(5),
                                      width: double.infinity,
                                      child: Text(
                                          '${box.get('readingroom_datetime').hour} : ${box.get('readingroom_datetime').minute.toString().padLeft(2, '0')}', style: TextStyle(fontSize: 24.0),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  );
                },
              ),
            ),
            /*Container(
              height: 70,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text('asdf'),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  onPressed() {
    final box = Hive.box(testBox);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomHourPicker(
          title: '시간을 선택하세요',
          elevation: 2,
          date: box.get('readingroom_datetime'),
          onPositivePressed: (context, time) {
            //print('onPositive : ${context}, ${time}, ${time.hour}, ${time.minute}');
            print('hour : ${time.hour}, minute : ${time.minute}');
            Navigator.of(context).pop();

            // 데이터를 생성하거나
            // 업데이트할때
            box.put('readingroom_datetime', time);
            print('keys : ${box.keys.toList()}');
            print('values : ${box.values.toList()}');
          },
          onNegativePressed: (context) {
            print('onNegative');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

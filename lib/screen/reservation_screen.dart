import 'package:flutter/material.dart';
import 'package:howon_project/component/calendar.dart';
import 'package:howon_project/component/reservation_banner.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/screen/reservation2_screen.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "title",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ReservationBanner(),
              Calendar(
                  selectedDay: selectedDay,
                  focusedDay: focusedDay,
                  onDaySelected: onDaySelected),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('선택한 날짜 : ${selectedDay.month}월 ${selectedDay.day}일'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Reservation2Screen();
                            },
                          )
                      );
                    },
                    child: Text('예약하기'),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text('notice', style: TextStyle(color: PRIMARY_COLOR),),
                            SizedBox(width: 16.0),
                            Text('[호원대학교] - 4월 10일 개학'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text('event', style: TextStyle(color: Colors.orange),),
                            SizedBox(width: 20.0),
                            Text('[호원대학교] - 학점차이자 등록금 환불 이벤트'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

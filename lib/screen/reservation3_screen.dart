import 'package:flutter/material.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/screen/home_screen.dart';

class Reservation3Screen extends StatelessWidget {
  const Reservation3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()),
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
            //Text('좌석 번호 : 12', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              '예약 날짜 : 2022 . 04 . 20',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '대여 시간 : 16:00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '반납 시간 : 18:00',
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
            Text('※부득이한 사정이 생길경우 다른 사용자를 위해 빠른 시간내에 "예약취소"를 해주시기 바랍니다.'),
            SizedBox(height: 16),
            Text('※예약취소를 하지 않은 채 비참여가 빈번할 경우 예약 시스템 사용이 불가할  수도 있습니다.'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/main.dart';
import 'package:howon_project/screen/library_placement2.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryPlacement1 extends StatefulWidget {
  const LibraryPlacement1({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement1> createState() => _LibraryPlacement1State();
}

class _LibraryPlacement1State extends State<LibraryPlacement1> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'title',
      body: SafeArea(
        child: Column(
          children: [
            _TopBanner1(),
            _Bottom(),
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          children: [
            Icon(Icons.menu_book_outlined, color: PRIMARY_COLOR),
            SizedBox(width: 16.0),
            Text(
              '좌석배정',
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 24.0),
              //textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Button(text: '인당도서관', selected: 'library1'),
            _Button(text: '반계관', selected: 'library2'),
            _Button(text: '연암관', selected: 'library3'),
            _Button(text: '다산관', selected: 'library4'),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final String selected;

  const _Button({
    required this.text,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          final box = Hive.box(testBox);

          // 데이터를 생성하거나
          // 업데이트할때
          box.put('selectedLibrary', selected);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return LibraryPlacement2();
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 32.0),
          ),
        ),
        style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
      ),
    );
  }
}

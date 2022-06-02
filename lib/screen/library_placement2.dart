import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/layout/main_layout.dart';
import 'package:howon_project/main.dart';
import 'package:howon_project/screen/library_placement4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryPlacement2 extends StatefulWidget {
  const LibraryPlacement2({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement2> createState() => _LibraryPlacement2State();
}

class _LibraryPlacement2State extends State<LibraryPlacement2> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'title',
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TopBanner1(),
            Flexible(
              child: StreamBuilder(
                stream:
                    //파이어베이스의 db안의 컬렉션 주소
                    //micro.com - wire structure
                    FirebaseFirestore.instance
                        .collection('library/library1/reading_rooms')
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final docs = snapshot.data!.docs;
                  return DataTable(
                    //columnSpacing: 51,
                    headingRowHeight: 32.0,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => PRIMARY_COLOR),
                    columns: [
                      DataColumn(
                        label: _label(data: '열람실명'),
                      ),
                      DataColumn(
                        label: _label(
                          data: '배정현황',
                        ),
                      ),
                      DataColumn(
                        label: _label(
                          data: '잔여석',
                        ),
                      ),
                    ],
                    rows: docs.asMap().entries.map((entry) {
                      final index = entry.key;
                      final value = entry.value;
                      return DataRow(
                        cells: [
                          DataCell(
                            Center(
                                child: Text(
                              '5F ${value['name']}',
                              textAlign: TextAlign.center,
                            )),
                            onTap: () {
                              onPressed(index);
                            },
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '${value['total_seat'] - value['unusing_seat']}/${value['total_seat']}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              onPressed(index);
                            },
                          ),
                          DataCell(
                            Center(
                                child: Text(
                              value['unusing_seat'].toString(),
                              textAlign: TextAlign.center,
                            )),
                            onTap: () {
                              onPressed(index);
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            /*Flexible(
              child: StreamBuilder(
                stream:
                    //파이어베이스의 db안의 컬렉션 주소
                    FirebaseFirestore.instance
                        .collection('library')
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          docs[index]['name'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                    },
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  onPressed(selected) {
    final box = Hive.box(testBox);

    // 데이터를 생성하거나
    // 업데이트할때
    box.put('selectedReadingroom', selected);
    print('keys : ${box.keys.toList()}');
    print('values : ${box.values.toList()}');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LibraryPlacement4();
        },
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

class _TopBanner2 extends StatelessWidget {
  const _TopBanner2({Key? key}) : super(key: key);

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
              style: TextStyle(color: Colors.green, fontSize: 24.0),
              //textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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

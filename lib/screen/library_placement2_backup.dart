import 'package:flutter/material.dart';
import 'package:howon_project/const/colors.dart';
import 'package:howon_project/screen/library_placement4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryPlacement2 extends StatefulWidget {
  const LibraryPlacement2({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement2> createState() => _LibraryPlacement2State();
}

class _LibraryPlacement2State extends State<LibraryPlacement2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('호원대학교 시설 예약 프로그램'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        backgroundColor: PRIMARY_COLOR,
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TopBanner1(),
            DataTable(
                //columnSpacing: 51,
                headingRowHeight: 32.0,
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => PRIMARY_COLOR),
                columns: [
                  DataColumn(
                    label: _label(
                      data: '열람실명',
                    ),
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
                rows: [
                  DataRow(cells: [
                    DataCell(Text('5F 열람실1', textAlign: TextAlign.center),
                        onTap: () {
                      onPressed();
                    }),
                    DataCell(Text('25/40', textAlign: TextAlign.center),
                        onTap: () {
                      onPressed();
                    }),
                    DataCell(Text('15', textAlign: TextAlign.center),
                        onTap: () {
                      onPressed();
                    }),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5F 열람실2')),
                    DataCell(Text('16/32')),
                    DataCell(Text('16')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5F 열람실3')),
                    DataCell(Text('13/36')),
                    DataCell(Text('23')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5F 열람실3')),
                    DataCell(Text('11/22')),
                    DataCell(Text('11')),
                  ]),
                ]),
            Flexible(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('library').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(docs[index]['name'], style: TextStyle(fontSize: 20.0),),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
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
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );
  }
}

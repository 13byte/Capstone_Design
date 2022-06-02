import 'package:flutter/material.dart';

class LibraryPlacement1 extends StatefulWidget {
  const LibraryPlacement1({Key? key}) : super(key: key);

  @override
  State<LibraryPlacement1> createState() => _LibraryPlacement1State();
}

class _LibraryPlacement1State extends State<LibraryPlacement1> {
  final valueList = ['첫 번째', '두 번째', '세 번째'];
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('호원대학교'),
        centerTitle: true,
        elevation: 0.0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        backgroundColor: Colors.green,
      ),
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
                    child: Text(
                      '좌석현황/배정',
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Text('step 1'),
              Text('도서관 선택'),
            ]),
            DropdownButton(
              hint: Text('예약하고자 하는 도서관 선택'),
              isExpanded: true,
              value: selectedValue,
              items: valueList.map((value){
                return DropdownMenuItem(value: value, child: Text(value),);
              }).toList(),
              onChanged: (value){
                setState(() {
                  selectedValue = value.toString();
                });
              },
            ),
            Row(children: [
              Text('step 2'),
              Text('열람실 선택'),
            ]),
            DropdownButton(
              value: selectedValue,
              items: valueList.map((value){
                return DropdownMenuItem(value: value, child: Text(value),);
              }).toList(),
              onChanged: (value){
                setState(() {
                  selectedValue = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

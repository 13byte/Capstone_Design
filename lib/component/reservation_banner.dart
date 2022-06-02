import 'package:flutter/material.dart';

class ReservationBanner extends StatefulWidget {
  const ReservationBanner({Key? key}) : super(key: key);

  @override
  State<ReservationBanner> createState() => _ReservationBannerState();
}

class _ReservationBannerState extends State<ReservationBanner> {
  String result = '';
  bool isLibrary = true;
  bool isGym = false;
  bool isLecture = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isLibrary, isGym, isLecture];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ToggleButtons(
              children: [
                Text('도서관'),
                Text('체육관'),
                Text('강의실'),
              ],
              isSelected: isSelected,
              onPressed: toggleSelect,
            );
          },
        ),
      ],
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isLibrary = true;
      isGym = false;
      isLecture = false;
    } else if (value == 1){
      isLibrary = false;
      isGym = true;
      isLecture = false;
    } else {
    isLibrary = false;
    isGym = false;
    isLecture = true;
    }
    setState(() {
      isSelected = [isLibrary, isGym, isLecture];
      print(isSelected);
    });
  }
}

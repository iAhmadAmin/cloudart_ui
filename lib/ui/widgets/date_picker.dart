import 'package:cloudart/ui/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  String date;

  void formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    setState(() {
      date = formatter.format(dateTime);
    });
  }

  @override
  void initState() {
    super.initState();
    formatDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      padding:
          EdgeInsets.only(left: SizeConfig.widthMultiplier * 7, right: 10.0),
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30),
          color: Colors.white24,
          borderRadius: BorderRadius.circular(40.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date == null ? "Date of Birth" : date,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: Colors.grey[200],
            ),
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.utc(1960),
                  maxTime: DateTime.now(), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                formatDate(date);
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
          )
        ],
      ),
    );
  }
}

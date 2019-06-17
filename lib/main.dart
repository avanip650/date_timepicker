import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  home: DateTimePicker(),
));

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  
  DateTime _date = new DateTime.now();
  TimeOfDay _timeOfDay = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(

        context: context, initialDate: _date, firstDate: new DateTime(2019), lastDate: new DateTime(2023));

    if(picked != null && picked != _date){
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async{
      final TimeOfDay timepicked = await showTimePicker(
          context: context, initialTime: _timeOfDay);

      if(timepicked != null && timepicked != _timeOfDay){
        setState(() {
          _timeOfDay = timepicked;
        });
      }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('DateTimePicker'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: new Column(
          children: <Widget>[
            Text('Date Selected ${_date.toString()}'),
            RaisedButton(onPressed: (){
              _selectDate(context);
            },
            child: Text('Select Date'),
            ),
            Text('Time Selected ${_timeOfDay.toString()}'),
            RaisedButton(onPressed: (){
              _selectTime(context);
            },
              child: Text('Select Date'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePickerConcept extends StatefulWidget {
  const DatePickerConcept({super.key});

  @override
  State<DatePickerConcept> createState() => _DatePickerConceptState();
}

class _DatePickerConceptState extends State<DatePickerConcept> {
  String? _dateCount;
  String? _range;

  @override
  void initState() {
    // TODO: implement initState
    _dateCount = '';
    _range = '';
    super.initState();
  }

  void _onSelectedDate(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/mm/yyy').format(args.value.startDate).toString() +
                '-' +
                DateFormat('dd/mm/yyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Date Picker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 80,
            child: SfDateRangePicker(
              startRangeSelectionColor: Colors.green,
              backgroundColor: Colors.cyanAccent,
              onSelectionChanged: _onSelectedDate,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(Duration(days: 4)),
                DateTime.now().add(Duration(days: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

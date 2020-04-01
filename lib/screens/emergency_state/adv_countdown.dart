import 'dart:async';
import 'package:flutter/material.dart';
import './adv_column.dart';
import './adv_row.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AdvCountdown extends StatefulWidget {
  final DateTime futureDate;
  final TextStyle style;

  AdvCountdown({this.futureDate, TextStyle style})
      : this.style = style ??
            TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w600);

  @override
  State<StatefulWidget> createState() => AdvCountdownState();
}

class AdvCountdownState extends State<AdvCountdown> {
  TextStyle _numberStyle;
  TextStyle _datepartStyle;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _numberStyle =
        widget.style.copyWith(fontSize: 45.0, fontWeight: FontWeight.w700);
    _datepartStyle = widget.style;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (this.mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = widget.futureDate.difference(DateTime.now());
    if (duration.isNegative) {
      _numberStyle = _numberStyle.copyWith(color: Colors.black);
      _datepartStyle = _datepartStyle.copyWith(color: Colors.black);
    }

    int day = duration.inDays.abs();
    int hour = (duration.inHours.abs() % 24);
    int minute = (duration.inMinutes.abs() % 60);
    int second = (duration.inSeconds.abs() % 60);

    String dayDatePartFr = day.abs() == 1 ? "jour" : "jours";
    String hourDatePartFr = hour.abs() == 1 ? "heure" : "heures";
    String minuteDatePartFr = minute.abs() == 1 ? "minute" : "minutes";
    String secondDatePartFr = second.abs() == 1 ? "seconde" : "secondes";

    String dayDatePartAr = (day.abs() <= 10 && day.abs() >= 2) ? "أيام" : "يوم";
    String hourDatePartAr =
        (hour.abs() <= 10 && hour.abs() >= 2) ? "ساعات" : "ساعة";
    String minuteDatePartAr =
        (minute.abs() <= 10 && minute.abs() >= 2) ? "دقائق" : "دقيقة";
    String secondDatePartAr =
        (second.abs() <= 10 && second.abs() >= 2) ? "ثواني" : "ثانية";

    String dayDatePartEn = day.abs() == 1 ? "day" : "days";
    String hourDatePartEn = hour.abs() == 1 ? "hour" : "hours";
    String minuteDatePartEn = minute.abs() == 1 ? "minute" : "minutes";
    String secondDatePartEn = second.abs() == 1 ? "second" : "seconds";

    Widget separator = SizedBox(
        //width: MediaQuery.of(context).size.width * 0.2,
        child: AutoSizeText(
      ":",
      style: _numberStyle,
      maxLines: 1,
      maxFontSize: 45.0,
      overflow: TextOverflow.fade,
      minFontSize: 2.0,
    ));
    List<Widget> children = [];

    if (minute == 0 && hour == 0 && day == 0) {
      children.add(_buildItem(
          (second * (duration.isNegative ? -1 : 1)).toString().padLeft(2, '0'),
          secondDatePartFr,
          secondDatePartAr,
          secondDatePartEn));
    } else {
      children.addAll([
        separator,
        _buildItem(second.toString().padLeft(2, '0'), secondDatePartFr,
            secondDatePartAr, secondDatePartEn)
      ]);
    }

    if (minute != 0) {
      if (hour == 0 && day == 0) {
        children.insert(
            0,
            _buildItem(
                (minute * (duration.isNegative ? -1 : 1))
                    .toString()
                    .padLeft(2, '0'),
                minuteDatePartFr,
                minuteDatePartAr,
                minuteDatePartEn));
      } else {
        children.insert(
            0,
            _buildItem(minute.toString().padLeft(2, '0'), minuteDatePartFr,
                minuteDatePartAr, minuteDatePartEn));
        children.insert(0, separator);
      }
    }

    if (hour != 0) {
      if (day == 0) {
        children.insert(
            0,
            _buildItem(
                (hour * (duration.isNegative ? -1 : 1))
                    .toString()
                    .padLeft(2, '0'),
                hourDatePartFr,
                hourDatePartAr,
                hourDatePartEn));
      } else {
        children.insert(
            0,
            _buildItem(hour.toString().padLeft(2, '0'), hourDatePartFr,
                hourDatePartAr, hourDatePartEn));
        children.insert(0, separator);
      }
    }

    if (day != 0) {
      children.insert(
          0,
          _buildItem(
              (day * (duration.isNegative ? -1 : 1)).toString().padLeft(2, '0'),
              dayDatePartFr,
              dayDatePartAr,
              dayDatePartEn));
    }

    return AdvRow(
        mainAxisSize: MainAxisSize.min,
        divider: RowDivider(8.0),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children);
  }

  Widget _buildItem(
      String amount, String datePartFr, String datePartAr, String datePartEn) {
    List<Widget> children = [];

    children.add(SizedBox(
      child: AutoSizeText(
        "$amount",
        style: _numberStyle,
        maxLines: 1,
        maxFontSize: 45.0,
        overflow: TextOverflow.fade,
        minFontSize: 2.0,
      ),
    )
        );
    children.add(SizedBox(
        child: AutoSizeText("$datePartFr",
            maxLines: 1,
            maxFontSize: _datepartStyle.fontSize * 0.4,
            overflow: TextOverflow.fade,
            minFontSize: 2.0,
            style: _datepartStyle.copyWith(
                fontSize: _datepartStyle.fontSize * 0.4))));
    children.add(SizedBox(
        child: AutoSizeText("$datePartAr",
            maxLines: 1,
            maxFontSize: _datepartStyle.fontSize * 0.4,
            overflow: TextOverflow.fade,
            minFontSize: 2.0,
            style: _datepartStyle.copyWith(
                fontSize: _datepartStyle.fontSize * 0.4))));
    children.add(SizedBox(
        child: AutoSizeText("$datePartEn",
            maxLines: 1,
            maxFontSize: _datepartStyle.fontSize * 0.4,
            overflow: TextOverflow.fade,
            minFontSize: 2.0,
            style: _datepartStyle.copyWith(
                fontSize: _datepartStyle.fontSize * 0.4))));

    return AdvColumn(children: children);
  }
}

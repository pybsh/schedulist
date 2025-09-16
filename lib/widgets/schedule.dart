import 'package:flutter/material.dart';
import 'package:schedulist/models/Schedule.dart';
import 'package:schedulist/services/store_service.dart';

class ScheduleWidget extends StatefulWidget {
  final Schedule schedule;
  const ScheduleWidget({required this.schedule, super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white // 라이트 테마 배경과 대비되는 흰색
              : Colors.grey[800], // 다크 테마 배경과 대비되는 회색
        ),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: isChecked,
              onChanged: (value) {
                if (value == true) {
                  setState(() {
                    isChecked = true;
                  });
                  deleteSchedule(widget.schedule);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.schedule.description,
                      style: const TextStyle(fontSize: 16)),
                  Text(widget.schedule.deadline.toString(),
                      style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

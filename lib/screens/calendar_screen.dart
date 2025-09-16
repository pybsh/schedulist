import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:schedulist/models/Schedule.dart';
import 'package:schedulist/services/store_service.dart'; // querySchedules 함수 가져오기

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isExpanded = true;
  DateTime selectedDay = DateTime.now();
  Map<DateTime, List<Schedule>> scheduleData = {};
  List<Schedule> selectedDaySchedules = [];

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  Future<void> fetchSchedules() async {
    final schedules = await querySchedules(); // querySchedules로 데이터 가져오기
    final Map<DateTime, List<Schedule>> newScheduleData = {};

    for (var schedule in schedules) {
      final scheduleDate = DateTime(
        schedule.deadline!.getDateTimeInUtc().year,
        schedule.deadline!.getDateTimeInUtc().month,
        schedule.deadline!.getDateTimeInUtc().day,
      );
      if (newScheduleData.containsKey(scheduleDate)) {
        newScheduleData[scheduleDate]!.add(schedule);
      } else {
        newScheduleData[scheduleDate] = [schedule];
      }
    }

    setState(() {
      scheduleData = newScheduleData;
      selectedDaySchedules = getSchedulesForDay(selectedDay);
    });
  }

  List<Schedule> getSchedulesForDay(DateTime day) {
    return scheduleData[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('캘린더', style: TextStyle(fontSize: 18)),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.utc(2030, 01, 01),
            focusedDay: selectedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
                selectedDaySchedules = getSchedulesForDay(selectedDay);
              });
            },
            availableGestures: AvailableGestures.none,
            calendarFormat:
                isExpanded ? CalendarFormat.month : CalendarFormat.week,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            eventLoader: (day) => getSchedulesForDay(day),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          TextButton(
            onPressed: () => setState(() => isExpanded = !isExpanded),
            style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                overlayColor: Colors.transparent),
            child: Text(isExpanded ? '▲' : '▼'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: selectedDaySchedules.isEmpty
                ? const Center(child: Text('해당 날짜에 일정이 없습니다.'))
                : ListView.builder(
                    itemCount: selectedDaySchedules.length,
                    itemBuilder: (context, index) {
                      final schedule = selectedDaySchedules[index];
                      return ListTile(
                        title: Text(schedule.description),
                        subtitle: Text(schedule.deadline.toString()),
                        leading: const Icon(Icons.event),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

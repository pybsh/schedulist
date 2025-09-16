import 'package:flutter/material.dart';
import 'package:schedulist/models/Schedule.dart';
import 'package:schedulist/services/store_service.dart'; // querySchedules 함수 사용
import 'package:schedulist/widgets/schedule.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Schedule> allSchedules = [];
  List<Schedule> filteredSchedules = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  Future<void> fetchSchedules() async {
    final schedules = await querySchedules();
    setState(() {
      allSchedules = schedules;
      filteredSchedules = schedules;
    });
  }

  void filterSchedules(String query) {
    setState(() {
      searchQuery = query;
      filteredSchedules = allSchedules.where((schedule) {
        final description = schedule.description.toLowerCase();
        final search = query.toLowerCase();
        return description.contains(search);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('검색',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: TextEditingController(text: searchQuery),
              hintText: "제목, 내용..",
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                filterSchedules(value);
              },
            ),
          ),
          Expanded(
            child: filteredSchedules.isEmpty
                ? const Center(child: Text('검색 결과가 없습니다.'))
                : ListView.builder(
                    itemCount: filteredSchedules.length,
                    itemBuilder: (context, index) {
                      final schedule = filteredSchedules[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        child: ScheduleWidget(schedule: schedule),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

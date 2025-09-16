import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:schedulist/models/Schedule.dart';
import 'package:schedulist/screens/calendar_screen.dart';
import 'package:schedulist/screens/search_screen.dart';
import 'package:schedulist/screens/today_screen.dart';
import 'package:schedulist/services/bedrock_service.dart';
import 'package:schedulist/services/store_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    TodayScreen(),
    CalendarScreen(),
    SearchScreen(),
  ];

  final TextEditingController _messageController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String description = '';
  String date = '';

  Future<void> _generateSchedule() async {
    if (_messageController.text.trim().isNotEmpty) {
      final res = await fetchBedrock(_messageController.text); // API 호출
      setState(() {
        description = res[0];
        date = res[1];
      });
      saveSchedule(
        Schedule(
          description: description,
          deadline: TemporalDateTime(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(date) * 1000), // 문자열 -> TemporalDateTime 변환
          ),
          author: "User",
          completed: false,
        ),
      );
      _messageController.clear(); // 전송 후 입력창 초기화
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: '오늘',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: '캘린더',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '검색',
            ),
          ],
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // 키보드 올라올 때 전체 높이 조절
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets, // 키보드 영역 감안
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 16),
                        child: Text("새 일정 추가",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(48.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: '어떤 계획이 있나요?',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_upward,
                                  color: Theme.of(context).primaryColor),
                              onPressed: _generateSchedule,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, size: 28),
      ),
    );
  }
}

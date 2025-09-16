import 'package:flutter/material.dart';
import 'package:schedulist/services/auth_service.dart';
import 'package:schedulist/services/store_service.dart'; // Store service for Amplify
import 'package:schedulist/models/Schedule.dart';
import 'package:schedulist/widgets/schedule.dart'; // Schedule 모델 가져오기

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '오늘',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => signOutCurrentUser(context),
              child: const Text(
                '로그아웃',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Schedule>>(
        future: querySchedules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('오늘 마감일자의 스케줄이 없습니다.'));
          } else {
            final schedules = snapshot.data!;
            return ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: ScheduleWidget(
                    schedule: schedule, // 날짜를 문자열로 변환
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

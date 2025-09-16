import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:schedulist/amplifyconfiguration.dart';
import 'package:schedulist/models/ModelProvider.dart';
import 'package:schedulist/widgets/auth_handler.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> _configureAmplify() async {
  try {
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedulist',
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Indigo 색 계열로 변경
        primaryColor: Colors.indigo,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100], // 밝은 배경색
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200], // AppBar 배경색: 연한 회색
          elevation: 1.0, // 살짝의 그림자 효과
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[200], // BottomNavigationBar 배경색
          selectedItemColor: Colors.indigoAccent, // 선택된 아이템 Indigo 강조
          unselectedItemColor: Colors.grey[700], // 더 진한 회색으로 변경
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo, // Indigo 색 계열로 변경
        primaryColor: Colors.indigo,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900], // 어두운 배경색
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850], // 다크 테마 AppBar 색상
          elevation: 1.0, // 동일한 그림자 효과
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[850], // 다크 테마 BottomNavigationBar 배경색
          selectedItemColor: Colors.indigoAccent, // 다크 테마 Indigo 강조
          unselectedItemColor: Colors.grey[500], // 다크 테마의 언셀렉트된 아이템 색상
        ),
      ),
      themeMode: ThemeMode.system,
      home: AuthHandler(),
    );
  }
}

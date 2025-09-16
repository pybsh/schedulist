import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:schedulist/screens/main_screen.dart';
import 'package:schedulist/screens/auth_screen.dart';

Future<bool> isUserSignedIn() async {
  final result = await Amplify.Auth.fetchAuthSession();
  return result.isSignedIn;
}

Future<AuthUser> getCurrentUser() async {
  final result = await Amplify.Auth.getCurrentUser();
  return result;
}

Future<void> signInWithWebUIProvider(BuildContext context) async {
  try {
    final result = await Amplify.Auth.signInWithWebUI(
      provider: AuthProvider.google,
    );
    if (result.isSignedIn) {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      safePrint('로그인 실패: 사용자 인증 필요');
    }
  } on AuthException catch (e) {
    safePrint('로그인 중 오류 발생: ${e.message}');
  }
}

Future<void> signOutCurrentUser(BuildContext context) async {
  try {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    } else if (result is CognitoFailedSignOut) {
      safePrint('로그아웃 실패: ${result.exception.message}');
    }
  } catch (e) {
    safePrint('로그아웃 중 오류 발생: ${e.toString()}');
  }
}

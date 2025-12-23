import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_block/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(), // 구글 폰트 theme 중에 'inter' 폰트 사용
        scaffoldBackgroundColor: Color(0xFF1F1F1F), // 앱 전체 배경색 설정
        colorScheme: ColorScheme.dark(
          // 다크 모드 컬러 테마 설정
          primaryContainer: Color(0xFFFEF754), // 카드 1
          secondaryContainer: Color(0xFF9C6BCE), // 카드 2
          tertiaryContainer: Color(0xFFBBF246), // 카드 3
          onPrimaryContainer: Colors.black, // 카드 위의 기본 텍스트 컬러
          onSurface: Colors.white, // 배경색(background) 위의 텍스트 컬러
          onSurfaceVariant: Color(0xFF979797), // 회색 글씨
          error: Color(0xFFB2257F), // 포인트 컬러
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

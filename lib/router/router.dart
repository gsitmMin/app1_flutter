import 'package:flutter_application_1/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  // 앱의 진입점 라우트
  initialLocation: '/',
  // 라우트 정의
  routes: [
    // 홈 라우트
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHome(),
    ),
    // 상세 화면 라우트
    /*
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsScreen(),
    ),
    */
  ],
);
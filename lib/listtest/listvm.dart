import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// StateNotifierProvider를 사용하여 ViewModel을 생성합니다.
// StateNotifier는 상태를 변경하는 로직을 내부에 가집니다.
class ListNotifier extends StateNotifier<int> {
  ListNotifier() : super(0);
  
  void test() {
    print('test');
  }
}

// UI에서 사용할 수 있도록 Provider를 노출합니다.
final counterProvider =
    StateNotifierProvider<ListNotifier, int>((ref) {
  return ListNotifier();
});
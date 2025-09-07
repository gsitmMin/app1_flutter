import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main(){
  usePathUrlStrategy();
  runApp(MyApp());
}

void _showMyAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    // builder는 다이얼로그로 보여줄 위젯을 반환하는 함수입니다.
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('알림'), // 다이얼로그의 제목
        content: const Text('준비중인 메뉴 입니다.'), // 다이얼로그의 내용
        actions: <Widget>[
          TextButton(
            child: const Text('확인'),
            onPressed: () {
              // '확인' 버튼을 누르면 다이얼로그를 닫습니다.
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      //home: MyHome(),
      routerConfig: router,
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('MyTestApp'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                print('test');
                //_showMyAlertDialog(context);
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 메뉴 헤더 (사용자 정보 등)
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            // 메뉴 항목
            ListTile(
              title: const Text('할일관리'),
              onTap: () {
                // 메뉴 1을 눌렀을 때 실행할 동작
                Navigator.pop(context); // 메뉴 닫기
              },
            ),
            ListTile(
              title: const Text('로그아웃'),
              onTap: () {
                // 메뉴 2를 눌렀을 때 실행할 동작
                Navigator.pop(context); // 메뉴 닫기
                _showMyAlertDialog(context);
              },
            ),
          ],
        ),
      ),
     body: Padding(padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('images/testLogo.png'),
            radius: 60,
          ),
        ),
        Divider(
          height:60,
          color: Colors.black,
          thickness: 0.3,
          endIndent: 30,
        ),
        Text('name',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 2.0
        ),),
        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0,0)),
        Text('가나',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          letterSpacing: 2,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.check_circle_outline),
            Text('나는나는 초보',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1
            ),),
  
          ],
        )
      ],
     ),),
     
    );
  }
}

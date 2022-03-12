import 'package:flutter/material.dart';
import 'package:lq_common_utils/common_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavPage(
      tabs: const [
        TabItem(icon: Icon(Icons.home), label: "主页"),
        TabItem(icon: Icon(Icons.message), label: "我的"),
        TabItem(icon: Icon(Icons.animation), label: "练习"),
      ],
      pages: const [PageOne(), PageTwo(), PageThree()],
    );
  }
}

class PageOne extends KeepAliveWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (_, index) {
      return ListTile(
        title: Text("这是第$index行"),
      );
    });
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingStatusWidget(
      status: LoadingStatus.completed,
      builder: (cxt) {
        return Container(color: Colors.blue);
      },
      error: (cxt) {
        return Container(color: Colors.red);
      },
      loading: (cxt) {
        return Container(color: Colors.green);
      },
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Container(
            color: Colors.green,
            margin: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}

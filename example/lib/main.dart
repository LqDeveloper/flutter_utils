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
      appBar: AppBar(
        title: const Text("标题"),
      ),
      tabs: const [
        TabItem(icon: Icon(Icons.home), label: "主页"),
        TabItem(icon: Icon(Icons.message), label: "我的"),
        TabItem(icon: Icon(Icons.animation), label: "练习"),
        TabItem(icon: Icon(Icons.web), label: "网页"),
      ],
      pages: const [PageOne(), PageTwo(), PageThree(), PageFour()],
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

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: const AppWebView(
        type: WebViewLoadType.htmlFile,
        value: "assets/index.html",
        // value: "https://www.baidu.com",
//       value: """
//       <html>
// <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
// <div>
//     <h1>Demo Page</h1>
//     <p>这是测试HTML字符串</p>
// </div>
// </html>
//       """,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

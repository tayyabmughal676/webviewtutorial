import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Webview Demo';
    return new MaterialApp(
      title: title,
      home: new MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

const String flutterUrl = "https://flutter.dev/";
const String wikiUrl = "https://es.wikipedia.org";

class _MyAppState extends State<MyAppHomePage> {
  WebViewController _controller;

  _back() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url == "https://flutter.dev/"
          ? 'https://es.wikipedia.org'
          : "https://flutter.dev/",
    );

    print(url);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        actions: <Widget>[
          IconButton(
            onPressed: _back,
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: _forward,
            icon: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadPage,
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: WebView(
          key: Key("webview"),
          initialUrl: flutterUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }



//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: AppBar(
//          title: Text("Sample App"),
//        ),
//        body: new Center(
//          child: new RaisedButton(
//              child: Text('Open Link'),
//              onPressed: () {
//                _opennewpage();
//              }
//          ) ,
//        )
//    );
//  }
//    // Open Page Function
//  void _opennewpage() {
//    Navigator.of(context).pushNamed('/widget');
//  }

//  routes: {
//        '/widget': (_) => new WebviewScaffold(
//          url: "https:\\FlutterCentral.com",
//          appBar: new AppBar(
//            title: const Text('Widget Webview'),
//          ),
//          withZoom: false,
//          withLocalStorage: true,
//        )
//      },


}
import 'package:flutter/material.dart';

import 'package:flutter_native_web/flutterwebview.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  WebController webController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FlutterWebView flutterWebView = new FlutterWebView(
      onWebCreated: onWebCreated,
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Native WebView as Widget'),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Text('Native WebView as Widget\n\n'),
              new Container(
                child: flutterWebView,
                height: 300.0,
                width: 500.0,
              ),
            ],
          ),
        )
      ),
    );
  }

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl("https://flutter.io/");
    this.webController.onPageStarted.listen((url) =>
        print("Loading $url")
    );
    this.webController.onPageFinished.listen((url) =>
        print("Finished loading $url")
    );
  }
}

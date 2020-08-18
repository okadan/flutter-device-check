import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_device_check/ios_device_check.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  dynamic _result;

  @override
  void initState() {
    super.initState();
    _generateToken();
  }

  void _generateToken() async {
    if (!(await IosDeviceCheck.isSupported())) {
      setState(() => _result = 'Not supported');
      return;
    }

    try {
      String token = await IosDeviceCheck.generateToken();
      setState(() => _result = token);
    } on PlatformException catch (e) {
      setState(() => _result = '[Error]: ${e.code} / ${e.message} / ${e.details}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IosDeviceCheck Plugin Example'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Text('${_result ?? ''}'),
                  ),
                ),
              ),

              Flexible(
                flex: 2,
                child: RaisedButton(
                  child: Text('generateToken'),
                  onPressed: _generateToken,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

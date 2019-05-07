import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_device_check/ios_device_check.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token = '';

  @override
  void initState() {
    super.initState();
    _generateToken();
  }

  Future<void> _generateToken() async {
    if (!(await IosDeviceCheck.isSupported)) {
      setState(() {
        _token = 'Not Supported';
      });
      return;
    }

    String token;

    try {
      token = await IosDeviceCheck.generateToken();
    } on PlatformException catch (e) {
      token = 
        'Failed to generate token\n'
        'Code: ${e.code}\n'
        'Message: ${e.message}\n'
        'Details: ${e.details}';
    }

    if (!mounted)
      return;

    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IosDeviceCheck Example App'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Text(_token),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: _generateToken,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(appId: '9fa000c81e9440b588d79ec961ad7f1e',
      tempToken: '0069fa000c81e9440b588d79ec961ad7f1eIABMmknbdee9yHXI9j1sYoGNtJ5L5jPGoXOQK3LkXbA/OAx+f9gAAAAAEAC1xaJww5LAYQEAAQDDksBh',
     channelName: 'test'),
    enabledPermission: [Permission.camera, Permission.microphone]
  );

   @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text(' Video Call App'),
      centerTitle: true,),
      body: Stack(
        children: [
          AgoraVideoViewer(client: client),
          AgoraVideoButtons(client: client)
        ],
      )
      ),
    );
  }
}

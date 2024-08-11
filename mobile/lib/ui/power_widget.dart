import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/ssh_connect.dart';
import 'package:mobile/utils/firebase_database.dart';
import 'dart:convert';

class PowerWidget extends StatefulWidget {
  const PowerWidget({super.key});

  @override
  State<PowerWidget> createState() => _PowerWidgetState();
}

class _PowerWidgetState extends State<PowerWidget> {
  late SSHClient _client;
  String _deviceName = '';
  Future establishConnection() async {
    Object data = await getUserData();
    var parsedData = json.decode(json.encode(data));
    setState(() {
      _deviceName = parsedData['device_name'];
    });
    _client = await connect(
        parsedData['IPv4'], parsedData['user_name'], parsedData['pswd']);
  }

  @override
  void initState() {
    establishConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double cardWidth = screenWidth * 0.425;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            _deviceName,
            style: const TextStyle(
                color: Color(0xfff4f5fc),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/battery.png',
            width: screenWidth * 0.7,
          ),
        ),
        const Text(
          'Battery Status',
          style: TextStyle(
            color: Color(0xfff4f5fc),
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            Card(
              elevation: 7,
              margin: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.025,
                top: screenHeight * 0.03,
              ),
              color: const Color(0xff24293e),
              child: GestureDetector(
                onTap: () {
                  sleep(_client);
                },
                child: SizedBox(
                  width: cardWidth,
                  height: cardWidth,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/sleep.png'),
                        const Text(
                          'Sleep',
                          style:
                              TextStyle(color: Color(0xfff4f5fc), fontSize: 18),
                        )
                      ]),
                ),
              ),
            ),
            Card(
                elevation: 7,
                margin: EdgeInsets.only(
                  left: screenWidth * 0.025,
                  right: screenWidth * 0.05,
                  top: screenHeight * 0.03,
                ),
                color: const Color(0xff24293e),
                child: GestureDetector(
                  onTap: () {
                    hibernate(_client);
                  },
                  child: SizedBox(
                    width: cardWidth,
                    height: cardWidth,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/hibernate.png'),
                          const Text(
                            'Hibernate',
                            style: TextStyle(
                                color: Color(0xfff4f5fc), fontSize: 18),
                          )
                        ]),
                  ),
                )),
          ],
        ),
        Row(
          children: [
            Card(
              elevation: 7,
              margin: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.025,
                  top: screenWidth * 0.05),
              color: const Color(0xff24293e),
              child: GestureDetector(
                onTap: () {
                  restart(_client);
                },
                child: SizedBox(
                  width: cardWidth,
                  height: cardWidth,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/restart.png'),
                        const Text(
                          'Restart',
                          style:
                              TextStyle(color: Color(0xfff4f5fc), fontSize: 18),
                        )
                      ]),
                ),
              ),
            ),
            Card(
                elevation: 7,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.025,
                    right: screenWidth * 0.05,
                    top: screenWidth * 0.05),
                color: const Color(0xff24293e),
                child: GestureDetector(
                  onTap: () {
                    shutdown(_client);
                  },
                  child: SizedBox(
                    width: cardWidth,
                    height: cardWidth,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/shutdown.png'),
                          const Text(
                            'Shutdown',
                            style: TextStyle(
                                color: Color(0xfff4f5fc), fontSize: 18),
                          )
                        ]),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

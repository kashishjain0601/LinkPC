import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/ssh_connect.dart';
import 'package:mobile/utils/firebase_database.dart';
import 'dart:convert';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  List _taskList = [];
  late SSHClient _client;
  var parsedData;
  bool chromeVisible = true;

  Future getTaskList() async {
    Object data = await getUserData();
    parsedData = json.decode(json.encode(data));
    _client = await connect(
        parsedData['IPv4'], parsedData['user_name'], parsedData['pswd']);
    List deviceTaskList = await tasklist(_client);
    setState(() {
      _taskList = deviceTaskList;
    });
  }

  @override
  void initState() {
    chromeVisible = true;
    getTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _taskList.length ~/ 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 8,
                  color: const Color(0xff24293e),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _taskList[(index + 2) * 10 + 1].toString(),
                          style: const TextStyle(
                              color: Color(0xfff4f5fc),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _taskList[(index + 2) * 10 + 9].toString(),
                          style: const TextStyle(
                              color: Color(0xfff4f5fc), fontSize: 10),
                        ),
                        IconButton(
                            onPressed: () async {
                              _client = await connect(parsedData['IPv4'],
                                  parsedData['user_name'], parsedData['pswd']);

                              taskKill(_client,
                                  _taskList[(index + 2) * 10 + 1].toString());
                            },
                            icon: const Icon(Icons.close,
                                color: Color(0xfff4f5fc)))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';
import 'package:dartssh2/dartssh2.dart';

Future<SSHClient> connect(String IPv4, String user_name, String pswd) async {
  final client = SSHClient(
    await SSHSocket.connect(IPv4, 22),
    username: user_name,
    onPasswordRequest: () => pswd,
  );
  return client;
}

Future<List> tasklist(SSHClient client) async {
  final shell = await client.shell();
  List output = [];
  final session = await client.execute('tasklist');
  await session.done;
  client.close();
  await shell.done;
  session.stdout.listen((event) {
    output.add(const Utf8Decoder().convert(event));
  });
  return output;
}

Future shutdown(SSHClient client) async {
  final shell = await client.shell();

  final session = await client.execute('shutdown /s');
  await session.done;
  await shell.done;
}

Future hibernate(SSHClient client) async {
  final shell = await client.shell();

  final session = await client.execute('shutdown /h');
  await session.done;
  await shell.done;
}

Future sleep(SSHClient client) async {
  final shell = await client.shell();

  final session = await client.execute('shutdown /h');
  await session.done;
  await shell.done;
}

Future restart(SSHClient client) async {
  final shell = await client.shell();

  final session = await client.execute('shutdown /r');
  await session.done;
  await shell.done;
}

Future taskKill(SSHClient client, String task) async {
  final shell = await client.shell();

  final session = await client.execute('taskkill /IM $task /F');
  await session.done;
  await shell.done;
}

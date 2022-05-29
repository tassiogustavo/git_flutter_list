import 'package:flutter/material.dart';
import 'package:git_flutter/models/member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/build_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _members = <Member>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    String url = "https://api.github.com/orgs/adobe/members";
    http.Response response = await http.get(Uri.parse(url));

    setState(() {
      final membersJson = jsonDecode(response.body);
      for (var member in membersJson) {
        _members.add(Member(member["login"], member["avatar_url"]));
      }
    });
  }

  void showAlertDialog(BuildContext context, String name, String url) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("OK"));

    AlertDialog alert = AlertDialog(
      title: Text(name),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(url),
        ],
      ),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: BuildRow(members: _members, index: index),
          onTap: () {
            showAlertDialog(
                context, _members[index].login, _members[index].avatarURL);
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../models/member.dart';

class BuildRow extends StatelessWidget {
  final _font = const TextStyle(fontSize: 20);

  final List<Member> members;
  final int index;

  const BuildRow({
    Key? key,
    required this.members,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        members[index].login,
        style: _font,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(members[index].avatarURL),
      ),
    );
  }
}

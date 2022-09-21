import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfoContainer extends StatefulWidget {
  String text;
  IconData icon;
  UserInfoContainer({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  State<UserInfoContainer> createState() => _UserInfoContainerState();
}

class _UserInfoContainerState extends State<UserInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 35,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  widget.text,
                  style: const TextStyle(fontSize: 20),
                ))
              ],
            )));
  }
}

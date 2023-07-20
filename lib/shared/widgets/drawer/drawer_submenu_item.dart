import 'package:flutter/material.dart';

class DrawerSubMenuItem extends StatelessWidget {
  final Function callback;
  final String name;

  const DrawerSubMenuItem(
      {Key? key, required this.callback, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(
          start: 6,
        ),
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff6c7b8a),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

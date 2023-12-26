import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class FailedWidget extends StatefulWidget {
  const FailedWidget({Key? key, this.failedMessage}) : super(key: key);
  final String? failedMessage;

  @override
  FailedWidgetState createState() => FailedWidgetState();
}

class FailedWidgetState extends State<FailedWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 200,
        color: Colors.transparent,
        child: Column(
          children: [
            Lottie.asset('assets/lottie/error.json'),
            Text(
              widget.failedMessage ?? '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: appFontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kishk_driver/res/m_colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(MColors.colorPrimary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontFamily: 'Tajawal',height: 2),
        ),
      ),
    );
  }
}

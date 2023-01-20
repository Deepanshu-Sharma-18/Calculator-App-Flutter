import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonNum extends StatefulWidget {
  final data;
  final Color? color;
  final Color? textcolor;

  const ButtonNum({super.key, required this.data, this.color, this.textcolor});

  @override
  State<ButtonNum> createState() => _ButtonNumState();
}

class _ButtonNumState extends State<ButtonNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color,
      ),
      child: Center(
          child: widget.data is String
              ? Text(
                  widget.data,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: widget.textcolor,
                  ),
                )
              : Icon(
                  widget.data,
                  size: 25,
                  color: widget.textcolor,
                )),
    );
  }
}

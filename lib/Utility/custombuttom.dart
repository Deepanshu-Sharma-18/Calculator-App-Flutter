import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatefulWidget {
  final data;
  final Color? color;
  final Color? textcolor;
  final double height;
  final double width;

  const CustomButton(
      {super.key,
      required this.data,
      this.color,
      this.textcolor,
      required this.height,
      required this.width});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
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

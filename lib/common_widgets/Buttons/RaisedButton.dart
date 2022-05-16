import 'package:flutter/material.dart';
class CustomRaisedButton extends StatelessWidget {
   CustomRaisedButton({
    this.color = Colors.blue,
    required this.child
  });

  final Widget child;
  final Color color;
  final double borderRadius = 23.0 ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {

        },
        child: child,
        color: color,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
            )
        ),

      ),
    );
  }
}

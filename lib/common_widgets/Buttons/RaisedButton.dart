import 'package:flutter/material.dart';
class CustomRaisedButton extends StatelessWidget {
   CustomRaisedButton({

     required this.child,
     this.color = Colors.blue,
     required this.onPressed,
     this.padding =15,

  });

  final Widget child;
  final Color color;
  final double borderRadius = 23.0 ;
  final VoidCallback onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        padding: EdgeInsets.all(padding),
        onPressed: onPressed,
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
            )
        ),
        elevation: 10,


      ),
    );
  }
}

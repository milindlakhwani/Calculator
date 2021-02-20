import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color bgColor;
  final Function func;

  const Button({
    this.text,
    this.icon,
    this.bgColor,
    this.textColor,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: SizedBox(
        width: mediaQuery.size.width / 5,
        height: mediaQuery.size.width / 5,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            (icon != null) ? func() : func(text);
          },
          textColor: textColor,
          color: bgColor,
          child: (icon != null)
              ? Icon(
                  icon,
                  textDirection: TextDirection.rtl,
                )
              : FittedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

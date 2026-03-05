import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoutonGenerer extends StatelessWidget {
  final void Function() onPressed;
  const BoutonGenerer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.amber,
        height: 75,
        child: Text(
          "genererer",
          style: GoogleFonts.inter(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}

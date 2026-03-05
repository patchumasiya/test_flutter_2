import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';

class ThemeCitation extends StatefulWidget {
  final List<String> choix;
  String valeurSelectionne = "";
  int indexSelectionne = 0;

  ThemeCitation({super.key, required this.choix}) {
    if (choix.isNotEmpty) {
      valeurSelectionne = choix[indexSelectionne];
    }
  }

  @override
  State<ThemeCitation> createState() => _ThemeCitationState();
}

class _ThemeCitationState extends State<ThemeCitation> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: widget.choix
          .mapIndexed(
            (index, elmt) => ChoiceChip(
              label: Text(
                elmt,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 28),
              ),
              selected: widget.indexSelectionne == index,
              backgroundColor: Colors.blueGrey[200],
              selectedColor: Colors.blueGrey,

              padding: EdgeInsets.all(20),
              onSelected: (value) {
                setState(() {
                  if (value) {
                    widget.indexSelectionne = index;
                    widget.valeurSelectionne = elmt;
                  }
                });
              },
            ),
          )
          .toList(),
    );
  }
}

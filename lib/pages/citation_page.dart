import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_flutter_2/data/api.dart';
import 'package:test_flutter_2/widgets/bouton_generer.dart';
import 'package:test_flutter_2/widgets/panneau_citation.dart';
import 'package:test_flutter_2/widgets/theme_citation.dart';

class CitationPage extends StatefulWidget {
  @override
  State<CitationPage> createState() => _CitationPageState();
}

class _CitationPageState extends State<CitationPage> {
  final themeCitation = ThemeCitation(
    choix: ["success", "wisdom", "leadership", "art", "writing", "fear"],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "citation",
          style: GoogleFonts.inter(color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 74, 73, 73),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: const Color.fromARGB(255, 228, 228, 225),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PanneauCitation(
                citationFuture: obtenirCitation(
                  themeCitation.valeurSelectionne,
                ),
              ),
              SizedBox(height: 20),
              themeCitation,
              SizedBox(height: 20),
              BoutonGenerer(
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

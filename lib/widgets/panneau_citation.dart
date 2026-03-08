import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_flutter_2/data/api.dart';

class PanneauCitation extends StatelessWidget {
  final Future citationFuture;
  const PanneauCitation({super.key, required this.citationFuture});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 250,
      color: const Color.fromARGB(255, 74, 73, 73),
      child: FutureBuilder(
        future: citationFuture,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 45,
                width: 45,
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          } else if (asyncSnapshot.hasData) {
            final citation = asyncSnapshot.data as Citation;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  citation.texteCitation,
                  style: GoogleFonts.gwendolyn(color: Colors.white, fontSize: 48),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "- ${citation.auteur}",
                    style: GoogleFonts.gwendolyn(
                      color: const Color.fromARGB(255, 253, 190, 185),
                      fontSize: 48,
                    ),
                  ),
                ),
              ],
            );
          } else if (asyncSnapshot.hasError) {
            return Center(
              child: Text(
                "Erreur: une erreur s'est produite ${asyncSnapshot.error}",
                style: GoogleFonts.gwendolyn(
                  color: const Color.fromARGB(255, 253, 190, 185),
                  fontSize: 48,
                ),
              ),
            );
          }

          return Center(
            child: SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

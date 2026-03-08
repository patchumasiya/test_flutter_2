import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class Citation {
  final String texteCitation;
  final String auteur;
  Citation({this.texteCitation = "", this.auteur = ""});
}

final translator=GoogleTranslator();

Future<Citation> obtenirCitation(String theme) async {
  var citation = Citation();
  final client = http.Client();
  final url = "https://api.api-ninjas.com/v2/quotes?categories=$theme";
  final cle = "91xAC/q/Fy0xF6NV9nYgqQ==YlovrcsEzYcB4hih";
  final reponse = await client.get(Uri.parse(url), headers: {"X-Api-Key": cle});
  final json = jsonDecode(utf8.decode(reponse.bodyBytes)) as List;
  if (json.isNotEmpty) {
    final elmt = json[0] as Map;
    final texteCitation = elmt["quote"];
    final traduction = await translator.translate(texteCitation, to: "fr");
    final auteur = elmt["author"];
    citation = Citation(texteCitation: traduction.toString(), auteur: auteur);
  }

  return citation;
}

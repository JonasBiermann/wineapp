import 'package:flutter/material.dart';

import 'package:wineapp/widgets/search_screens_widgets/pref_information_card.dart';

class PartyPrefResults extends StatelessWidget {
  PartyPrefResults({Key? key}) : super(key: key);
  String wineName = 'Luis Latour Château Corton Grancey at Vivino';
  String wineType = 'Red Wine';
  String wineUse = 'Spaghetti, Pasta and more';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: PrefInformationCard(
            wineName: wineName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: PrefInformationCard(
            wineName: wineName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: PrefInformationCard(
            wineName: wineName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: PrefInformationCard(
            wineName: wineName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: PrefInformationCard(
            wineName: wineName,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'backend/SoccerSimulator.dart';

class CountrySelector extends StatelessWidget {
  final Function onCountrySelected;
  final List teams;

  CountrySelector({Key key, this.onCountrySelected, this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
        onPageChanged: (page) {
          onCountrySelected(teams[page]);
        },
        children: teams
            .map(
              (e) => Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image(
                        image: Image.network(
                                "https://raw.githubusercontent.com/linssen/country-flag-icons/master/images/png/${e.code}.png")
                            .image),
                  ),
                ),
              ),
            )
            .toList());
  }
}

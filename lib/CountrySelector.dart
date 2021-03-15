import 'package:flutter/material.dart';

class CountrySelector extends StatelessWidget {
  final Function onCountrySelected;
  final List countries = ["alb", "nld", "aus", "deu", "usa"];
  final List countrynames = [
    "Albanie",
    "Nederland",
    "Australie",
    "Duitsland",
    "Verenigde Staten"
  ];
  
  CountrySelector({Key key, this.onCountrySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
        onPageChanged: (page) {
          onCountrySelected(countrynames[page]);
        },
        children: countries
            .map(
              (e) => Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Image(
                        image: Image.network(
                                "https://raw.githubusercontent.com/linssen/country-flag-icons/master/images/png/$e.png")
                            .image),
                  ),
                ),
              ),
            )
            .toList());
  }
}

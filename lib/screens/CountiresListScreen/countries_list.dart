
import 'package:flutter/material.dart';
import 'components/countries_list_body.dart';

class CountriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CountriesList'),
      ),
      body: CountriesListBody(),
    );
  }
}
    
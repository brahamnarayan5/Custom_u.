import 'package:custom_uber/AppPages/FinalModels/ListViewForPlaces.dart';
import 'package:custom_uber/AppPages/FinalModels/SearchPanel.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: TrialRun(),
    ),
  ));
}

class TrialRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      ListViewForPlaces(),
      SearchPanel(),
      ],
    );
  }
}
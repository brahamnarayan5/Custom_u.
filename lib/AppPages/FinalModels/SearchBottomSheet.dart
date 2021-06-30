import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SearchBottomSheet(),
    ),
  ));
}

class SearchBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return ListView.separated(
          itemBuilder: null,
          controller: scrollController,
          separatorBuilder: (context, index) {
            return null;
          },
          itemCount: 5,
        );
      },
    );
  }
}

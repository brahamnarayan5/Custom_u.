import 'package:custom_uber/AppPages/FinalModels/RouteDetailsTIle.dart';
import 'package:flutter/material.dart';

class RideDetailsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.5,
      minChildSize: 0.2,
      builder: (context, scrollController) {
        return ListView(
          padding: EdgeInsets.all(0),
          children: [
            Container(
              height: 35,
              child: Text(
                "choose a ride or swipe up.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            ListView.separated(
                itemBuilder: (context, index) {
                  return RouteDetailsTile(
                    index: index,
                  );
                },
                separatorBuilder: null,
                itemCount: null)
          ],
        );
      },
    );
  }
}

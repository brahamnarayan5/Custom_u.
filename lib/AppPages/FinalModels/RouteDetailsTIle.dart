import 'package:flutter/material.dart';

class RouteDetailsTile extends StatelessWidget {
  final int index;
  RouteDetailsTile({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(Icons.horizontal_rule),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
                child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("HatchBacks",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                Expanded(flex: 1, child: Text("dropoff by 1.00 P.M ")),
              ],
            )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text('\u20B9 51.00'),
            ),
          ),
        ],
      ),
    );
  }
}

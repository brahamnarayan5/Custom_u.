import 'package:flutter/material.dart';

class ContainerForNavigationToSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.search,
                  size: 22,
                  color: Colors.blue[800].withOpacity(0.9),
                ),
              ),
              Text(
                "Your nxt Destination ?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

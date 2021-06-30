import 'package:flutter/material.dart';

class ConstListViewer extends StatelessWidget {
  static final List<ListItems> list = [
    ListItems(icon: Icon(Icons.star_border), text: "Saved Places"),
    ListItems(icon: Icon(Icons.map_outlined), text: "Choose On Map")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(0w),
      itemBuilder: (context, index) {
        return ListTile(
          index: index,
          list: list,
        );
      },
      separatorBuilder: (context, index) => Divider(
          thickness: 1,

          ),
      itemCount: list.length,
    );
  }
}

class ListTile extends StatelessWidget {
  final List<ListItems> list;
  final int index;
  ListTile({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(0),
                        // color: Colors.grey
                    ),
                    child: list[index].icon
                )
            ),
            Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${list[index].text}",
                      style: TextStyle(fontSize: 18)),
                ))
          ],
        ));
  }
}

class ListItems {
  String text;
  Widget icon;
  ListItems({@required this.icon, @required this.text});
}

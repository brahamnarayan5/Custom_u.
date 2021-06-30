import 'package:custom_uber/AppPages/AppPage-1/GetControllers/IndexedStackNavController.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/MapPaddingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexedStackPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexedStackNavController>(
        init: IndexedStackNavController(),
        builder: (controller) {
          return IndexedStack(
            alignment: Alignment.bottomCenter,
            index: controller.index,
            children: [Sheet01(), Sheet02()],
          );
        });
  }
}

class Sheet01 extends StatelessWidget {
  Sheet01({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapPaddingController>(builder: (controller) {
      return DraggableScrollableSheet(
        initialChildSize: 0.15,
        maxChildSize: 0.15,
        minChildSize: 0.15,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.only(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.find<IndexedStackNavController>().toIndexNo(1);
                  Get.find<MapPaddingController>().bpForStackItem1();
                },
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
              ),
            ),
          );
        },
      );
    });
  }
}

class Sheet02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollcontroller) {
            return Container(
              // margin: EdgeInsets.symmetric(horizontal: 0),

              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 4,
                  )
                ],
              ),
              child: ListView(
                controller: scrollcontroller,
                children: [],
              ),
            );
          }),

//-----------------------------------------------------------------------------------------------

      FractionallySizedBox(
        heightFactor: 0.20,
        widthFactor: 1,
        child: Container( //------------------------------------------------------gives white color to the search container.
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              spreadRadius: 4,
              blurRadius: 4,
              color: Colors.grey.withOpacity(0.4),
            )
          ]),
          child: SafeArea( // ----------------------------------------------------safe area to prevent any sort of ui disturbance.
            child: Column(
              children: [
                Expanded( //------------------------------------------------------The first row in the column above which has back button and booking user selection
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded( // ---------------------------------------------The Back Arrow Button to navigate to the previous Page.
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.find<IndexedStackNavController>()
                                  .toIndexNo(0);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        Expanded(//-----------------------------------------------DropDown Button to select who is riding .
                            flex: 4,
                            child: Align(
                              alignment: Alignment.center,
                              // child: ElevatedButton(
                              //   child: Text("for me"),
                              //   onPressed: () {},
                              // ),
                            )),
                        Expanded(flex: 1, child: SizedBox()) //-------------------Padding using expanded and sizedbox.
                      ],
                    ),
                  ),
                ),
                //----------------------------------------------------------------search field-1.
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [ //-----------------------------------the second row which contains icon and search field
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.check_circle,
                              size: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              // border:Border.all(color: Colors.grey),
                            ),
                            alignment: Alignment.topCenter,

                            // padding: EdgeInsets.symmetric(),
                            margin: EdgeInsets.only(top: 5),
                            child: TextField(
                              
                              autocorrect: false,
                              maxLines: 1,
                              style: TextStyle(fontSize: 18,),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                isDense: true,
                                hintText: "your pickup Point ?",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.grey),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ]),
                    )),
                //------------------------------------------search field 2
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.check_circle,
                              size: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Container(
                            height: 35,
                            margin: EdgeInsets.only(bottom: 5,),
                            // decoration: BoxDecoration(
                            //   border:Border.all(color: Colors.grey),
                            // ),
                            // padding: EdgeInsets.symmetric(),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                style: TextStyle(fontSize: 18),
                                                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  isDense: true,
                                  hintText: "nxt destination ?",
                                  hintStyle: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                  alignLabelWithHint: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ]),
                    )),

                // Expanded(
                //   flex: 1,
                //   child: SizedBox())
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

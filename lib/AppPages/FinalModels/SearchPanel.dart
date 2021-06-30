import 'package:custom_uber/AppPages/AppPage-1/GetControllers/SearchFieldController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SearchPanel(),
    ),
  ));
}

class SearchPanel extends StatelessWidget {
  final SearchFieldController searchFieldController =
      Get.find<SearchFieldController>();

  @override
  Widget build(BuildContext context) {
    Get.put(SearchFieldController());
    final aloo = TextEditingController();
    // aloo.text = "hello";

    return FractionallySizedBox(
      heightFactor: 0.22,
      widthFactor: 1,
      child: Container(
        //------------------------------------------------------gives white color to the search container.
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 4,
            color: Colors.grey.withOpacity(0.4),
          )
        ]),
        child: SafeArea(
          // ----------------------------------------------------safe area to prevent any sort of ui disturbance.
          child: Column(
            children: [
              Expanded(
                //------------------------------------------------------The first row in the column above which has back button and booking user selection
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        // ---------------------------------------------The Back Arrow Button to navigate to the previous Page.
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            // Get.find<IndexedStackNavController>()
                            //     .toIndexNo(0);
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          //-----------------------------------------------DropDown Button to select who is riding .
                          flex: 4,
                          child: Align(
                            alignment: Alignment.center,
                            // child: ElevatedButton(
                            //   child: Text("for me"),
                            //   onPressed: () {},
                            // ),
                          )),
                      Expanded(
                          flex: 1,
                          child:
                              SizedBox()) //-------------------Padding using expanded and sizedbox.
                    ],
                  ),
                ),
              ),
              //----------------------------------------------------------------search field-1.
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(children: [
                      //-----------------------------------the second row which contains icon and search field.
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.check_circle,
                            size: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: Colors.grey, width: 2),
                          ),
                          alignment: Alignment.center,

                          // padding: EdgeInsets.symmetric(),
                          margin: EdgeInsets.only(top: 5),
                          child: TextField(
                            //----------------------------------------------------text field 1 starts here.
                            onChanged: (value) {
                              searchFieldController.pickupAssigned = false;

                              searchFieldController.searchPredictions(value, 1);
                            },
                            controller: aloo,
                            autocorrect: false,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              isDense: true,
                              hintText: "Your pickup location",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[600],
                              ),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.1),
                              focusColor: Colors.black,
                              hoverColor: Colors.grey,

                              // fillColor: Colors.white,
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
                  child: Container(
                    margin: EdgeInsets.only(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.check_circle,
                            size: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.only(
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              // border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          // padding: EdgeInsets.symmetric(),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              onChanged: (value) {
                                searchFieldController.destinationAssigned =
                                    false;
                                searchFieldController.searchPredictions(
                                    value, 2);
                              },
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                isDense: true,
                                hintText: "Where next ?",
                                hintStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),

                                // fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
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
    );
  }
}

import 'dart:convert';
import 'package:custom_uber/AppPages/AppPage-1/DataModels/Predictions.dart';
import 'package:custom_uber/AppPages/AppPage-1/DataModels/RouteDataModel.dart';
import 'package:custom_uber/AppPages/AppPage-1/DataModels/mapsKey.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/PolyLineController.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/RouteDataGetter.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/SessionToken.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SearchFieldController extends GetxController {
  // static String searchQuery;

  FinalAddressPicked pickup;

  FinalAddressPicked destination;

  //this is true if the user has successfully entered the pickupPoint .
  bool pickupAssigned = false;

  //this is true if the user has successffuly selected the destination address.
  bool destinationAssigned = false;

  //instance of List<predictions> to store the list of data ( converted into instance of class Prediction through the searchPredictions function)
  //and use the data in it to view suggestion of places to users.
  List<Predictions> finalPredictionsList = [];

  //this Instantiates the PlaceDetails class to store the selected place ( Location selected by the user during searching. ) details .
  PlaceDetails placeDetails;

  //function to update finalPredictableList with new values and update the getBuilder to build the widget with updated variables.
  void listSetter(List<Predictions> list) {
    finalPredictionsList = list;
    update();
  }

  //this functions assigns the placeDetails field to the argument it takes as well as updates the getbuilder about it .
  void detailsSetter(PlaceDetails details) {
    placeDetails = details;
    update();
  }

  //this function uses the url to get json response from google maps about candidates for the search predictions based on the searchQuery variable it
  //takes as an argument , it also decodes the reponse and gets the usefull data about candidate places from it with the help of Predictions class and puts all the candidates
  //in a list and calls the listSetter function which assigns this list to finalPredictionsList and updates the getBuilder listening to it.

  // Future<List<Predictions>>
  void searchPredictions(String searchQuery, int index) async {
    // var response = https://maps.googleapis.com/maps/api/place/autocomplete/json?input=1600+Amphitheatre&key=<API_KEY>&sessiontoken=1234567890

    //checks if searchQuery length is more than 1.
    if (searchQuery.length > 1) {
      //url to make the request to googleMaps API.
      var urlString =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery}&key=$mapKey&sessiontoken=${SessionTokenGenerator.getToken()}";

      //this makes request to the url and waits for it to get a response from the GoogleServers .
      var response = await http.get(urlString);

      //this works on the reponse recieved and decodes it into a instance of class Map to be used further.
      Map<String, Object> responseData = jsonDecode(response.body);

      //this checks if the responseData has status = OK to confirm that the reponse recieved has no problems in it.
      if (responseData["status"] == "OK") {
        //this assigns the predictions data inside the reponse to predictions variable .
        var predictions = responseData["predictions"];

        //this works on the data inside predictions variable to convert its data into a list of class Predictions and assigns it to variable predictionsList.
        var predictionsList = (predictions as List)
            .map((e) => Predictions.fromJson(e, index))
            .toList();

        //call to listSetter function.
        listSetter(predictionsList);

        // return predictionsList;
      }
    }
  }

  void saveSelectedPlaceDetails(
      {String placeID, int index, int typeindex, LatLng latLng}) {
    if (index == 1) {
      pickupAssigned = true;
    }
    if (index == 2) {
      destinationAssigned = true;
    }

    if (typeindex == 1 && index == 1) {
      pickup = FinalAddressPicked.asPlaceID(placeAsID: placeID);
    }

    if (typeindex == 1 && index == 2) {
      destination = FinalAddressPicked.asPlaceID(placeAsID: placeID);
    }

    if (typeindex == 2 && index == 1) {
      pickup = FinalAddressPicked.asLatLng(placeAsLatLng: latLng);
    }

    if (typeindex == 2 && index == 2) {
      destination = FinalAddressPicked.asLatLng(placeAsLatLng: latLng);
    }
  }

//  Future<List<LatLng>>

  RouteDataModel routeData;
  void getroutedata(
      FinalAddressPicked pickup, FinalAddressPicked destination) async {
    if (destinationAssigned == true && pickupAssigned == true) {
      if (pickup.placeAsID != null) {
        if (destination.placeAsID != null) {
          routeData = await RouteDataGetter.routeWithBothPlaceID(
              pickup.placeAsID, destination.placeAsID);

          List<LatLng> polylineList =
              RouteDataGetter.polylineDecoder(routeData);

          Get.find<PolylineController>().polylineGetter(polylineList);
        }
      }
    }
  }

  void fareCalculater({
    RouteDataModel routeDetails,
  }){
    
  }
}

class PlaceDetails {
  double lat;
  double lng;
  String placeName;
  String placeID;
}

class FinalAddressPicked {
  LatLng placeAsLatLng;
  String placeAsID;

  FinalAddressPicked.asLatLng({this.placeAsLatLng});
  FinalAddressPicked.asPlaceID({this.placeAsID});
}

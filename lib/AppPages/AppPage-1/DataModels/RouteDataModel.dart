class RouteDataModel {
  String distanceText;
  String durationText;
  int distanceValue;
  int durationValue;
  String encodedPoints;

  RouteDataModel({
    this.distanceText,
    this.distanceValue,
    this.durationText,
    this.durationValue,
    this.encodedPoints,
  });
  
  RouteDataModel.fromJson(Map<String,dynamic> response){
    RouteDataModel routeData = RouteDataModel();

    var responseResults = response["routes"][0];

    routeData.distanceText = responseResults["legs"][0]["distance"]["text"];
    routeData.durationText = responseResults["legs"][0]["duration"]["text"];
    routeData.distanceValue = responseResults["legs"][0]["distance"]["value"];
    routeData.durationValue = responseResults["legs"][0]["duration"]["value"];
    routeData.encodedPoints = responseResults["overview_polyline"];
  }
}

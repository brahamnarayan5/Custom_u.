///this is a simple class which holds placeId , description and main name which it takes from
///the json reponse someother class gets from the google server .
///this class also has a Predictions.fromJson constructor which takes a response of type
///Map<String,dynamic> and uses it to get the values for its variables .
class Predictions {
  var placeId;
  var description;
  var mainName;
  int index;

  Predictions({
    this.description,
    this.mainName,
    this.placeId,
    this.index,
  });

  Predictions.fromJson(Map<String, dynamic> json , this.index) {
    description = json["description"];
    mainName = json["structured_formatting"]["main_text"];
    placeId = json["place_id"];
  }
}

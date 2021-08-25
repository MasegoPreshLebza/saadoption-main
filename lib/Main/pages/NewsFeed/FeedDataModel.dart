class FeedDataModel{
  int id;
  String name;
  String imageURL;
  String description;
  String date;

  FeedDataModel(
      {this.id,
        this.name,
        this.imageURL,
        this.description,
        this.date,
      });

  FeedDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    imageURL = json['imageUrl'];
    description = json['description'];
    date = json['date'];
  }
}
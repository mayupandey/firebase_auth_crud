import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String name;
  String description;
  String imageurl;
  String id;
  DocumentReference reference;

  Post({this.name,this.description,this.reference,
    this.imageurl,this.id});
  Post.fromMap(Map<String, dynamic> map, {this.reference}) {
    name = map["name"];
    description=map["description"];
    imageurl=map["imageurl"];

    id =map["id"];
  }

 Post.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'name': name,'description':description,'imageurl':imageurl,"id":id};
  }
}
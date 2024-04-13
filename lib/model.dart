import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Album {
  String? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl
    };
  }
}
 
class AlbumService{
  Future<List<Album>> getData()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Album.fromJson(e)).toList();
    }else{
      throw Exception('HTTP Failed');
    }
  }
}
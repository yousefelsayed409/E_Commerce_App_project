// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  int? id;
  String? url;
  String? title;

  CategoryModel({this.id, this.url, this.title});

  CategoryModel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
   url =  data['image'];
   title =data['name'];
  }
}
 

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModels {
  int? id;
  String? url;
  String? title;

  CategoryModels({this.id, this.url, this.title});

  CategoryModels.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
   url =  data['image'];
    
   title =data['name'];
  }
}
 

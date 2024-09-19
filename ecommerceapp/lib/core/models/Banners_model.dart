// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModels {
  int? id;
  String? url;
 

  BannerModels.fromjson({required Map<String, dynamic> data}) {
    id =data['id'];
   url =data['image'];
  }
}

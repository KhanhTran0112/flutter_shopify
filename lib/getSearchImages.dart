import 'package:http/http.dart' as http;

Future<List> searchImg(url) async{
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq = [];
  var collection = data.split('<div class="grid__item grid__item--desktop-up-third"');
  for(int i = 1 ; i < collection.length ; i++){
    String url = collection[i].split('<div class="ratio-box"')[0].split('<a class="photo-tile__image-wrapper"')[1];
    url = url.split('">')[0].split('href="')[1];

    String linkImages = collection[i].split('" data-category-handle="')[0].split('<img sizes="100vw"')[1];
    linkImages = linkImages.split(' 2x')[0].split(' 1x, ')[1];
    kq.add({
      'linkImages':linkImages,
      'url':url
    });
    print(linkImages);
  }
  return kq;
}
Future<List> searchImg2(url) async{
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq = [];
  var collection = data.split('<div class="scrollable-carousel__item"');
  for(int i = 1 ; i < collection.length ; i++){
    String name = collection[i].split('</h4>')[0].split('<h4 class="tile__link-overlay__heading heading--5">')[1];
    String linkImages = collection[i].split(');"></div>')[0].split('style="background-image: url(')[1];
    String url = collection[i].split('<h4 class="tile__link-overlay__heading heading--5"')[0].split('<a class="tile__link-overlay"')[1];
    url = url.split('">')[0].split('href="')[1];
    kq.add({
      'name':name,
      'linkImages':linkImages,
      'url':url,
    });
  }
  return kq;
}
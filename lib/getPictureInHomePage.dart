import 'package:http/http.dart' as http;

Future<List> homePage() async{
  final String url = 'https://burst.shopify.com/';
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq = [];
//  .split('')[0].split('')[1];
  var topFree = data.split('<div class="scrollable-carousel__item scrollable-carousel__photo"');
  for (int i = 1; i < topFree.length; i++){
    String urlTopFree = topFree[i].split('class="scrollable-carousel__photo__image js-track-photo-stat-view js-track-photo-stat-click lazyload"')[0].split('<a class="scrollable-carousel__photo__link"')[1];
    urlTopFree = urlTopFree.split(' 2x" ')[0].split(' 1x, ')[1];
    String linkImages = topFree[i].split('<img sizes="100vw" data-srcset')[0].split('<a class="scrollable-carousel__photo__link"')[1];
    linkImages = linkImages.split('">')[0].split('href="')[1];
    String title = topFree[i].split('" data-photo-id="')[0].split('data-photo-title="')[1];

    kq.add({
      'name':title,
      'linkImages':linkImages,
      'urlTopFree': urlTopFree,
    });
  }
  return kq;
}
Future<List> homePage1() async{
  final String url = 'https://burst.shopify.com/';
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq1 = [];
  var collection = data.split('<div class="tile gutter-bottom"');
  for (int i = 1; i < collection.length; i++){
    String urlCollection = collection[i].split('class="tile__photo lazyload"')[0].split('<div class="tile__background tile__image"')[1];
    urlCollection = urlCollection.split(' 2x" src="')[0].split('1x, ')[1];
    String name = collection[i].split('</h2>')[0].split('<h2 class="tile__link-overlay__heading heading--4"')[1];
    name = name.split('>')[1];
    String link = collection[i].split('<h2 class="tile__link-overlay__heading heading--4"')[0].split('<a class="tile__link-overlay"')[1];
    link = link.split('">')[0].split('href="')[1];
    kq1.add({
      'link':link,
      'urlCollection':urlCollection,
      'name':name,
    });

  }
  return kq1;
}
import 'package:http/http.dart' as http;

Future<List> getInforImage(url) async{
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq = [];
  //  .split('')[0].split('')[1];

  var title = data.split('<div class="photo__download"')[0].split('<div class="photo__info"')[1];
  String name = title.split('</h1>')[0].split('<h1 class="heading--4">')[1];
  title = title.split('</p>')[0].split('<p>')[1];

  var linkImages = data.split('class="photo__image lazyload"')[0].split('<div class="ratio-box"')[1];
  linkImages = linkImages.split(' 2x" src="')[0].split(' 1x, ')[1];
  kq.add({
    'linkImages':linkImages,
    'name':name,
    'title':title,
  });
  print(data);
  return kq;
}

Future<List> getInforImage1(url) async{
  var reponse =await http.get(Uri.encodeFull(url), headers: {'Accept': 'Application/json'});
  var data = reponse.body;
  var kq = [];
  //  .split('')[0].split('')[1];

  var listImages = data.split('<div class="scrollable-carousel__item scrollable-carousel__photo"');
  for (int i = 1; i < listImages.length; i++){
    String urlImages = listImages[i].split('<img sizes="100vw" data-srcset="')[0].split('<a class="scrollable-carousel__photo__link"')[1];
    urlImages = urlImages.split('">')[0].split('href="')[1];
    String linkImages = listImages[i].split('" data-photo-title="')[0].split('<img sizes="100vw" data-srcset="')[1];
    linkImages = linkImages.split(' 2x')[0].split('1x, ')[1];
    print(linkImages);
    kq.add({
      'urlImages':urlImages,
      'linkImages':linkImages,
    });
  }
  return kq;
}



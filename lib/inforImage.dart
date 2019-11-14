import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'getInforImages.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InforImages extends StatefulWidget {
  String urlImages;

  InforImages(this.urlImages);

  @override
  _InforImagesState createState() => _InforImagesState(urlImages);
}

class _InforImagesState extends State<InforImages> {
  String urlImages;

  _InforImagesState(String urlImages) {
    this.urlImages = urlImages;
  }

  List kq1;
  List kq2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInforImage('https://burst.shopify.com/${widget.urlImages}').then((aa) {
      setState(() {
        kq1 = aa;
      });
    });

    getInforImage1('https://burst.shopify.com/${widget.urlImages}').then((aa) {
      setState(() {
        kq2 = aa;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Images'),
      ),
      body: ListView(
        children: <Widget>[
          kq1 != null
              ? Container(
                  child: Column(
                      children: List.generate(kq1.length, (i) {
                    final _cachedImage = new CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: '${kq1[i]['linkImages']}',
                    );
                    return new Column(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(0.5),
                          height: 300.0,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: _cachedImage,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(
                            '${kq1[i]['name']}',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(
                            '${kq1[i]['title']}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        new SizedBox(
                          width: 250.0,
                          child: new RaisedButton(
                            color: Colors.blue,
                            onPressed: () {},
                            child: new Text(
                              'Download free photo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
                )
              : new Center(
                  child: new Text(
                    'Loading...',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
          kq2 != null
              ? CarouselSlider(
                  autoPlay: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.4,
                  enlargeCenterPage: true,
                  items: List.generate(kq2.length, (i) {
                    final _cachedImage = new CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: '${kq2[i]['linkImages']}',
                    );
                    return InkWell(
                      child: new Container(
                        width: 380.0,
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: _cachedImage,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InforImages('${kq2[i]['urlImages']}')));
                      },
                    );
                  }),
                )
              : new Center(
                  child: new Text(
                    'Loading...',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
        ],
      ),
    );
  }
}

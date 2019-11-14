import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'getSearchImages.dart';
import 'inforImage.dart';

class searchImages extends StatefulWidget {
  String string;

  searchImages(this.string);
  @override
  _searchImagesState createState() => _searchImagesState(string);
}

class _searchImagesState extends State<searchImages> {
  String string;
  _searchImagesState(String string) {
    this.string;
  }

  List kq1;
  List kq2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchImg(
            'https://burst.shopify.com/photos/search?utf8=✓&q=${widget.string.replaceAll(' ', '+')}&button=')
        .then((aa) {
      setState(() {
        kq1 = aa;
      });
    });
    searchImg2(
            'https://burst.shopify.com/photos/search?utf8=✓&q=${widget.string.replaceAll(' ', '+')}&button=')
        .then((aa) {
      setState(() {
        kq2 = aa;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Search: ${widget.string.trim()}'),
      ),
      body: new ListView(
        children: <Widget>[
          kq1 != null
              ? Container(
                  padding: EdgeInsets.all(6.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: new Column(
                            children: <Widget>[
                              Wrap(
                                runSpacing: 2.0,
                                spacing: 2.0,
                                children: List.generate(kq1.length, (i) {
                                  final _cachedImage = new CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: '${kq1[i]['linkImages']}',
                                  );
                                  return InkWell(
                                    child: (i % 2 == 0)
                                        ? Container(
                                            width: 200.0,
                                            height: 130.0,
                                            child: _cachedImage,
                                          )
                                        : Container(),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InforImages(
                                                  '${kq1[i]['url']}')));
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Column(
                          children: <Widget>[
                            Wrap(
                              runSpacing: 2.0,
                              spacing: 2.0,
                              children: List.generate(kq1.length, (i) {
                                final _cachedImage = new CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: '${kq1[i]['linkImages']}',
                                );
                                return InkWell(
                                  child: (i % 2 != 0)
                                      ? Container(
                                          width: 200.0,
                                          height: 130.0,
                                          child: _cachedImage,
                                        )
                                      : Container(),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InforImages(
                                                '${kq1[i]['url']}')));
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
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

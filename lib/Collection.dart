import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'getCollection.dart';
import 'inforImage.dart';

class viewCollection extends StatefulWidget {
  String url;
  String name;

  viewCollection(this.url, this.name);
  @override
  _viewCollectionState createState() => _viewCollectionState(url, name);
}

class _viewCollectionState extends State<viewCollection> {
  String url;
  String name;

  _viewCollectionState(String url, String name) {
    this.url;
    this.name;
  }
  List kq1;
  List kq2;
  List kq3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewimageConlection('https://burst.shopify.com/${widget.url}').then((aa) {
      setState(() {
        kq1 = aa;
      });
    });

    viewimageConlection1('https://burst.shopify.com/${widget.url}').then((aa) {
      setState(() {
        kq2 = aa;
      });
    });
    viewimageConlection2('https://burst.shopify.com/${widget.url}').then((aa) {
      setState(() {
        kq3 = aa;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.name}'),
      ),
      body: new ListView(children: <Widget>[
        kq1 != null ? Container(
                child: new Column(
                  children: List.generate(
                    kq1.length,
                    (i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('${kq1[i]['name']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            new Text(
                              '${kq1[i]['title']}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            : new Center(
                child: new Text(
                  'Loading...',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            'Popular',
            style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold),
          ),
        ),
        kq2 != null ? Container(
                height: 75.0,
                padding: EdgeInsets.only(left: 6.0, top: 6.0, bottom: 6.0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(kq2.length, (i) {
                    final _cachedImage = new CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: '${kq2[i]['linkImages']}',
                    );
                    return InkWell(
                      child: Stack(
                        alignment: Alignment(0, 0),
                        children: <Widget>[
                          new Container(
                            width: 180,
                            padding: EdgeInsets.only(right: 6.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: _cachedImage),
                          ),
                          new Text(
                            '${kq2[i]['name']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => viewCollection('${kq2[i]['url']}', '${kq2[i]['name']}')));
                      },
                    );
                  }),
                ),
              )
            : new Center(
                child: new Text(
                  'Loading...',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
        kq3 != null? Container(
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
                              children: List.generate(kq3.length, (i) {
                                final _cachedImage = new CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: '${kq3[i]['linkImages']}',
                                );
                                return InkWell(
                                  child: (i%2==0)?Container(
                                    width: 200.0,
                                    height: 130.0,
                                    child: _cachedImage,
                                  ):Container(),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => InforImages('${kq3[i]['url']}')));
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
                            children: List.generate(kq3.length, (i) {
                              final _cachedImage = new CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: '${kq3[i]['linkImages']}',
                              );
                              return InkWell(
                                child: (i%2!=0)?Container(
                                  width: 200.0,
                                  height: 130.0,
                                  child: _cachedImage,
                                ):Container(),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InforImages('${kq3[i]['url']}')));
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              )
            : new Center(
                child: new Text(
                  'Loading...',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'getPictureInHomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Collection.dart';
import 'search.dart';
import 'inforImage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burst by Shopify',
      home: MyHomePage(title: 'Burst by Shopify'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data1;
  List kq;

  String search;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage().then((aa){
      setState(() {
        data1=aa;
      });
    });
    homePage1().then((aa){
      setState(() {
        kq=aa;
      });
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new ListView(
          children: <Widget>[
            new Stack(
              alignment: Alignment(0, 2.0),
              children: <Widget>[
                new Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/hoahong.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                new Container(
                  height: 200.0,
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Free stock photos for websites and commercial use',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      new Text(
                        'Download free, high-resolution images',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      new Container(
                        decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 240, 240, 240),
                            border: new Border.all(
                                width: 1.2, color: Colors.black12),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0))),
                        child: new TextField(
                          //keyboardType: TextInputType.text,
                          //autocorrect: false,
                          decoration: new InputDecoration(
                            hintText: "Search free photos",
                            contentPadding: new EdgeInsets.all(12.5),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search),
                          ),
                          onSubmitted: (search){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => searchImages(search)));
                          },
                          onChanged: (text){
                            search = text;
                            print(search);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Top free pics this week",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      border: Border.all(width: 1.0),
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),

            data1!=null?Container(
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(data1.length, (i) {
                  final _cachedImage = new CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl: '${data1[i]['urlTopFree']}',
                  );
                  return InkWell(
                    child: Container(
                      padding: EdgeInsets.only(left: 6.0),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: _cachedImage,
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InforImages('${data1[i]['linkImages']}')));
                    },
                  );
                }),
              ),
            ):new Center(child: new Text('Loading...', style: TextStyle(fontSize: 20.0),),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Browse high-resolution photo collections",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      border: Border.all(width: 1.0),
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
            kq!=null?CarouselSlider(
              autoPlay: true,
              viewportFraction: 0.9,
              aspectRatio: 2.4,
              enlargeCenterPage: true,
              items: List.generate(kq.length, (i) {
                final _cachedImage = new CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${kq[i]['urlCollection']}',
                );
                return Stack(
                  alignment: const Alignment(0, 0),
                  children: <Widget>[
                    InkWell(
                      child: new Container(
                        width: 380.0,
                        padding:
                        EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: _cachedImage,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>viewCollection('${kq[i]['link']}', '${kq[i]['name']}')));
                      },
                    ),
                    new Container(
                      color: Colors.black38,
                      child: new Text(
                        '${kq[i]['name']}',
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    )
                  ],
                );
              }),
            ):
            new Center(child: new Text('Loading...', style: TextStyle(fontSize: 20.0),),),
          ],
        ));
  }
}
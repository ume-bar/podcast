import 'package:flutter/material.dart' ;
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  

  

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.white,
            ]),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NHK NEWS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }  
  }

@override
void initState() {
    //アプリ起動時に一度だけ実行される
  initState();


  Future(() async{
    var url = Uri.parse('http://www.nhk.or.jp/rj/podcast/rss/english.xml');
    print(await http.read(url));
    var response = await http.read(url);
    var document = XmlDocument.parse(response);
    final enclosures = document.findAllElements('enclosure');
    print(enclosures);
    enclosures.first.getAttribute("url");
    print(enclosures.first.getAttribute("url"));

  });
  }     
  

      

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
    
        
      ),
      body: Center(
  
        child: Column(
   
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 45.0,
                    color: Colors.black,
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                    ),
                  ),
                  IconButton(
                    iconSize: 62.0,
                    color: Colors.black,
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                    ),
                  ),
                    IconButton(
                    iconSize: 45.0,
                    color: Colors.black,
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                    ),
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }


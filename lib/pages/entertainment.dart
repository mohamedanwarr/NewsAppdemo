import 'package:flutter/material.dart';
import 'package:newsappcourse/nework/busnisses.dart';

import '../details_news page.dart';
import '../model/busness.dart';

class entertainmentpage extends StatefulWidget {
  @override
  State<entertainmentpage> createState() => _entertainmentpageState();
}

class _entertainmentpageState extends State<entertainmentpage> {
  Future <business> ? news;

  void initState() {
    super.initState();
    news=networkapi.fetchbusiness( URL: 'https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=74587a67db6c4be6a27571bdb04de140') as Future<business>? ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<business>(
          future: news,
          builder: ( context, AsyncSnapshot <business> snapshot ){
            if(snapshot.hasData){
              return   ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),

                     child: GestureDetector(
                      onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailnews("${snapshot.data!.articles![index].url}") ));
                    });
                  },
                      child: Card(
                        color: Colors.blueGrey.shade900,
                        child: Column(
                          children: [
                            Image.network( "${snapshot.data!.articles![index].urlToImage}"),
                            SizedBox(height: 20,),
                            Text("${snapshot.data!.articles![index].title}",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return CircularProgressIndicator();
            }
          }
      ),
    );
  }
}
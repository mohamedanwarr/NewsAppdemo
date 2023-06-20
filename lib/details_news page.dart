import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';


class Detailnews extends StatefulWidget {
  final String url;
  const Detailnews(this.url, {Key? key}) : super(key: key);

  @override
  State<Detailnews> createState() => _DetailnewsState();
}

class _DetailnewsState extends State<Detailnews> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  final _key = UniqueKey();

  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
      backgroundColor: Colors.blueGrey.shade900,
      title: Text("News Detail"),
    ) ,
      body: _isError
          ? const AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(24, 30, 24, 30),
        content:
        Text("Oops.. Looks like there's no\n    internet connection"),
      )
          : Center(
        child: WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
          onWebResourceError: (error) {
            setState(() {
              _isError = true;
            });
          },
          onPageFinished:(url){
            print("finished");
            // _controller.runJavascript(
            //     "document.getElementsByTagName('header')[0].style.display='none'");
            // _controller.runJavascript(
            //     "document.getElementsByTagName('footer')[0].style.display='none'");
          } ,
          onWebViewCreated: (WebViewController webViewController) async {
            _controller.complete(webViewController);

            // await _controller.runJavascript(
            //    "document.getElementsByTagName('header')[0].style.display='none'");
          },
        ),
      ),

    );
  }
}
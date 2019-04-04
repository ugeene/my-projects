import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _DashBoard();
  
}

class _DashBoard extends State<DashBoard> {

  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            _buildTextComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer(){
    return new Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Row(
        children: <Widget>[
          new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: 'Send a Message'
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      )
    );
  }
  
  void _handleSubmitted(String text){
    _textController.clear();
  }



}
import 'package:flutter/material.dart';

void main(){
  runApp(new FriendlyChat());
}

class FriendlyChat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendly Chat",
      home: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("Friendly Chat AppBar"),
      ),
    // body: _buildTextComposer(),
     body: new Column(
       children: <Widget>[
         new Flexible(
             child: new ListView.builder(
                 padding: new EdgeInsets.all(8.0),                     //new
                 reverse: true,
                 itemBuilder: (_, int index) => _messages[index],
                 itemCount: _messages.length,
             ),
         ),
         new Divider(height: 1.0),
         new Container(
           decoration: new BoxDecoration(
              color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
         ),
       ],
     )
   ); }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage chatMessage = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
                hintText: "Send a message"),
          ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed:() => _handleSubmitted(_textController.text))
          )
        ],
      )
    );
  }
}

class ChatMessage extends StatelessWidget{
  /*Constructor*/
  ChatMessage({this.text});
  final String text;

  final String _name = "Pooja";

  @override
  Widget build(BuildContext context) {
      return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0]))
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name,
                style: Theme.of(context).textTheme.subhead,
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )

              ],
            )
          ],
        )
      );
  }

}


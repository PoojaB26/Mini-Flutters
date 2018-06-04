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

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

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
                padding: new EdgeInsets.all(8.0),
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
    setState(() {                                                    //new
      _isComposing = false;                                          //new
    });
    ChatMessage chatMessage = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
      new Flexible(child: new TextField(
        controller: _textController,
        onChanged: (String text){
          setState(() {
            _isComposing = text.length>0;
          });
        },
        onSubmitted: _handleSubmitted,
        decoration: new InputDecoration.collapsed(
            hintText: "Send a message"),
      ),
    ),
    new Container(
    margin: new EdgeInsets.symmetric(horizontal: 4.0),
    child: new IconButton(
    icon: new Icon(Icons.send),
    onPressed: _isComposing
    ? () => _handleSubmitted(_textController.text): null,                                           //modified
                ),
             )
          ],
       )
    );
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget{
  /*Constructor*/
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;                   //new


  final String _name = "Pooja";

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container(
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
                    ),


                  ],
                )
              ],
            )

        )
    );
  }

}


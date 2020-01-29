import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/contacts/contact-item.widget.dart';
import 'package:frontend/models/contact.model.dart';

class MessageList extends StatefulWidget {
  @override
  MessageListState createState() {
    return new MessageListState();
  }
}

class MessageListState extends State<MessageList> {

  // The GlobalKey keeps track of the visible state of the list items
  // while they are being animated.
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  // backing data
  List<Contact> contacts = List.generate(15, (index) {
    return Contact("name{$index}",
        "lastMessage hello my name is yasser and i like to dance and i like to dance {$index}",
        "https://picsum.photos/250?image=${index + 320}", "id{$index}",
        "$index");
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stumble', style: TextStyle(fontFamily: 'Milkshake', fontSize: 40),),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 167, 79, 1),
        actions: <Widget>[

          IconButton(
            iconSize: 40,
            disabledColor: Colors.white,
            icon: Icon(Icons.perm_identity),
          ),

        ],
      ),
      body: Center(

        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactItem(contacts[index], () {
              setState(() => contacts.remove(contacts[index]));
            });
          },
        ),
      ),
    );
  }
}
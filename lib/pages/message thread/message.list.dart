import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/message thread/Contact.dart';
import 'package:frontend/pages/start/animations.dart';

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
  List<Contact> contacts = List.generate(4, (index) {
    return Contact("name{$index}", "lastMessage hello my name is yasser and i like to dance and i like to dance {$index}", "https://picsum.photos/250?image=${index+320}", "id{$index}", "$index");
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stumble', style: TextStyle(fontFamily: 'Milkshake', fontSize: 40),),
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

              return _buildItem(contacts[index]);
              },
          ),
      ),
    );
  }

  // This is the animated row with the Card.
  Widget _buildItem(Contact contact) {
   return Container(
     height: 80,
      child: GestureDetector(
        onDoubleTap: (){
        },
        onTap: () {
          Map data = new Map<String, dynamic>();
          data["id"] = contact.id;
          //Method to go to next page

        },
        child: Dismissible(
          direction: DismissDirection.endToStart,
            // ignore: missing_return
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                final bool res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Are you sure you want to delete " + contact.name + "?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Unmatch",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              // TODO: Delete the item from DB etc..
                              setState(() {
                                contacts.remove(contact);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return res;
              } else {
                // TODO: Navigate to edit page;
              }
            },
            background: slideLeftBackground(),

          key: UniqueKey(),

            child: Container(
              child: Row(
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(

                          padding: EdgeInsets.only(right: 10, left: 10),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.network(contact.photo, height: 60, width: 60,),

                          ),
                        )
                      ]
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children: <Widget>[
                            Padding(
                                child: Text(contact.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.start,),
                                padding: EdgeInsets.only(top: 5, left: 2)
                            ),
                          ]
                      ),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(

                                child: Text(contact.lastMessage.length > 3 ? '${contact.lastMessage.substring(0, 40)}...' : contact.lastMessage),
                                padding: EdgeInsets.only(top: 5, left: 2)
                            ),
                          ]
                      ),
                    ],
                  ),

                  Spacer(),

                  int.parse(contact.unread) > 0 ? unreadIcon(context, contact) : SizedBox.shrink(),

                ],
              ),
            )
        ),
      ),
    );
  }

  Widget unreadIcon(BuildContext context, Contact contact) {
    return Stack(
      children: <Widget>[
        Icon(Icons.brightness_1, color: Colors.green, size: 30,),
        Padding(
          padding: EdgeInsets.only(left: 11, top: 6),
          child: Text(contact.unread, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ],
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            Text(
              "Unmatch",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }





}




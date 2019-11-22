import 'package:flutter/material.dart';
import 'package:frontend/pages/contacts/contact.model.dart';

class ContactItem extends StatelessWidget {

  final Contact contact;
  final VoidCallback callback;

  ContactItem(this.contact, this.callback);

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 80,
        child: GestureDetector(
          onTap: () {
            Map data = new Map<String, dynamic>();
            data["id"] = contact.id;
            //Method to go to next page
          },
          child: Dismissible(
              key: UniqueKey(),
              background: _slideLeftBackground(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  callback();
                  return true;
                } else return false;
              },
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: Image.network(contact.photo, height: 60, width: 60,),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            child: Text(contact.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.start,),
                            padding: EdgeInsets.only(top: 5, left: 2)
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 2),
                          child: Text(contact.lastMessage.length > 3 ? '${contact.lastMessage.substring(0, 40)}...' : contact.lastMessage),
                        ),
                      ],
                    ),

                    Spacer(),

                    int.parse(contact.unread) > 0 ? _unreadIcon(context, contact) : SizedBox.shrink(),
                  ],
                ),
              )
          ),
        ),
      );
  }

  Widget _unreadIcon(BuildContext context, Contact contact) {
    return Stack(
      children: <Widget>[
        Icon(Icons.brightness_1, color: Colors.green, size: 30),
        Padding(
          padding: EdgeInsets.only(left: 11, top: 6),
          child: Text(contact.unread, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ],
    );
  }

  Widget _slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.cancel, color: Colors.white),
            Text("Unmatch",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
              )
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class Contact
{
  String name;
  String lastMessage;
  String photo;
  String id;
  String unread;
  
  Contact(this.name, this.lastMessage, this.photo, this.id, this.unread);

  factory Contact.fromJson(Map<String, dynamic> json)
  {
    return Contact(
      json['name'],
      json['lastMessage'],
      json['photo'],
      json['id'],
      json['unread']
    );
  }
}


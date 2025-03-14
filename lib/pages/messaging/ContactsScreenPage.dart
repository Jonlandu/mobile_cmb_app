import 'package:badges/badges.dart';
import 'package:cmb_app/pages/messaging/widgets/CircularImage.dart';
import 'package:flutter/material.dart';

import 'Conversation.dart';

class ContactsScreenPage extends StatefulWidget {
  @override
  _ContactsScreenPageState createState() => _ContactsScreenPageState();
}

class _ContactsScreenPageState extends State<ContactsScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/DSC_0515.jpg"),
                            ),
                          ),

                          Positioned(
                              right: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white, width: 3)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Text("+9", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                                ),
                              ))
                        ],
                      ),

                      Text("Chats", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.camera_alt, color: Colors.black,),
                      ),

                      SizedBox(width: 10,),

                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.edit, color: Colors.black,),
                      )
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)
                ),
                width: MediaQuery.of(context).size.width - 40,
                child: Padding(
                  padding: const EdgeInsets.only(left:12),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: Icon(Icons.search)
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.add, size: 24, color: Colors.black),),
                  ),
                  CircularImage(
                    image: "DSC_0521.jpg",
                    status: true,
                    online: true,
                  ),
                  CircularImage(
                    image: "DSC_0753.jpg",
                    status: true,
                    online: true,
                  ),
                  CircularImage(
                    image: "DSC_0685.jpg",
                    status: false,
                    online: true,
                  ),
                  CircularImage(
                    image: "DSC_0521.jpg",
                    status: false,
                    online: true,
                  ),
                  CircularImage(
                    image: "DSC_0685.jpg",
                    status: false,
                    online: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Conversation(
              image: "DSC_0753.jpg",
              name: "Josué Nlandu",
              msg: "I want preachings of Bro. Moses Ntumba",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0418.jpg",
              name: "Ewald Frank Tujibikile Phines",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0521.jpg",
              name: "Jean Tshinga",
              msg: "I want preachings of Bro. Moses Ntumba",
              isRead: true,
            ),
            Conversation(
              image: "DSC_0685.jpg",
              name: "Léonard Bothas ",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0418.jpg",
              name: "Ewald Frank Tujibikile Phines",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0418.jpg",
              name: "Ewald Frank Tujibikile Phines",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0418.jpg",
              name: "Ewald Frank Tujibikile Phines",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
            Conversation(
              image: "DSC_0418.jpg",
              name: "Ewald Frank Tujibikile Phines",
              msg: "Salut Ma Soeur, nous n'avons pas encore...",
              isRead: false,
            ),
          ],
        ),
      ),
    );
  }
}
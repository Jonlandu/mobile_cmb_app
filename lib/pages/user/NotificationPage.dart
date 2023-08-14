import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> notifications = [
    "Exaucé vous a envoyé un message",
    "Josué a contacté votre article 'Ordinateur'",
    "Becker a partagé votre publication",
    "Aimée a répondu à votre message",
    "Vous avez créé(e) un article",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Notification'),
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(Icons.density_medium),
            )
          ]),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(15),
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.notifications, color: Colors.orange,),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notifications[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              "Il y a quelques minutes",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(child: Icon(Icons.more_horiz), onTap: (){},),
                    ],
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey[400],)
            ],
          );
        },
      ),
    );
  }
}

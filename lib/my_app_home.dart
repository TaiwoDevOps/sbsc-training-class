import 'package:flutter/material.dart';
import 'package:test_app/contact_me.dart';

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

    return Scaffold(
      backgroundColor: Colors.grey,
      //APP bar property for the top
      appBar: AppBar(
        //Title is for presenting the caption
        title: Text(
          "About Me",
          style: Theme.of(context).textTheme.headline1,
        ),
        //Using action to present widgets at the right side

        actions: [
          //Using a BUTTON Widget directly
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              print(
                  "Thank you for reaching out to us with that Business idea. We would get back to you shortly.");
            },
          ),

          // GestureDetector/ InkWell
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 16.0),
            child: GestureDetector(
              onTap: () {
                print("Thank you for the marketing. We won't pay you o.");
              },
              onDoubleTap: () {
                print("E don do......");
              },
              child: Icon(Icons.share),
            ),
          )
        ],
      ),
      //body: this is for holding or displaying the primary content of the scaffold
      //
      //Hafis --- set the height of the container and use that as the parent widget for Column
      body: Scrollbar(
        thickness: 14,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            //presenting widgets vertically
            children: [
              //This is the top segment of the content in our Body widget
              Row(
                children: [
                  //For showing images in the application
                  //Step 1) Add the assets to the application folder
                  //Step 2) Register the assets(eg Image) in the pubspec.yaml
                  //Step 3) Use the asset in the appropriate place (eg Image asset)
                  Container(
                    height: 95,
                    width: 95,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 23,
                          spreadRadius: -3,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage("assets/image/userProfile.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Fullname
                        //
                        //this is using the Inline styling and SPAN tags concept of web dev
                        RichText(
                            text: TextSpan(
                                text: "Full Name:",
                                style: Theme.of(context).textTheme.headline5,
                                children: [
                              TextSpan(
                                text: " Taiwo Adisa Joshua",
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ])),
                        SizedBox(height: 6),
                        //Contact Info
                        //
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                              text: "Contact Info: ",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: " 08122222222\n",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                TextSpan(
                                  text: "gbasgbos@gbs.com",
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //#endRegion
              //
              //
              SizedBox(height: 14),
              Divider(
                color: Colors.black,
                height: 4.0,
              ),

              //Description

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: RichText(
                  text: TextSpan(
                    text: "About Us \n",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: desc,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
              ),

              //STYlE out button
              ElevatedButton(
                child: Text(
                  'Let\'s Talk',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 30),
                ),
                onPressed: () {
                  //Navigating to another screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactMePage()));
                },
                style: Theme.of(context).elevatedButtonTheme.style,
              ),
              //Adeboye -- pad the button
              SizedBox(height: 40),
              //SANDRA,HAFIS, OLATUNDE---- it will the defined bg color COlors.grey
              // DAVID, SIMI PAM, AYODELE,ADEBOYE, ABDU,  ---- it will the defined bg color COlors.black
              // OLATUNDE ,HAFIS--- text color black
              // TAIWO,Fortune ---- BLUE
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbsc_todo_app/model/todo_model.dart';
import 'package:sbsc_todo_app/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        backgroundColor: customBackgroundColor,
        scaffoldBackgroundColor: customScaffoldBackgroundColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //Keep track of how many TODO we have
  List<TodoModelClass> todos = [];

  void _showInputFieldWidget(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        title: Text(
          "Create TODO",
          style: GoogleFonts.lateef(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          const SizedBox(height: 24),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: "Eg. Eat Food",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: descController,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "What is your TODO for",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  setState(() {
                    todos.add(TodoModelClass(
                      title: titleController.text,
                      description: descController.text,
                      dateTime: DateTime.now(),
                    ));
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "SAVE",
                style: GoogleFonts.lateef(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Media query helps us get the device SIZE (height, width) property
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 4,
            color: Colors.white,
            //Stack widget stacks widgets on top of each other
            child: Stack(
              children: [
                // first child of the stack
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1508558936510-0af1e3cccbab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80"),
                    ),
                  ),
                ),
                // second child
                // Positioned(
                //   bottom: 10,
                //   right: 4,
                //   child:
                // ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Don't stop when you are tired.\nStop when you are DONE!",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.lateef(
                      color: Colors.white,
                      height: .8,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
          ),
          //Todo list will appear here
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shadowColor: Colors.white,
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                todos[index].title,
                                style: GoogleFonts.lateef(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                //The Datetime comes as a Date time type, so we turned it to a string with the toString method and then we split to get the desired value
                                todos[index].dateTime.toString().split(" ")[0],
                                style: GoogleFonts.lateef(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Text(
                            todos[index].description,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lateef(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: () {
          // clear the controller value as soon as you tap on the FAB
          titleController.clear();
          descController.clear();
          _showInputFieldWidget(context);
        },
        tooltip: 'Add Todo',
        child: Icon(
          Icons.edit,
          size: 34,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Secret page app

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Decret page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int login;      //changes based on the data stored locally on disc file
String email ="";
String password="";

saveNamePreference(int slogin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("slogin", slogin);
}
getNamePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
int slogin = await prefs.getInt("slogin") ;
if(slogin==null){
  slogin=0;
}
setState(() {
  login=slogin;
});

}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
  getNamePreference();
  print(login);
    if(login==1){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.yellow[200],
              Colors.yellow[100],
            ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: Text("Welcome to my Secret Page"),
actions: <Widget>[

  Column(
      children: <Widget>[
        FlatButton.icon(icon: Icon(Icons.person), onPressed: () async{
          saveNamePreference(0);

//          setState(() {
//            login=1;
//          });
        },label: Text("Logout"),),
      ],
  )
],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.yellow[200],
                    Colors.yellow[100],
                  ]
              )
          ),
          child: Container(
            child: Card(
              color: Colors.yellow[50],
              margin: EdgeInsets.all(20.0),
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home.jpg"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Hey This is Aditi Deshmukh',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black
                        )
                      ),
                      SizedBox(height: 20,),
                      Text("I hope you liked my assignment.",
                      style: TextStyle(
                        fontSize: 20
                      )),
                      Text("App Description:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          )),
                      Text("When a person logs in to the system using any assumed credentials from your end, every time the app is opened even after clearing the app from recent apps it should go to the secret page.The secret page should have a logout button which when pressed logs the person out, from nowon every time the person opens the app login screen should open.",
                          style: TextStyle(
                              fontSize: 20
                          )),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );}
    else{








      return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.amber[900],
        ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        image: DecorationImage(
                            image: AssetImage('assets/login.jpg'),
                            
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextField(
                                  onChanged: (val){
                                    setState(() {
                                      email=val;
                                    });
                                  },

                                  decoration: InputDecoration(
                                      hintText: "Email Id",
                                      hintStyle: TextStyle(color: Colors.grey[800]),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: TextField(
                                  onChanged: (val){
                                    setState(() {
                                      password=val;
                                    });
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      focusColor: Colors.amber,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[800]),
                                    enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                        Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.amber)
                              ),

                              onPressed: ()  {
//                                if(email == "" && password == ""){

                              if(email == "abdeshmukh@gmail.com" && password == "abdeshmukh"){
                                saveNamePreference(1);
//                                setState(() {
//                                  login = 1;
//                                });
                              }
                              else{
                                saveNamePreference(0);
//                                setState(() {
//                                  login = 0;
//                                });
                              }
                            },
                              child: Center(
                                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                              elevation: 5,
                              color: Colors.amber,
                              textColor: Colors.white,
                              hoverElevation: 10,
                            ),
//                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),

                        SizedBox(height: 20,),
                        Text("Forgot Password?", style: TextStyle(color: Colors.amber[800],)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
  }
}

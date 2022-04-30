import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SignUp()));
}

class SignUp  extends StatefulWidget{
  _signUp createState() => _signUp();
}

class _signUp extends State {
  int radioValue = 0;
  double sliderValue = 0;
  bool switchValue = false;
  bool checkboxValue = false;

  final GlobalKey<ScaffoldState>sKey = GlobalKey<ScaffoldState>();

  void radioMethod(value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/google_play_100.png'),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(12.0),
                        child: Text("Name : ",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),)),
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter full Name",
                          labelText: "Full Name",
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Profession : ",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                                value: 1, groupValue: radioValue, onChanged: (
                                int? rv) {
                              radioMethod(rv);
                            }),
                            Text("Proffessional",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                                value: 2, groupValue: radioValue, onChanged: (
                                int? rv) {
                              radioMethod(rv);
                            }),
                            const Text("Student",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),


                Row(
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Rate your Self \nin Dart :",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )),
                     Slider(
                        value: sliderValue,
                        min: 0,
                        max: 5,
                        divisions: 5,
                        onChanged: (double dbVal) {
                          setState(() {
                            sliderValue = dbVal;
                          });
                        }),
                    Text(sliderValue.toString())
                  ],
                ),


                Row(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.all(12.0),
                        child: Text("Opt bormi",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )),
                    Switch(value: switchValue, onChanged: (bool? sv) {
                      setState(() {
                        switchValue = sv!;
                      });
                    })

                  ],
                ),
                Row(
                  children:  <Widget>[
                   Checkbox(value: checkboxValue, onChanged:(bool? cv){
                     setState(() {
                       checkboxValue=cv!;
                     });
                   }),
                 Padding(padding: EdgeInsets.all(12.0),
                        child: Text("I accept term and conditon",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),))

                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: RaisedButton(
                    onPressed: () {
                      sKey.currentState!.showSnackBar(const SnackBar(
                          content: Text("Hi! You Just Summited")));
                    },
                    color: Colors.deepPurpleAccent,
                    child: const Text("Submit Deails", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),


    );
  }
}

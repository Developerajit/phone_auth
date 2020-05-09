import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  String uid = '';
  @override
  void initState(){
    uid= '';
    FirebaseAuth.instance.currentUser().then((val){
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e){
      print(e);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('User'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('User Id : $uid'),
              SizedBox(height: 10,),
              new OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.blue, style: BorderStyle.solid, width: 3
                  ),
                  child: Text('Log out', style: TextStyle( color: Colors.blue),),
                  onPressed: (){
                    FirebaseAuth.instance.signOut().then((action){
                      Navigator.of(context)
                          .pushReplacementNamed('/landpage');
                    }).catchError((e){
                      print(e);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}


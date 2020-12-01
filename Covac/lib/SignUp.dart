import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hacko_vid/SignInPage.dart';
import 'BackdropExample.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key key}) : super(key: key);
  @override
_MyState createState() => _MyState();
}


 class _MyState extends State<SignUp>{


  bool checkbox_value1=false;
  String name;
  String email;
  String number;
  String aadhar;
  int age;
  int count_old=1;
  int count_old_health=1;
  int count_adult=1;
  int count_adult_health=1;
  int count_child=1;

  final db=Firestore.instance;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            SizedBox(
              height : 40.0,
            ),

            // Name 



            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
                onChanged: (value)
                {
                  name=value;
                },
            ),),



            // Adhar Card


            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.info),
                labelText: 'AADHAR',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
                onChanged: (value)
                {
                  aadhar=value;
                },
            ),),


            // Age

            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.date_range),
                labelText: 'Age',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
                onChanged: (value)
                {
                  age=int.parse(value);
                },
            ),),


            //check-box important


            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(12.0)
                
              ),
              child: Row(children: <Widget>[
              Checkbox(value: checkbox_value1,
            onChanged: (bool value){
              setState(() {
              checkbox_value1=value;
              });
            },),Text("Have Health Issues : Heart,Lungs,Dibetes",style:new TextStyle( color:Colors.black ,fontSize:12.0),),
            ],
          )
            ),
            ),
           
           
            // Email -id

            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
                onChanged: (value)
                {
                 email=value;
                },
            ),),


            // mobile


            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Mobile Number',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
                onChanged: (value)
                {
                 number=value;
                },
            ),),


            // password

            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
            ),),


            // password

            Padding(padding: EdgeInsets.symmetric(vertical:16.0 , horizontal : 16.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple,)
                ), border: OutlineInputBorder()   ,          ),
            ),),


            Padding(padding: EdgeInsets.symmetric( vertical:8.0,horizontal:16.0),
            child:MaterialButton(
              child: Text('Register Me..',style: TextStyle(color: Colors.white),),
              color: Colors.purple,
              minWidth: 500,
              height: 50,
              shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                        ),
              onPressed: ()async
              {
                _navigateToNextScreen2(context);


                //  Database Updation after registering


                if(age>55)
                {
                  if(checkbox_value1)
                  {
                    await db.collection("Old_Health").add(
                      {
                        'name':name,
                        'email':email,
                        'mobile':number,
                        'age':age,
                        'aadhar':aadhar,
                        'count':count_old_health++
                      }
                    );
                  }else
                  {
                    await db.collection("Old_Fine").add(
                      {
                        'name':name,
                        'email':email,
                        'mobile':number,
                        'age':age,
                        'aadhar':aadhar,
                        'count':count_old++,
                      }
                    );
                  }
                }


                // child

                if(age<16)
                {
                  
                    await db.collection("child").add(
                      {
                        'name':name,
                        'email':email,
                        'mobile':number,
                        'age':age,
                        'aadhar':aadhar,
                        'count':count_child++
                      }
                    );
                }

                //adult


                else if(age>16 && age<55)
                {
                  if(checkbox_value1)
                  {
                    await db.collection("adult_Health").add(
                      {
                        'name':name,
                        'email':email,
                        'mobile':number,
                        'age':age,
                        'aadhar':aadhar,
                        'count':count_adult_health++
                      }
                    );
                  }else
                  {
                    await db.collection("adult_Fine").add(
                      {
                        'name':name,
                        'email':email,
                        'mobile':number,
                        'age':age,
                        'aadhar':aadhar,
                        'count':count_adult++,
                      }
                    );
                  }
                }
              },
            )),
            Padding(padding: EdgeInsets.symmetric( vertical:8.0,horizontal:16.0),
            child:MaterialButton(
              child: Text('Already Registered',style: TextStyle(color: Colors.white),),
              color: Colors.purple,
              minWidth: 500,
              height: 50,
              shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                        ),
              onPressed: ()async
              {
                _navigateToNextScreen(context);
              },
            ))
          ]
        ),
        )
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
  }
void _navigateToNextScreen2(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BackdropExample()));
  }


}

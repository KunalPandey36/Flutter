import "package:flutter/material.dart";
import 'package:hacko_vid/BackdropExample.dart';

class SignInPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       body: Column(
         children: [
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets\corona-4942823_960_720.png"),),
               ),),),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                 
                 child: Column(
                   children: [
                     Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                     Text("Sign In",
                     style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
                   
                      ],
       ),
       Row(
         children: [
           Padding(padding: const EdgeInsets.only(right: 5),
           child: Icon(Icons.email,
           color: Colors.purple,
           ),),
           Expanded(
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Email"
               )),)
         ],
       ),
        Row(
         children: [
           Padding(padding: const EdgeInsets.only(right: 5),
           
           child: Icon(Icons.lock,
           color: Colors.purple,
           ),),
           Expanded(
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Password"
               )),)
         ],
       ),
       Spacer(),
       Padding(
        padding: EdgeInsets.only(bottom: 90),
       child: Container(
         padding: EdgeInsets.all(16),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.purple,
         ),
         child: IconButton(icon: new Icon(Icons.arrow_forward),
         onPressed:(){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BackdropExample(),
  ));
         },
         
         color: Colors.white,
         ),
       ),)
                   ],
               ), ),)
         ],),);
  }

  
}


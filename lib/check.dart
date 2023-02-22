// Created This File for Temporary To Modify Dialogue Box
import 'package:flutter/material.dart';

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.blue[200],
      // icon: Icon(Icons.add_alert),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      title: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              color: Color.fromARGB(255, 230, 185, 159),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.center,
          padding: EdgeInsets.all(3),
          width: double.infinity,
          child: Text(
            'titleText',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      content: Text(
        "titleText Click on 'Reset Game' to Restart Game..",
        style: TextStyle(
          color: Color.fromARGB(166, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      actions: [
        InkWell(
          onTap: (){},
          child: Center(
            child: Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Text(
                "Reset Game",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
        // ElevatedButton(
        //     style: ButtonStyle(),
        //     onPressed: () {
        //       return setState(() {
        //         startGame();
        //         Navigator.of(ctx).pop();
        //       });
        //     },
        //     child: Text(
        //       "Reset Game",
        //       style: TextStyle(fontSize: 20, color: Colors.blueGrey[100]),
        //     ))
      ],
    );
    ;
  }
}

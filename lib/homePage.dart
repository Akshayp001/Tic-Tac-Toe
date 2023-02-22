import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'modalButton.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var displayColor = Colors.red[100];
  List<int> winIndices;
  var displayTurnText;
  var winPlayer;
  var checkWinPlayer;
  var displayIcon = Icon(
    Icons.square,
    color: Colors.red[100],
  );
  var player_X = Icon(
    Icons.close,
    color: Colors.green[700],
  );
  var player_0 = Icon(
    Icons.circle_outlined,
    color: Colors.red,
  );
  var currentPlayer;

  List<int> occupiedBoxes = [];
  List<int> X_occupied = [];
  List<int> O_occupied = [];

  List<BoxButton> allBoxes;

  List<Color> buttonColors;
  List<Icon> buttonIcon;
  List<bool> buttonEnabled;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startGame();
    // buttonColors = [
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    //   displayColor,
    // ];

    // buttonEnabled = [
    //   true,
    //   true,
    //   true,
    //   true,
    //   true,
    //   true,
    //   true,
    //   true,
    //   true,
    // ];

    // buttonIcon = [
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    //   displayIcon,
    // ];
  }

  void startGame() {
    currentPlayer = 0;
    occupiedBoxes = [];
    X_occupied = [];
    O_occupied = [];
    winIndices = [];
    winPlayer = null;
    checkWinPlayer = null;
    displayTurnText = doStrInit();
    allBoxes = doInit();
  }

  List<BoxButton> doInit() {
    return [
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
      BoxButton(value: displayIcon, color: displayColor, enabled: true),
    ];
  }

  String doStrInit() {
    return "Game Started !!, O's Turn";
  }

  showdiaBox(String titleText) {
    return showDialog(
        context: context,
        builder: (ctx) {
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
                  titleText,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            content: Text(
              "$titleText Click on 'Reset Game' to Restart Game..",
              style: TextStyle(
                color: Color.fromARGB(166, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            actions: [
              InkWell(
                onTap: () {
                  setState(() {
                    startGame();
                    Navigator.of(context).pop();
                  });
                },
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
        });
  }

  Widget checkWin() {
    // row 1
    winPlayer = null;
    if (X_occupied.contains(0) &&
        X_occupied.contains(1) &&
        X_occupied.contains(2)) {
      winPlayer = player_X;
      winIndices = [0, 1, 2];
    }
    if (O_occupied.contains(0) &&
        O_occupied.contains(1) &&
        O_occupied.contains(2)) {
      winPlayer = player_0;
      winIndices = [0, 1, 2];
    }
    // row 2
    if (X_occupied.contains(3) &&
        X_occupied.contains(4) &&
        X_occupied.contains(5)) {
      winPlayer = player_X;
      winIndices = [3, 4, 5];
    }
    if (O_occupied.contains(3) &&
        O_occupied.contains(4) &&
        O_occupied.contains(5)) {
      winPlayer = player_0;
      winIndices = [3, 4, 5];
    }
    // row 3
    if (X_occupied.contains(6) &&
        X_occupied.contains(7) &&
        X_occupied.contains(8)) {
      winPlayer = player_X;
      winIndices = [6, 7, 8];
    }
    if (O_occupied.contains(6) &&
        O_occupied.contains(7) &&
        O_occupied.contains(8)) {
      winPlayer = player_0;
      winIndices = [6, 7, 8];
    }
    // Col 1
    if (X_occupied.contains(0) &&
        X_occupied.contains(3) &&
        X_occupied.contains(6)) {
      winPlayer = player_X;
      winIndices = [0, 3, 6];
    }
    if (O_occupied.contains(0) &&
        O_occupied.contains(3) &&
        O_occupied.contains(6)) {
      winPlayer = player_0;
      winIndices = [0, 3, 6];
    }
    // Col 2
    if (X_occupied.contains(1) &&
        X_occupied.contains(4) &&
        X_occupied.contains(7)) {
      winPlayer = player_X;
      winIndices = [1, 4, 7];
    }
    if (O_occupied.contains(1) &&
        O_occupied.contains(4) &&
        O_occupied.contains(7)) {
      winPlayer = player_0;
      winIndices = [1, 4, 7];
    }
    // Col 3
    if (X_occupied.contains(2) &&
        X_occupied.contains(5) &&
        X_occupied.contains(8)) {
      winPlayer = player_X;
      winIndices = [2, 5, 8];
    }
    if (O_occupied.contains(2) &&
        O_occupied.contains(5) &&
        O_occupied.contains(8)) {
      winPlayer = player_0;
      winIndices = [2, 5, 8];
    }
    // dia 1
    if (X_occupied.contains(0) &&
        X_occupied.contains(4) &&
        X_occupied.contains(8)) {
      winPlayer = player_X;
      winIndices = [0, 4, 8];
    }
    if (O_occupied.contains(0) &&
        O_occupied.contains(4) &&
        O_occupied.contains(8)) {
      winPlayer = player_0;
      winIndices = [0, 4, 8];
    }
    // dia 2
    if (X_occupied.contains(2) &&
        X_occupied.contains(4) &&
        X_occupied.contains(6)) {
      winPlayer = player_X;
      winIndices = [2, 4, 6];
    }
    if (O_occupied.contains(2) &&
        O_occupied.contains(4) &&
        O_occupied.contains(6)) {
      winPlayer = player_0;
      winIndices = [2, 4, 6];
    }
    return winPlayer;
  }

  void checkDraw() {
    if (occupiedBoxes.length == 9 && winPlayer == null) {
      showdiaBox("Game Draw!");
    }
    // draw logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Tic-Tac-Toe",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
              Colors.purpleAccent,
              Colors.pink,
              Colors.red,
              Colors.orange,
              Colors.amber,
              Colors.pink,
              Colors.purple,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  displayTurnText,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[200],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (allBoxes[index].enabled) {
                          if (currentPlayer == 0) {
                            setState(() {
                              allBoxes[index].value = player_0;
                              currentPlayer = 1;
                              allBoxes[index].color = Colors.orange.shade200;
                              allBoxes[index].enabled = false;
                              displayTurnText = "X's Turn";
                              occupiedBoxes.add(index);
                              O_occupied.add(index);
                              checkWinPlayer = checkWin();
                            });
                          } else {
                            setState(() {
                              allBoxes[index].value = player_X;
                              currentPlayer = 0;
                              allBoxes[index].color = Colors.lightBlue.shade200;
                              allBoxes[index].enabled = false;
                              displayTurnText = "O's Turn";
                              occupiedBoxes.add(index);
                              X_occupied.add(index);
                              checkWinPlayer = checkWin();
                            });
                          }
                        }
                        // if (occupiedBoxes.length == 9) {
                        // displayTurnText = "Game Over!!";
                        //   showdiaBox();
                        // }
                        checkDraw();
                        if (checkWinPlayer != null) {
                          displayTurnText = "Game Over!!";
                          setState(() {
                            allBoxes[winIndices[0]].color =
                                Colors.lightGreen[400];
                            allBoxes[winIndices[1]].color =
                                Colors.lightGreen[400];
                            allBoxes[winIndices[2]].color =
                                Colors.lightGreen[400];
                          });
                          if (checkWinPlayer == player_0) {
                            Future.delayed(Duration(seconds: 10));
                            showdiaBox("Player 'O' Win!!");
                          } else {
                            Future.delayed(Duration(seconds: 10));
                            showdiaBox("Player 'X' Win!!");
                          }
                        }
                      },
                      child: Card(
                        child: allBoxes[index].value,
                        color: allBoxes[index].color,
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  return setState(() {
                    startGame();
                  });
                },
                child: Text(
                  "Reset Game",
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 25,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

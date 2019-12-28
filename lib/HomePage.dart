import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//****************** Link up Images ************************

  AssetImage crossImage = AssetImage("assets/images/cross.png");
  AssetImage circleImage = AssetImage("assets/images/circle.png");
  AssetImage editImage = AssetImage("assets/images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

//  ****************** Initialize game state in runtime *******************

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

//***************** Method to reset game *******************

  void resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

//******************* Method for Playing Game *****************

  void playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross == true) {
          this.gameState[index] = "cross";
          this.isCross = false;
        } else {
          this.gameState[index] = "circle";
          this.isCross = true;
        }
        this.checkWin();
      });
    }
  }

//******************* Method for setting images *************************

  getImage(String value) {
    switch (value) {
      case ("empty"):
        {
          return editImage;
        }
        break;
      case ("cross"):
        {
          return crossImage;
        }
        break;
      case ("circle"):
        {
          return circleImage;
        }
        break;
    }
  }

//********************* Introduces delay of 1 Second after user wins *************
  delay() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        this.resetGame();
      });
    });
  }

//********************* Method for checking winner *****************

  checkWin() {
    if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[1]) &&
        (this.gameState[1] == this.gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
        this.delay();
      });
    }

    if ((this.gameState[3] != "empty") &&
        (this.gameState[3] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} wins";
        this.delay();
      });
    }

    if ((this.gameState[6] != "empty") &&
        (this.gameState[6] == this.gameState[7]) &&
        (this.gameState[7] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[3]} wins";
        this.delay();
      });
    }

    if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[3]) &&
        (this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
        this.delay();
      });
    }

    if ((this.gameState[1] != "empty") &&
        (this.gameState[1] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} wins";
        this.delay();
      });
    }

    if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[5]) &&
        (this.gameState[5] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} wins";
        this.delay();
      });
    }

    if ((this.gameState[0] != "empty") &&
        (this.gameState[0] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
        this.delay();
      });
    }

    if ((this.gameState[2] != "empty") &&
        (this.gameState[2] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} wins";
        this.delay();
      });
    }
  }

// 012  345 678  036 147  258 048 246

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: MaterialButton(
                    onPressed: () => playGame(i),
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Text(
                this.message,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: resetGame,
                minWidth: 270,
                height: 50,
                child: Text(
                  "Reset Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

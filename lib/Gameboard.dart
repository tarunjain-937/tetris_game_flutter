import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tetris_game/piece.dart';
import 'package:tetris_game/pixel.dart';
import 'package:tetris_game/values.dart';

class gameBoard extends StatefulWidget {
  const gameBoard({Key? key}) : super(key: key);

  @override
  State<gameBoard> createState() => _gameBoardState();
}

class _gameBoardState extends State<gameBoard> {

  Piece currentPiece = Piece(type: TetrisPieces.S); // object of Piece class

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //start game
    startGame();
  }

  //start game method
  void startGame(){
    currentPiece.initializePiece();

    // frame rate
    Duration frameRate = Duration(seconds: 1);
    gameLoop(frameRate);
  }

  //gameLoop method
  void gameLoop(Duration frameRate){
    Timer.periodic(frameRate, (timer) {
      setState(() {
        currentPiece.movePiece(Directions.down);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("T E T R I S",style: TextStyle(fontSize: 25),),
          ),
      body: Column(
        children: [
          ///game Bord View
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnLength),
                itemCount: columnLength * rowLength,
                itemBuilder: (context, index) {

                  if(currentPiece.positions.contains(index)){
                    return pixel(colour: Colors.yellow, child: index.toString(),);
                  }
                  else{
                    return pixel(colour: Colors.grey[900], child: index.toString(),);
                  }
                },
            ),
          ),
          
          ///game Controls
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){currentPiece.movePiece(Directions.left);},
                  child: Icon(Icons.arrow_left, color: Colors.white,size: 25),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),),

                ElevatedButton(
                  onPressed: (){},
                  child:  Icon(Icons.rotate_90_degrees_ccw, color: Colors.white,size: 25),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),),

                ElevatedButton(
                  onPressed: (){},
                  child:  Icon(Icons.rotate_90_degrees_cw_outlined, color: Colors.white,size: 25),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),),

                ElevatedButton(
                  onPressed: (){currentPiece.movePiece(Directions.right);},
                  child:  Icon(Icons.arrow_right, color: Colors.white,size: 25),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:tetris_game/values.dart';

class Piece{
  TetrisPieces type;
  Piece({required this.type});

  //the piece is just a list of Integers
  List<int> positions=[];

  //generate the integers
  void initializePiece(){
    switch (type){
      case TetrisPieces.L : positions=[-26,-16,-6,-5];
      break;
      case TetrisPieces.S : positions=[-15,-14,-5,-6];
      break;
      case TetrisPieces.Z : positions=[-17,-16,-5,-6];
      break;
      case TetrisPieces.T : positions=[-26,-16,-6,-15];
      break;
      case TetrisPieces.O : positions=[-15,-16,-5,-6];
      break;
      case TetrisPieces.J : positions=[-25,-15,-5,-6];
      break;
      case TetrisPieces.I : positions=[-4,-5,-6,-7];
      break;
    }
  }

  void movePiece(Directions directions){
    switch (directions){
      case Directions.down :
        for(int i=0;i<positions.length;i++){
          positions[i] += columnLength;
        }
        break;
      case Directions.right:
        for(int i=0;i<positions.length;i++){
          positions[i] += 1;
        }
        break;
      case Directions.left:
        for(int i=0;i<positions.length;i++){
          positions[i] -= 1;
        }
        break;
    }
  }
}
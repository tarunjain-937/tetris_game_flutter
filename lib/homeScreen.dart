import 'package:flutter/material.dart';
import 'package:tetris_game/Gameboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          backgroundColor: Colors.black,
          title: const Text("T E T R I S",style: TextStyle(fontSize: 25),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return const gameBoard();
                  },));
                },
                child: const Text("Play",style: TextStyle(color: Colors.white,fontSize: 20),),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey[900])),),
            ),
          ]),
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100,right: 8,left: 8),
                child: Image.asset("lib/tetris_image.png", height: 400,width: double.infinity,),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text("Build By:-", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
              const SizedBox(height: 10),
              const Text("Tarun jain", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blue,letterSpacing: 2),)
            ],
          ),
        ),
      ),
    );
  }
}

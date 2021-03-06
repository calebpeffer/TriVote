import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:votesmarter/model/question.dart';
import 'package:votesmarter/screen/game_results_screen.dart';
import 'package:votesmarter/screen/question_screen.dart';
import 'package:votesmarter/widgets/wheel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:votesmarter/state/game_state.dart';

class MainGame extends StatefulWidget {
  final GameState state;

  MainGame({this.state});

  @override
  State<StatefulWidget> createState() {
    return _MainGameState();
  }
}

class _MainGameState extends State<MainGame>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // if (widget.state.gameIsFinished()) {
    //   print("game is finished");
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => GameResultsScreen(state: widget.state)));
    // }

    return widget.state.gameIsFinished()
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameResultsScreen(state: widget.state)))
        : Scaffold(
            resizeToAvoidBottomPadding: false,
             appBar: 
           AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text('ROUND ' + widget.state.currentGameRound.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  
                  elevation: 0,
                  leading:  Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        // child: Icon(Icons.person,
                        //     color: Colors.white, size: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 15,
                            backgroundImage: AssetImage("assets/sawyer.jpeg"),
                          ),
                        )),
                  actions: <Widget>[
                    
                   
                         Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        // child: Icon(Icons.person,
                        //     color: Colors.white, size: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 25,
                            backgroundImage: AssetImage("assets/caleb.jpeg",),
                          ),
                        )),
                        
                  ],
                
            ),
             
            body: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 0.9,
                        colors: [
                          Theme.of(context).accentColor, // yellow sun
                          Theme.of(context).primaryColor, // blue sky
                        ],
                      ),
                    ),
                    child: Wheel(state: widget.state),
                  ),
                  Center(
                    heightFactor: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            widget.state.currentNumberOfLives, (index) {
                          return Container(
                              width: 50,
                              height: 50,
                              child: new FlareActor("assets/animheart.flr",
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  animation: "anim"));
                        })),
                  ),
                ],
              ),
            ),
        );
            
  }
}

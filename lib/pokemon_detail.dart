import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonDetailScreen extends StatefulWidget {

  var pokemonDetail;
  var  color;
  var herotag;



  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 20,),onPressed: (){
              Navigator.pop(context);
            }),
          ),
          Positioned(
              top: 70,
              left: 20,
              child: Text(widget.pokemonDetail['name'], style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              )),

          Positioned(
              top: height*0.18,
              right: -30,
              child: Image.asset('images/pokeball.jpg', height: 200, fit: BoxFit.fitHeight,)),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white
              ),
            ),
          ),

        ],
      ),
    );
  }
}

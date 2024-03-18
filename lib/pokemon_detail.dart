import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({Key? key, this.pokemonDetail,required this.color,  required this.heroTag}) :super(key: key);
  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),onPressed: (){
              Navigator.pop(context);
            }),
          ),
          Positioned(
            top: 70,
              left: 5,
              child: Text(widget.pokemonDetail['name'], style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold,
                fontSize: 30
              ),)),
          Positioned(
            top: 140,
              left: 20,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(widget.pokemonDetail['type'].toString(), style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  color: Colors.black26
                ),
              ),),
          Positioned(
              top: height*0.2,
              right: -10,
              child: Image.asset('images/pokeball.jpg', height: 200, fit: BoxFit.fitHeight,)
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Container(
                            width: width*0.3,
                            child: Text('Name', style: TextStyle(
                              color: Colors.blueGrey, fontSize: 10,
                            ),),
                        ),
                            Container(
                              width: width*0.3,
                              child: Text(widget.pokemonDetail['name'].toString(), style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                              ),),
                            ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('height', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            Container(
                              width: width*0.3,
                              child: Text(widget.pokemonDetail['height'].toString(), style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('Weight', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            Container(
                              width: width*0.3,
                              child: Text(widget.pokemonDetail['weight'].toString(), style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('Spawn Time', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            Container(
                              width: width*0.3,
                              child: Text(widget.pokemonDetail['spawn_time'].toString(), style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('Weakness', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            Container(
                              width: width*0.3,
                              child: Text(widget.pokemonDetail['weaknesses'].toString(), style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('Pre Form', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            widget.pokemonDetail['prev_evolution'] != null ?
                            SizedBox(
                              height: 20,
                              width: width*0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemonDetail['prev_evolution'].length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(widget.pokemonDetail['prev_evolution'][index]['name'], style: TextStyle(
                                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                                    ),),
                                  );
                                },
                              ),
                            ): Text('Just Hatched ', style: TextStyle(
                              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                            ),)
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width*0.3,
                              child: Text('Evolution', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 10,
                              ),),
                            ),
                            widget.pokemonDetail['next_evolution'] != null ?
                            SizedBox(
                              height: 20,
                              width: width*0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemonDetail['next_evolution'].length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(widget.pokemonDetail['next_evolution'][index]['name'], style: TextStyle(
                                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                                    ),),
                                  );
                                },
                              ),
                            ): Text('Maxed out ', style: TextStyle(
                              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,
                            ),)
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 140,
              left: width/2,
              child: CachedNetworkImage(
            imageUrl: widget.pokemonDetail['img'],
                height: 200,
                fit: BoxFit.fitHeight,
          ))

        ],
      ),

    );
  }
}

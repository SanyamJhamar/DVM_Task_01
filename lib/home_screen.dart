import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  var pokedex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(children: [
          Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'images/pokeball.jpg',
                width: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
              top: 100,
              left: 20,
              child: Text("pokedex",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: pokedex.length,
                    itemBuilder: (context, index) {
                      var type = pokedex[index]['type'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Card(
                            color: Colors.green,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: -10,
                                    right: -10,
                                    child: Image.asset(
                                      'images/pokeball.jpg',
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    )),
                                Column(
                                  children: [
                                    Positioned(
                                      top: 30,
                                      left: 20,
                                      child: Text(pokedex[index]['name']),
                                    ),
                                    Positioned(
                                      top: 45,
                                      left: 20,
                                      child: Container(
                                        color: Colors.black26,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 4,
                                              bottom: 4),
                                          child: Text(type.toString()),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: CachedNetworkImage(
                                            imageUrl: pokedex[index]['img'])),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                    : Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ]));
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        print(pokedex[0]['name']);
        setState(() {});
      }
    });
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pokemon/Components/propertyTitle.dart';

class PropertyPoke extends StatelessWidget {
  const PropertyPoke({
    Key key,
    @required this.pokemonProperty,
    @required this.propertyLabel,
    @required this.colour,
    @required this.maxValue
  }) : super(key: key);

  final String pokemonProperty;
  final String propertyLabel;
  final Color colour;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
      child: Row(
        children: [
          ProperTitle(label: propertyLabel),
          SizedBox(
            width: 15,
          ),
          Text(pokemonProperty,style:  TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: FAProgressBar(
                progressColor: colour,
                size:10,
                maxValue: maxValue,
                currentValue: int.parse(pokemonProperty.replaceAll(RegExp('[^0-9]'), '')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
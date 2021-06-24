import 'package:pokemon/Class/pokemon.dart';
import 'package:flutter/material.dart';

colorCheck(Pokemon pokemon){
  return
    pokemon.type.first == "Grass" ? Color(0xff4aa96c) :
    pokemon.type.first == "Fire" ? Color(0xffe23b26) :
    pokemon.type.first == "Water" ? Color(0xff3d84b8) :
    pokemon.type.first == "Poison" ? Color(0xff583d72) :
    pokemon.type.first == "Electric" ? Colors.amber :
    pokemon.type.first == "Rock" ? Colors.grey :
    pokemon.type.first == "Ground" ? Color(0xff766161) :
    pokemon.type.first == "Psychic" ? Color(0xff344fa1) :
    pokemon.type.first == "Fighting" ? Colors.orange :
    pokemon.type.first == "Bug" ? Color(0xff008080) :
    pokemon.type.first == "Ghost" ? Color(0xffa58faa) :
    pokemon.type.first == "Flying" ? Color(0xffdfeeea) :
    pokemon.type.first == "Normal" ? Color(0xff424040) : Colors.pink;

}

typeCheck(String type){
  return
    type== "Grass" ? Color(0xff64ef94) :
    type== "Fire" ? Color(0xffe39990) :
    type == "Water" ? Color(0xff79b6ea) :
    type == "Poison" ? Color(0xffbb8ce5) :
    type == "Electric" ? Color(0xffFCDEC0):
    type == "Rock" ? Color(0xffe0e0e0) :
    type == "Ground" ? Color(0xff6c5959) :
    type == "Psychic" ? Color(0xff5c6fa8) :
    type == "Fighting" ? Colors.orange :
    type == "Bug" ? Color(0xff90c1c1) :
    type == "Ghost" ? Color(0xffbdadc1) :
    type== "Flying" ? Color(0xff9dc6bd) :
    type== "Ice" ? Color(0xffb2b6ae) :
    type == "Normal" ? Color(0xff898484) : Colors.pink;

}
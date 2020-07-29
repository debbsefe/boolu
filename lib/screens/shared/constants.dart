import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

class Strings {
  static const String premierLeague = 'ENGLAND: Premier League';
  static const String laLiga = 'SPAIN: La Liga';
  static const String serieA = 'ITALY: Serie A';
}

import 'package:flutter/material.dart';

List<BoxShadow> boxShadow() => [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(0, 1), // changes position of shadow
      ),
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(-1, 0), // changes position of shadow
      ),
    ];

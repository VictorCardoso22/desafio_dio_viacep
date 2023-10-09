import 'dart:convert';

import 'package:desafio_dio_viacep/model/viacep_model.dart';
import 'package:desafio_dio_viacep/viacep/viacep.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text("informe o cep para consulta:"),
            Viacep(),
          ],
        ),
      ),
    );
  }
}

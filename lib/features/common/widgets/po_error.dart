import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PoError extends StatelessWidget {
  const PoError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error?? 'Nao foi possivel carregar os dados')
        ),
    );
  }
}
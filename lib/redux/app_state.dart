import 'package:flutter/material.dart';
import 'package:grpc_redux_demo/generated/rick.pb.dart';

class AppState {
  final Widget character;

  AppState({
    required this.character,
  });
}

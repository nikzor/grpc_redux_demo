import 'package:flutter/material.dart';

sealed class AppState {}

class InitialState implements AppState {
  final Widget image;

  const InitialState(this.image);
}

class LoadingState implements AppState {
  const LoadingState();
}

class SuccessState implements AppState {
  final String name;
  final Widget image;

  const SuccessState(this.name, this.image);
}

class ErrorState implements AppState {
  final Object error;
  final StackTrace? stackTrace;

  const ErrorState(this.error, [this.stackTrace]);
}

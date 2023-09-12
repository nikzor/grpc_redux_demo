import 'package:flutter/material.dart';
import 'package:grpc_redux_demo/character_widget.dart';
import 'package:redux/redux.dart';
import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    character: _characterReducer(state.character, action));


Reducer<Widget> _characterReducer = combineReducers([
  TypedReducer(_getCharacterReducer),
  TypedReducer(_loadedCharacterReducer),
]);

Widget _getCharacterReducer(Widget widget, GetCharacterAction action) =>
    const Center(
      child: CircularProgressIndicator(),
    );

Widget _loadedCharacterReducer(Widget widget, LoadedCharacterAction action) =>
    CharacterWidget(name: action.name, image: action.image);

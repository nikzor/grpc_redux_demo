import 'dart:async';

import 'package:grpc_redux_demo/main.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter/material.dart';
import '../generated/rick.pb.dart';

class GetImage {
  final String url;

  GetImage({required this.url});
}

class GetCharacterAction {}

class LoadedCharacterAction {
  final Widget image;
  final String name;

  LoadedCharacterAction({required this.image, required this.name});
}

ThunkAction loadCharacterThunkAction = (Store store) async {
  store.dispatch(GetCharacterAction());
  final request = Request();
  final character = await client.getCharacter(request);
  final image = await _loadImage(character.url);
  store.dispatch(
    LoadedCharacterAction(
      image: image,
      name: character.name,
    ),
  );
};

Future<Widget> _loadImage(String url) async {
  final completer = Completer<Widget>();

  Image.network(url).image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener((info, synchronousCall) {
      if (!completer.isCompleted) {
        completer.complete(Image.network(url));
      }
    }),
  );

  return completer.future;
}

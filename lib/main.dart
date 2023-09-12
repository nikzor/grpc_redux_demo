import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';
import 'redux/app_state.dart';
import 'redux/reducers.dart';

void main() {
  final Store<AppState> store = Store(reducer,
      initialState: AppState(
        character: const Icon(Icons.cloud_download),
      ));
  runApp(
    StoreProvider(
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC Redux Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => vm.character,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => store.dispatch(loadCharacterThunkAction(store)),
                child: const Text('Get random character'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

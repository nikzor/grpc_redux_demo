import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grpc_redux_demo/character_widget.dart';
import 'package:grpc_redux_demo/client.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';
import 'redux/app_state.dart';
import 'redux/reducers.dart';

final client = RickTerminalClient();

void main() {
  final Store<AppState> store = Store(
    reducer(),
    initialState: const InitialState(Icon(Icons.cloud_download)),
  );
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
              StoreBuilder<AppState>(
                  builder: (context, store) => switch (store.state) {
                        InitialState() => const Icon(Icons.cloud_download),
                        LoadingState() =>
                          const Center(child: CircularProgressIndicator()),
                        SuccessState(name: final name, image: final image) =>
                          CharacterWidget(
                            name: name,
                            image: image,
                          ),
                        ErrorState() => const Text('Ошибка загрузки'),
                      }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () =>
                    store.dispatch(loadCharacterThunkAction(store)),
                child: const Text('Get random character'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

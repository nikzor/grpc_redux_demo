import 'package:grpc/grpc.dart';
import 'package:grpc_redux_demo/generated/rick.pbgrpc.dart';

class RickTerminalClient {
  late final ClientChannel channel;
  late final RickClient stub;

  RickTerminalClient() {
    channel = ClientChannel(
      '127.0.0.1',
      port: 5555,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = RickClient(channel);
  }

  Future<Character> getCharacter(Request request) async{
    final character = await stub.getCharacter(request);
    print('Character: $character');
    return character;
  }
  Future<void> callService(Request request) async{
    await getCharacter(request);
    await channel.shutdown();
  }
}

Future<void> main(List<String> args) async {
  final clientApp = RickTerminalClient();
  final request = Request();
  await clientApp.callService(request);
}
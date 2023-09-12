import 'dart:math';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc_redux_demo/generated/rick.pbgrpc.dart';
import 'characters_db_driver.dart';

class RickService extends RickServiceBase{
  @override
  Future<Character> getCharacter(grpc.ServiceCall call, Request request) async {
    print('Received request from client');
    return questionsDb[Random().nextInt(questionsDb.length)];
  }
}

class Server {
  Future<void> run() async {
    final server = grpc.Server.create(services: [RickService()]);
    await server.serve(port: 5555);
    print('Serving on the port: ${server.port}');
  }
}

Future<void> main() async {
  await Server().run();
}
//
//  Generated code. Do not modify.
//  source: rick.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rick.pb.dart' as $0;

export 'rick.pb.dart';

@$pb.GrpcServiceName('Rick')
class RickClient extends $grpc.Client {
  static final _$getCharacter = $grpc.ClientMethod<$0.Request, $0.Character>(
      '/Rick/getCharacter',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Character.fromBuffer(value));

  RickClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Character> getCharacter($0.Request request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCharacter, request, options: options);
  }
}

@$pb.GrpcServiceName('Rick')
abstract class RickServiceBase extends $grpc.Service {
  $core.String get $name => 'Rick';

  RickServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Character>(
        'getCharacter',
        getCharacter_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Character value) => value.writeToBuffer()));
  }

  $async.Future<$0.Character> getCharacter_Pre($grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return getCharacter(call, await request);
  }

  $async.Future<$0.Character> getCharacter($grpc.ServiceCall call, $0.Request request);
}

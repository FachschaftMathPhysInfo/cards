//
//  Generated code. Do not modify.
//  source: anki/collection.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'collection.pb.dart' as $2;
import 'collection.pbjson.dart';
import 'generic.pb.dart' as $0;

export 'collection.pb.dart';

abstract class CollectionServiceBase extends $pb.GeneratedService {
  $async.Future<$2.CheckDatabaseResponse> checkDatabase($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$2.UndoStatus> getUndoStatus($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$2.OpChangesAfterUndo> undo($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$2.OpChangesAfterUndo> redo($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.UInt32> addCustomUndoEntry($pb.ServerContext ctx, $0.String request);
  $async.Future<$2.OpChanges> mergeUndoEntries($pb.ServerContext ctx, $0.UInt32 request);
  $async.Future<$2.Progress> latestProgress($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.Empty> setWantsAbort($pb.ServerContext ctx, $0.Empty request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CheckDatabase': return $0.Empty();
      case 'GetUndoStatus': return $0.Empty();
      case 'Undo': return $0.Empty();
      case 'Redo': return $0.Empty();
      case 'AddCustomUndoEntry': return $0.String();
      case 'MergeUndoEntries': return $0.UInt32();
      case 'LatestProgress': return $0.Empty();
      case 'SetWantsAbort': return $0.Empty();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CheckDatabase': return this.checkDatabase(ctx, request as $0.Empty);
      case 'GetUndoStatus': return this.getUndoStatus(ctx, request as $0.Empty);
      case 'Undo': return this.undo(ctx, request as $0.Empty);
      case 'Redo': return this.redo(ctx, request as $0.Empty);
      case 'AddCustomUndoEntry': return this.addCustomUndoEntry(ctx, request as $0.String);
      case 'MergeUndoEntries': return this.mergeUndoEntries(ctx, request as $0.UInt32);
      case 'LatestProgress': return this.latestProgress(ctx, request as $0.Empty);
      case 'SetWantsAbort': return this.setWantsAbort(ctx, request as $0.Empty);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => CollectionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => CollectionServiceBase$messageJson;
}

abstract class BackendCollectionServiceBase extends $pb.GeneratedService {
  $async.Future<$0.Empty> openCollection($pb.ServerContext ctx, $2.OpenCollectionRequest request);
  $async.Future<$0.Empty> closeCollection($pb.ServerContext ctx, $2.CloseCollectionRequest request);
  $async.Future<$0.Bool> createBackup($pb.ServerContext ctx, $2.CreateBackupRequest request);
  $async.Future<$0.Empty> awaitBackupCompletion($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$2.Progress> latestProgress($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.Empty> setWantsAbort($pb.ServerContext ctx, $0.Empty request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'OpenCollection': return $2.OpenCollectionRequest();
      case 'CloseCollection': return $2.CloseCollectionRequest();
      case 'CreateBackup': return $2.CreateBackupRequest();
      case 'AwaitBackupCompletion': return $0.Empty();
      case 'LatestProgress': return $0.Empty();
      case 'SetWantsAbort': return $0.Empty();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'OpenCollection': return this.openCollection(ctx, request as $2.OpenCollectionRequest);
      case 'CloseCollection': return this.closeCollection(ctx, request as $2.CloseCollectionRequest);
      case 'CreateBackup': return this.createBackup(ctx, request as $2.CreateBackupRequest);
      case 'AwaitBackupCompletion': return this.awaitBackupCompletion(ctx, request as $0.Empty);
      case 'LatestProgress': return this.latestProgress(ctx, request as $0.Empty);
      case 'SetWantsAbort': return this.setWantsAbort(ctx, request as $0.Empty);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => BackendCollectionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => BackendCollectionServiceBase$messageJson;
}


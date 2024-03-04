//
//  Generated code. Do not modify.
//  source: anki/sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'generic.pb.dart' as $0;
import 'sync.pbenum.dart';

export 'sync.pbenum.dart';

class SyncAuth extends $pb.GeneratedMessage {
  factory SyncAuth({
    $core.String? hkey,
    $core.String? endpoint,
    $core.int? ioTimeoutSecs,
  }) {
    final $result = create();
    if (hkey != null) {
      $result.hkey = hkey;
    }
    if (endpoint != null) {
      $result.endpoint = endpoint;
    }
    if (ioTimeoutSecs != null) {
      $result.ioTimeoutSecs = ioTimeoutSecs;
    }
    return $result;
  }
  SyncAuth._() : super();
  factory SyncAuth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncAuth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncAuth', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hkey')
    ..aOS(2, _omitFieldNames ? '' : 'endpoint')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'ioTimeoutSecs', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncAuth clone() => SyncAuth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncAuth copyWith(void Function(SyncAuth) updates) => super.copyWith((message) => updates(message as SyncAuth)) as SyncAuth;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncAuth create() => SyncAuth._();
  SyncAuth createEmptyInstance() => create();
  static $pb.PbList<SyncAuth> createRepeated() => $pb.PbList<SyncAuth>();
  @$core.pragma('dart2js:noInline')
  static SyncAuth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncAuth>(create);
  static SyncAuth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hkey => $_getSZ(0);
  @$pb.TagNumber(1)
  set hkey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearHkey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get endpoint => $_getSZ(1);
  @$pb.TagNumber(2)
  set endpoint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndpoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndpoint() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get ioTimeoutSecs => $_getIZ(2);
  @$pb.TagNumber(3)
  set ioTimeoutSecs($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIoTimeoutSecs() => $_has(2);
  @$pb.TagNumber(3)
  void clearIoTimeoutSecs() => clearField(3);
}

class SyncLoginRequest extends $pb.GeneratedMessage {
  factory SyncLoginRequest({
    $core.String? username,
    $core.String? password,
    $core.String? endpoint,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (endpoint != null) {
      $result.endpoint = endpoint;
    }
    return $result;
  }
  SyncLoginRequest._() : super();
  factory SyncLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'endpoint')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncLoginRequest clone() => SyncLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncLoginRequest copyWith(void Function(SyncLoginRequest) updates) => super.copyWith((message) => updates(message as SyncLoginRequest)) as SyncLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncLoginRequest create() => SyncLoginRequest._();
  SyncLoginRequest createEmptyInstance() => create();
  static $pb.PbList<SyncLoginRequest> createRepeated() => $pb.PbList<SyncLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static SyncLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncLoginRequest>(create);
  static SyncLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endpoint => $_getSZ(2);
  @$pb.TagNumber(3)
  set endpoint($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndpoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndpoint() => clearField(3);
}

class SyncStatusResponse extends $pb.GeneratedMessage {
  factory SyncStatusResponse({
    SyncStatusResponse_Required? required,
    $core.String? newEndpoint,
  }) {
    final $result = create();
    if (required != null) {
      $result.required = required;
    }
    if (newEndpoint != null) {
      $result.newEndpoint = newEndpoint;
    }
    return $result;
  }
  SyncStatusResponse._() : super();
  factory SyncStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..e<SyncStatusResponse_Required>(1, _omitFieldNames ? '' : 'required', $pb.PbFieldType.OE, defaultOrMaker: SyncStatusResponse_Required.NO_CHANGES, valueOf: SyncStatusResponse_Required.valueOf, enumValues: SyncStatusResponse_Required.values)
    ..aOS(4, _omitFieldNames ? '' : 'newEndpoint')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncStatusResponse clone() => SyncStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncStatusResponse copyWith(void Function(SyncStatusResponse) updates) => super.copyWith((message) => updates(message as SyncStatusResponse)) as SyncStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncStatusResponse create() => SyncStatusResponse._();
  SyncStatusResponse createEmptyInstance() => create();
  static $pb.PbList<SyncStatusResponse> createRepeated() => $pb.PbList<SyncStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static SyncStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncStatusResponse>(create);
  static SyncStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SyncStatusResponse_Required get required => $_getN(0);
  @$pb.TagNumber(1)
  set required(SyncStatusResponse_Required v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequired() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequired() => clearField(1);

  @$pb.TagNumber(4)
  $core.String get newEndpoint => $_getSZ(1);
  @$pb.TagNumber(4)
  set newEndpoint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewEndpoint() => $_has(1);
  @$pb.TagNumber(4)
  void clearNewEndpoint() => clearField(4);
}

class SyncCollectionRequest extends $pb.GeneratedMessage {
  factory SyncCollectionRequest({
    SyncAuth? auth,
    $core.bool? syncMedia,
  }) {
    final $result = create();
    if (auth != null) {
      $result.auth = auth;
    }
    if (syncMedia != null) {
      $result.syncMedia = syncMedia;
    }
    return $result;
  }
  SyncCollectionRequest._() : super();
  factory SyncCollectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncCollectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncCollectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOM<SyncAuth>(1, _omitFieldNames ? '' : 'auth', subBuilder: SyncAuth.create)
    ..aOB(2, _omitFieldNames ? '' : 'syncMedia')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncCollectionRequest clone() => SyncCollectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncCollectionRequest copyWith(void Function(SyncCollectionRequest) updates) => super.copyWith((message) => updates(message as SyncCollectionRequest)) as SyncCollectionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncCollectionRequest create() => SyncCollectionRequest._();
  SyncCollectionRequest createEmptyInstance() => create();
  static $pb.PbList<SyncCollectionRequest> createRepeated() => $pb.PbList<SyncCollectionRequest>();
  @$core.pragma('dart2js:noInline')
  static SyncCollectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncCollectionRequest>(create);
  static SyncCollectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SyncAuth get auth => $_getN(0);
  @$pb.TagNumber(1)
  set auth(SyncAuth v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuth() => clearField(1);
  @$pb.TagNumber(1)
  SyncAuth ensureAuth() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get syncMedia => $_getBF(1);
  @$pb.TagNumber(2)
  set syncMedia($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSyncMedia() => $_has(1);
  @$pb.TagNumber(2)
  void clearSyncMedia() => clearField(2);
}

class SyncCollectionResponse extends $pb.GeneratedMessage {
  factory SyncCollectionResponse({
    $core.int? hostNumber,
    $core.String? serverMessage,
    SyncCollectionResponse_ChangesRequired? required,
    $core.String? newEndpoint,
    $core.int? serverMediaUsn,
  }) {
    final $result = create();
    if (hostNumber != null) {
      $result.hostNumber = hostNumber;
    }
    if (serverMessage != null) {
      $result.serverMessage = serverMessage;
    }
    if (required != null) {
      $result.required = required;
    }
    if (newEndpoint != null) {
      $result.newEndpoint = newEndpoint;
    }
    if (serverMediaUsn != null) {
      $result.serverMediaUsn = serverMediaUsn;
    }
    return $result;
  }
  SyncCollectionResponse._() : super();
  factory SyncCollectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncCollectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncCollectionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hostNumber', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'serverMessage')
    ..e<SyncCollectionResponse_ChangesRequired>(3, _omitFieldNames ? '' : 'required', $pb.PbFieldType.OE, defaultOrMaker: SyncCollectionResponse_ChangesRequired.NO_CHANGES, valueOf: SyncCollectionResponse_ChangesRequired.valueOf, enumValues: SyncCollectionResponse_ChangesRequired.values)
    ..aOS(4, _omitFieldNames ? '' : 'newEndpoint')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'serverMediaUsn', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncCollectionResponse clone() => SyncCollectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncCollectionResponse copyWith(void Function(SyncCollectionResponse) updates) => super.copyWith((message) => updates(message as SyncCollectionResponse)) as SyncCollectionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncCollectionResponse create() => SyncCollectionResponse._();
  SyncCollectionResponse createEmptyInstance() => create();
  static $pb.PbList<SyncCollectionResponse> createRepeated() => $pb.PbList<SyncCollectionResponse>();
  @$core.pragma('dart2js:noInline')
  static SyncCollectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncCollectionResponse>(create);
  static SyncCollectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hostNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set hostNumber($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerMessage() => clearField(2);

  @$pb.TagNumber(3)
  SyncCollectionResponse_ChangesRequired get required => $_getN(2);
  @$pb.TagNumber(3)
  set required(SyncCollectionResponse_ChangesRequired v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequired() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequired() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get newEndpoint => $_getSZ(3);
  @$pb.TagNumber(4)
  set newEndpoint($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewEndpoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewEndpoint() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get serverMediaUsn => $_getIZ(4);
  @$pb.TagNumber(5)
  set serverMediaUsn($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServerMediaUsn() => $_has(4);
  @$pb.TagNumber(5)
  void clearServerMediaUsn() => clearField(5);
}

class MediaSyncStatusResponse extends $pb.GeneratedMessage {
  factory MediaSyncStatusResponse({
    $core.bool? active,
    MediaSyncProgress? progress,
  }) {
    final $result = create();
    if (active != null) {
      $result.active = active;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    return $result;
  }
  MediaSyncStatusResponse._() : super();
  factory MediaSyncStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaSyncStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MediaSyncStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'active')
    ..aOM<MediaSyncProgress>(2, _omitFieldNames ? '' : 'progress', subBuilder: MediaSyncProgress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaSyncStatusResponse clone() => MediaSyncStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaSyncStatusResponse copyWith(void Function(MediaSyncStatusResponse) updates) => super.copyWith((message) => updates(message as MediaSyncStatusResponse)) as MediaSyncStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaSyncStatusResponse create() => MediaSyncStatusResponse._();
  MediaSyncStatusResponse createEmptyInstance() => create();
  static $pb.PbList<MediaSyncStatusResponse> createRepeated() => $pb.PbList<MediaSyncStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static MediaSyncStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaSyncStatusResponse>(create);
  static MediaSyncStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get active => $_getBF(0);
  @$pb.TagNumber(1)
  set active($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearActive() => clearField(1);

  @$pb.TagNumber(2)
  MediaSyncProgress get progress => $_getN(1);
  @$pb.TagNumber(2)
  set progress(MediaSyncProgress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgress() => clearField(2);
  @$pb.TagNumber(2)
  MediaSyncProgress ensureProgress() => $_ensure(1);
}

class MediaSyncProgress extends $pb.GeneratedMessage {
  factory MediaSyncProgress({
    $core.String? checked,
    $core.String? added,
    $core.String? removed,
  }) {
    final $result = create();
    if (checked != null) {
      $result.checked = checked;
    }
    if (added != null) {
      $result.added = added;
    }
    if (removed != null) {
      $result.removed = removed;
    }
    return $result;
  }
  MediaSyncProgress._() : super();
  factory MediaSyncProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaSyncProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MediaSyncProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'checked')
    ..aOS(2, _omitFieldNames ? '' : 'added')
    ..aOS(3, _omitFieldNames ? '' : 'removed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaSyncProgress clone() => MediaSyncProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaSyncProgress copyWith(void Function(MediaSyncProgress) updates) => super.copyWith((message) => updates(message as MediaSyncProgress)) as MediaSyncProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaSyncProgress create() => MediaSyncProgress._();
  MediaSyncProgress createEmptyInstance() => create();
  static $pb.PbList<MediaSyncProgress> createRepeated() => $pb.PbList<MediaSyncProgress>();
  @$core.pragma('dart2js:noInline')
  static MediaSyncProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaSyncProgress>(create);
  static MediaSyncProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get checked => $_getSZ(0);
  @$pb.TagNumber(1)
  set checked($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChecked() => $_has(0);
  @$pb.TagNumber(1)
  void clearChecked() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get added => $_getSZ(1);
  @$pb.TagNumber(2)
  set added($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdded() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdded() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get removed => $_getSZ(2);
  @$pb.TagNumber(3)
  set removed($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoved() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoved() => clearField(3);
}

class FullUploadOrDownloadRequest extends $pb.GeneratedMessage {
  factory FullUploadOrDownloadRequest({
    SyncAuth? auth,
    $core.bool? upload,
    $core.int? serverUsn,
  }) {
    final $result = create();
    if (auth != null) {
      $result.auth = auth;
    }
    if (upload != null) {
      $result.upload = upload;
    }
    if (serverUsn != null) {
      $result.serverUsn = serverUsn;
    }
    return $result;
  }
  FullUploadOrDownloadRequest._() : super();
  factory FullUploadOrDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullUploadOrDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FullUploadOrDownloadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.sync'), createEmptyInstance: create)
    ..aOM<SyncAuth>(1, _omitFieldNames ? '' : 'auth', subBuilder: SyncAuth.create)
    ..aOB(2, _omitFieldNames ? '' : 'upload')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'serverUsn', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FullUploadOrDownloadRequest clone() => FullUploadOrDownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FullUploadOrDownloadRequest copyWith(void Function(FullUploadOrDownloadRequest) updates) => super.copyWith((message) => updates(message as FullUploadOrDownloadRequest)) as FullUploadOrDownloadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FullUploadOrDownloadRequest create() => FullUploadOrDownloadRequest._();
  FullUploadOrDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<FullUploadOrDownloadRequest> createRepeated() => $pb.PbList<FullUploadOrDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static FullUploadOrDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullUploadOrDownloadRequest>(create);
  static FullUploadOrDownloadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  SyncAuth get auth => $_getN(0);
  @$pb.TagNumber(1)
  set auth(SyncAuth v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuth() => clearField(1);
  @$pb.TagNumber(1)
  SyncAuth ensureAuth() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get upload => $_getBF(1);
  @$pb.TagNumber(2)
  set upload($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpload() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpload() => clearField(2);

  /// if not provided, media syncing will be skipped
  @$pb.TagNumber(3)
  $core.int get serverUsn => $_getIZ(2);
  @$pb.TagNumber(3)
  set serverUsn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerUsn() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerUsn() => clearField(3);
}

class SyncServiceApi {
  $pb.RpcClient _client;
  SyncServiceApi(this._client);

}

class BackendSyncServiceApi {
  $pb.RpcClient _client;
  BackendSyncServiceApi(this._client);

  $async.Future<$0.Empty> syncMedia($pb.ClientContext? ctx, SyncAuth request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendSyncService', 'SyncMedia', request, $0.Empty())
  ;
  $async.Future<$0.Empty> abortMediaSync($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendSyncService', 'AbortMediaSync', request, $0.Empty())
  ;
  $async.Future<MediaSyncStatusResponse> mediaSyncStatus($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<MediaSyncStatusResponse>(ctx, 'BackendSyncService', 'MediaSyncStatus', request, MediaSyncStatusResponse())
  ;
  $async.Future<SyncAuth> syncLogin($pb.ClientContext? ctx, SyncLoginRequest request) =>
    _client.invoke<SyncAuth>(ctx, 'BackendSyncService', 'SyncLogin', request, SyncAuth())
  ;
  $async.Future<SyncStatusResponse> syncStatus($pb.ClientContext? ctx, SyncAuth request) =>
    _client.invoke<SyncStatusResponse>(ctx, 'BackendSyncService', 'SyncStatus', request, SyncStatusResponse())
  ;
  $async.Future<SyncCollectionResponse> syncCollection($pb.ClientContext? ctx, SyncCollectionRequest request) =>
    _client.invoke<SyncCollectionResponse>(ctx, 'BackendSyncService', 'SyncCollection', request, SyncCollectionResponse())
  ;
  $async.Future<$0.Empty> fullUploadOrDownload($pb.ClientContext? ctx, FullUploadOrDownloadRequest request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendSyncService', 'FullUploadOrDownload', request, $0.Empty())
  ;
  $async.Future<$0.Empty> abortSync($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendSyncService', 'AbortSync', request, $0.Empty())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

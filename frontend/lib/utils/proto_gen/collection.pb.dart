//
//  Generated code. Do not modify.
//  source: anki/collection.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'generic.pb.dart' as $0;
import 'sync.pb.dart' as $1;

class OpenCollectionRequest extends $pb.GeneratedMessage {
  factory OpenCollectionRequest({
    $core.String? collectionPath,
    $core.String? mediaFolderPath,
    $core.String? mediaDbPath,
  }) {
    final $result = create();
    if (collectionPath != null) {
      $result.collectionPath = collectionPath;
    }
    if (mediaFolderPath != null) {
      $result.mediaFolderPath = mediaFolderPath;
    }
    if (mediaDbPath != null) {
      $result.mediaDbPath = mediaDbPath;
    }
    return $result;
  }
  OpenCollectionRequest._() : super();
  factory OpenCollectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpenCollectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpenCollectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'collectionPath')
    ..aOS(2, _omitFieldNames ? '' : 'mediaFolderPath')
    ..aOS(3, _omitFieldNames ? '' : 'mediaDbPath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpenCollectionRequest clone() => OpenCollectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpenCollectionRequest copyWith(void Function(OpenCollectionRequest) updates) => super.copyWith((message) => updates(message as OpenCollectionRequest)) as OpenCollectionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpenCollectionRequest create() => OpenCollectionRequest._();
  OpenCollectionRequest createEmptyInstance() => create();
  static $pb.PbList<OpenCollectionRequest> createRepeated() => $pb.PbList<OpenCollectionRequest>();
  @$core.pragma('dart2js:noInline')
  static OpenCollectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenCollectionRequest>(create);
  static OpenCollectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get collectionPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set collectionPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCollectionPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollectionPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mediaFolderPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set mediaFolderPath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMediaFolderPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediaFolderPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mediaDbPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set mediaDbPath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMediaDbPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearMediaDbPath() => clearField(3);
}

class CloseCollectionRequest extends $pb.GeneratedMessage {
  factory CloseCollectionRequest({
    $core.bool? downgradeToSchema11,
  }) {
    final $result = create();
    if (downgradeToSchema11 != null) {
      $result.downgradeToSchema11 = downgradeToSchema11;
    }
    return $result;
  }
  CloseCollectionRequest._() : super();
  factory CloseCollectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloseCollectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CloseCollectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'downgradeToSchema11')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloseCollectionRequest clone() => CloseCollectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloseCollectionRequest copyWith(void Function(CloseCollectionRequest) updates) => super.copyWith((message) => updates(message as CloseCollectionRequest)) as CloseCollectionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseCollectionRequest create() => CloseCollectionRequest._();
  CloseCollectionRequest createEmptyInstance() => create();
  static $pb.PbList<CloseCollectionRequest> createRepeated() => $pb.PbList<CloseCollectionRequest>();
  @$core.pragma('dart2js:noInline')
  static CloseCollectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseCollectionRequest>(create);
  static CloseCollectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get downgradeToSchema11 => $_getBF(0);
  @$pb.TagNumber(1)
  set downgradeToSchema11($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDowngradeToSchema11() => $_has(0);
  @$pb.TagNumber(1)
  void clearDowngradeToSchema11() => clearField(1);
}

class CheckDatabaseResponse extends $pb.GeneratedMessage {
  factory CheckDatabaseResponse({
    $core.Iterable<$core.String>? problems,
  }) {
    final $result = create();
    if (problems != null) {
      $result.problems.addAll(problems);
    }
    return $result;
  }
  CheckDatabaseResponse._() : super();
  factory CheckDatabaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckDatabaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckDatabaseResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'problems')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckDatabaseResponse clone() => CheckDatabaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckDatabaseResponse copyWith(void Function(CheckDatabaseResponse) updates) => super.copyWith((message) => updates(message as CheckDatabaseResponse)) as CheckDatabaseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckDatabaseResponse create() => CheckDatabaseResponse._();
  CheckDatabaseResponse createEmptyInstance() => create();
  static $pb.PbList<CheckDatabaseResponse> createRepeated() => $pb.PbList<CheckDatabaseResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckDatabaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckDatabaseResponse>(create);
  static CheckDatabaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get problems => $_getList(0);
}

class OpChanges extends $pb.GeneratedMessage {
  factory OpChanges({
    $core.bool? card,
    $core.bool? note,
    $core.bool? deck,
    $core.bool? tag,
    $core.bool? notetype,
    $core.bool? config,
    $core.bool? browserTable,
    $core.bool? browserSidebar,
    $core.bool? noteText,
    $core.bool? studyQueues,
    $core.bool? deckConfig,
    $core.bool? mtime,
  }) {
    final $result = create();
    if (card != null) {
      $result.card = card;
    }
    if (note != null) {
      $result.note = note;
    }
    if (deck != null) {
      $result.deck = deck;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    if (notetype != null) {
      $result.notetype = notetype;
    }
    if (config != null) {
      $result.config = config;
    }
    if (browserTable != null) {
      $result.browserTable = browserTable;
    }
    if (browserSidebar != null) {
      $result.browserSidebar = browserSidebar;
    }
    if (noteText != null) {
      $result.noteText = noteText;
    }
    if (studyQueues != null) {
      $result.studyQueues = studyQueues;
    }
    if (deckConfig != null) {
      $result.deckConfig = deckConfig;
    }
    if (mtime != null) {
      $result.mtime = mtime;
    }
    return $result;
  }
  OpChanges._() : super();
  factory OpChanges.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpChanges.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpChanges', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'card')
    ..aOB(2, _omitFieldNames ? '' : 'note')
    ..aOB(3, _omitFieldNames ? '' : 'deck')
    ..aOB(4, _omitFieldNames ? '' : 'tag')
    ..aOB(5, _omitFieldNames ? '' : 'notetype')
    ..aOB(6, _omitFieldNames ? '' : 'config')
    ..aOB(7, _omitFieldNames ? '' : 'browserTable')
    ..aOB(8, _omitFieldNames ? '' : 'browserSidebar')
    ..aOB(9, _omitFieldNames ? '' : 'noteText')
    ..aOB(10, _omitFieldNames ? '' : 'studyQueues')
    ..aOB(11, _omitFieldNames ? '' : 'deckConfig')
    ..aOB(12, _omitFieldNames ? '' : 'mtime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpChanges clone() => OpChanges()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpChanges copyWith(void Function(OpChanges) updates) => super.copyWith((message) => updates(message as OpChanges)) as OpChanges;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpChanges create() => OpChanges._();
  OpChanges createEmptyInstance() => create();
  static $pb.PbList<OpChanges> createRepeated() => $pb.PbList<OpChanges>();
  @$core.pragma('dart2js:noInline')
  static OpChanges getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpChanges>(create);
  static OpChanges? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get card => $_getBF(0);
  @$pb.TagNumber(1)
  set card($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get note => $_getBF(1);
  @$pb.TagNumber(2)
  set note($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get deck => $_getBF(2);
  @$pb.TagNumber(3)
  set deck($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeck() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeck() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get tag => $_getBF(3);
  @$pb.TagNumber(4)
  set tag($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearTag() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get notetype => $_getBF(4);
  @$pb.TagNumber(5)
  set notetype($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotetype() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotetype() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get config => $_getBF(5);
  @$pb.TagNumber(6)
  set config($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearConfig() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get browserTable => $_getBF(6);
  @$pb.TagNumber(7)
  set browserTable($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBrowserTable() => $_has(6);
  @$pb.TagNumber(7)
  void clearBrowserTable() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get browserSidebar => $_getBF(7);
  @$pb.TagNumber(8)
  set browserSidebar($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBrowserSidebar() => $_has(7);
  @$pb.TagNumber(8)
  void clearBrowserSidebar() => clearField(8);

  /// editor and displayed card in review screen
  @$pb.TagNumber(9)
  $core.bool get noteText => $_getBF(8);
  @$pb.TagNumber(9)
  set noteText($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNoteText() => $_has(8);
  @$pb.TagNumber(9)
  void clearNoteText() => clearField(9);

  /// whether to call .reset() and getCard()
  @$pb.TagNumber(10)
  $core.bool get studyQueues => $_getBF(9);
  @$pb.TagNumber(10)
  set studyQueues($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStudyQueues() => $_has(9);
  @$pb.TagNumber(10)
  void clearStudyQueues() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get deckConfig => $_getBF(10);
  @$pb.TagNumber(11)
  set deckConfig($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDeckConfig() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeckConfig() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get mtime => $_getBF(11);
  @$pb.TagNumber(12)
  set mtime($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMtime() => $_has(11);
  @$pb.TagNumber(12)
  void clearMtime() => clearField(12);
}

/// Allows frontend code to extract changes from other messages like
/// ImportResponse without decoding other potentially large fields.
class OpChangesOnly extends $pb.GeneratedMessage {
  factory OpChangesOnly({
    OpChanges? changes,
  }) {
    final $result = create();
    if (changes != null) {
      $result.changes = changes;
    }
    return $result;
  }
  OpChangesOnly._() : super();
  factory OpChangesOnly.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpChangesOnly.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpChangesOnly', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOM<OpChanges>(1, _omitFieldNames ? '' : 'changes', subBuilder: OpChanges.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpChangesOnly clone() => OpChangesOnly()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpChangesOnly copyWith(void Function(OpChangesOnly) updates) => super.copyWith((message) => updates(message as OpChangesOnly)) as OpChangesOnly;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpChangesOnly create() => OpChangesOnly._();
  OpChangesOnly createEmptyInstance() => create();
  static $pb.PbList<OpChangesOnly> createRepeated() => $pb.PbList<OpChangesOnly>();
  @$core.pragma('dart2js:noInline')
  static OpChangesOnly getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpChangesOnly>(create);
  static OpChangesOnly? _defaultInstance;

  @$pb.TagNumber(1)
  OpChanges get changes => $_getN(0);
  @$pb.TagNumber(1)
  set changes(OpChanges v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChanges() => $_has(0);
  @$pb.TagNumber(1)
  void clearChanges() => clearField(1);
  @$pb.TagNumber(1)
  OpChanges ensureChanges() => $_ensure(0);
}

class OpChangesWithCount extends $pb.GeneratedMessage {
  factory OpChangesWithCount({
    OpChanges? changes,
    $core.int? count,
  }) {
    final $result = create();
    if (changes != null) {
      $result.changes = changes;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  OpChangesWithCount._() : super();
  factory OpChangesWithCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpChangesWithCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpChangesWithCount', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOM<OpChanges>(1, _omitFieldNames ? '' : 'changes', subBuilder: OpChanges.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpChangesWithCount clone() => OpChangesWithCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpChangesWithCount copyWith(void Function(OpChangesWithCount) updates) => super.copyWith((message) => updates(message as OpChangesWithCount)) as OpChangesWithCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpChangesWithCount create() => OpChangesWithCount._();
  OpChangesWithCount createEmptyInstance() => create();
  static $pb.PbList<OpChangesWithCount> createRepeated() => $pb.PbList<OpChangesWithCount>();
  @$core.pragma('dart2js:noInline')
  static OpChangesWithCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpChangesWithCount>(create);
  static OpChangesWithCount? _defaultInstance;

  @$pb.TagNumber(1)
  OpChanges get changes => $_getN(0);
  @$pb.TagNumber(1)
  set changes(OpChanges v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChanges() => $_has(0);
  @$pb.TagNumber(1)
  void clearChanges() => clearField(1);
  @$pb.TagNumber(1)
  OpChanges ensureChanges() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class OpChangesWithId extends $pb.GeneratedMessage {
  factory OpChangesWithId({
    OpChanges? changes,
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (changes != null) {
      $result.changes = changes;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  OpChangesWithId._() : super();
  factory OpChangesWithId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpChangesWithId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpChangesWithId', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOM<OpChanges>(1, _omitFieldNames ? '' : 'changes', subBuilder: OpChanges.create)
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpChangesWithId clone() => OpChangesWithId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpChangesWithId copyWith(void Function(OpChangesWithId) updates) => super.copyWith((message) => updates(message as OpChangesWithId)) as OpChangesWithId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpChangesWithId create() => OpChangesWithId._();
  OpChangesWithId createEmptyInstance() => create();
  static $pb.PbList<OpChangesWithId> createRepeated() => $pb.PbList<OpChangesWithId>();
  @$core.pragma('dart2js:noInline')
  static OpChangesWithId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpChangesWithId>(create);
  static OpChangesWithId? _defaultInstance;

  @$pb.TagNumber(1)
  OpChanges get changes => $_getN(0);
  @$pb.TagNumber(1)
  set changes(OpChanges v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChanges() => $_has(0);
  @$pb.TagNumber(1)
  void clearChanges() => clearField(1);
  @$pb.TagNumber(1)
  OpChanges ensureChanges() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class UndoStatus extends $pb.GeneratedMessage {
  factory UndoStatus({
    $core.String? undo,
    $core.String? redo,
    $core.int? lastStep,
  }) {
    final $result = create();
    if (undo != null) {
      $result.undo = undo;
    }
    if (redo != null) {
      $result.redo = redo;
    }
    if (lastStep != null) {
      $result.lastStep = lastStep;
    }
    return $result;
  }
  UndoStatus._() : super();
  factory UndoStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndoStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UndoStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'undo')
    ..aOS(2, _omitFieldNames ? '' : 'redo')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lastStep', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndoStatus clone() => UndoStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndoStatus copyWith(void Function(UndoStatus) updates) => super.copyWith((message) => updates(message as UndoStatus)) as UndoStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UndoStatus create() => UndoStatus._();
  UndoStatus createEmptyInstance() => create();
  static $pb.PbList<UndoStatus> createRepeated() => $pb.PbList<UndoStatus>();
  @$core.pragma('dart2js:noInline')
  static UndoStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndoStatus>(create);
  static UndoStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get undo => $_getSZ(0);
  @$pb.TagNumber(1)
  set undo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUndo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUndo() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get redo => $_getSZ(1);
  @$pb.TagNumber(2)
  set redo($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRedo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedo() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lastStep => $_getIZ(2);
  @$pb.TagNumber(3)
  set lastStep($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastStep() => clearField(3);
}

class OpChangesAfterUndo extends $pb.GeneratedMessage {
  factory OpChangesAfterUndo({
    OpChanges? changes,
    $core.String? operation,
    $fixnum.Int64? revertedToTimestamp,
    UndoStatus? newStatus,
    $core.int? counter,
  }) {
    final $result = create();
    if (changes != null) {
      $result.changes = changes;
    }
    if (operation != null) {
      $result.operation = operation;
    }
    if (revertedToTimestamp != null) {
      $result.revertedToTimestamp = revertedToTimestamp;
    }
    if (newStatus != null) {
      $result.newStatus = newStatus;
    }
    if (counter != null) {
      $result.counter = counter;
    }
    return $result;
  }
  OpChangesAfterUndo._() : super();
  factory OpChangesAfterUndo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpChangesAfterUndo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OpChangesAfterUndo', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOM<OpChanges>(1, _omitFieldNames ? '' : 'changes', subBuilder: OpChanges.create)
    ..aOS(2, _omitFieldNames ? '' : 'operation')
    ..aInt64(3, _omitFieldNames ? '' : 'revertedToTimestamp')
    ..aOM<UndoStatus>(4, _omitFieldNames ? '' : 'newStatus', subBuilder: UndoStatus.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'counter', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OpChangesAfterUndo clone() => OpChangesAfterUndo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OpChangesAfterUndo copyWith(void Function(OpChangesAfterUndo) updates) => super.copyWith((message) => updates(message as OpChangesAfterUndo)) as OpChangesAfterUndo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OpChangesAfterUndo create() => OpChangesAfterUndo._();
  OpChangesAfterUndo createEmptyInstance() => create();
  static $pb.PbList<OpChangesAfterUndo> createRepeated() => $pb.PbList<OpChangesAfterUndo>();
  @$core.pragma('dart2js:noInline')
  static OpChangesAfterUndo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpChangesAfterUndo>(create);
  static OpChangesAfterUndo? _defaultInstance;

  @$pb.TagNumber(1)
  OpChanges get changes => $_getN(0);
  @$pb.TagNumber(1)
  set changes(OpChanges v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChanges() => $_has(0);
  @$pb.TagNumber(1)
  void clearChanges() => clearField(1);
  @$pb.TagNumber(1)
  OpChanges ensureChanges() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get operation => $_getSZ(1);
  @$pb.TagNumber(2)
  set operation($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get revertedToTimestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set revertedToTimestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRevertedToTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearRevertedToTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  UndoStatus get newStatus => $_getN(3);
  @$pb.TagNumber(4)
  set newStatus(UndoStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewStatus() => clearField(4);
  @$pb.TagNumber(4)
  UndoStatus ensureNewStatus() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get counter => $_getIZ(4);
  @$pb.TagNumber(5)
  set counter($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCounter() => $_has(4);
  @$pb.TagNumber(5)
  void clearCounter() => clearField(5);
}

class Progress_FullSync extends $pb.GeneratedMessage {
  factory Progress_FullSync({
    $core.int? transferred,
    $core.int? total,
  }) {
    final $result = create();
    if (transferred != null) {
      $result.transferred = transferred;
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  Progress_FullSync._() : super();
  factory Progress_FullSync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Progress_FullSync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Progress.FullSync', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'transferred', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Progress_FullSync clone() => Progress_FullSync()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Progress_FullSync copyWith(void Function(Progress_FullSync) updates) => super.copyWith((message) => updates(message as Progress_FullSync)) as Progress_FullSync;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Progress_FullSync create() => Progress_FullSync._();
  Progress_FullSync createEmptyInstance() => create();
  static $pb.PbList<Progress_FullSync> createRepeated() => $pb.PbList<Progress_FullSync>();
  @$core.pragma('dart2js:noInline')
  static Progress_FullSync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Progress_FullSync>(create);
  static Progress_FullSync? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get transferred => $_getIZ(0);
  @$pb.TagNumber(1)
  set transferred($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransferred() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferred() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class Progress_NormalSync extends $pb.GeneratedMessage {
  factory Progress_NormalSync({
    $core.String? stage,
    $core.String? added,
    $core.String? removed,
  }) {
    final $result = create();
    if (stage != null) {
      $result.stage = stage;
    }
    if (added != null) {
      $result.added = added;
    }
    if (removed != null) {
      $result.removed = removed;
    }
    return $result;
  }
  Progress_NormalSync._() : super();
  factory Progress_NormalSync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Progress_NormalSync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Progress.NormalSync', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stage')
    ..aOS(2, _omitFieldNames ? '' : 'added')
    ..aOS(3, _omitFieldNames ? '' : 'removed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Progress_NormalSync clone() => Progress_NormalSync()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Progress_NormalSync copyWith(void Function(Progress_NormalSync) updates) => super.copyWith((message) => updates(message as Progress_NormalSync)) as Progress_NormalSync;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Progress_NormalSync create() => Progress_NormalSync._();
  Progress_NormalSync createEmptyInstance() => create();
  static $pb.PbList<Progress_NormalSync> createRepeated() => $pb.PbList<Progress_NormalSync>();
  @$core.pragma('dart2js:noInline')
  static Progress_NormalSync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Progress_NormalSync>(create);
  static Progress_NormalSync? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stage => $_getSZ(0);
  @$pb.TagNumber(1)
  set stage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearStage() => clearField(1);

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

class Progress_DatabaseCheck extends $pb.GeneratedMessage {
  factory Progress_DatabaseCheck({
    $core.String? stage,
    $core.int? stageTotal,
    $core.int? stageCurrent,
  }) {
    final $result = create();
    if (stage != null) {
      $result.stage = stage;
    }
    if (stageTotal != null) {
      $result.stageTotal = stageTotal;
    }
    if (stageCurrent != null) {
      $result.stageCurrent = stageCurrent;
    }
    return $result;
  }
  Progress_DatabaseCheck._() : super();
  factory Progress_DatabaseCheck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Progress_DatabaseCheck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Progress.DatabaseCheck', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stage')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'stageTotal', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'stageCurrent', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Progress_DatabaseCheck clone() => Progress_DatabaseCheck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Progress_DatabaseCheck copyWith(void Function(Progress_DatabaseCheck) updates) => super.copyWith((message) => updates(message as Progress_DatabaseCheck)) as Progress_DatabaseCheck;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Progress_DatabaseCheck create() => Progress_DatabaseCheck._();
  Progress_DatabaseCheck createEmptyInstance() => create();
  static $pb.PbList<Progress_DatabaseCheck> createRepeated() => $pb.PbList<Progress_DatabaseCheck>();
  @$core.pragma('dart2js:noInline')
  static Progress_DatabaseCheck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Progress_DatabaseCheck>(create);
  static Progress_DatabaseCheck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stage => $_getSZ(0);
  @$pb.TagNumber(1)
  set stage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearStage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stageTotal => $_getIZ(1);
  @$pb.TagNumber(2)
  set stageTotal($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStageTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearStageTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get stageCurrent => $_getIZ(2);
  @$pb.TagNumber(3)
  set stageCurrent($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStageCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearStageCurrent() => clearField(3);
}

enum Progress_Value {
  none, 
  mediaSync, 
  mediaCheck, 
  fullSync, 
  normalSync, 
  databaseCheck, 
  importing, 
  exporting, 
  computeWeights, 
  computeRetention, 
  computeMemory, 
  notSet
}

class Progress extends $pb.GeneratedMessage {
  factory Progress({
    $0.Empty? none,
    $1.MediaSyncProgress? mediaSync,
    $core.String? mediaCheck,
    Progress_FullSync? fullSync,
    Progress_NormalSync? normalSync,
    Progress_DatabaseCheck? databaseCheck,
    $core.String? importing,
    $core.String? exporting,
    ComputeWeightsProgress? computeWeights,
    ComputeRetentionProgress? computeRetention,
    ComputeMemoryProgress? computeMemory,
  }) {
    final $result = create();
    if (none != null) {
      $result.none = none;
    }
    if (mediaSync != null) {
      $result.mediaSync = mediaSync;
    }
    if (mediaCheck != null) {
      $result.mediaCheck = mediaCheck;
    }
    if (fullSync != null) {
      $result.fullSync = fullSync;
    }
    if (normalSync != null) {
      $result.normalSync = normalSync;
    }
    if (databaseCheck != null) {
      $result.databaseCheck = databaseCheck;
    }
    if (importing != null) {
      $result.importing = importing;
    }
    if (exporting != null) {
      $result.exporting = exporting;
    }
    if (computeWeights != null) {
      $result.computeWeights = computeWeights;
    }
    if (computeRetention != null) {
      $result.computeRetention = computeRetention;
    }
    if (computeMemory != null) {
      $result.computeMemory = computeMemory;
    }
    return $result;
  }
  Progress._() : super();
  factory Progress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Progress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Progress_Value> _Progress_ValueByTag = {
    1 : Progress_Value.none,
    2 : Progress_Value.mediaSync,
    3 : Progress_Value.mediaCheck,
    4 : Progress_Value.fullSync,
    5 : Progress_Value.normalSync,
    6 : Progress_Value.databaseCheck,
    7 : Progress_Value.importing,
    8 : Progress_Value.exporting,
    9 : Progress_Value.computeWeights,
    10 : Progress_Value.computeRetention,
    11 : Progress_Value.computeMemory,
    0 : Progress_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Progress', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
    ..aOM<$0.Empty>(1, _omitFieldNames ? '' : 'none', subBuilder: $0.Empty.create)
    ..aOM<$1.MediaSyncProgress>(2, _omitFieldNames ? '' : 'mediaSync', subBuilder: $1.MediaSyncProgress.create)
    ..aOS(3, _omitFieldNames ? '' : 'mediaCheck')
    ..aOM<Progress_FullSync>(4, _omitFieldNames ? '' : 'fullSync', subBuilder: Progress_FullSync.create)
    ..aOM<Progress_NormalSync>(5, _omitFieldNames ? '' : 'normalSync', subBuilder: Progress_NormalSync.create)
    ..aOM<Progress_DatabaseCheck>(6, _omitFieldNames ? '' : 'databaseCheck', subBuilder: Progress_DatabaseCheck.create)
    ..aOS(7, _omitFieldNames ? '' : 'importing')
    ..aOS(8, _omitFieldNames ? '' : 'exporting')
    ..aOM<ComputeWeightsProgress>(9, _omitFieldNames ? '' : 'computeWeights', subBuilder: ComputeWeightsProgress.create)
    ..aOM<ComputeRetentionProgress>(10, _omitFieldNames ? '' : 'computeRetention', subBuilder: ComputeRetentionProgress.create)
    ..aOM<ComputeMemoryProgress>(11, _omitFieldNames ? '' : 'computeMemory', subBuilder: ComputeMemoryProgress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Progress clone() => Progress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Progress copyWith(void Function(Progress) updates) => super.copyWith((message) => updates(message as Progress)) as Progress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Progress create() => Progress._();
  Progress createEmptyInstance() => create();
  static $pb.PbList<Progress> createRepeated() => $pb.PbList<Progress>();
  @$core.pragma('dart2js:noInline')
  static Progress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Progress>(create);
  static Progress? _defaultInstance;

  Progress_Value whichValue() => _Progress_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Empty get none => $_getN(0);
  @$pb.TagNumber(1)
  set none($0.Empty v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNone() => $_has(0);
  @$pb.TagNumber(1)
  void clearNone() => clearField(1);
  @$pb.TagNumber(1)
  $0.Empty ensureNone() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.MediaSyncProgress get mediaSync => $_getN(1);
  @$pb.TagNumber(2)
  set mediaSync($1.MediaSyncProgress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMediaSync() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediaSync() => clearField(2);
  @$pb.TagNumber(2)
  $1.MediaSyncProgress ensureMediaSync() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get mediaCheck => $_getSZ(2);
  @$pb.TagNumber(3)
  set mediaCheck($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMediaCheck() => $_has(2);
  @$pb.TagNumber(3)
  void clearMediaCheck() => clearField(3);

  @$pb.TagNumber(4)
  Progress_FullSync get fullSync => $_getN(3);
  @$pb.TagNumber(4)
  set fullSync(Progress_FullSync v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFullSync() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullSync() => clearField(4);
  @$pb.TagNumber(4)
  Progress_FullSync ensureFullSync() => $_ensure(3);

  @$pb.TagNumber(5)
  Progress_NormalSync get normalSync => $_getN(4);
  @$pb.TagNumber(5)
  set normalSync(Progress_NormalSync v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasNormalSync() => $_has(4);
  @$pb.TagNumber(5)
  void clearNormalSync() => clearField(5);
  @$pb.TagNumber(5)
  Progress_NormalSync ensureNormalSync() => $_ensure(4);

  @$pb.TagNumber(6)
  Progress_DatabaseCheck get databaseCheck => $_getN(5);
  @$pb.TagNumber(6)
  set databaseCheck(Progress_DatabaseCheck v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDatabaseCheck() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatabaseCheck() => clearField(6);
  @$pb.TagNumber(6)
  Progress_DatabaseCheck ensureDatabaseCheck() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get importing => $_getSZ(6);
  @$pb.TagNumber(7)
  set importing($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasImporting() => $_has(6);
  @$pb.TagNumber(7)
  void clearImporting() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get exporting => $_getSZ(7);
  @$pb.TagNumber(8)
  set exporting($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExporting() => $_has(7);
  @$pb.TagNumber(8)
  void clearExporting() => clearField(8);

  @$pb.TagNumber(9)
  ComputeWeightsProgress get computeWeights => $_getN(8);
  @$pb.TagNumber(9)
  set computeWeights(ComputeWeightsProgress v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasComputeWeights() => $_has(8);
  @$pb.TagNumber(9)
  void clearComputeWeights() => clearField(9);
  @$pb.TagNumber(9)
  ComputeWeightsProgress ensureComputeWeights() => $_ensure(8);

  @$pb.TagNumber(10)
  ComputeRetentionProgress get computeRetention => $_getN(9);
  @$pb.TagNumber(10)
  set computeRetention(ComputeRetentionProgress v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasComputeRetention() => $_has(9);
  @$pb.TagNumber(10)
  void clearComputeRetention() => clearField(10);
  @$pb.TagNumber(10)
  ComputeRetentionProgress ensureComputeRetention() => $_ensure(9);

  @$pb.TagNumber(11)
  ComputeMemoryProgress get computeMemory => $_getN(10);
  @$pb.TagNumber(11)
  set computeMemory(ComputeMemoryProgress v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasComputeMemory() => $_has(10);
  @$pb.TagNumber(11)
  void clearComputeMemory() => clearField(11);
  @$pb.TagNumber(11)
  ComputeMemoryProgress ensureComputeMemory() => $_ensure(10);
}

class ComputeWeightsProgress extends $pb.GeneratedMessage {
  factory ComputeWeightsProgress({
    $core.int? current,
    $core.int? total,
    $core.int? reviews,
    $core.int? currentPreset,
    $core.int? totalPresets,
  }) {
    final $result = create();
    if (current != null) {
      $result.current = current;
    }
    if (total != null) {
      $result.total = total;
    }
    if (reviews != null) {
      $result.reviews = reviews;
    }
    if (currentPreset != null) {
      $result.currentPreset = currentPreset;
    }
    if (totalPresets != null) {
      $result.totalPresets = totalPresets;
    }
    return $result;
  }
  ComputeWeightsProgress._() : super();
  factory ComputeWeightsProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComputeWeightsProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComputeWeightsProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'current', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'reviews', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'currentPreset', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'totalPresets', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComputeWeightsProgress clone() => ComputeWeightsProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComputeWeightsProgress copyWith(void Function(ComputeWeightsProgress) updates) => super.copyWith((message) => updates(message as ComputeWeightsProgress)) as ComputeWeightsProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComputeWeightsProgress create() => ComputeWeightsProgress._();
  ComputeWeightsProgress createEmptyInstance() => create();
  static $pb.PbList<ComputeWeightsProgress> createRepeated() => $pb.PbList<ComputeWeightsProgress>();
  @$core.pragma('dart2js:noInline')
  static ComputeWeightsProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComputeWeightsProgress>(create);
  static ComputeWeightsProgress? _defaultInstance;

  /// Current iteration
  @$pb.TagNumber(1)
  $core.int get current => $_getIZ(0);
  @$pb.TagNumber(1)
  set current($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  /// Total iterations
  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get reviews => $_getIZ(2);
  @$pb.TagNumber(3)
  set reviews($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReviews() => $_has(2);
  @$pb.TagNumber(3)
  void clearReviews() => clearField(3);

  /// Only used in 'compute all weights' case
  @$pb.TagNumber(4)
  $core.int get currentPreset => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentPreset($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentPreset() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPreset() => clearField(4);

  /// Only used in 'compute all weights' case
  @$pb.TagNumber(5)
  $core.int get totalPresets => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalPresets($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalPresets() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPresets() => clearField(5);
}

class ComputeRetentionProgress extends $pb.GeneratedMessage {
  factory ComputeRetentionProgress({
    $core.int? current,
    $core.int? total,
  }) {
    final $result = create();
    if (current != null) {
      $result.current = current;
    }
    if (total != null) {
      $result.total = total;
    }
    return $result;
  }
  ComputeRetentionProgress._() : super();
  factory ComputeRetentionProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComputeRetentionProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComputeRetentionProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'current', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComputeRetentionProgress clone() => ComputeRetentionProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComputeRetentionProgress copyWith(void Function(ComputeRetentionProgress) updates) => super.copyWith((message) => updates(message as ComputeRetentionProgress)) as ComputeRetentionProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComputeRetentionProgress create() => ComputeRetentionProgress._();
  ComputeRetentionProgress createEmptyInstance() => create();
  static $pb.PbList<ComputeRetentionProgress> createRepeated() => $pb.PbList<ComputeRetentionProgress>();
  @$core.pragma('dart2js:noInline')
  static ComputeRetentionProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComputeRetentionProgress>(create);
  static ComputeRetentionProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get current => $_getIZ(0);
  @$pb.TagNumber(1)
  set current($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);
}

class ComputeMemoryProgress extends $pb.GeneratedMessage {
  factory ComputeMemoryProgress({
    $core.int? currentCards,
    $core.int? totalCards,
    $core.String? label,
  }) {
    final $result = create();
    if (currentCards != null) {
      $result.currentCards = currentCards;
    }
    if (totalCards != null) {
      $result.totalCards = totalCards;
    }
    if (label != null) {
      $result.label = label;
    }
    return $result;
  }
  ComputeMemoryProgress._() : super();
  factory ComputeMemoryProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ComputeMemoryProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ComputeMemoryProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'currentCards', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCards', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'label')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ComputeMemoryProgress clone() => ComputeMemoryProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ComputeMemoryProgress copyWith(void Function(ComputeMemoryProgress) updates) => super.copyWith((message) => updates(message as ComputeMemoryProgress)) as ComputeMemoryProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComputeMemoryProgress create() => ComputeMemoryProgress._();
  ComputeMemoryProgress createEmptyInstance() => create();
  static $pb.PbList<ComputeMemoryProgress> createRepeated() => $pb.PbList<ComputeMemoryProgress>();
  @$core.pragma('dart2js:noInline')
  static ComputeMemoryProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ComputeMemoryProgress>(create);
  static ComputeMemoryProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get currentCards => $_getIZ(0);
  @$pb.TagNumber(1)
  set currentCards($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentCards() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentCards() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalCards => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCards($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCards() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCards() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);
}

class CreateBackupRequest extends $pb.GeneratedMessage {
  factory CreateBackupRequest({
    $core.String? backupFolder,
    $core.bool? force,
    $core.bool? waitForCompletion,
  }) {
    final $result = create();
    if (backupFolder != null) {
      $result.backupFolder = backupFolder;
    }
    if (force != null) {
      $result.force = force;
    }
    if (waitForCompletion != null) {
      $result.waitForCompletion = waitForCompletion;
    }
    return $result;
  }
  CreateBackupRequest._() : super();
  factory CreateBackupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBackupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBackupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'anki.collection'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'backupFolder')
    ..aOB(2, _omitFieldNames ? '' : 'force')
    ..aOB(3, _omitFieldNames ? '' : 'waitForCompletion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBackupRequest clone() => CreateBackupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBackupRequest copyWith(void Function(CreateBackupRequest) updates) => super.copyWith((message) => updates(message as CreateBackupRequest)) as CreateBackupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBackupRequest create() => CreateBackupRequest._();
  CreateBackupRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBackupRequest> createRepeated() => $pb.PbList<CreateBackupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBackupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBackupRequest>(create);
  static CreateBackupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backupFolder => $_getSZ(0);
  @$pb.TagNumber(1)
  set backupFolder($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackupFolder() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackupFolder() => clearField(1);

  /// Create a backup even if the configured interval hasn't elapsed yet.
  @$pb.TagNumber(2)
  $core.bool get force => $_getBF(1);
  @$pb.TagNumber(2)
  set force($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForce() => $_has(1);
  @$pb.TagNumber(2)
  void clearForce() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get waitForCompletion => $_getBF(2);
  @$pb.TagNumber(3)
  set waitForCompletion($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWaitForCompletion() => $_has(2);
  @$pb.TagNumber(3)
  void clearWaitForCompletion() => clearField(3);
}

class CollectionServiceApi {
  $pb.RpcClient _client;
  CollectionServiceApi(this._client);

  $async.Future<CheckDatabaseResponse> checkDatabase($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<CheckDatabaseResponse>(ctx, 'CollectionService', 'CheckDatabase', request, CheckDatabaseResponse())
  ;
  $async.Future<UndoStatus> getUndoStatus($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<UndoStatus>(ctx, 'CollectionService', 'GetUndoStatus', request, UndoStatus())
  ;
  $async.Future<OpChangesAfterUndo> undo($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<OpChangesAfterUndo>(ctx, 'CollectionService', 'Undo', request, OpChangesAfterUndo())
  ;
  $async.Future<OpChangesAfterUndo> redo($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<OpChangesAfterUndo>(ctx, 'CollectionService', 'Redo', request, OpChangesAfterUndo())
  ;
  $async.Future<$0.UInt32> addCustomUndoEntry($pb.ClientContext? ctx, $0.String request) =>
    _client.invoke<$0.UInt32>(ctx, 'CollectionService', 'AddCustomUndoEntry', request, $0.UInt32())
  ;
  $async.Future<OpChanges> mergeUndoEntries($pb.ClientContext? ctx, $0.UInt32 request) =>
    _client.invoke<OpChanges>(ctx, 'CollectionService', 'MergeUndoEntries', request, OpChanges())
  ;
  $async.Future<Progress> latestProgress($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<Progress>(ctx, 'CollectionService', 'LatestProgress', request, Progress())
  ;
  $async.Future<$0.Empty> setWantsAbort($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$0.Empty>(ctx, 'CollectionService', 'SetWantsAbort', request, $0.Empty())
  ;
}

class BackendCollectionServiceApi {
  $pb.RpcClient _client;
  BackendCollectionServiceApi(this._client);

  $async.Future<$0.Empty> openCollection($pb.ClientContext? ctx, OpenCollectionRequest request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendCollectionService', 'OpenCollection', request, $0.Empty())
  ;
  $async.Future<$0.Empty> closeCollection($pb.ClientContext? ctx, CloseCollectionRequest request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendCollectionService', 'CloseCollection', request, $0.Empty())
  ;
  $async.Future<$0.Bool> createBackup($pb.ClientContext? ctx, CreateBackupRequest request) =>
    _client.invoke<$0.Bool>(ctx, 'BackendCollectionService', 'CreateBackup', request, $0.Bool())
  ;
  $async.Future<$0.Empty> awaitBackupCompletion($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendCollectionService', 'AwaitBackupCompletion', request, $0.Empty())
  ;
  $async.Future<Progress> latestProgress($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<Progress>(ctx, 'BackendCollectionService', 'LatestProgress', request, Progress())
  ;
  $async.Future<$0.Empty> setWantsAbort($pb.ClientContext? ctx, $0.Empty request) =>
    _client.invoke<$0.Empty>(ctx, 'BackendCollectionService', 'SetWantsAbort', request, $0.Empty())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

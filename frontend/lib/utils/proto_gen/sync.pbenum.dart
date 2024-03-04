//
//  Generated code. Do not modify.
//  source: anki/sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SyncStatusResponse_Required extends $pb.ProtobufEnum {
  static const SyncStatusResponse_Required NO_CHANGES = SyncStatusResponse_Required._(0, _omitEnumNames ? '' : 'NO_CHANGES');
  static const SyncStatusResponse_Required NORMAL_SYNC = SyncStatusResponse_Required._(1, _omitEnumNames ? '' : 'NORMAL_SYNC');
  static const SyncStatusResponse_Required FULL_SYNC = SyncStatusResponse_Required._(2, _omitEnumNames ? '' : 'FULL_SYNC');

  static const $core.List<SyncStatusResponse_Required> values = <SyncStatusResponse_Required> [
    NO_CHANGES,
    NORMAL_SYNC,
    FULL_SYNC,
  ];

  static final $core.Map<$core.int, SyncStatusResponse_Required> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncStatusResponse_Required? valueOf($core.int value) => _byValue[value];

  const SyncStatusResponse_Required._($core.int v, $core.String n) : super(v, n);
}

class SyncCollectionResponse_ChangesRequired extends $pb.ProtobufEnum {
  static const SyncCollectionResponse_ChangesRequired NO_CHANGES = SyncCollectionResponse_ChangesRequired._(0, _omitEnumNames ? '' : 'NO_CHANGES');
  static const SyncCollectionResponse_ChangesRequired NORMAL_SYNC = SyncCollectionResponse_ChangesRequired._(1, _omitEnumNames ? '' : 'NORMAL_SYNC');
  static const SyncCollectionResponse_ChangesRequired FULL_SYNC = SyncCollectionResponse_ChangesRequired._(2, _omitEnumNames ? '' : 'FULL_SYNC');
  static const SyncCollectionResponse_ChangesRequired FULL_DOWNLOAD = SyncCollectionResponse_ChangesRequired._(3, _omitEnumNames ? '' : 'FULL_DOWNLOAD');
  static const SyncCollectionResponse_ChangesRequired FULL_UPLOAD = SyncCollectionResponse_ChangesRequired._(4, _omitEnumNames ? '' : 'FULL_UPLOAD');

  static const $core.List<SyncCollectionResponse_ChangesRequired> values = <SyncCollectionResponse_ChangesRequired> [
    NO_CHANGES,
    NORMAL_SYNC,
    FULL_SYNC,
    FULL_DOWNLOAD,
    FULL_UPLOAD,
  ];

  static final $core.Map<$core.int, SyncCollectionResponse_ChangesRequired> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncCollectionResponse_ChangesRequired? valueOf($core.int value) => _byValue[value];

  const SyncCollectionResponse_ChangesRequired._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

//
//  Generated code. Do not modify.
//  source: anki/sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'generic.pbjson.dart' as $0;

@$core.Deprecated('Use syncAuthDescriptor instead')
const SyncAuth$json = {
  '1': 'SyncAuth',
  '2': [
    {'1': 'hkey', '3': 1, '4': 1, '5': 9, '10': 'hkey'},
    {'1': 'endpoint', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'endpoint', '17': true},
    {'1': 'io_timeout_secs', '3': 3, '4': 1, '5': 13, '9': 1, '10': 'ioTimeoutSecs', '17': true},
  ],
  '8': [
    {'1': '_endpoint'},
    {'1': '_io_timeout_secs'},
  ],
};

/// Descriptor for `SyncAuth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncAuthDescriptor = $convert.base64Decode(
    'CghTeW5jQXV0aBISCgRoa2V5GAEgASgJUgRoa2V5Eh8KCGVuZHBvaW50GAIgASgJSABSCGVuZH'
    'BvaW50iAEBEisKD2lvX3RpbWVvdXRfc2VjcxgDIAEoDUgBUg1pb1RpbWVvdXRTZWNziAEBQgsK'
    'CV9lbmRwb2ludEISChBfaW9fdGltZW91dF9zZWNz');

@$core.Deprecated('Use syncLoginRequestDescriptor instead')
const SyncLoginRequest$json = {
  '1': 'SyncLoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'endpoint', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'endpoint', '17': true},
  ],
  '8': [
    {'1': '_endpoint'},
  ],
};

/// Descriptor for `SyncLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncLoginRequestDescriptor = $convert.base64Decode(
    'ChBTeW5jTG9naW5SZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd2'
    '9yZBgCIAEoCVIIcGFzc3dvcmQSHwoIZW5kcG9pbnQYAyABKAlIAFIIZW5kcG9pbnSIAQFCCwoJ'
    'X2VuZHBvaW50');

@$core.Deprecated('Use syncStatusResponseDescriptor instead')
const SyncStatusResponse$json = {
  '1': 'SyncStatusResponse',
  '2': [
    {'1': 'required', '3': 1, '4': 1, '5': 14, '6': '.anki.sync.SyncStatusResponse.Required', '10': 'required'},
    {'1': 'new_endpoint', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'newEndpoint', '17': true},
  ],
  '4': [SyncStatusResponse_Required$json],
  '8': [
    {'1': '_new_endpoint'},
  ],
};

@$core.Deprecated('Use syncStatusResponseDescriptor instead')
const SyncStatusResponse_Required$json = {
  '1': 'Required',
  '2': [
    {'1': 'NO_CHANGES', '2': 0},
    {'1': 'NORMAL_SYNC', '2': 1},
    {'1': 'FULL_SYNC', '2': 2},
  ],
};

/// Descriptor for `SyncStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncStatusResponseDescriptor = $convert.base64Decode(
    'ChJTeW5jU3RhdHVzUmVzcG9uc2USQgoIcmVxdWlyZWQYASABKA4yJi5hbmtpLnN5bmMuU3luY1'
    'N0YXR1c1Jlc3BvbnNlLlJlcXVpcmVkUghyZXF1aXJlZBImCgxuZXdfZW5kcG9pbnQYBCABKAlI'
    'AFILbmV3RW5kcG9pbnSIAQEiOgoIUmVxdWlyZWQSDgoKTk9fQ0hBTkdFUxAAEg8KC05PUk1BTF'
    '9TWU5DEAESDQoJRlVMTF9TWU5DEAJCDwoNX25ld19lbmRwb2ludA==');

@$core.Deprecated('Use syncCollectionRequestDescriptor instead')
const SyncCollectionRequest$json = {
  '1': 'SyncCollectionRequest',
  '2': [
    {'1': 'auth', '3': 1, '4': 1, '5': 11, '6': '.anki.sync.SyncAuth', '10': 'auth'},
    {'1': 'sync_media', '3': 2, '4': 1, '5': 8, '10': 'syncMedia'},
  ],
};

/// Descriptor for `SyncCollectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncCollectionRequestDescriptor = $convert.base64Decode(
    'ChVTeW5jQ29sbGVjdGlvblJlcXVlc3QSJwoEYXV0aBgBIAEoCzITLmFua2kuc3luYy5TeW5jQX'
    'V0aFIEYXV0aBIdCgpzeW5jX21lZGlhGAIgASgIUglzeW5jTWVkaWE=');

@$core.Deprecated('Use syncCollectionResponseDescriptor instead')
const SyncCollectionResponse$json = {
  '1': 'SyncCollectionResponse',
  '2': [
    {'1': 'host_number', '3': 1, '4': 1, '5': 13, '10': 'hostNumber'},
    {'1': 'server_message', '3': 2, '4': 1, '5': 9, '10': 'serverMessage'},
    {'1': 'required', '3': 3, '4': 1, '5': 14, '6': '.anki.sync.SyncCollectionResponse.ChangesRequired', '10': 'required'},
    {'1': 'new_endpoint', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'newEndpoint', '17': true},
    {'1': 'server_media_usn', '3': 5, '4': 1, '5': 5, '10': 'serverMediaUsn'},
  ],
  '4': [SyncCollectionResponse_ChangesRequired$json],
  '8': [
    {'1': '_new_endpoint'},
  ],
};

@$core.Deprecated('Use syncCollectionResponseDescriptor instead')
const SyncCollectionResponse_ChangesRequired$json = {
  '1': 'ChangesRequired',
  '2': [
    {'1': 'NO_CHANGES', '2': 0},
    {'1': 'NORMAL_SYNC', '2': 1},
    {'1': 'FULL_SYNC', '2': 2},
    {'1': 'FULL_DOWNLOAD', '2': 3},
    {'1': 'FULL_UPLOAD', '2': 4},
  ],
};

/// Descriptor for `SyncCollectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncCollectionResponseDescriptor = $convert.base64Decode(
    'ChZTeW5jQ29sbGVjdGlvblJlc3BvbnNlEh8KC2hvc3RfbnVtYmVyGAEgASgNUgpob3N0TnVtYm'
    'VyEiUKDnNlcnZlcl9tZXNzYWdlGAIgASgJUg1zZXJ2ZXJNZXNzYWdlEk0KCHJlcXVpcmVkGAMg'
    'ASgOMjEuYW5raS5zeW5jLlN5bmNDb2xsZWN0aW9uUmVzcG9uc2UuQ2hhbmdlc1JlcXVpcmVkUg'
    'hyZXF1aXJlZBImCgxuZXdfZW5kcG9pbnQYBCABKAlIAFILbmV3RW5kcG9pbnSIAQESKAoQc2Vy'
    'dmVyX21lZGlhX3VzbhgFIAEoBVIOc2VydmVyTWVkaWFVc24iZQoPQ2hhbmdlc1JlcXVpcmVkEg'
    '4KCk5PX0NIQU5HRVMQABIPCgtOT1JNQUxfU1lOQxABEg0KCUZVTExfU1lOQxACEhEKDUZVTExf'
    'RE9XTkxPQUQQAxIPCgtGVUxMX1VQTE9BRBAEQg8KDV9uZXdfZW5kcG9pbnQ=');

@$core.Deprecated('Use mediaSyncStatusResponseDescriptor instead')
const MediaSyncStatusResponse$json = {
  '1': 'MediaSyncStatusResponse',
  '2': [
    {'1': 'active', '3': 1, '4': 1, '5': 8, '10': 'active'},
    {'1': 'progress', '3': 2, '4': 1, '5': 11, '6': '.anki.sync.MediaSyncProgress', '10': 'progress'},
  ],
};

/// Descriptor for `MediaSyncStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaSyncStatusResponseDescriptor = $convert.base64Decode(
    'ChdNZWRpYVN5bmNTdGF0dXNSZXNwb25zZRIWCgZhY3RpdmUYASABKAhSBmFjdGl2ZRI4Cghwcm'
    '9ncmVzcxgCIAEoCzIcLmFua2kuc3luYy5NZWRpYVN5bmNQcm9ncmVzc1IIcHJvZ3Jlc3M=');

@$core.Deprecated('Use mediaSyncProgressDescriptor instead')
const MediaSyncProgress$json = {
  '1': 'MediaSyncProgress',
  '2': [
    {'1': 'checked', '3': 1, '4': 1, '5': 9, '10': 'checked'},
    {'1': 'added', '3': 2, '4': 1, '5': 9, '10': 'added'},
    {'1': 'removed', '3': 3, '4': 1, '5': 9, '10': 'removed'},
  ],
};

/// Descriptor for `MediaSyncProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaSyncProgressDescriptor = $convert.base64Decode(
    'ChFNZWRpYVN5bmNQcm9ncmVzcxIYCgdjaGVja2VkGAEgASgJUgdjaGVja2VkEhQKBWFkZGVkGA'
    'IgASgJUgVhZGRlZBIYCgdyZW1vdmVkGAMgASgJUgdyZW1vdmVk');

@$core.Deprecated('Use fullUploadOrDownloadRequestDescriptor instead')
const FullUploadOrDownloadRequest$json = {
  '1': 'FullUploadOrDownloadRequest',
  '2': [
    {'1': 'auth', '3': 1, '4': 1, '5': 11, '6': '.anki.sync.SyncAuth', '10': 'auth'},
    {'1': 'upload', '3': 2, '4': 1, '5': 8, '10': 'upload'},
    {'1': 'server_usn', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'serverUsn', '17': true},
  ],
  '8': [
    {'1': '_server_usn'},
  ],
};

/// Descriptor for `FullUploadOrDownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fullUploadOrDownloadRequestDescriptor = $convert.base64Decode(
    'ChtGdWxsVXBsb2FkT3JEb3dubG9hZFJlcXVlc3QSJwoEYXV0aBgBIAEoCzITLmFua2kuc3luYy'
    '5TeW5jQXV0aFIEYXV0aBIWCgZ1cGxvYWQYAiABKAhSBnVwbG9hZBIiCgpzZXJ2ZXJfdXNuGAMg'
    'ASgFSABSCXNlcnZlclVzbogBAUINCgtfc2VydmVyX3Vzbg==');

const $core.Map<$core.String, $core.dynamic> SyncServiceBase$json = {'1': 'SyncService'};

@$core.Deprecated('Use syncServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> SyncServiceBase$messageJson = {
};

/// Descriptor for `SyncService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List syncServiceDescriptor = $convert.base64Decode(
    'CgtTeW5jU2VydmljZQ==');

const $core.Map<$core.String, $core.dynamic> BackendSyncServiceBase$json = {
  '1': 'BackendSyncService',
  '2': [
    {'1': 'SyncMedia', '2': '.anki.sync.SyncAuth', '3': '.anki.generic.Empty'},
    {'1': 'AbortMediaSync', '2': '.anki.generic.Empty', '3': '.anki.generic.Empty'},
    {'1': 'MediaSyncStatus', '2': '.anki.generic.Empty', '3': '.anki.sync.MediaSyncStatusResponse'},
    {'1': 'SyncLogin', '2': '.anki.sync.SyncLoginRequest', '3': '.anki.sync.SyncAuth'},
    {'1': 'SyncStatus', '2': '.anki.sync.SyncAuth', '3': '.anki.sync.SyncStatusResponse'},
    {'1': 'SyncCollection', '2': '.anki.sync.SyncCollectionRequest', '3': '.anki.sync.SyncCollectionResponse'},
    {'1': 'FullUploadOrDownload', '2': '.anki.sync.FullUploadOrDownloadRequest', '3': '.anki.generic.Empty'},
    {'1': 'AbortSync', '2': '.anki.generic.Empty', '3': '.anki.generic.Empty'},
  ],
};

@$core.Deprecated('Use backendSyncServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BackendSyncServiceBase$messageJson = {
  '.anki.sync.SyncAuth': SyncAuth$json,
  '.anki.generic.Empty': $0.Empty$json,
  '.anki.sync.MediaSyncStatusResponse': MediaSyncStatusResponse$json,
  '.anki.sync.MediaSyncProgress': MediaSyncProgress$json,
  '.anki.sync.SyncLoginRequest': SyncLoginRequest$json,
  '.anki.sync.SyncStatusResponse': SyncStatusResponse$json,
  '.anki.sync.SyncCollectionRequest': SyncCollectionRequest$json,
  '.anki.sync.SyncCollectionResponse': SyncCollectionResponse$json,
  '.anki.sync.FullUploadOrDownloadRequest': FullUploadOrDownloadRequest$json,
};

/// Descriptor for `BackendSyncService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List backendSyncServiceDescriptor = $convert.base64Decode(
    'ChJCYWNrZW5kU3luY1NlcnZpY2USNQoJU3luY01lZGlhEhMuYW5raS5zeW5jLlN5bmNBdXRoGh'
    'MuYW5raS5nZW5lcmljLkVtcHR5EjoKDkFib3J0TWVkaWFTeW5jEhMuYW5raS5nZW5lcmljLkVt'
    'cHR5GhMuYW5raS5nZW5lcmljLkVtcHR5EkoKD01lZGlhU3luY1N0YXR1cxITLmFua2kuZ2VuZX'
    'JpYy5FbXB0eRoiLmFua2kuc3luYy5NZWRpYVN5bmNTdGF0dXNSZXNwb25zZRI9CglTeW5jTG9n'
    'aW4SGy5hbmtpLnN5bmMuU3luY0xvZ2luUmVxdWVzdBoTLmFua2kuc3luYy5TeW5jQXV0aBJACg'
    'pTeW5jU3RhdHVzEhMuYW5raS5zeW5jLlN5bmNBdXRoGh0uYW5raS5zeW5jLlN5bmNTdGF0dXNS'
    'ZXNwb25zZRJVCg5TeW5jQ29sbGVjdGlvbhIgLmFua2kuc3luYy5TeW5jQ29sbGVjdGlvblJlcX'
    'Vlc3QaIS5hbmtpLnN5bmMuU3luY0NvbGxlY3Rpb25SZXNwb25zZRJTChRGdWxsVXBsb2FkT3JE'
    'b3dubG9hZBImLmFua2kuc3luYy5GdWxsVXBsb2FkT3JEb3dubG9hZFJlcXVlc3QaEy5hbmtpLm'
    'dlbmVyaWMuRW1wdHkSNQoJQWJvcnRTeW5jEhMuYW5raS5nZW5lcmljLkVtcHR5GhMuYW5raS5n'
    'ZW5lcmljLkVtcHR5');


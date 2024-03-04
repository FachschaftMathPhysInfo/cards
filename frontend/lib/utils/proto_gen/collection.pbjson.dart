//
//  Generated code. Do not modify.
//  source: anki/collection.proto
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
import 'sync.pbjson.dart' as $1;

@$core.Deprecated('Use openCollectionRequestDescriptor instead')
const OpenCollectionRequest$json = {
  '1': 'OpenCollectionRequest',
  '2': [
    {'1': 'collection_path', '3': 1, '4': 1, '5': 9, '10': 'collectionPath'},
    {'1': 'media_folder_path', '3': 2, '4': 1, '5': 9, '10': 'mediaFolderPath'},
    {'1': 'media_db_path', '3': 3, '4': 1, '5': 9, '10': 'mediaDbPath'},
  ],
};

/// Descriptor for `OpenCollectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List openCollectionRequestDescriptor = $convert.base64Decode(
    'ChVPcGVuQ29sbGVjdGlvblJlcXVlc3QSJwoPY29sbGVjdGlvbl9wYXRoGAEgASgJUg5jb2xsZW'
    'N0aW9uUGF0aBIqChFtZWRpYV9mb2xkZXJfcGF0aBgCIAEoCVIPbWVkaWFGb2xkZXJQYXRoEiIK'
    'DW1lZGlhX2RiX3BhdGgYAyABKAlSC21lZGlhRGJQYXRo');

@$core.Deprecated('Use closeCollectionRequestDescriptor instead')
const CloseCollectionRequest$json = {
  '1': 'CloseCollectionRequest',
  '2': [
    {'1': 'downgrade_to_schema11', '3': 1, '4': 1, '5': 8, '10': 'downgradeToSchema11'},
  ],
};

/// Descriptor for `CloseCollectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List closeCollectionRequestDescriptor = $convert.base64Decode(
    'ChZDbG9zZUNvbGxlY3Rpb25SZXF1ZXN0EjIKFWRvd25ncmFkZV90b19zY2hlbWExMRgBIAEoCF'
    'ITZG93bmdyYWRlVG9TY2hlbWExMQ==');

@$core.Deprecated('Use checkDatabaseResponseDescriptor instead')
const CheckDatabaseResponse$json = {
  '1': 'CheckDatabaseResponse',
  '2': [
    {'1': 'problems', '3': 1, '4': 3, '5': 9, '10': 'problems'},
  ],
};

/// Descriptor for `CheckDatabaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkDatabaseResponseDescriptor = $convert.base64Decode(
    'ChVDaGVja0RhdGFiYXNlUmVzcG9uc2USGgoIcHJvYmxlbXMYASADKAlSCHByb2JsZW1z');

@$core.Deprecated('Use opChangesDescriptor instead')
const OpChanges$json = {
  '1': 'OpChanges',
  '2': [
    {'1': 'card', '3': 1, '4': 1, '5': 8, '10': 'card'},
    {'1': 'note', '3': 2, '4': 1, '5': 8, '10': 'note'},
    {'1': 'deck', '3': 3, '4': 1, '5': 8, '10': 'deck'},
    {'1': 'tag', '3': 4, '4': 1, '5': 8, '10': 'tag'},
    {'1': 'notetype', '3': 5, '4': 1, '5': 8, '10': 'notetype'},
    {'1': 'config', '3': 6, '4': 1, '5': 8, '10': 'config'},
    {'1': 'deck_config', '3': 11, '4': 1, '5': 8, '10': 'deckConfig'},
    {'1': 'mtime', '3': 12, '4': 1, '5': 8, '10': 'mtime'},
    {'1': 'browser_table', '3': 7, '4': 1, '5': 8, '10': 'browserTable'},
    {'1': 'browser_sidebar', '3': 8, '4': 1, '5': 8, '10': 'browserSidebar'},
    {'1': 'note_text', '3': 9, '4': 1, '5': 8, '10': 'noteText'},
    {'1': 'study_queues', '3': 10, '4': 1, '5': 8, '10': 'studyQueues'},
  ],
};

/// Descriptor for `OpChanges`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List opChangesDescriptor = $convert.base64Decode(
    'CglPcENoYW5nZXMSEgoEY2FyZBgBIAEoCFIEY2FyZBISCgRub3RlGAIgASgIUgRub3RlEhIKBG'
    'RlY2sYAyABKAhSBGRlY2sSEAoDdGFnGAQgASgIUgN0YWcSGgoIbm90ZXR5cGUYBSABKAhSCG5v'
    'dGV0eXBlEhYKBmNvbmZpZxgGIAEoCFIGY29uZmlnEh8KC2RlY2tfY29uZmlnGAsgASgIUgpkZW'
    'NrQ29uZmlnEhQKBW10aW1lGAwgASgIUgVtdGltZRIjCg1icm93c2VyX3RhYmxlGAcgASgIUgxi'
    'cm93c2VyVGFibGUSJwoPYnJvd3Nlcl9zaWRlYmFyGAggASgIUg5icm93c2VyU2lkZWJhchIbCg'
    'lub3RlX3RleHQYCSABKAhSCG5vdGVUZXh0EiEKDHN0dWR5X3F1ZXVlcxgKIAEoCFILc3R1ZHlR'
    'dWV1ZXM=');

@$core.Deprecated('Use opChangesOnlyDescriptor instead')
const OpChangesOnly$json = {
  '1': 'OpChangesOnly',
  '2': [
    {'1': 'changes', '3': 1, '4': 1, '5': 11, '6': '.anki.collection.OpChanges', '10': 'changes'},
  ],
};

/// Descriptor for `OpChangesOnly`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List opChangesOnlyDescriptor = $convert.base64Decode(
    'Cg1PcENoYW5nZXNPbmx5EjQKB2NoYW5nZXMYASABKAsyGi5hbmtpLmNvbGxlY3Rpb24uT3BDaG'
    'FuZ2VzUgdjaGFuZ2Vz');

@$core.Deprecated('Use opChangesWithCountDescriptor instead')
const OpChangesWithCount$json = {
  '1': 'OpChangesWithCount',
  '2': [
    {'1': 'changes', '3': 1, '4': 1, '5': 11, '6': '.anki.collection.OpChanges', '10': 'changes'},
    {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `OpChangesWithCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List opChangesWithCountDescriptor = $convert.base64Decode(
    'ChJPcENoYW5nZXNXaXRoQ291bnQSNAoHY2hhbmdlcxgBIAEoCzIaLmFua2kuY29sbGVjdGlvbi'
    '5PcENoYW5nZXNSB2NoYW5nZXMSFAoFY291bnQYAiABKA1SBWNvdW50');

@$core.Deprecated('Use opChangesWithIdDescriptor instead')
const OpChangesWithId$json = {
  '1': 'OpChangesWithId',
  '2': [
    {'1': 'changes', '3': 1, '4': 1, '5': 11, '6': '.anki.collection.OpChanges', '10': 'changes'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `OpChangesWithId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List opChangesWithIdDescriptor = $convert.base64Decode(
    'Cg9PcENoYW5nZXNXaXRoSWQSNAoHY2hhbmdlcxgBIAEoCzIaLmFua2kuY29sbGVjdGlvbi5PcE'
    'NoYW5nZXNSB2NoYW5nZXMSDgoCaWQYAiABKANSAmlk');

@$core.Deprecated('Use undoStatusDescriptor instead')
const UndoStatus$json = {
  '1': 'UndoStatus',
  '2': [
    {'1': 'undo', '3': 1, '4': 1, '5': 9, '10': 'undo'},
    {'1': 'redo', '3': 2, '4': 1, '5': 9, '10': 'redo'},
    {'1': 'last_step', '3': 3, '4': 1, '5': 13, '10': 'lastStep'},
  ],
};

/// Descriptor for `UndoStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List undoStatusDescriptor = $convert.base64Decode(
    'CgpVbmRvU3RhdHVzEhIKBHVuZG8YASABKAlSBHVuZG8SEgoEcmVkbxgCIAEoCVIEcmVkbxIbCg'
    'lsYXN0X3N0ZXAYAyABKA1SCGxhc3RTdGVw');

@$core.Deprecated('Use opChangesAfterUndoDescriptor instead')
const OpChangesAfterUndo$json = {
  '1': 'OpChangesAfterUndo',
  '2': [
    {'1': 'changes', '3': 1, '4': 1, '5': 11, '6': '.anki.collection.OpChanges', '10': 'changes'},
    {'1': 'operation', '3': 2, '4': 1, '5': 9, '10': 'operation'},
    {'1': 'reverted_to_timestamp', '3': 3, '4': 1, '5': 3, '10': 'revertedToTimestamp'},
    {'1': 'new_status', '3': 4, '4': 1, '5': 11, '6': '.anki.collection.UndoStatus', '10': 'newStatus'},
    {'1': 'counter', '3': 5, '4': 1, '5': 13, '10': 'counter'},
  ],
};

/// Descriptor for `OpChangesAfterUndo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List opChangesAfterUndoDescriptor = $convert.base64Decode(
    'ChJPcENoYW5nZXNBZnRlclVuZG8SNAoHY2hhbmdlcxgBIAEoCzIaLmFua2kuY29sbGVjdGlvbi'
    '5PcENoYW5nZXNSB2NoYW5nZXMSHAoJb3BlcmF0aW9uGAIgASgJUglvcGVyYXRpb24SMgoVcmV2'
    'ZXJ0ZWRfdG9fdGltZXN0YW1wGAMgASgDUhNyZXZlcnRlZFRvVGltZXN0YW1wEjoKCm5ld19zdG'
    'F0dXMYBCABKAsyGy5hbmtpLmNvbGxlY3Rpb24uVW5kb1N0YXR1c1IJbmV3U3RhdHVzEhgKB2Nv'
    'dW50ZXIYBSABKA1SB2NvdW50ZXI=');

@$core.Deprecated('Use progressDescriptor instead')
const Progress$json = {
  '1': 'Progress',
  '2': [
    {'1': 'none', '3': 1, '4': 1, '5': 11, '6': '.anki.generic.Empty', '9': 0, '10': 'none'},
    {'1': 'media_sync', '3': 2, '4': 1, '5': 11, '6': '.anki.sync.MediaSyncProgress', '9': 0, '10': 'mediaSync'},
    {'1': 'media_check', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'mediaCheck'},
    {'1': 'full_sync', '3': 4, '4': 1, '5': 11, '6': '.anki.collection.Progress.FullSync', '9': 0, '10': 'fullSync'},
    {'1': 'normal_sync', '3': 5, '4': 1, '5': 11, '6': '.anki.collection.Progress.NormalSync', '9': 0, '10': 'normalSync'},
    {'1': 'database_check', '3': 6, '4': 1, '5': 11, '6': '.anki.collection.Progress.DatabaseCheck', '9': 0, '10': 'databaseCheck'},
    {'1': 'importing', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'importing'},
    {'1': 'exporting', '3': 8, '4': 1, '5': 9, '9': 0, '10': 'exporting'},
    {'1': 'compute_weights', '3': 9, '4': 1, '5': 11, '6': '.anki.collection.ComputeWeightsProgress', '9': 0, '10': 'computeWeights'},
    {'1': 'compute_retention', '3': 10, '4': 1, '5': 11, '6': '.anki.collection.ComputeRetentionProgress', '9': 0, '10': 'computeRetention'},
    {'1': 'compute_memory', '3': 11, '4': 1, '5': 11, '6': '.anki.collection.ComputeMemoryProgress', '9': 0, '10': 'computeMemory'},
  ],
  '3': [Progress_FullSync$json, Progress_NormalSync$json, Progress_DatabaseCheck$json],
  '8': [
    {'1': 'value'},
  ],
};

@$core.Deprecated('Use progressDescriptor instead')
const Progress_FullSync$json = {
  '1': 'FullSync',
  '2': [
    {'1': 'transferred', '3': 1, '4': 1, '5': 13, '10': 'transferred'},
    {'1': 'total', '3': 2, '4': 1, '5': 13, '10': 'total'},
  ],
};

@$core.Deprecated('Use progressDescriptor instead')
const Progress_NormalSync$json = {
  '1': 'NormalSync',
  '2': [
    {'1': 'stage', '3': 1, '4': 1, '5': 9, '10': 'stage'},
    {'1': 'added', '3': 2, '4': 1, '5': 9, '10': 'added'},
    {'1': 'removed', '3': 3, '4': 1, '5': 9, '10': 'removed'},
  ],
};

@$core.Deprecated('Use progressDescriptor instead')
const Progress_DatabaseCheck$json = {
  '1': 'DatabaseCheck',
  '2': [
    {'1': 'stage', '3': 1, '4': 1, '5': 9, '10': 'stage'},
    {'1': 'stage_total', '3': 2, '4': 1, '5': 13, '10': 'stageTotal'},
    {'1': 'stage_current', '3': 3, '4': 1, '5': 13, '10': 'stageCurrent'},
  ],
};

/// Descriptor for `Progress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressDescriptor = $convert.base64Decode(
    'CghQcm9ncmVzcxIpCgRub25lGAEgASgLMhMuYW5raS5nZW5lcmljLkVtcHR5SABSBG5vbmUSPQ'
    'oKbWVkaWFfc3luYxgCIAEoCzIcLmFua2kuc3luYy5NZWRpYVN5bmNQcm9ncmVzc0gAUgltZWRp'
    'YVN5bmMSIQoLbWVkaWFfY2hlY2sYAyABKAlIAFIKbWVkaWFDaGVjaxJBCglmdWxsX3N5bmMYBC'
    'ABKAsyIi5hbmtpLmNvbGxlY3Rpb24uUHJvZ3Jlc3MuRnVsbFN5bmNIAFIIZnVsbFN5bmMSRwoL'
    'bm9ybWFsX3N5bmMYBSABKAsyJC5hbmtpLmNvbGxlY3Rpb24uUHJvZ3Jlc3MuTm9ybWFsU3luY0'
    'gAUgpub3JtYWxTeW5jElAKDmRhdGFiYXNlX2NoZWNrGAYgASgLMicuYW5raS5jb2xsZWN0aW9u'
    'LlByb2dyZXNzLkRhdGFiYXNlQ2hlY2tIAFINZGF0YWJhc2VDaGVjaxIeCglpbXBvcnRpbmcYBy'
    'ABKAlIAFIJaW1wb3J0aW5nEh4KCWV4cG9ydGluZxgIIAEoCUgAUglleHBvcnRpbmcSUgoPY29t'
    'cHV0ZV93ZWlnaHRzGAkgASgLMicuYW5raS5jb2xsZWN0aW9uLkNvbXB1dGVXZWlnaHRzUHJvZ3'
    'Jlc3NIAFIOY29tcHV0ZVdlaWdodHMSWAoRY29tcHV0ZV9yZXRlbnRpb24YCiABKAsyKS5hbmtp'
    'LmNvbGxlY3Rpb24uQ29tcHV0ZVJldGVudGlvblByb2dyZXNzSABSEGNvbXB1dGVSZXRlbnRpb2'
    '4STwoOY29tcHV0ZV9tZW1vcnkYCyABKAsyJi5hbmtpLmNvbGxlY3Rpb24uQ29tcHV0ZU1lbW9y'
    'eVByb2dyZXNzSABSDWNvbXB1dGVNZW1vcnkaQgoIRnVsbFN5bmMSIAoLdHJhbnNmZXJyZWQYAS'
    'ABKA1SC3RyYW5zZmVycmVkEhQKBXRvdGFsGAIgASgNUgV0b3RhbBpSCgpOb3JtYWxTeW5jEhQK'
    'BXN0YWdlGAEgASgJUgVzdGFnZRIUCgVhZGRlZBgCIAEoCVIFYWRkZWQSGAoHcmVtb3ZlZBgDIA'
    'EoCVIHcmVtb3ZlZBprCg1EYXRhYmFzZUNoZWNrEhQKBXN0YWdlGAEgASgJUgVzdGFnZRIfCgtz'
    'dGFnZV90b3RhbBgCIAEoDVIKc3RhZ2VUb3RhbBIjCg1zdGFnZV9jdXJyZW50GAMgASgNUgxzdG'
    'FnZUN1cnJlbnRCBwoFdmFsdWU=');

@$core.Deprecated('Use computeWeightsProgressDescriptor instead')
const ComputeWeightsProgress$json = {
  '1': 'ComputeWeightsProgress',
  '2': [
    {'1': 'current', '3': 1, '4': 1, '5': 13, '10': 'current'},
    {'1': 'total', '3': 2, '4': 1, '5': 13, '10': 'total'},
    {'1': 'reviews', '3': 3, '4': 1, '5': 13, '10': 'reviews'},
    {'1': 'current_preset', '3': 4, '4': 1, '5': 13, '10': 'currentPreset'},
    {'1': 'total_presets', '3': 5, '4': 1, '5': 13, '10': 'totalPresets'},
  ],
};

/// Descriptor for `ComputeWeightsProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List computeWeightsProgressDescriptor = $convert.base64Decode(
    'ChZDb21wdXRlV2VpZ2h0c1Byb2dyZXNzEhgKB2N1cnJlbnQYASABKA1SB2N1cnJlbnQSFAoFdG'
    '90YWwYAiABKA1SBXRvdGFsEhgKB3Jldmlld3MYAyABKA1SB3Jldmlld3MSJQoOY3VycmVudF9w'
    'cmVzZXQYBCABKA1SDWN1cnJlbnRQcmVzZXQSIwoNdG90YWxfcHJlc2V0cxgFIAEoDVIMdG90YW'
    'xQcmVzZXRz');

@$core.Deprecated('Use computeRetentionProgressDescriptor instead')
const ComputeRetentionProgress$json = {
  '1': 'ComputeRetentionProgress',
  '2': [
    {'1': 'current', '3': 1, '4': 1, '5': 13, '10': 'current'},
    {'1': 'total', '3': 2, '4': 1, '5': 13, '10': 'total'},
  ],
};

/// Descriptor for `ComputeRetentionProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List computeRetentionProgressDescriptor = $convert.base64Decode(
    'ChhDb21wdXRlUmV0ZW50aW9uUHJvZ3Jlc3MSGAoHY3VycmVudBgBIAEoDVIHY3VycmVudBIUCg'
    'V0b3RhbBgCIAEoDVIFdG90YWw=');

@$core.Deprecated('Use computeMemoryProgressDescriptor instead')
const ComputeMemoryProgress$json = {
  '1': 'ComputeMemoryProgress',
  '2': [
    {'1': 'current_cards', '3': 1, '4': 1, '5': 13, '10': 'currentCards'},
    {'1': 'total_cards', '3': 2, '4': 1, '5': 13, '10': 'totalCards'},
    {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `ComputeMemoryProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List computeMemoryProgressDescriptor = $convert.base64Decode(
    'ChVDb21wdXRlTWVtb3J5UHJvZ3Jlc3MSIwoNY3VycmVudF9jYXJkcxgBIAEoDVIMY3VycmVudE'
    'NhcmRzEh8KC3RvdGFsX2NhcmRzGAIgASgNUgp0b3RhbENhcmRzEhQKBWxhYmVsGAMgASgJUgVs'
    'YWJlbA==');

@$core.Deprecated('Use createBackupRequestDescriptor instead')
const CreateBackupRequest$json = {
  '1': 'CreateBackupRequest',
  '2': [
    {'1': 'backup_folder', '3': 1, '4': 1, '5': 9, '10': 'backupFolder'},
    {'1': 'force', '3': 2, '4': 1, '5': 8, '10': 'force'},
    {'1': 'wait_for_completion', '3': 3, '4': 1, '5': 8, '10': 'waitForCompletion'},
  ],
};

/// Descriptor for `CreateBackupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBackupRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVCYWNrdXBSZXF1ZXN0EiMKDWJhY2t1cF9mb2xkZXIYASABKAlSDGJhY2t1cEZvbG'
    'RlchIUCgVmb3JjZRgCIAEoCFIFZm9yY2USLgoTd2FpdF9mb3JfY29tcGxldGlvbhgDIAEoCFIR'
    'd2FpdEZvckNvbXBsZXRpb24=');

const $core.Map<$core.String, $core.dynamic> CollectionServiceBase$json = {
  '1': 'CollectionService',
  '2': [
    {'1': 'CheckDatabase', '2': '.anki.generic.Empty', '3': '.anki.collection.CheckDatabaseResponse'},
    {'1': 'GetUndoStatus', '2': '.anki.generic.Empty', '3': '.anki.collection.UndoStatus'},
    {'1': 'Undo', '2': '.anki.generic.Empty', '3': '.anki.collection.OpChangesAfterUndo'},
    {'1': 'Redo', '2': '.anki.generic.Empty', '3': '.anki.collection.OpChangesAfterUndo'},
    {'1': 'AddCustomUndoEntry', '2': '.anki.generic.String', '3': '.anki.generic.UInt32'},
    {'1': 'MergeUndoEntries', '2': '.anki.generic.UInt32', '3': '.anki.collection.OpChanges'},
    {'1': 'LatestProgress', '2': '.anki.generic.Empty', '3': '.anki.collection.Progress'},
    {'1': 'SetWantsAbort', '2': '.anki.generic.Empty', '3': '.anki.generic.Empty'},
  ],
};

@$core.Deprecated('Use collectionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> CollectionServiceBase$messageJson = {
  '.anki.generic.Empty': $0.Empty$json,
  '.anki.collection.CheckDatabaseResponse': CheckDatabaseResponse$json,
  '.anki.collection.UndoStatus': UndoStatus$json,
  '.anki.collection.OpChangesAfterUndo': OpChangesAfterUndo$json,
  '.anki.collection.OpChanges': OpChanges$json,
  '.anki.generic.String': $0.String$json,
  '.anki.generic.UInt32': $0.UInt32$json,
  '.anki.collection.Progress': Progress$json,
  '.anki.sync.MediaSyncProgress': $1.MediaSyncProgress$json,
  '.anki.collection.Progress.FullSync': Progress_FullSync$json,
  '.anki.collection.Progress.NormalSync': Progress_NormalSync$json,
  '.anki.collection.Progress.DatabaseCheck': Progress_DatabaseCheck$json,
  '.anki.collection.ComputeWeightsProgress': ComputeWeightsProgress$json,
  '.anki.collection.ComputeRetentionProgress': ComputeRetentionProgress$json,
  '.anki.collection.ComputeMemoryProgress': ComputeMemoryProgress$json,
};

/// Descriptor for `CollectionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List collectionServiceDescriptor = $convert.base64Decode(
    'ChFDb2xsZWN0aW9uU2VydmljZRJMCg1DaGVja0RhdGFiYXNlEhMuYW5raS5nZW5lcmljLkVtcH'
    'R5GiYuYW5raS5jb2xsZWN0aW9uLkNoZWNrRGF0YWJhc2VSZXNwb25zZRJBCg1HZXRVbmRvU3Rh'
    'dHVzEhMuYW5raS5nZW5lcmljLkVtcHR5GhsuYW5raS5jb2xsZWN0aW9uLlVuZG9TdGF0dXMSQA'
    'oEVW5kbxITLmFua2kuZ2VuZXJpYy5FbXB0eRojLmFua2kuY29sbGVjdGlvbi5PcENoYW5nZXNB'
    'ZnRlclVuZG8SQAoEUmVkbxITLmFua2kuZ2VuZXJpYy5FbXB0eRojLmFua2kuY29sbGVjdGlvbi'
    '5PcENoYW5nZXNBZnRlclVuZG8SQAoSQWRkQ3VzdG9tVW5kb0VudHJ5EhQuYW5raS5nZW5lcmlj'
    'LlN0cmluZxoULmFua2kuZ2VuZXJpYy5VSW50MzISRAoQTWVyZ2VVbmRvRW50cmllcxIULmFua2'
    'kuZ2VuZXJpYy5VSW50MzIaGi5hbmtpLmNvbGxlY3Rpb24uT3BDaGFuZ2VzEkAKDkxhdGVzdFBy'
    'b2dyZXNzEhMuYW5raS5nZW5lcmljLkVtcHR5GhkuYW5raS5jb2xsZWN0aW9uLlByb2dyZXNzEj'
    'kKDVNldFdhbnRzQWJvcnQSEy5hbmtpLmdlbmVyaWMuRW1wdHkaEy5hbmtpLmdlbmVyaWMuRW1w'
    'dHk=');

const $core.Map<$core.String, $core.dynamic> BackendCollectionServiceBase$json = {
  '1': 'BackendCollectionService',
  '2': [
    {'1': 'OpenCollection', '2': '.anki.collection.OpenCollectionRequest', '3': '.anki.generic.Empty'},
    {'1': 'CloseCollection', '2': '.anki.collection.CloseCollectionRequest', '3': '.anki.generic.Empty'},
    {'1': 'CreateBackup', '2': '.anki.collection.CreateBackupRequest', '3': '.anki.generic.Bool'},
    {'1': 'AwaitBackupCompletion', '2': '.anki.generic.Empty', '3': '.anki.generic.Empty'},
    {'1': 'LatestProgress', '2': '.anki.generic.Empty', '3': '.anki.collection.Progress'},
    {'1': 'SetWantsAbort', '2': '.anki.generic.Empty', '3': '.anki.generic.Empty'},
  ],
};

@$core.Deprecated('Use backendCollectionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BackendCollectionServiceBase$messageJson = {
  '.anki.collection.OpenCollectionRequest': OpenCollectionRequest$json,
  '.anki.generic.Empty': $0.Empty$json,
  '.anki.collection.CloseCollectionRequest': CloseCollectionRequest$json,
  '.anki.collection.CreateBackupRequest': CreateBackupRequest$json,
  '.anki.generic.Bool': $0.Bool$json,
  '.anki.collection.Progress': Progress$json,
  '.anki.sync.MediaSyncProgress': $1.MediaSyncProgress$json,
  '.anki.collection.Progress.FullSync': Progress_FullSync$json,
  '.anki.collection.Progress.NormalSync': Progress_NormalSync$json,
  '.anki.collection.Progress.DatabaseCheck': Progress_DatabaseCheck$json,
  '.anki.collection.ComputeWeightsProgress': ComputeWeightsProgress$json,
  '.anki.collection.ComputeRetentionProgress': ComputeRetentionProgress$json,
  '.anki.collection.ComputeMemoryProgress': ComputeMemoryProgress$json,
};

/// Descriptor for `BackendCollectionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List backendCollectionServiceDescriptor = $convert.base64Decode(
    'ChhCYWNrZW5kQ29sbGVjdGlvblNlcnZpY2USTQoOT3BlbkNvbGxlY3Rpb24SJi5hbmtpLmNvbG'
    'xlY3Rpb24uT3BlbkNvbGxlY3Rpb25SZXF1ZXN0GhMuYW5raS5nZW5lcmljLkVtcHR5Ek8KD0Ns'
    'b3NlQ29sbGVjdGlvbhInLmFua2kuY29sbGVjdGlvbi5DbG9zZUNvbGxlY3Rpb25SZXF1ZXN0Gh'
    'MuYW5raS5nZW5lcmljLkVtcHR5EkgKDENyZWF0ZUJhY2t1cBIkLmFua2kuY29sbGVjdGlvbi5D'
    'cmVhdGVCYWNrdXBSZXF1ZXN0GhIuYW5raS5nZW5lcmljLkJvb2wSQQoVQXdhaXRCYWNrdXBDb2'
    '1wbGV0aW9uEhMuYW5raS5nZW5lcmljLkVtcHR5GhMuYW5raS5nZW5lcmljLkVtcHR5EkAKDkxh'
    'dGVzdFByb2dyZXNzEhMuYW5raS5nZW5lcmljLkVtcHR5GhkuYW5raS5jb2xsZWN0aW9uLlByb2'
    'dyZXNzEjkKDVNldFdhbnRzQWJvcnQSEy5hbmtpLmdlbmVyaWMuRW1wdHkaEy5hbmtpLmdlbmVy'
    'aWMuRW1wdHk=');


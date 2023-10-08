import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TextEditingController title,
    @Default(false) bool isCompleted,
  }) = _Todo;
}

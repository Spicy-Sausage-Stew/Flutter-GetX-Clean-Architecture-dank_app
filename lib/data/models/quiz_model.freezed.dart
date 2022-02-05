// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return _QuizModel.fromJson(json);
}

/// @nodoc
class _$QuizModelTearOff {
  const _$QuizModelTearOff();

  _QuizModel call(
      {required String title, required String body, required int answer}) {
    return _QuizModel(
      title: title,
      body: body,
      answer: answer,
    );
  }

  QuizModel fromJson(Map<String, Object?> json) {
    return QuizModel.fromJson(json);
  }
}

/// @nodoc
const $QuizModel = _$QuizModelTearOff();

/// @nodoc
mixin _$QuizModel {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizModelCopyWith<QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizModelCopyWith<$Res> {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) then) =
      _$QuizModelCopyWithImpl<$Res>;
  $Res call({String title, String body, int answer});
}

/// @nodoc
class _$QuizModelCopyWithImpl<$Res> implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._value, this._then);

  final QuizModel _value;
  // ignore: unused_field
  final $Res Function(QuizModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$QuizModelCopyWith<$Res> implements $QuizModelCopyWith<$Res> {
  factory _$QuizModelCopyWith(
          _QuizModel value, $Res Function(_QuizModel) then) =
      __$QuizModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, String body, int answer});
}

/// @nodoc
class __$QuizModelCopyWithImpl<$Res> extends _$QuizModelCopyWithImpl<$Res>
    implements _$QuizModelCopyWith<$Res> {
  __$QuizModelCopyWithImpl(_QuizModel _value, $Res Function(_QuizModel) _then)
      : super(_value, (v) => _then(v as _QuizModel));

  @override
  _QuizModel get _value => super._value as _QuizModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? answer = freezed,
  }) {
    return _then(_QuizModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizModel implements _QuizModel {
  _$_QuizModel({required this.title, required this.body, required this.answer});

  factory _$_QuizModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuizModelFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final int answer;

  @override
  String toString() {
    return 'QuizModel(title: $title, body: $body, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$QuizModelCopyWith<_QuizModel> get copyWith =>
      __$QuizModelCopyWithImpl<_QuizModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizModelToJson(this);
  }
}

abstract class _QuizModel implements QuizModel {
  factory _QuizModel(
      {required String title,
      required String body,
      required int answer}) = _$_QuizModel;

  factory _QuizModel.fromJson(Map<String, dynamic> json) =
      _$_QuizModel.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  int get answer;
  @override
  @JsonKey(ignore: true)
  _$QuizModelCopyWith<_QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

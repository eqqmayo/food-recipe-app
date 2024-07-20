import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator.freezed.dart';
part 'creator.g.dart';

@freezed
class Creator with _$Creator {
  const factory Creator({
    required String image,
    required String name,
    required String location,
  }) = _Creator;

  factory Creator.fromJson(Map<String, Object?> json) =>
      _$CreatorFromJson(json);
}

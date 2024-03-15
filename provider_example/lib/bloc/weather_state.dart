part of 'weather_bloc.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = Initial;
  const factory WeatherState.loading() = Loading;
  const factory WeatherState.success({required Weather weather}) = Success;
  const factory WeatherState.failure() = Failure;
}

import 'dart:async';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';
part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const Initial()) {
    on<Fetched>(_getWeather);
  }

  FutureOr<void> _getWeather(Fetched event, Emitter<WeatherState> emit) async {
    emit(const WeatherState.loading());
    try {
      WeatherFactory wf = WeatherFactory(apiKey);
      final response = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);
      log(response.toString());
      emit(WeatherState.success(weather: response));
    } catch (e) {
      log(e.toString());
    }
  }
}

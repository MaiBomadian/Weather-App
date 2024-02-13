import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition,
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeView(),
                  );
                },
              )),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange; // Representing 'clear' conditions with orange

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.blue; // Representing 'rainy' conditions with blue

    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'light snow':
    case 'patchy light snow':
    case 'moderate snow':
    case 'patchy moderate snow':
    case 'heavy snow':
    case 'patchy heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.lightBlue;

    case 'thundery outbreaks possible':
      return Colors.deepPurple;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    default:
      return Colors.grey;
  }
}

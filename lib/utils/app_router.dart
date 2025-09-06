import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/weather_model.dart';
import '../view/screen/daily_details/daily_details_screen.dart';
import '../view/screen/home/home_screen.dart';
import '../view/screen/search/search_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String search = '/search';
  static const String dailyDetails = '/daily-details';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: search,
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: dailyDetails,
        name: 'dailyDetails',
        builder: (context, state) {
          final weatherModel = state.extra as WeatherModel;
          return DailyDetailsScreen(weatherModel: weatherModel);
        },
      ),
    ],
  );
}

import 'package:dtgoldsmith_web/views/about.dart';
import 'package:dtgoldsmith_web/views/contact.dart';
import 'package:dtgoldsmith_web/views/faq.dart';
import 'package:dtgoldsmith_web/views/home.dart';
import 'package:dtgoldsmith_web/views/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

Color appDarkGrey = Color.fromARGB(255, 31, 31, 31);

class MyRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'Home',
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [],
      ),
      GoRoute(
        name: 'About',
        path: '/About',
        builder: (context, state) => About(),
        routes: [],
      ),
      GoRoute(
        name: 'Contact',
        path: '/Contact',
        builder: (context, state) => Contact(),
        routes: [],
      ),
      GoRoute(
        name: 'FAQ',
        path: '/FAQ',
        builder: (context, state) => FAQ(),
        routes: [],
      ),
      GoRoute(
        name: 'Services',
        path: '/Services',
        builder: (context, state) => Services(),
        routes: [],
      ),
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}

double width = 1920;
double height = 1080;
bool isMobile = false;

Future<void> getScreenSize(context) async {
  width = MediaQuery.of(context).size.width;
  height = MediaQuery.of(context).size.height;
  isMobile = width < height;
}

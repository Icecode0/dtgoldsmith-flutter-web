import 'package:dtgoldsmith_web/views/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dtgoldsmith_web/globals.dart' as globals;

void main() {
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: globals.MyRouter().router,
      theme: ThemeData(),
    ),
  );
}

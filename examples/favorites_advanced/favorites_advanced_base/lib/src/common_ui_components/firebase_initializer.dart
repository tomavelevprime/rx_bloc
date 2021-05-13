import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../core.dart';

class FirebaseInitializer extends StatefulWidget {
  FirebaseInitializer({required this.child});

  final Widget child;

  @override
  _FirebaseInitializerState createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  /// The future is part of the state of our widget. We should not call
  /// `initializeApp` directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              title: 'Booking app',
              home: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  ),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return widget.child;
          }

          return LoadingWidget();
        },
      );
}

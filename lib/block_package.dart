import 'package:flutter/material.dart';
import 'bloc_color2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bloc_Package extends StatefulWidget {
  @override
  _Bloc_PackageState createState() => _Bloc_PackageState();
}

class _Bloc_PackageState extends State<Bloc_Package> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black26,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_indigoAccent);
            },
            backgroundColor: Colors.indigoAccent,
          ),
          SizedBox(
            width: 20.0,
            height: 30.0,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_limeAccent);
            },
            backgroundColor: Colors.limeAccent,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "'BloC Package Controller",),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 150.0,
            height: 150.0,
            color: currentColor,
          ),
        ),
      ),
    );
  }
}
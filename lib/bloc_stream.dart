import 'package:flutter/material.dart';
import 'bloc_color1.dart';

class Bloc_Stream extends StatefulWidget {
  @override
  _Bloc_StreamState createState() => _Bloc_StreamState();
}

class _Bloc_StreamState extends State<Bloc_Stream> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Stream Controller",),
      ),
      backgroundColor: Colors.black26,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.indigoAccent,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_greenAcccent);
            },
          ),
          SizedBox(
            height: 50,
            width: 32,
          ),
          FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.green,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_redAccent);
              }),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.greenAccent,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: snapshot.data,
              width: 200,
              height: 200,
            );
          },
        ),
      ),
    );
  }
}
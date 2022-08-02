import 'dart:developer';

import 'package:app_shop/resources/views/home/parallaxSample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataEvent{

}

class Increment extends DataEvent{

}

class DataState{

}

class Loading extends DataState{

}

class Success extends DataState{
  int count=0;
  Success(this.count);
}




class CounterBloc extends Bloc<DataEvent, DataState> {

  int count = 0;

  CounterBloc(super.initialState);

  // TODO: implement initialState
  DataState get initialState => Success(count);

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is Increment) {
      yield Loading();
      await Future.delayed(Duration(seconds: 1));
      count++;
      yield Success(count);
    }
  }

}


class HomePageBloc extends StatelessWidget{

  HomePageBloc({required Key? key,  this.title}):super(key: key);

  final String? title;

  @override

  Widget build(BuildContext context){

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            BlocBuilder<CounterBloc, DataState>(
            builder: (context, state) {
              if (state is Success) {
                return Text('${state.count}');
              }else{
                return new CircularProgressIndicator();
              }
            },

            ),



          ],


        ),


      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          counterBloc.add(Increment()),
        },
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),

    );
  }

}




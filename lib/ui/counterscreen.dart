import 'package:bloccounter/bloc/counter_bloc.dart';
import 'package:bloccounter/bloc/counter_event.dart';
import 'package:bloccounter/bloc/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInit) {
                  return Text(state.counter.toString());
                }
                if (state is UpdatedCounter) {
                  return Text(state.counter.toString());
                }
                return Text("0");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementPressed());
                },
                child: Text("-")),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementPressed());
                },
                child: Text("+")),
          ],
        ),
      ),
    );
  }
}

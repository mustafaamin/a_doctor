import 'package:a_doctor/blocs/bloc.dart';
import 'package:a_doctor/blocs/splash/splash_event.dart';
import 'package:a_doctor/blocs/splash/splash_state.dart';
import 'package:a_doctor/blocs/state.dart';
import 'package:a_doctor/views/widget/container_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController _controller =
        PageController(initialPage: 0, keepPage: false);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            new PageView(
              controller: _controller,
              onPageChanged: (index) {
                bloc.add(PageEvent(activePage: index));
              },
              children: [
                containerPageView('departments.json'),
                containerPageView('doctor.json'),
                containerPageView('booked.json'),
              ],
            ),
            BlocBuilder<AppBloc,AppState>(builder: (context, state) {
              if (state is PageState) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.bottomCenter,
                            // padding: EdgeInsets.all(89),
                            child: state.activePage == 2
                                ? OutlinedButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(context, '/home');
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 55,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Go',
                                        style: const TextStyle(
                                            fontSize: 24, color: Colors.black),
                                      ),
                                    ),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      _controller.animateToPage(2,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeInOut);
                                    },
                                    child: const Text('skip'),
                                  )),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 50),
                            // padding: EdgeInsets.all(89),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == state.activePage ? 25 : 10,
                                  height: 10,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: index == state.activePage
                                          ? Colors.black54
                                          : Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.bottomCenter,
                          // padding: EdgeInsets.all(89),
                          child: TextButton(
                            onPressed: () {
                              _controller.animateToPage(2,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text('skip'),
                          )),
                      IgnorePointer(
                        ignoring: true,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50),
                          // padding: EdgeInsets.all(89),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == 0 ? 25 : 10,
                                height: 10,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.black54
                                        : Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(5)),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );;
            })
          ],
        ));
  }
}

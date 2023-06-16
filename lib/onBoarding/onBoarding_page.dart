import 'package:flutter/material.dart';

class onBoardingPage extends StatefulWidget {
  const onBoardingPage({Key? key}) : super(key: key);

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 200,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage('assets/todo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          'Reminders made simple',
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 171,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Positioned(
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/MainView');
                  },
                  minWidth: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 16,
                  color: Colors.green,
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )))),
        )
      ]),
    );
  }
}

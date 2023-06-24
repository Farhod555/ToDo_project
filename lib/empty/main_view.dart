import 'package:flutter/material.dart';
import 'package:todo_project/box/box.dart';
import 'empty_page.dart';
import 'item_icon/task_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController _pageController = PageController();
  TextEditingController tasksCtr = TextEditingController();
  int _currentIndex = 0;
  var time = DateTime.now();
  var controller = TextEditingController();
  bool isPressed = false;

  _pressed() {
    var newVal = true;
    if(isPressed) {
      newVal = true;
    } else {
      newVal = false;
    }

    setState((){
      isPressed = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          EmptyPage(tasksCtr.text, time),
          TaskPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Task')
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context, tasksCtr);
          },
          child: Icon(
            Icons.add,
            size: 35,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showBottomSheet(BuildContext context, TextEditingController tasksCtr) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState1) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(1.0),
                          blurRadius: 60,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF964fc9),
                          Color(0xFF7e5a98),
                          Color(0xFF544c5b),
                          Color(0xFF7f6557),
                          Color(0xFFa3521b),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFFFFF),
                            Color(0xffffffff),
                            Color(0xfff5f5f5),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Add new task',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: tasksCtr,
                              decoration: InputDecoration(labelText: ''),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage('assets/yellow.png'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pressed();
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: isPressed
                                                ? Colors.yellow
                                                : Colors.white,
                                          ),
                                          child: Text('Personal')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image(
                                    image: AssetImage('assets/green.png'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pressed();
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: isPressed
                                                ? Colors.green
                                                : Colors.white,
                                          ),
                                          child: Text('Work')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image(
                                    image: AssetImage('assets/pink.png'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pressed();
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: isPressed
                                                  ? Colors.pink
                                                  : Colors.white),
                                          child: Text('Meeting')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image(
                                    image: AssetImage('assets/blue.png'),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pressed();
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: isPressed
                                                ? Colors.blueAccent
                                                : Colors.white,
                                          ),
                                          child: Text('Study')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Positioned(
                              child: MaterialButton(
                                onPressed: () {
                                  box!.add(tasksCtr.text);
                                  Navigator.pop(context);
                                  setState1(() {});
                                },
                                minWidth: MediaQuery.of(context).size.width / 1.1,
                                height: MediaQuery.of(context).size.height / 16,
                                color: Colors.blueAccent,
                                child: Center(
                                  child: Text(
                                    'Add task',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 500,),
                  Positioned(
                    top: 14,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

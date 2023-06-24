import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_project/item/home_page_item.dart';
import '../box/box.dart';


class EmptyPage extends StatefulWidget {
  EmptyPage(this.taskName, this.time, {Key? key}) : super(key: key);
  String taskName;
  DateTime time;
  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

//nb=
class _EmptyPageState extends State<EmptyPage> {
  TextEditingController controller = TextEditingController();

  bool notificationss = false;
  bool circlee = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(
            375,
            238,
          ),
          child: Container(
            width: 375,
            height: 238,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello Brenda!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          'Today you have 9 tasks',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    )
                  ],
                ),
                SizedBox(
                  height: 33,
                ),
                Container(
                  width: 370,
                  height: 140,
                  color: Colors.lightBlue,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Today Reminder',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Meeting with client',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '13.00 PM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Image(
                        image: AssetImage('assets/bell.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: box!.values.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 256,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage('assets/todo_photo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            'No tasks',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      )
          : SingleChildScrollView(
        child: ListView.builder(
          itemCount: box!.values.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    icon: Icons.edit,
                    backgroundColor: Colors.blue,
                    onPressed: (context) => {},
                  ),
                  SlidableAction(
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    onPressed: (context) => {},
                  ),
                ],
              ),
              child: HomeItem(
                box!.getAt(index).toString(),
                widget.time,
                widget.taskName,
                    () {
                  notificationss = !notificationss;
                  setState(
                        () {},
                  );
                },
                notificationss,
                    () {
                  circlee = !circlee;
                  setState(() {});
                },
                circlee,
              ),
            );
          },
        ),
      ),
    );
  }
}

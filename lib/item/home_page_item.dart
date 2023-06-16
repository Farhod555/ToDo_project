import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeItem extends StatelessWidget {
  String task;
  DateTime data;
  String name;
  void Function() notification;
  void Function() circle;
  bool notificationss;
  bool circlee;
  bool isDone = false;

  HomeItem(this.task, this.data, this.name, this.notification,
      this.notificationss, this.circle, this.circlee,
      {Key? key,})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width - 30,
        child: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.yellow),
                width: 7,
                height: double.infinity,
              ),
              const SizedBox(width: 10,),
              StatefulBuilder(
                builder: (context, setState) => InkWell(
                    onTap: () {
                      circlee = !circlee;
                      setState(() {});
                    },
                    child: Icon(
                  circlee ? Icons.check_circle_outline : Icons.circle_outlined,
                  color: circlee ? Colors.green : Colors.grey ,
                ),
                    ),
              ),
              SizedBox(
                width: 11,
              ),
              Text(DateFormat('hh:mm').format(DateTime.now())),
              SizedBox(
                width: 15,
              ),
              Text(
                name,
                style:
                    TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 170,),
              StatefulBuilder(
                builder: (context, setState) => InkWell(
                    onTap: (){
                      notificationss = !notificationss;
                      setState((){});
                    },
                    child: Icon(
                      notificationss
                          ? Icons.notifications
                          : Icons.notifications_none,
                      color: notificationss ? Colors.yellow : Colors.grey,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

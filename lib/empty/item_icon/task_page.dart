import 'package:flutter/material.dart';
import 'package:todo_project/empty/item_icon/pages/detail_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
        bottom: PreferredSize(
          preferredSize: Size(375, 238),
          child: Container(
            width: 375,
            height: 238,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Brenda!',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18) ,),
                        Text('Today you have 9 tasks', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30  ,
                    )
                  ],
                ),
                SizedBox(height: 33,),
                Container(
                  width: 370,
                  height: 140,
                  color: Colors.lightBlue,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Today Reminder', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Meeting with client', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('13.00 PM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),),
                          ),
                        ],
                      ),
                      SizedBox(width: 100,),
                      Image(
                        image: AssetImage('assets/bell.png'),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context,index){
                return TaskWidget(imagesBack[index],imagesFront[index], taskName[index], taskNumber[index]);
              })),
    );
  }
}

class TaskWidget extends StatelessWidget {
  TaskWidget(this.imageBack,this.imageFront, this.taskName, this.taskNumber,{Key? key}) : super(key: key);
  String imageFront,imageBack, taskName, taskNumber;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(name: taskName),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image:  DecorationImage(
                          image: AssetImage(imageBack),
                          fit: BoxFit.cover,
                        )),
                    child:  Center(
                      child: Image(
                        image: AssetImage(imageFront),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Text(taskName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Text(taskNumber, style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
List<String> imagesBack = [
  'assets/ellips_back.png',
  'assets/green_back.png',
  'assets/pink_back.png',
  'assets/Ellipse_back.png',
  'assets/blue_back.png',
  'assets/Ellipse1_back.png'
];



List<String> imagesFront = [
  'assets/user.png',
  'assets/briefcase.png',
  'assets/presentation.png',
  'assets/shopping-basket.png',
  'assets/confetti.png',
  'assets/molecule.png',
];



List<String> taskName = [
  'Personal',
  'Work',
  'Meeting',
  'Shopping',
  'Party',
  'Study',
];



List<String> taskNumber = [
  '24 Task',
  '44 Task',
  '45 Task',
  '54 Task',
  '24 Task',
  '24 Task',
];





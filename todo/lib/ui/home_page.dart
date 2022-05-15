import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/notification_services.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/add_task_bar.dart';
import 'package:todo/ui/stopwatch_timer_page.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/ui/widgets/button.dart';
import 'package:todo/ui/widgets/task_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/task_controller.dart';
import 'CalenderApp.dart';
import 'Feeback.dart';
import 'Internetvideo.dart';
import 'LocalFile.dart';
import 'Timerclock.dart';
import 'Weatherfile.dart';
import 'currentLocation.dart';
import 'mailtofile.dart';

Widget fadeAlertAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

_onCustomAnimationAlertPressed(context) {
  Alert(
    context: context,
    title: "     About Us",
    desc: "This app is created by M.A.M.B,Abdullah,Abdulrahman.The"
        " technology used to make this app is flutter."
        "This app also used many builtin flfutter packages.We used firebase and sqllite for database as well in our application.\n"
        "Flutter version used:	2.16.1 / 9  ",
    alertAnimation: fadeAlertAnimation,
  ).show();
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selected = DateTime.now();
  final _taskController = Get.put(TaskController());
  // ignore: prefer_typing_uninitialized_variables
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _addTaskBar(),
            _addDateBar(),
            const SizedBox(
              height: 10,
            ),
            _showTasks(),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/a.jpg"), fit: BoxFit.cover)
                    // color: Colors.blue,
                    ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                // leading: Icon(
                //   Icons.home,
                //   color: Color.fromARGB(255, 11, 0, 158),
                //   size: 1,
                // ),
                title: Text(
                  'Home',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.video_call,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Play Internet Video',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoPlayerApp()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.video_call_rounded,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Play Local Video',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoPlayerAppp()),
                  ); // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.punch_clock_rounded,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Stop Watch',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountUpTimerPage()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.maps_home_work,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 41,
                ),
                title: Text(
                  'Current Location',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myLocation()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lock_clock,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Clock',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Clock()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.cloud_circle,
              //     color: Color.fromARGB(255, 11, 0, 158),
              //     size: 42,
              //   ),
              //   title: Text(
              //     'Weather',
              //     textScaleFactor: 1.5,
              //   ),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyAppp()),
              //     );
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              ListTile(
                leading: Icon(
                  Icons.wordpress_outlined,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Official Page',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  // Update the state of the  app.
                  // ...
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MailtoExampleApp()),
                  // );
                  launch('https://www.javatpoint.com/');
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.support,
              //     color: Color.fromARGB(255, 11, 0, 158),
              //     size: 1,
              //   ),
              //   title: Text(
              //     'Support us',
              //     textScaleFactor: 1.5,
              //   ),
              //   onTap: () {
              //     // Update the state of the  app.
              //     // ...
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => MailtoExampleApp()),
              //     // );
              //     launch(
              //         'mailto:ali123mazhar@gmail.com?subject=This is Subject Title&body=This is Body of Email and here you can write your message.');
              //   },
              // ),
              ListTile(
                leading: Icon(
                  Icons.feedback,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Feedback',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeraApp()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                title: Text(
                  'Calender',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => temporaaryfile()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text(
                  'About Us',
                  textScaleFactor: 1.5,
                ),
                leading: Icon(
                  Icons.contact_phone,
                  color: Color.fromARGB(255, 11, 0, 158),
                  size: 42,
                ),
                onTap: () {
                  //_onCustomAnimationAlertPressed(context);
                  showAlertDialog(context);
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ));
  }

  _showTasks() {
    _taskController.getTasks();
    return Expanded(child: Obx(
      () {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              print("ddddd");
              print(_taskController.taskList.length);
              // for (Task task in _taskController.taskList) {
              //   _taskController.delete(task);
              // }

              Task task = _taskController.taskList[index];
              if (task.repeat == 'Daily') {
                // DateTime date =
                //     DateFormat.jm().parse(task.startTime.toString());
                // var myTime = DateFormat("HH:mm").format(date);
                // notifyHelper.scheduledNotification(
                //   int.parse(myTime.toString().split(":")[0]),
                //   int.parse(myTime.toString().split(":")[1]),
                //   task,
                // );
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ]),
                    ),
                  ),
                );
              }
              if (task.date == DateFormat.yMd().format(_selected)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ]),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            });
      },
    ));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkgreyClr : Colors.white,
        child: Column(children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
          ),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "\nTask Completed",
                  onTap: () {
                    _taskController.markTaskCompleted(task.id!);
                    Get.back();
                  },
                  clr: primaryClr,
                  context: context),
          const SizedBox(
            height: 1,
          ),
          _bottomSheetButton(
              label: "\nDelete Task",
              onTap: () {
                _taskController.delete(task);

                Get.back();
              },
              clr: Colors.red[300]!,
              context: context),
          const SizedBox(
            height: 40,
          ),
          _bottomSheetButton(
              label: "\nClose",
              onTap: () {
                Get.back();
              },
              clr: Colors.red[300]!,
              isClose: true,
              context: context),
        ]),
      ),
    );
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Text(
          label,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selected = date;
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          MyButton(
              label: "\n+Add Task",
              onTap: () async {
                await Get.to(const AddTaskPage());
                _taskController.getTasks();
              })
        ],
      ),
    );
  }

  _appBar() {
    // ignore: dead_code
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light theme"
                  : "Activated Dark theme");
          //notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 38,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      // actions: const [
      //   CircleAvatar(
      //     backgroundImage: AssetImage("images/profile.png"),
      //   ),
      //   SizedBox(
      //     width: 20,
      //   )
      // ],
    );
  }
}

class MMMyApp {}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      textScaleFactor: 1.5,
    ),
    onPressed: () {
      // Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "  About Us",
      textScaleFactor: 2,
      style: TextStyle(
        color: Color.fromARGB(255, 1, 63, 114),
      ),
    ),
    content: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        "This app is created by M.A.M.B,Abdullah,Abdulrahman.The"
        " technology used to make this app is flutter."
        "This app also used many builtin flfutter packages.\n"
        "Flutter version used:	2.16.1 / 9  ",
        textScaleFactor: 1.3,
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

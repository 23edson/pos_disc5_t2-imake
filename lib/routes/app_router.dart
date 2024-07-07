import 'package:flutter/material.dart';
import 'package:imake/about_us.dart';
import 'package:imake/page_login.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/splash_screen.dart';
import 'package:imake/tasks/data/local/model/task_model.dart';
import 'package:imake/tasks/presentation/pages/new_task_screen.dart';
import 'package:imake/tasks/presentation/pages/tasks_screen.dart';
import 'package:imake/tasks/presentation/pages/update_task_screen.dart';

import '../page_not_found.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Pages.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );

    case Pages.about:
      return MaterialPageRoute(
        builder: (context) => AboutUsScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}

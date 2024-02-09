import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seccai/view/screens/auth/authscreen.dart';
import 'package:seccai/view/screens/auth/widgets/signupscreen.dart';
import 'package:seccai/view/screens/home/homescreen.dart';
import 'package:seccai/view/screens/profile/edit_profile_screen.dart';
import 'package:seccai/view/screens/profile/profilescreen.dart';
import 'package:seccai/view/screens/projects/project_details_screen.dart';
import 'package:seccai/view/screens/projects/project_name_screen.dart';
import 'package:seccai/view/screens/projects/projects_screen.dart';
import 'package:seccai/view/screens/projects/recent_project_screen.dart';
import 'package:seccai/view/screens/projects/team_member_screen.dart';
import 'package:seccai/view/screens/splash/splashscreen.dart';
import 'package:seccai/view/screens/task/add_task_screen.dart';
import 'package:seccai/view/screens/task/comment_screen.dart';
import 'package:seccai/view/screens/task/sub_task_comment_screen.dart';
import 'package:seccai/view/screens/task/sub_task_screen.dart';
import 'package:seccai/view/screens/task/task_screen.dart';
import 'package:seccai/view/screens/navigation/navigation_bar.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String projects = '/projects';
  static const String chats = '/chats';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String filter = '/filter';
  static const String task = '/task';
  static const String recentproject = '/recentproject';
  static const String projectinfo = '/projectinfo';
  static const String projectdetails = '/projectdetails';
  static const String taskcomment = '/taskcomment';
  static const String comment = '/comment';
  static const String subtask = '/subtask';
  static const String teammember = '/teammember';
  static const String addtask = '/addtask';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getAuthRoute(String name) => '$auth?name=$name';
  static getRegisterRoute(String name) => '$register?name=$name';
  static getDashboardRoute(String name) => '$dashboard?name=$name';
  static getHomeRoute(String name) => '$home?name=$name';
  static getProjectsRoute(String name) => '$projects?name=$name';
  static getChatsRoute(String name) => '$chats?name=$name';
  static getProfileRoute(String name) => '$profile?name=$name';
  static getFilterRoute(String name) => '$filter?name=$name';
  static getTaskRoute(String name) => '$task?name=$name';
  static getRecentprojectRoute(String name) => '$recentproject?name=$name';
  static getProjectinfoRoute(String name) => '$projectinfo?name=$name';
  static getProjectDetailsRoute(String name) => '$projectdetails?name=$name';
  static getTaskCommentRoute(String name) => '$taskcomment?name=$name';
  static getSubTaskRoute(String name) => '$subtask?name=$name';
  static getCommentRoute(String name) => '$comment?name=$name';
  static getTeamMemberRoute(String name) => '$teammember?name=$name';
  static getAddTaskRoute(String name) => '$addtask?name=$name';
  static getEditProfileRoute(String name) => '$editprofile?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: auth,
      page: () => const AuthScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: register,
      page: () => const SignUpScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: projects,
      page: () => ProjectsScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: task,
      page: () => TaskScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: recentproject,
      page: () => RecentProjectsScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    
    GetPage(
      name: projectdetails,
      page: () => ProjectDetailsScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: taskcomment,
      page: () => TaskCommentScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: comment,
      page: () => CommentScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: subtask,
      page: () => SubTaskScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: teammember,
      page: () => TeamMemberScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addtask,
      page: () => AddTaskScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: editprofile,
      page: () => EditProfileScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    )
  ];
}

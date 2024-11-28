import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/modules/on_boarding/on_boarding_Screen.dart';
import 'package:newsappaymn/shared/cubit/cubit.dart';
import 'package:newsappaymn/shared/cubit/states.dart';
import 'layout/news_app/newsapp_layout.dart';
import 'modules/login_and_register/login/login_screen.dart';
import 'network/local/cashe_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit,AppState>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(

             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.white,
             appBarTheme: const AppBarTheme(
               titleSpacing: 20,
                 iconTheme: IconThemeData(
                     color: Colors.black,
                     size: 30
                 ),
                 backgroundColor: Colors.white,
                 elevation: 0,
                 systemOverlayStyle: SystemUiOverlayStyle(
                     statusBarColor: Colors.white,
                     statusBarIconBrightness: Brightness.dark
                 ),
                 titleTextStyle: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 )



             ),
             textTheme:  const TextTheme(
                 bodyText1: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Colors.white
                 )
             ),

             bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor: Colors.deepOrange
             ),

           ),
           darkTheme: ThemeData(
             textTheme:  const TextTheme(
                 bodyLarge:  TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Colors.black
                 )
             ),
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.grey[800],
             appBarTheme:  AppBarTheme(
               titleSpacing: 20,
                 iconTheme: const IconThemeData(
                     color: Colors.white,
                     size: 30
                 ),
                 backgroundColor: Colors.grey[800],
                 elevation: 0,
                 systemOverlayStyle: const SystemUiOverlayStyle(
                     statusBarColor: Colors.black12,
                     statusBarIconBrightness: Brightness.light
                 ),
                 titleTextStyle: const TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 )



             ),
             bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor: Colors.deepOrange,
                 unselectedItemColor: Colors.grey,
                 backgroundColor: Colors.grey[800]
             ),

           ),
           themeMode: AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
           home:  Directionality(
               textDirection: TextDirection.rtl,
               child: OnBoardingScreen()),
         );
       },
      ),
    );
  }
}

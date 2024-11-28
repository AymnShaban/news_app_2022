import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/modules/search_screen/search_screen.dart';
import 'package:newsappaymn/shared/componants/componants.dart';
import 'package:newsappaymn/shared/cubit/cubit.dart';
import 'package:newsappaymn/shared/cubit/states.dart';
// 6590074249
class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state) {
        var x = AppCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: [
              IconButton(onPressed: (){
myNavigator(context: context, Widget: SearchScreen());
              }
                , icon: const Icon(Icons.search)),
              IconButton(onPressed: ()
              {x.changeAppMode();
                print('alaah is one');
                }
                , icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: x.screens[x.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: x.BottomItems,
            currentIndex: x.currentIndex,
            onTap: (index){
              x.ChangeBottomNavBAr(index);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/shared/cubit/cubit.dart';
import 'package:newsappaymn/shared/cubit/states.dart';

import '../../shared/componants/componants.dart';
var searchController = TextEditingController();
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(

      listener: (context,state){},
      builder: (context,state){
       var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onTap: (){},
                    controller: searchController,
                    onChanged: (value){
                      AppCubit.get(context).getSearch(value);
                    },
                    decoration:  const InputDecoration(

                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),

                    ),
                  )
                ),
                articleBuilder(list, context)
              ],
            ),
          ),
        );

      },
    );
  }
}

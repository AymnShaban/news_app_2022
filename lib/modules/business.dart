import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/shared/componants/componants.dart';
import 'package:newsappaymn/shared/cubit/cubit.dart';
import 'package:newsappaymn/shared/cubit/states.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
      builder: (context,state){
        var list = AppCubit.get(context).business;
        return articleBuilder(list,context);
      },
      listener: (context,state){},
    )  ;
  }
}

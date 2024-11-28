import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/layout/news_app/newsapp_layout.dart';

import '../../../shared/componants/componants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LAndRCubit(),
      child: BlocConsumer<LAndRCubit, LAndRStates>(
        listener: (context, state) {
          //  if(state is LAndRCreateUserSuccessState){
          // myNavigator(context: context, Widget: HomeLayoutScreen());
          //  }
        },
        builder: (context, state) {
          var x = LAndRCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Text(
                            'انشاء حساب',
                            style: TextStyle(
                              fontFamily: 'Aas',
                              fontSize: 45,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'سجل الان وتابع كل الاخبار الحصريه ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              label: 'اسم المستخدم',
                              prefix: Icons.person,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: 'عنوان البريد',
                              prefix: Icons.email,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                              isPassword: x.isPassword,
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'الباسوورد',
                              suffixPressed: () {
                                x.changePasswordVisibility();
                              },
                              suffix: x.suffix,
                              prefix: Icons.lock_outline,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password is to short';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultTextFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              label: 'رقم الهاتف',
                              prefix: Icons.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your phone numper';
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  myNavigator(
                                      context: context,
                                      Widget: const NewsLayout());
                                  // x.userRegister(
                                  //         name: nameController.text,
                                  //         email: emailController.text,
                                  //         password: passwordController.text,
                                  //         phone: phoneController.text);
                                }
                              },
                              text: 'انشاء حساب',
                            ),
                            condition: state is! LAndRRegisterLoadingState,
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

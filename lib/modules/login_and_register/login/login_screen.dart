import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/layout/news_app/newsapp_layout.dart';

import '../../../shared/componants/componants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => LAndRCubit(),
      child: BlocConsumer<LAndRCubit, LAndRStates>(
        listener: (context, state) {},
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
                          Container(
                              decoration: defaultGradient(),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'سجل الأن ',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          const SizedBox(
                            height: 30,
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
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  // x.userLogin(
                                  //     email: emailController.text,
                                  //     password: passwordController.text);
                                }
                              },
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
                            height: 20,
                          ),
                          ConditionalBuilder(
                            builder: (context) => defaultButton(
                                function: () {
                                  myNavigator(
                                      context: context,
                                      Widget: const NewsLayout());
                                },
                                text: 'تسجيل'),
                            condition: state is! LAndRLoginLoadingState,
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              const Text(
                                'ان لم يكن لديك حساب فيمكنك الضغط ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextButton(
                                    child: const Text(
                                      'هنا ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {

                                      myNavigator(
                                          context: context,
                                          Widget: RegisterScreen());
                                    },
                                  )),
                            ],
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

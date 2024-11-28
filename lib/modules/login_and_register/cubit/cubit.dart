

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/modules/login_and_register/cubit/states.dart';

class LAndRCubit extends Cubit<LAndRStates> {
  // ignore: non_constant_identifier_names
  LAndRCubit() : super(LAndRLoginInitialState());

  static LAndRCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off_outlined;
    emit(LAndRLoginChangeVisibilityState());
  }

  // void userLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(LAndRLoginLoadingState());
  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   )
  //       .then((value) {
  //     emit(LAndRLoginSuccessState(value.user!.uid));
  //     print(value.user!.uid);
  //   }).catchError((error) {
  //     emit(LAndRLoginErrorState(error));
  //   });
  // }

  // void userRegister({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String phone,
  // }) {
  //   emit(LAndRRegisterLoadingState());
  //
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   )
  //       .then((value) {
  //     createUser(phone: phone, email: email, name: name, uId: value.user!.uid);
  //   }).catchError((error) {
  //     emit(LAndRRegisterErrorState(error.toString()));
  //   });
  // }

  // void createUser({
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String uId,
  // }) {
  //   UserModel? model = UserModel(
  //       name: name,
  //       email: email,
  //       phone: phone,
  //       uId: uId,
  //       isEmailVerified: false,
  //       bio: 'write your bio ...',
  //       cover:
  //           'https://scontent.fcai20-3.fna.fbcdn.net/v/t1.6435-9/197319105_821482411808225_8688121148417576132_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=W_PDzDfw-PoAX_EmKnt&_nc_ht=scontent.fcai20-3.fna&oh=00_AfAoFtobiDvu-Ul9wR74b0xQqxJjRngNiuiQtqaay_vJsw&oe=63CC8ED5',
  //       image:
  //           'https://png.pngtree.com/png-clipart/20220719/original/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_8385663.png');
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value) {
  //     emit(LAndRCreateUserSuccessState());
  //   }).catchError((error) {
  //     emit(LAndRCreateUserErrorState(error.toString()));
  //   });
  // }
}

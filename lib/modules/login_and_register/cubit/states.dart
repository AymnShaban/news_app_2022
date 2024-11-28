abstract class LAndRStates {}

class LAndRLoginInitialState extends LAndRStates{}

class LAndRLoginLoadingState extends LAndRStates{}
class LAndRLoginSuccessState extends LAndRStates {
  final String uId;

  LAndRLoginSuccessState(this.uId);
}
class LAndRLoginErrorState extends LAndRStates{
  final String error;
  LAndRLoginErrorState(this.error);}
class LAndRLoginChangeVisibilityState extends LAndRStates{}

class LAndRRegisterLoadingState extends LAndRStates{}
class LAndRRegisterSuccessState extends LAndRStates {}
class LAndRRegisterErrorState extends LAndRStates{
  final String error;
  LAndRRegisterErrorState(this.error);}
class LAndRRegisterChangeVisibilityState extends LAndRStates{}

class LAndRCreateUserSuccessState extends LAndRStates {}
class LAndRCreateUserErrorState extends LAndRStates{
  final String error;
  LAndRCreateUserErrorState(this.error);}



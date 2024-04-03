import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app60/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
static  AuthCubit get(context)=> BlocProvider.of(context);

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
UserModel userModel =UserModel();
// register email& password

registerByEmailAndPassword({required String name,
  required String email ,
  required String password,
})async{
     UserCredential userCredential =
     await  auth.createUserWithEmailAndPassword(email: email, password: password);
   //  userModel.pic
     userModel.email = email;
     userModel.id= userCredential.user!.uid;
     userModel.name = name;
    await store.collection("profile").doc(userModel.id).
    set(userModel.toMap()) ;
    emit(AuthRegisterByEmailState());
}

}

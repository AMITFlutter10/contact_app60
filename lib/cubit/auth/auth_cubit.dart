import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app60/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
static  AuthCubit get(context)=> BlocProvider.of(context);

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
UserModel userModel =UserModel();
// register email& password
  GoogleSignIn googleSignIn =GoogleSignIn();

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


loginByEmailAndPassword({required String email,required String password })async{
 UserCredential userLogin=  await auth.signInWithEmailAndPassword(email: email, password: password);
 var userData=    await store.collection("profile").doc(userModel.id).get();
 userModel =UserModel.fromMap(userData.data()!);
 //GetallUser
 emit(AuthRegisterByEmailState());
}

registerByGoogle ()async{
 await googleSignIn.signOut();

  emit(AuthLoadingState());
  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication? googleSignInAuthentication = await
  googleSignInAccount!
      .authentication;
  AuthCredential userCredential = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken,
  );
  UserCredential userByGoogle= await auth.signInWithCredential(userCredential);
  //////////////
  userModel.id = userByGoogle.user!.uid; //orpRW53##
  userModel.name = userByGoogle.user!.displayName;
  userModel.pic =userByGoogle.user!.photoURL;
  userModel.email = userByGoogle.user!.email;
  await store.collection("profile").doc(userModel.id).
  set(userModel.toMap());
  emit(AuthRegisterByGoogleState());
}

uploadPhoto(){}

}

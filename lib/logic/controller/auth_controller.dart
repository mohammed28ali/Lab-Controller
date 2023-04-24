import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lab_controller/model/user_model.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/services/network/firestore_user.dart';
import 'package:lab_controller/view/screens/welcome_screen.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var selectedGender = "".obs;
  var selectedRole = "".obs;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserPhone = ''.obs;
  var displayGender = '';
  var isSignedIn = false;
  var profilePicLink='';
  //String profilePicLink = "";

  final GetStorage authBox = GetStorage();
  static AuthController instance = Get.find();

  User? get userProfile => firebaseAuth.currentUser;
  User? user = FirebaseAuth.instance.currentUser;


  late Rx<File?> _pickedImage;
  File? pickedFile;
  File? get profilePhoto => _pickedImage.value ;


  late Rx<User?> _user;

  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }

  // FIREBASE
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//History Collection
  CollectionReference history = FirebaseFirestore.instance.collection('history');



  @override
  void onInit() {
    displayUserName.value = (userProfile != null ? userProfile!.displayName : "")!;
    //displayUserPhoto.value = (userProfile != null ? userProfile!.photoURL :"" )!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
    //displayUserPhone.value = (userProfile != null ? userProfile!.phoneNumber : "")!;
    super.onInit();
  }

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  onChangeGender(var gender) {
    selectedGender.value = gender;
    update();
  }

  onChangeRole(var gender) {
    selectedRole.value = gender;
    update();
  }


  void pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
      pickedFile = File(pickedImage.path);
      setProfileImagePath(pickedFile!.path);
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
    update();
  }

  // upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    ref.getDownloadURL().then((value) async{
      profilePicLink=value ;
      update();

    });
    return downloadUrl;
  }

  // registering the user
  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
    required File? image,
    required String id,
    required String nationality,
    required String address,
    required String homeNum,
    required String phoneNum,
    required String role,
    required String gender,
  }) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        String downloadUrl = await _uploadToStorage(image!);
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: email,
          name: name,
          pic: downloadUrl,
          id: id,
          nationality: nationality,
          address: address,
          homeNum: homeNum,
          phoneNum: phoneNum,
          role: role,
          gender: gender,
        ));
        displayUserName.value = name;
        displayUserPhone.value=phoneNum;
        firebaseAuth.currentUser!.updateDisplayName(name);
      });
      await sendEmailVerification();
      update();
      //Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      firebaseAuth.currentUser!.sendEmailVerification();
      Get.snackbar('Email verification sent!', 'Check your Email And Login',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';
      if (error.code == 'Email-not-found') {
        message =
        'Account does not exists for that ..Create your account by signing up.. ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }


  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      displayUserName.value = firebaseAuth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      if (email == 'admin@admin.com') {
        Get.offNamed(Routes.adminMainScreen);
      } else {
        Get.offNamed(Routes.mainScreen);
      }
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
        'Account does not exists for that $email..Create your account by signing up.. ';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
        'Account does not exists for that $email..Create your account by signing up.. ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await firebaseAuth.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offAll(const WelcomeScreen());
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }


  addUserHistory(String deviceNum) {
    history.doc(user!.uid).set({
      'username': FirebaseAuth.instance.currentUser!.displayName,
      'email': FirebaseAuth.instance.currentUser!.email,
      'deviceNum':deviceNum,
      'dateFrom': DateTime.now(),
      'dateTo': DateTime.now(),
    }).then((value) => print('History Added Success')).catchError((error) =>
        print(error));
  }

  updateDateTo() {
    history.doc(user!.uid).update({
      'dateTo': DateTime.now(),
    }).then((value) => print('History Added Success')).catchError((error) => print(error));
  }
}

import 'dart:async';
import 'dart:io';

import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/local/storage.dart';
import '../../../../core/models/user_model.dart';
import '../../../core/app_constant.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/successful_changed_password_screen.dart';
import '../../core/controllers/firebase/firebase_fun.dart';
import '../../widgets/constants_widgets.dart';
import '../../widgets/dialog_with_shaddow_widget.dart';


class ProfileController extends GetxController {
  late final ImagePicker _imagePicker;
  File? profileImage;
  String?  imagePath;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final genders= [Strings.male, Strings.female];
  // static ProfileController?   _instance;
  // static ProfileController  get instance =>init();
  // static init(){
  //   if(_instance!=null)
  //     _instance=Get.put(ProfileController());
  //   return _instance!;
  // }
  // static ProfileController  get instance => Get.find<ProfileController>();
  final Rx<UserModel?> currentUser = Rx(null);
  final timeLimit = Duration(seconds: 60);
  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  String? gender;

  Future<void> updateImage(XFile? image) async {
    try {
      // ConstantsWidgets.showLoading(context);
      String? imagePath;
      if(image!=null){
        imagePath=await FirebaseFun.uploadImage(image: image);
      }
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
          .update({'photoUrl':imagePath}).timeout(timeLimit)
          .then((value){
        Get.back();
        Get.snackbar(
            "Success",
            'Successful update image',
            backgroundColor: ColorsManager.successColor
        );
        // Get.offAll(HomePage());
      });

    } catch (e) {
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      Get.back();
      Get.snackbar(
          "خطأ",
          errorMessage,
          backgroundColor: ColorsManager.errorColor
      );
    }
  }
  Future<void> updateUser(
      ) async {

    String name=nameController.value.text;
    String email=emailController.value.text;

    try {
      ConstantsWidgets.showLoading();

      if(profileImage!=null){
        imagePath=await FirebaseFun.uploadImage(image: XFile(profileImage!.path));
        if(imagePath==null)
          return;
        profileImage=null;
      }
      print(profileImage);

      if(email!=currentUser.value?.email)
        auth.currentUser?.verifyBeforeUpdateEmail(email);

      // auth.currentUser?.updateEmail();
      // if(password!=''&&password!=null)
      //   auth.currentUser?.updatePassword(password!);

      UserModel? userModel=UserModel(
        name: name,
        email: email,
        phoneNumber: phoneController.value.text,
        userName: userNameController.value.text,
        // birthDate: DateFormat.yMd().tryParse(dateBirthController.value.text),
        gender: gender,
        photoUrl: imagePath,
        typeUser: currentUser.value?.typeUser,
        uid:currentUser.value?.uid ,
          googleId:currentUser.value?.googleId ,
        id: currentUser.value?.id,
        password:  currentUser.value?.password
      );
     var data=userModel.toJson();
     data.remove("password");

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
          .update(data).timeout(timeLimit)
          .then((value){

        currentUser.value=userModel;
        print(currentUser.value?.name);
        update();

        ConstantsWidgets.closeDialog();
        // Get.back();
        Get.dialog(
            DialogWithShadowWidget(
              text: Strings
                  .saveInformationSuccessfulText,
            ));
        Timer(Duration(seconds: 2), (){
          Get.back();

        });
        // Get.snackbar(
        //     Strings.message_success,
        //     Strings.profileUpdateSuccessFullText,
        //     // Strings.message_successfully_update,
        //     backgroundColor: ColorsManager.successColor
        // );
        // if(email!=currentUser.value?.email||(password!=''&&password!=null))
        //    Get.offAll(SplashScreen());

      });

    } catch (e) {
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      ConstantsWidgets.closeDialog();
      // Get.back();
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: ColorsManager.errorColor
      );
    }
  }

  Future<void> updateAdditionalInfo(
      {
        String? about,
        DateTime? availabilityFrom,
        DateTime? availabilityTo,
      }
      ) async {
    try {
      ConstantsWidgets.showLoading();
      UserModel? userModel=UserModel.fromJson(currentUser.value?.toJson());
      // userModel.additionalInfo?.about=about;
      // userModel.additionalInfo?.availabilityFrom=availabilityFrom;
      // userModel.additionalInfo?.availabilityTo=availabilityTo;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
          .update(userModel.toJson()).timeout(timeLimit)
          .then((value){
        currentUser.value=userModel;
        update();

        ConstantsWidgets.closeDialog();
        Get.back();
        Get.snackbar(
            Strings.message_success,
            Strings.message_successfully_update,
            backgroundColor: ColorsManager.successColor
        );
        // if(email!=currentUser.value?.email||(password!=''&&password!=null))
        //    Get.offAll(SplashScreen());

      });

    } catch (e) {
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      ConstantsWidgets.closeDialog();
      // Get.back();
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: ColorsManager.errorColor
      );
    }
  }


  Future<void> changePassword(
      String password
      ) async {
    try {
      ConstantsWidgets.showLoading();
      await auth.currentUser?.updatePassword(password).then((value) async {
        String hashPassword=BCrypt.hashpw(password, BCrypt.gensalt());
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
            .update({"password":password}).timeout(timeLimit)
            .then((value){
          currentUser.value?.password=hashPassword;
          update();

          ConstantsWidgets.closeDialog();
          // Get.back();
          Get.snackbar(
              Strings.message_success,
              Strings.message_successfully_update,
              backgroundColor: ColorsManager.successColor
          );
          Get.offAll(()=>SuccessfulChangedPasswordScreen());
          // if(email!=currentUser.value?.email||(password!=''&&password!=null))
          //    Get.offAll(SplashScreen());

        });
      })
      ;




    } catch (e) {
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "حدث خطأ، حاول مرة أخرى لاحقاً";
      ConstantsWidgets.closeDialog();
      // Get.back();
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: ColorsManager.errorColor
      );
    }
  }

  Future<void> getUser(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ??
          '${await AppStorage.storageRead(key: AppConstants.uidKEY)}'??'')
          .get()
          .then((value){
        currentUser.value=UserModel.fromJson(value);
        update();
        // Get.snackbar(
        //     AppString.message_success,
        //     AppString.message_successful_get_user,
        //     backgroundColor: ColorsManager.successColor
        // );
      });
      // if(currentUser.value?.isAdmin??false)
      //   Get.offAll(NavBarAdminScreen());
      // else
      //   Get.offAll(NavbarUserScreen());



    } catch (e) {

      currentUser.value= null;
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: ColorsManager.errorColor
      );
      // context.pushAndRemoveUntil(Routes.loginRoute, predicate: (Route<dynamic> route) =>false);

      Get.offAll(()=>LoginScreen());
    }
  }



  ///image local
  void deletePhoto() {

    profileImage = null;
    imagePath=null;
    Get.back();

    // update();
  }

  Future<void> pickPhoto(ImageSource source) async {
    Get.back();
    final XFile? result = await _imagePicker.pickImage(source: source);
    if (result != null) {
      profileImage = File(result.path);
      update();
    }

  }


  void refresh(){
    nameController = TextEditingController(text: currentUser.value?.name);
    userNameController = TextEditingController(text: currentUser.value?.userName);
    emailController = TextEditingController(text: currentUser.value?.email);
    phoneController = TextEditingController(text: currentUser.value?.phoneNumber);
    // if(currentUser.value?.birthDate!=null)
    //   dateBirthController = TextEditingController(text:DateFormat.yMd().format( currentUser.value!.birthDate!));

    // gender=genders.firstWhereOrNull((element)=>element==currentUser.value?.gender);
    // genderController = TextEditingController();
    imagePath=currentUser.value?.photoUrl;
  }
  @override
  void onInit() {
    _imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

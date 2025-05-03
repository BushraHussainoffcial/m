import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/successful_changed_password_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../welcome/welcome_screen.dart';

import '../../../../core/local/storage.dart';
import '../../../../core/models/user_model.dart';
import '../../../core/app_constant.dart';
import '../../../core/strings.dart';
import '../../core/controllers/firebase/firebase_constants.dart';
import '../../core/controllers/firebase/firebase_fun.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/controller/profile_controller.dart';
import '../../splash/splash_screen.dart';
import '../../widgets/constants_widgets.dart';
import '../../widgets/dialog_with_shaddow_widget.dart';
import '../screens/otp_screen.dart';

class AuthController extends GetxController {
  var formKey = GlobalKey<FormState>();

  static AuthController get instance => Get.find();

  //controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String typeUser = AppConstants.collectionUser;

  init() {
    formKey = GlobalKey<FormState>();
    nameController.clear();
    firstNameController.clear();
    lastNameController.clear();
    userNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    typeUser = AppConstants.collectionUser;
  }

  int currentIndex = 0;
  late final PageController pageController;
  final List<String> tabsList = [
    Strings.loginText,
    Strings.createNewAccountText
  ];

  final FirebaseAuth auth = FirebaseAuth.instance;

  _initPageView() {
    pageController = PageController(initialPage: 0);
  }

  navigateToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    currentIndex = index;
    update();
  }

  // validatePassword(String value) {
  //   RegExp regex =
  //   RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  //   if (value.isEmpty) {
  //     return StringsValidator.requiredFieldText;
  //   } else {
  //     Validator.validatePassword(value);
  //     return null;
  //   }
  // }
  //
  // String? validatePhoneNumber(String value) {
  //   if (value.isEmpty) {
  //     return Strings.requiredField;
  //   } else {
  //     if (!value.isPhoneNumber) {
  //       return 'Error';
  //     } else {
  //       return null;
  //     }
  //   }
  // }
  //
  // String? validateEmail(String value) {
  //   if (value.isEmpty) {
  //     return Strings.requiredField;
  //   } else {
  //     if (!value.isEmail) {
  //       return 'Error';
  //     } else {
  //       return null;
  //     }
  //   }
  // }
  //
  // validateConfirmPassword(String value,String password) {
  //   if (value.isEmpty) {
  //     return Strings.requiredField;
  //   }
  //   else if (value!=password) {
  //
  //     return 'Not Match';
  //   }
  //   else {
  //     return null;
  //   }
  // }
  //
  // String? validateFullName(String value) {
  //   if (value.isEmpty) {
  //     return Strings.requiredField;
  //   }
  //   return null;
  // }
  //

  Future<void> login(BuildContext context,{UserModel? userSign}) async {
    String userName =userSign?.email?? emailController.value.text;
    String password =userSign?.password?? passwordController.value.text;
    String email = userName;
    try {
      ConstantsWidgets.showLoading();
      var result = await FirebaseFun.fetchUserByUserName(userName: userName);

      ///handling
      // !result['status']?throw FirebaseAuthException(code: result['message']):'';
      print(result);
      if (result['status'] && result['body'] != null) {
        UserModel? userModel = UserModel.fromJson(result['body']);
        // if(userModel==null)
        //   throw FirebaseAuthException(code: AppString.message_user_name_invalid);
        email = userModel.email ?? userName;
      }

      //,,,,,,,,,,,,,,,,,
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(FirebaseFun.timeOut)
          .then((value) async {
        // ConstantsWidgets.TOAST(null,
        //     textToast: Strings.message_successful_login, state: true);
        // Get.snackbar(
        //     AppString.message_success,
        //     AppString.message_successful_login,
        //     backgroundColor: ColorManager.successColor
        // );

        await AppStorage.storageWrite(
            key: AppConstants.rememberMe, value: true);
        await AppStorage.storageWrite(
            key: AppConstants.uidKEY, value: auth.currentUser?.uid);
        await AppStorage.storageWrite(
            key: AppConstants.EMAIL_KEY, value: email);
        await AppStorage.storageWrite(
            key: AppConstants.PASSWORD_KEY, value: password);

        //Get.offAll(HomePage());
        ProfileController profileController = Get.put(ProfileController());
        ;
        await profileController.getUser(context);
        Get.back();
        // context.pop();
        if (profileController.currentUser.value == null) return;
        ConstantsWidgets.TOAST(null,
            textToast: Strings.message_successful_login, state: true);
        if (profileController.currentUser.value?.isAdmin ?? false)
          ;
        // context.pushAndRemoveUntil(Routes.adminNavbarRoute,
        //     predicate: (Route<dynamic> route) => false);

        // Get.offAll(NavbarScreen());
        // Get.offAll(NavBarAdminScreen());

        else
          // context.pushAndRemoveUntil(Routes.navbarRoute,
          //     predicate: (Route<dynamic> route) => false);

          Get.offAll(() => HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      Get.back();
      // context.pop();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
      // Get.snackbar(
      //     AppString.message_failure,
      //    errorMessage,
      //     backgroundColor: ColorManager.errorColor
      // );
    }
  }

  Future<void> signUp(BuildContext context,{UserModel? userSign}) async {
    // String name = firstNameController.value.text+" "+lastNameController.value.text;
    String name =userSign?.name?? nameController.value.text;
    String userName =userSign?.userName?? userNameController.value.text;
    String email =userSign?.email?? emailController.value.text;
    String phoneNumber =userSign?.phoneNumber?? phoneController.value.text;
    // String password = passwordController.value.text;
    String password = userSign?.password??confirmPasswordController.value.text;
    // String name='Ahmad Mriwed';
    // String email='mr.ahmadmriwed@gmail.com';
    // String phoneNumber='0937954969';
    // String password='12345678';
    try {
      ConstantsWidgets.showLoading();
      // String userName = await _getUserNameByName(name);

      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(FirebaseFun.timeOut);
      final user = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          userName: userName,
          password: password,
          typeUser: typeUser,
          googleId: userSign?.googleId,
          photoUrl: userSign?.photoUrl??'',
         );
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser)
          .doc(user.uid)
          .set(user.toJson());
      await AppStorage.storageWrite(key: AppConstants.rememberMe, value: true);
      await AppStorage.storageWrite(key: AppConstants.uidKEY, value: user.uid);

      // ProfileController.instance.getUser();

      ProfileController profileController = Get.put(ProfileController());
      profileController.currentUser.value = user;
      // if(profileController.currentUser.value?.isAdmin??false)
      if (user.isAdmin)
        ;
      // context.pushAndRemoveUntil(Routes.adminNavbarRoute,
      //     predicate: (Route<dynamic> route) => false);

      // Get.offAll(NavbarScreen());
      // Get.offAll(NavBarAdminScreen());

      else
        // context.pushAndRemoveUntil(Routes.navbarRoute,
        //     predicate: (Route<dynamic> route) => false);

        Get.offAll(()=>HomeScreen());
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      // context.pop();
      Get.back();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
      // Get.snackbar(
      //     AppString.message_failure,
      //     errorMessage,
      //     backgroundColor: ColorManager.errorColor
      // );
    }
  }
  Future<void> signWithGoogle(BuildContext context) async {

    ConstantsWidgets.showLoading();
    try {

      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      GoogleSignIn googleSignIn = GoogleSignIn(
        // Optional clientId
        // clientId: 'your-client_id.apps.googleusercontent.com',
        // scopes: scopes,
      );
      final googleSignInAccount= await googleSignIn.signIn();

      if(googleSignInAccount?.email ==null)
        throw Exception( "فشلت العملية، حاول مرة أخرى"??'Failed Auth');
      print(googleSignInAccount!.email!);
      print(googleSignInAccount!.displayName);
      print(googleSignInAccount!.photoUrl);
      print(googleSignInAccount!.id);
      var result = await FirebaseFun.fetchUserByEmail(email: googleSignInAccount!.email);

      ///handling
      // !result['status']?throw FirebaseAuthException(code: result['message']):'';
      UserModel? userModel;

      if (result['status'] && result['body'] != null) {
        userModel = UserModel.fromJson(result['body']);
        userModel.photoUrl=(userModel.googleId?.isEmpty??true)?userModel.photoUrl:googleSignInAccount.photoUrl;
        userModel.googleId=googleSignInAccount.id;
        login(context,userSign: userModel);
      }
      else{
        userModel=UserModel(

          email: googleSignInAccount.email,
          name: googleSignInAccount.displayName,
          userName:await _getUserNameByName(googleSignInAccount.displayName??googleSignInAccount.email??""),
          password: "112233aaAA@@",
          typeUser: typeUser,
          googleId: googleSignInAccount.id,
          photoUrl: googleSignInAccount.photoUrl,
        );
        signUp(context,userSign: userModel);
      }





    } catch (error) {
      print("error $error");
      ConstantsWidgets.TOAST(null, textToast: "فشلت العملية، حاول مرة أخرى", state: false);

    }finally{
      ConstantsWidgets.closeDialog();
    }



  }


  _generateUserNameByName(String name) {
    name = name.toLowerCase();
    List<String> names = name.trim().split(' ');
    String firstName = names.isNotEmpty ? names.first : '';
    String? lastName = names.length > 1 ? names.sublist(1, 2).join(' ') : null;
    String userName = '${firstName}';
    if (lastName != null) userName += '_${lastName}';
    return userName;
  }

  _getUserNameByName(String name) async {
    String genUserName = _generateUserNameByName(name);
    String userName = genUserName;
    var result = await FirebaseFun.fetchUsers();
    if (!result['status']) return null;
    Users users = Users.fromJson(result['body']);
    for (int i = 0; i < 10000; i++) {
      bool exists = users.items.any((user) => user.userName == userName);
      if (exists)
        userName = genUserName + '$i';
      else
        break;
    }
    return userName;
  }

  void signOut(BuildContext context, {bool deleteFromAuth = false}) async {
    await auth.signOut().then((value) async {
      if (deleteFromAuth) {
        auth.currentUser?.delete();
      }
      await AppStorage.depose();
      // await AppStorage.storageDelete(key:AppConstants.rememberMe);
      //  await AppStorage.storageDelete(key:AppConstants.uidKEY);
      //  await AppStorage.storageDelete(key:AppConstants.EMAIL_KEY);
      //  await AppStorage.storageDelete(key:AppConstants.PASSWORD_KEY);
      //  await AppStorage.storageDelete(key:AppConstants.USER_NAME_KEY);
    });
    // context.pushAndRemoveUntil(Routes.initialRoute,
    //     predicate: (Route<dynamic> route) => false);

    Get.offAll(()=>SplashScreen());
  }

  sendPasswordResetEmail(BuildContext context, {required String email}) async {
    ConstantsWidgets.showLoading();
    var result = await FirebaseFun.sendPasswordResetEmail(email: email);
    ConstantsWidgets.closeDialog();

    if (result['status']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SuccessfulChangedPasswordScreen()),
      );
      // context.pushReplacement(Routes.checkYourInboxRoute);
    } else {
      ConstantsWidgets.TOAST(context,
          textToast: FirebaseFun.findTextToast(result['message'].toString()),
          state: result['status']);
    }
    return result;
  }

  checkEmailIsFound(BuildContext context, {required String email}) async {
    try {
      ConstantsWidgets.showLoading();
      var result = await FirebaseFun.fetchUserByEmail(email: email);

      ///handling
      print(result);
      if (result['status'] && result['body'] != null) {
        emailController.text = email;

        UserModel? userModel = UserModel.fromJson(result['body']);

        await auth
            .signInWithEmailAndPassword(
                email: email, password: userModel.password ?? "")
            .timeout(FirebaseFun.timeOut)
            .then((value) async {
          Get.back();
          emailController.text = email;
          print("emailController.text");
          print(emailController.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OtpScreen()),
          );
        });
      } else {
        throw FirebaseAuthException(
            code: "البريد غير موجود" ?? result['message']);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      Get.back();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    } catch (e) {
      String errorMessage = FirebaseFun.findTextToast("$e");
      Get.back();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
  }

  checkCodeToResetPassword(BuildContext context,
      {required String email}) async {
    ConstantsWidgets.showLoading();
    var result = await FirebaseFun.sendPasswordResetEmail(email: email);
    ConstantsWidgets.closeDialog();

    if (result['status']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpScreen()),
      );
      // context.pushReplacement(Routes.checkYourInboxRoute);
    } else {
      ConstantsWidgets.TOAST(context,
          textToast: FirebaseFun.findTextToast(result['message'].toString()),
          state: result['status']);
    }
    return result;
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      ConstantsWidgets.showLoading();
      await auth.currentUser?.delete().timeout(FirebaseFun.timeOut);
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser)
          .doc(await AppStorage.storageRead(key: AppConstants.uidKEY))
          .delete();
      Get.dialog(
        DialogWithShadowWidget(text: Strings.successfulDeleteAccountText),
      );
      Timer(Duration(seconds: 3), () {
        Navigator.pop(context);
        signOut(context);
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      Get.back();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
  }

  @override
  void onInit() {
    // _initPageView();
    passwordController.addListener(() {
      update();
    });

    super.onInit();
  }

  Future<void> seeder() async {
    List<UserModel> users = [
      UserModel(
          email: 'admin@gmail.com',
          name: 'Admin Acc',
          password: '12345678',
          typeUser: AppConstants.collectionAdmin),
      // UserModel(email: 'worker@gmail.com', name: 'Worker Acc', password: '12345678', typeUser: AppConstants.collectionWorker),
      UserModel(
          email: 'user@gmail.com',
          name: 'User Acc',
          password: '12345678',
          typeUser: AppConstants.collectionUser),
      // UserModel(email: 'owner@gmail.com', name: 'Owner Acc', password: '12345678', typeUser: AppConstants.collectionOwner),
      // UserModel(email: 'mr.ahmadmriwed@gmail.com', name: 'Ahmad Mriwed', password: '12345678', typeUser: AppConstants.collectionUser,phoneNumber: '0937954969'),
    ];
    try {
      ConstantsWidgets.showLoading();
      for (UserModel userModel in users) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(
                email: userModel.email!, password: userModel.password!)
            .timeout(FirebaseFun.timeOut);
        if (userCredential.user != null) {
          userModel.uid = userCredential.user!.uid;
          await FirebaseFirestore.instance
              .collection(FirebaseConstants.collectionUser)
              .doc(userModel.uid)
              .set(userModel.toJson());
        }
      }
      ConstantsWidgets.closeDialog();
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
  }

  @override
  void onClose() {
    // nameController.dispose();
    // userNameController.dispose();
    // firstNameController.dispose();
    // firstNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    // passwordController.dispose();
    // pageController.dispose();

    super.onClose();
  }
}

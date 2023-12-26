import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../common_utils/app_constants.dart';
import '../../data/profile_entity.dart';
import '../../domain/profile_repository.dart';
import '../app_pages/app_pages_cubit.dart';
import '../social_media/social_media_cubit.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  SocialMediaCubit? mSocialMediaCubit;
  AppPagesCubit? mAppPagesCubit;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'KW');
  String myCountry = '+965';
  String name = '+';
  String? initialIsoCode = "KW";

  ProfileRepository profileRepository = ProfileRepository();

  Future<void> getProfile() async {
    final resul = await profileRepository.getProfile();
    resul.fold((l) {
      emit(ProfileFailed(l));
    }, (r) async {
      if (r.data == null) {
        emit(ProfileFailed("emptyData".tr));
      } else {
        final data = r.data!;
        name = data.name ?? '';

        ///countrycode
        // myCountry = data.countryCode ?? '';
        nameController.text = data.name ?? '';
        emailController.text = data.email ?? '';
        phoneEditingController.text = data.mobile ?? '';
        // countryController.text = data.countryCode ?? '';
        emit(ProfileLoaded(r.data!));
      }
    });
  }

  Future<void> saveAppImageToShare(String imageUrl) async {
    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/appLogo.png");
    final Response response = await Dio().get(
      imageUrl,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    file.writeAsBytesSync(Uint8List.fromList(response.data));

    await Share.shareXFiles([XFile(file.path)],
        text: '${'getIosApp'.trParams({
              "fieldName": 'https://apps.apple.com/app/$appCurrentAppStoreId',
            })}\n${'getAndroidApp'.trParams({
              "fieldName":
                  'https://play.google.com/store/apps/details?id=$appCurrentGooglePlayId',
            })}');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/assets_data/assets_data.dart';
import '../../../core/constants.dart';
import '../cubit/edit_profile_cubit.dart';

class EditPicProfileWidget extends StatelessWidget {
  const EditPicProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        var cubit = EditProfileCubit.get(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (cubit.image != null) {
                    cubit.removeImage();
                  } else {
                    cubit.getImage(ImageSource.gallery);
                  }
                },
                child: Stack(
                  children: [
                    cubit.image != null
                        ? Container(
                            width: 130.h,
                            height: 130.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      cubit.image!,
                                    ))),
                          )
                        : userData!.image == null || userData!.image == ''
                            ? Container(
                                width: 130.w, // Adjust the width as needed
                                height: 130.w, // Adjust the height as needed
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Image.asset(AssetsData.userPng),
                              )
                            : Container(
                                width: 130.w,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(userData?.image ?? ''),
                                    fit: BoxFit
                                        .cover, // Adjust the BoxFit property based on your preference
                                  ),
                                ),
                              ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            (userData?.image == '' && cubit.image == null)
                                ? Icons.add
                                : (userData?.image != '' && cubit.image != null)
                                    ? Icons.delete
                                    : Icons.edit,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
            ],
          ),
        );
      },
    );
  }
}

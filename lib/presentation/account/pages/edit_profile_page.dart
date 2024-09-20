import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/spaces.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Text('Terjadi Kesalahan');
              },
              loaded: (user) {
                final nameController =
                    TextEditingController(text: user.name ?? '');
                final emailController =
                    TextEditingController(text: user.email ?? '');
                final phoneController =
                    TextEditingController(text: user.phone ?? '');

                return Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Photo
                            CircleAvatar(
                              radius: 75,
                              backgroundImage:
                                  AssetImage(Assets.images.logoAcm2.path),
                            ),

                            const SpaceHeight(40),

                            // Form Nama (Buat CustomWidget)
                            TextFormField(
                              controller: nameController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Nama tidak boleh kosong!";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Nama",
                                hintText: "Nama",
                                prefixIcon: const Icon(Icons.person),
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),

                            const SpaceHeight(20),

                            // Email
                            TextFormField(
                              readOnly: true,
                              controller: emailController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email tidak boleh kosong!";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Email",
                                hintText: "email",
                                prefixIcon:
                                    const Icon(Icons.alternate_email_rounded),
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),

                            const SpaceHeight(20),

                            // No Handphone
                            TextFormField(
                              maxLength: 14,
                              controller: phoneController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Nomor Handphone tidak boleh kosong!";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Nomor Handphone",
                                hintText: "Nomor Handphone",
                                prefixIcon: const Icon(Icons.phone),
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),

                            const SpaceHeight(20),

                            // Position
                            // TextFormField(
                            //   controller: positionController,
                            //   cursorColor: Colors.black,
                            //   keyboardType: TextInputType.text,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "Alamat tidak boleh kosong!";
                            //     }
                            //     return null;
                            //   },
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     labelText: "Alamat",
                            //     hintText: "Alamat",
                            //     prefixIcon:
                            //         const Icon(Icons.location_city_rounded),
                            //     fillColor: Colors.grey.shade200,
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(50)),
                            //   ),
                            // ),

                            const SpaceHeight(20),

                            // Button Kirim
                            ElevatedButton(
                              onPressed: () async {
                                final List<ConnectivityResult>
                                    connectivityResult =
                                    await (Connectivity().checkConnectivity());

                                log(emailController.text);
                                log(phoneController.text);
                                if (formKey.currentState!.validate()) {
                                  if (connectivityResult
                                      .contains(ConnectivityResult.none)) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text(
                                            'Tidak Ada Koneksi Internet'),
                                        content: const Text(
                                            'Mohon periksa koneksi internet Anda.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    // TODO: Kirim data ke server
                                    // Send Data
                                    BlocProvider.of<UserBloc>(context).add(
                                      UserEvent.updateUser(
                                        // userId,
                                        nameController.text,
                                        emailController.text,
                                        phoneController.text,
                                      ),
                                    );
                                    // context.goNamed(
                                    //   RouteConstants.successEditProfilePage,
                                    //   pathParameters: PathParameters(
                                    //     rootTab: RootTab.account,
                                    //   ).toMap(),
                                    // );
                                  }
                                }
                              },
                              child: const Text('Ubah data profil'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

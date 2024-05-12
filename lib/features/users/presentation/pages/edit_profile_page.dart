import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/features/users/domain/entities/user_entity.dart';
import 'package:petgogu/utils/service_config.dart';

import '../../../../utils/my_alerts.dart';
import '../widgets/edit_profile_page/edit_changes_button.dart';
import '../widgets/edit_profile_page/edit_profile_form_field.dart';

class EditProfilePage extends StatefulWidget {
  final UserEntity userEntity;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  const EditProfilePage({
    required this.userEntity,
  });
}

class _EditProfilePageState extends State<EditProfilePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  setInitValues() {
    setState(() {
      emailController.text = widget.userEntity.email;
      nameController.text = widget.userEntity.name;
      cityController.text = widget.userEntity.city;
      phoneController.text = widget.userEntity.phone;
    });
  }

  @override
  void initState() {
    setInitValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<UserLogicCubit>(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      title: const Text("Edit your Profile"),
                    ),
                    EditProfileFormField(
                      labelText: "Your Name",
                      controller: nameController,
                    ),
                    EditProfileFormField(
                      labelText: "Your Email",
                      controller: emailController,
                    ),
                    EditProfileFormField(
                      labelText: "Your Phone",
                      controller: phoneController,
                      disable: true,
                    ),
                    EditProfileFormField(
                      labelText: "Your City",
                      controller: cityController,
                    ),
                    EditChangesButton(
                      onTap: () {
                        validateFields(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  validateFields(BuildContext context) {
    if (nameController.text.isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "Name Can't Be Empty",
        color: Colors.amber,
      );
      return;
    }
    if (emailController.text.isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "Email Can't Be Empty",
        color: Colors.amber,
      );
      return;
    }
    if (cityController.text.isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "City Can't Be Empty",
        color: Colors.amber,
      );
      return;
    }
    context.read<UserLogicCubit>().updateUser(
          name: nameController.text,
          email: emailController.text,
          city: cityController.text,
        );
  }
}

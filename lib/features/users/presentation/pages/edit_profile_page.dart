import 'package:flutter/material.dart';

import '../widgets/edit_profile_page/edit_changes_button.dart';
import '../widgets/edit_profile_page/edit_profile_form_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const EditProfileFormField(
                initVal: "My Name",
                labelText: "Your Name",
              ),
              const EditProfileFormField(
                initVal: "my@email.com",
                labelText: "Your Email",
                disable: true,
              ),
              const EditProfileFormField(
                initVal: "9876543210",
                labelText: "Your Phone",
              ),
              const EditProfileFormField(
                initVal: "Karad",
                labelText: "Your City",
              ),
              const EditChangesButton(),
            ],
          ),
        ),
      ),
    );
  }
}

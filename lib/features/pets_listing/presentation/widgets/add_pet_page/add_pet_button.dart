import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/add_pet/add_new_pet_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';
import 'package:petgogu/utils/my_alerts.dart';

class AddPetButton extends StatelessWidget {
  const AddPetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: BlocConsumer<AddNewPetCubit, AddNewPetState>(
          listener: (context, state) {
            if (state is AddNewPetError) {
              MyAlerts.showMySnackBar(
                context,
                content: state.err,
                color: Colors.red,
              );
            }
            if (state is AddNewPetSuccess) {
              MyAlerts.showMySnackBar(
                context,
                content: "Pet Added Successfully for Review Published between Next 12 Hours!",
                color: Colors.green,
              );
              context.read<TempPetCubit>().setToInit();
            }
          },
          builder: (context, state) {
            if (state is AddNewPetLoading) {
              return const LinearProgressIndicator();
            }
            return ElevatedButton(
              onPressed: () {
                if (validateFields(context)) {
                  context.read<AddNewPetCubit>().insertPet();
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text("Submit Pet For Review"),
            );
          },
        ),
      ),
    );
  }

  bool validateFields(BuildContext context) {
    final tempPet = BlocProvider.of<TempPetCubit>(context, listen: false).state;
    if (tempPet.category == 'Others' && tempPet.othCategory.trim().isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "Specify Pet Category",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.category == 'Others' && tempPet.othBreed.trim().isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "Specify Pet Breed",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.category != 'Others' &&
        tempPet.category == "Select Pet Category") {
      MyAlerts.showMySnackBar(
        context,
        content: "Select Pet Category",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.category != 'Others' && tempPet.breed == "Select Pet Breed") {
      MyAlerts.showMySnackBar(
        context,
        content: "Select Pet Breed",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.name == "") {
      MyAlerts.showMySnackBar(
        context,
        content: "Fill Pet Name",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.age == 0) {
      MyAlerts.showMySnackBar(
        context,
        content: "Pet Age is Missing",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.weight == 0) {
      MyAlerts.showMySnackBar(
        context,
        content: "Pet Weight is Missing",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.description == "") {
      MyAlerts.showMySnackBar(
        context,
        content: "Write Briefly about Pet",
        color: Colors.orange,
      );
      return false;
    }
    if (tempPet.pics.isEmpty) {
      MyAlerts.showMySnackBar(
        context,
        content: "Pick Images of Pet",
        color: Colors.orange,
      );
      return false;
    }
    return true;
  }
}

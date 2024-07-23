import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';
import 'package:petgogu/utils/my_alerts.dart';

import '../../../../pets_listing/presentation/widgets/pet_details_page/image_carousel_widget.dart';
import '../manager/fetch_admin_pets/fetch_admin_pets_cubit.dart';
import '../pages/admin_pet_detail_page.dart';

import 'package:flutter/services.dart';

class AdminPropertyCardWidget extends StatelessWidget {
  final PetEntity pet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ListTile(
              // onTap: () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => PetDetailsPageDesktop(pet: pet),
              //     ),
              //   );
              // },
              leading: const Icon(Icons.pets),
              titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              title: Text(
                pet.name,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text("${pet.category} - ${pet.breed}"),
              trailing: Text(pet.owner.city,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
            ),
            const Divider(height: 10, thickness: 1),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return ImageCaroselWidget(picsList: pet.pics);
                          },
                        );
                      },
                      child: Image.network(
                        pet.pics.first,
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 10, thickness: 1),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          title: Text("Owner: ${pet.owner.name}"),
                          subtitle: Text(
                            "Age: ${pet.age} Month's Old\n"
                            "Weight: ${pet.weight} ${pet.inkg ? 'KG' : 'Gram'}\n"
                            "Posted On: ${DateFormat.yMMMd().format(pet.createdAt).toString()}\n"
                            "---------------------------------------------------\n"
                            "Owners Contact No: ${pet.owner.phone}\n",
                          ),
                        ),
                        ListTile(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(25),
                          // ),
                          minLeadingWidth: 20,
                          tileColor: Colors.grey.shade200,
                          leading: const Icon(Icons.pending_actions),
                          title: const Text("Take Action About Pet"),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                if (pet.status != 1)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPetsCubit>()
                                          .takingActionOnProperty(pet, 1);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("De-list Pet"),
                                  ),
                                if (pet.status != 2)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPetsCubit>()
                                          .takingActionOnProperty(pet, 2);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("Withheld Pet"),
                                  ),
                                if (pet.status != 0)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPetsCubit>()
                                          .takingActionOnProperty(pet, 0);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("Approve Pet"),
                                  ),
                                // TextButton(
                                //   onPressed: () async {
                                //     await Clipboard.setData(
                                //       ClipboardData(
                                //         text:
                                //             "https://gharmarket.com/#/propertydetailById/${pet.id}",
                                //       ),
                                //     ).then((value) {
                                //       MyAlerts.showMySnackBar(
                                //         context,
                                //         content: "Property Link Copied !",
                                //         color: Colors.green,
                                //       );
                                //     });
                                //   },
                                //   style: TextButton.styleFrom(
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(18.0),
                                //       side:
                                //           const BorderSide(color: Colors.black),
                                //     ),
                                //     backgroundColor: Colors.white,
                                //   ),
                                //   child: const Text("Copy Link"),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 10, thickness: 1),
          ],
        ),
      ),
    );
  }

  const AdminPropertyCardWidget({
    super.key,
    required this.pet,
  });
}

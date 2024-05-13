import 'package:flutter/material.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';
import 'package:petgogu/features/pets_listing/presentation/widgets/home_page/pet_list_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../favorite_button.dart';

class PetActionBar extends StatelessWidget {
  final PetEntity petEntity;

  const PetActionBar({
    super.key,
    required this.petEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Contact Pet Owner",
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.call),
                            onPressed: () async {
                              final url =
                                  Uri.parse("tel://${petEntity.owner.phone}");
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            label: const Text("Call Owner"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.chat_bubble),
                            onPressed: () async {
                              final url = Uri.parse(
                                  "https://wa.me/91${petEntity.owner.phone}");
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                            label: const Text("Chat on WhatsApp"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SeftyTips(),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                ),
                child: const Text("Contact For Adoption"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FavoriteButton(pet: petEntity),
          ),
        ],
      ),
    );
  }
}

class SeftyTips extends StatelessWidget {
  const SeftyTips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "*Tip: "
          "\n- Be Safe and Take Necessary Precautions while meeting Owner and User "
          "\n- Do not Pay in Advance",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

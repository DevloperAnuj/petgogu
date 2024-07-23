import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petgogu/features/pets_listing/domain/entities/pet_entitiety.dart';



class AdminPropertyDetailsPage extends StatelessWidget {
  final PetEntity pet;

  static const String routeName = "/adminpropertydetail";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider.value(
        //   value: serviceConfig.get<ReportPropertyCubit>(),
        // ),
        // BlocProvider.value(
        //   value: serviceConfig.get<FavoritePropertyCubit>(),
        // ),
        // BlocProvider.value(
        //   value: serviceConfig.get<FetchConnectionsCubit>(),
        // ),
      ],
      child: PetDetailsPageDesktop(
        pet: pet,
      ),
    );
  }

  const AdminPropertyDetailsPage({
    super.key,
    required this.pet,
  });
}

class PetDetailsPageDesktop extends StatelessWidget {
  final PetEntity pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(),
          // DetailsHeaderWidgetDesktop(
          //   pet: pet,
          // ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Row(
                        children: [
                          // PropertyImageCollageWidgetDesktop(
                          //   imageList: pet.picsUrl,
                          // ),
                          AdminPropertyHighlightsWidget(
                            pet: pet,
                          ),
                        ],
                      ),
                    ),
                    // const Divider(),
                    // SecondHeadRowWidget(
                    //   pet: pet,
                    // ),
                    const Divider(),
                    // DescriptionWidget(
                    //   pet: pet,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  const PetDetailsPageDesktop({
    super.key,
    required this.pet,
  });
}

class AdminPropertyHighlightsWidget extends StatelessWidget {
  final PetEntity pet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        ],
      ),
    );
  }

  const AdminPropertyHighlightsWidget({
    super.key,
    required this.pet,
  });
}

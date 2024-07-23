import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/fetch_admin_pets/fetch_admin_pets_cubit.dart';
import 'admin_property_card.dart';

class PendingPetsList extends StatelessWidget {
  const PendingPetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPetsCubit, FetchAdminPetsState>(
      builder: (context, state) {
        if (state.pendingPets.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.pendingPets[i];
              return AdminPropertyCardWidget(pet: property);
            },
            itemCount: state.pendingPets.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class ApprovedPetsList extends StatelessWidget {
  const ApprovedPetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPetsCubit, FetchAdminPetsState>(
      builder: (context, state) {
        if (state.approvedPets.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.approvedPets[i];
              return AdminPropertyCardWidget(pet: property);
            },
            itemCount: state.approvedPets.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class DelistedPetsList extends StatelessWidget {
  const DelistedPetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPetsCubit, FetchAdminPetsState>(
      builder: (context, state) {
        if (state.delistPets.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.delistPets[i];
              return AdminPropertyCardWidget(pet: property);
            },
            itemCount: state.delistPets.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class WithheldPetsList extends StatelessWidget {
  const WithheldPetsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPetsCubit, FetchAdminPetsState>(
      builder: (context, state) {
        if (state.withheldPets.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.withheldPets[i];
              return AdminPropertyCardWidget(pet: property);
            },
            itemCount: state.withheldPets.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}
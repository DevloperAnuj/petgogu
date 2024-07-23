import 'package:get_it/get_it.dart';
import 'package:petgogu/features/admin/features/admin_panel/manager/admin_panel_logic/admin_panel_logic_cubit.dart';
import 'package:petgogu/features/admin/features/admin_panel/manager/fetch_admin_pets/fetch_admin_pets_cubit.dart';
import 'package:petgogu/features/admin/features/admin_panel/manager/fetch_users/admin_fetch_users_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/login_logic/login_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/reg_logic/reg_logic_cubit.dart';
import 'package:petgogu/features/auth/presentation/manager/user_logic/user_logic_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/add_pet/add_new_pet_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_all_pets/fetch_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_favorites_pets/fetch_favorite_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/fetch_my_pets/fetch_my_pets_cubit.dart';
import 'package:petgogu/features/pets_listing/presentation/manager/temp_pet/temp_pet_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt serviceConfig = GetIt.instance;

void initSetup() {
  serviceConfig.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  serviceConfig.registerLazySingleton<LoginLogicCubit>(
    () => LoginLogicCubit(),
  );

  serviceConfig.registerLazySingleton<RegLogicCubit>(
    () => RegLogicCubit(),
  );

  serviceConfig.registerLazySingleton<UserLogicCubit>(
    () => UserLogicCubit(),
  );

  serviceConfig.registerLazySingleton<TempPetCubit>(
    () => TempPetCubit(),
  );

  serviceConfig.registerLazySingleton<AddNewPetCubit>(
    () => AddNewPetCubit(),
  );

  serviceConfig.registerLazySingleton<FetchPetsCubit>(
    () => FetchPetsCubit(),
  );

  serviceConfig.registerLazySingleton<FetchFavoritePetsCubit>(
    () => FetchFavoritePetsCubit(),
  );

  serviceConfig.registerLazySingleton<FetchMyPetsCubit>(
        () => FetchMyPetsCubit(),
  );

  serviceConfig.registerLazySingleton<AdminPanelLogicCubit>(
        () => AdminPanelLogicCubit(),
  );

  serviceConfig.registerLazySingleton<FetchAdminPetsCubit>(
        () => FetchAdminPetsCubit(),
  );

  serviceConfig.registerLazySingleton<AdminFetchUsersCubit>(
        () => AdminFetchUsersCubit(),
  );

}

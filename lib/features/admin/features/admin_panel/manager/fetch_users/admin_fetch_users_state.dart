part of 'admin_fetch_users_cubit.dart';

class AdminFetchUsersState {

  final List<UserEntity> allUsers;

  const AdminFetchUsersState({
    required this.allUsers,
  });

  factory AdminFetchUsersState.initial(){
    return const AdminFetchUsersState(allUsers: []);
  }

  AdminFetchUsersState copyWith({
    List<UserEntity>? allUsers,
  }) {
    return AdminFetchUsersState(
      allUsers: allUsers ?? this.allUsers,
    );
  }
}

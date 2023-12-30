part of 'password_visibility_cubit.dart';

@immutable
sealed class PasswordVisibilityState {}

final class PasswordVisibilityInitial extends PasswordVisibilityState {}
final class PasswordToggle extends PasswordVisibilityState {}

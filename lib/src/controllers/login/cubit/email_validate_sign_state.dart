part of 'email_validate_sign_cubit.dart';

@immutable
sealed class EmailValidateSignState {}

final class EmailValidateSignInitial extends EmailValidateSignState {}
final class EmailValid extends EmailValidateSignState {}
final class EmailInvalid extends EmailValidateSignState {}

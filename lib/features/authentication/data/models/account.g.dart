// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final int typeId = 0;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel(
      adUserId: fields[1] as int?,
      email: fields[0] as String?,
      birthday: fields[5] as String?,
      firstLogin: fields[6] as bool?,
      fullName: fields[3] as String?,
      phone: fields[2] as String?,
      userPin: fields[4] as String?,
      username: fields[7] as String?,
      password: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.password)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.adUserId)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.userPin)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.firstLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

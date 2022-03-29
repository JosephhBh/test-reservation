abstract class Copyable<T> {
  T copy();
  T copyWith();
}

class LockersModel implements Copyable<LockersModel> {
  LockersModel({
    this.size = "M",
    this.number = 0,
    this.isSizeSelected = false,
    this.isSizeConfirmed = false,
    this.isNumberSelected = false,
    this.isNumberConfirmed = false,
  });

  final String size;
  final int number;
  final bool isSizeSelected;
  final bool isSizeConfirmed;
  final bool isNumberSelected;
  final bool isNumberConfirmed;

  @override
  LockersModel copy() => LockersModel(
        size: size,
        number: number,
        isSizeSelected: isSizeSelected,
        isSizeConfirmed: isSizeConfirmed,
        isNumberSelected: isNumberSelected,
        isNumberConfirmed: isNumberConfirmed,
      );

  @override
  LockersModel copyWith({
    String? size,
    int? number,
    bool? isSizeSelected,
    bool? isSizeConfirmed,
    bool? isNumberSelected,
    bool? isNumberConfirmed,
  }) =>
      LockersModel(
        size: size ?? this.size,
        number: number ?? this.number,
        isSizeSelected: isSizeSelected ?? this.isSizeSelected,
        isSizeConfirmed: isSizeConfirmed ?? this.isSizeConfirmed,
        isNumberSelected: isNumberSelected ?? this.isNumberSelected,
        isNumberConfirmed: isNumberConfirmed ?? this.isNumberConfirmed,
      );
}

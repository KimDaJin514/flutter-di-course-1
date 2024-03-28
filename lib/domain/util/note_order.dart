// import 'package:note_app/domain/util/order_type.dart';
//
// sealed class NoteOrder<T> {
//   const factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
//   const factory NoteOrder.date(OrderType orderType) = NoteOrderDate;
//   const factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
// }
//
// class NoteOrderTitle<T> implements NoteOrder<T> {
//   final OrderType orderType;
//   const NoteOrderTitle(this.orderType);
// }
//
// class NoteOrderDate<T> implements NoteOrder<T> {
//   final OrderType orderType;
//   const NoteOrderDate(this.orderType);
// }
//
// class NoteOrderColor<T> implements NoteOrder<T> {
//   final OrderType orderType;
//   const NoteOrderColor(this.orderType);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/util/order_type.dart';

part 'note_order.freezed.dart';

@freezed
sealed class NoteOrder with _$NoteOrder {
  const factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
  const factory NoteOrder.date(OrderType orderType) = NoteOrderDate;
  const factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
}
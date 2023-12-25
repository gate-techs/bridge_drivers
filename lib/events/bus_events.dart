import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

class FavoritesEventBus {
  const FavoritesEventBus();
}

class CartEventBus {
  const CartEventBus();
}

class NotificationsEventBus {
  const NotificationsEventBus();
}

class LogoutEventBus {
  const LogoutEventBus();
}

abstract class AreaEvent {
  const AreaEvent();
}

class CitiesEvent extends AreaEvent {
  final int parentId;

  CitiesEvent({
    required this.parentId,
  });
}

class SortEventBus {
  final Map<String, dynamic> params;

  const SortEventBus(this.params);
}

class Sort2EventBus {
  final Map<String, dynamic> params;

  const Sort2EventBus(this.params);
}

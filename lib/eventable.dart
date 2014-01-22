library Eventable;


import 'package:json_object/json_object.dart';
import 'dart:async';


part 'emit_time_queue_change_error.dart';
part 'duplicate_event_setting_error.dart';
part 'event.dart';
part 'emitter.dart';
part 'detector.dart';


const String OMNI = 'omni';
typedef void EventAction(Event event);
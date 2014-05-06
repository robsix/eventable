/**
 * author: Daniel Robinson  http://github.com/0xor1
 */

library EventableTest;

import 'package:unittest/unittest.dart';
import 'dart:async';
import 'package:eventable/eventable.dart';

part 'event_emitter_test.dart';
part 'event_test.dart';
part 'event_detector_test.dart';

class TypeA implements IEvent{
  EventEmitter emitter;
}
class TypeB implements IEvent{
  EventEmitter emitter;
}

EventEmitter emitter1;
EventEmitter emitter2;
EventDetector detector;

IEvent lastDetectedEvent;
int eventADetectedCount;
int eventBDetectedCount;

EventAction detectEvent = (event){
  if(event is TypeA){
    eventADetectedCount++;
  }
  else if(event is TypeB){
    eventBDetectedCount++;
  }
  lastDetectedEvent = event;
};

void setUpTestObjects(){
  emitter1 = new EventEmitter();
  emitter2 = new EventEmitter();
  detector = new EventDetector();

  eventADetectedCount = eventBDetectedCount = 0;

  detector.listen(emitter1, TypeA, detectEvent);
  detector.listen(emitter2, TypeB, detectEvent);
}

void tearDownTestObjects(){
  emitter1 = emitter2 = detector = lastDetectedEvent = null;
  eventADetectedCount = eventBDetectedCount = 0;
}

void main(){

  runEventEmitterTests();
  runEventTests();
  runEventDetectorTests();

}
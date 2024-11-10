abstract class MIDIMessage {
  const MIDIMessage();

  String get name => runtimeType.toString();

  int? get channel => null;
}

class MIDIControlChangeMessage extends MIDIMessage {
  @override
  final int channel;
  final int controller;
  final int value;

  const MIDIControlChangeMessage({
    required this.channel,
    required this.controller,
    required this.value,
  });

  @override
  String get name => 'Control Change';

  @override
  String toString() {
    return 'MIDIControlChangeMessage{channel: $channel, controller: $controller, value: $value}';
  }
}

class MIDIProgramChangeMessage extends MIDIMessage {
  @override
  final int channel;
  final int program;

  const MIDIProgramChangeMessage({
    required this.channel,
    required this.program,
  });

  @override
  String get name => 'Program Change';

  @override
  String toString() {
    return 'MIDIProgramChangeMessage{channel: $channel, program: $program}';
  }
}

class MIDINoteOnMessage extends MIDIMessage {
  @override
  final int channel;
  final int note;
  final int velocity;

  const MIDINoteOnMessage({
    required this.channel,
    required this.note,
    required this.velocity,
  });

  @override
  String get name => 'Note On';

  @override
  String toString() {
    return 'MIDINoteOnMessage{channel: $channel, note: $note, velocity: $velocity}';
  }
}

class MIDINoteOffMessage extends MIDIMessage {
  @override
  final int channel;
  final int note;
  final int velocity;

  const MIDINoteOffMessage({
    required this.channel,
    required this.note,
    required this.velocity,
  });

  @override
  String get name => 'Note Off';

  @override
  String toString() {
    return 'MIDINoteOffMessage{channel: $channel, note: $note, velocity: $velocity}';
  }
}

class MIDIPolyphonicKeyPressureMessage extends MIDIMessage {
  @override
  final int channel;
  final int note;
  final int pressure;

  const MIDIPolyphonicKeyPressureMessage({
    required this.channel,
    required this.note,
    required this.pressure,
  });

  @override
  String get name => 'Polyphonic Key Pressure';

  @override
  String toString() {
    return 'MIDIPolyphonicKeyPressureMessage{channel: $channel, note: $note, pressure: $pressure}';
  }
}

class MIDIChannelPressureMessage extends MIDIMessage {
  @override
  final int channel;
  final int pressure;

  const MIDIChannelPressureMessage({
    required this.channel,
    required this.pressure,
  });

  @override
  String get name => 'Channel Pressure';

  @override
  String toString() {
    return 'MIDIChannelPressureMessage{channel: $channel, pressure: $pressure}';
  }
}

class MIDIPitchBendChangeMessage extends MIDIMessage {
  @override
  final int channel;
  final int value;

  const MIDIPitchBendChangeMessage({
    required this.channel,
    required this.value,
  });

  @override
  String get name => 'Pitch Bend Change';

  @override
  String toString() {
    return 'MIDIPitchBendChangeMessage{channel: $channel, value: $value}';
  }
}

class MIDITimeCodeQuarterFrame extends MIDIMessage {
  final int messageType;
  final int value;

  const MIDITimeCodeQuarterFrame({
    required this.messageType,
    required this.value,
  });

  @override
  String get name => 'Time Code Quarter Frame';

  @override
  String toString() {
    return 'MIDITimeCodeQuarterFrame{messageType: $messageType, value: $value}';
  }
}

class MIDISongPositionPointer extends MIDIMessage {
  final int value;

  const MIDISongPositionPointer({
    required this.value,
  });

  @override
  String get name => 'Song Position Pointer';

  @override
  String toString() {
    return 'MIDISongPositionPointer{value: $value}';
  }
}

class MIDISongSelect extends MIDIMessage {
  final int songNumber;

  const MIDISongSelect({
    required this.songNumber,
  });

  @override
  String get name => 'Song Select';

  @override
  String toString() {
    return 'MIDISongSelect{songNumber: $songNumber}';
  }
}

class MIDITuneRequest extends MIDIMessage {
  const MIDITuneRequest();

  @override
  String get name => 'Tune Request';
}

class MIDITimingClock extends MIDIMessage {
  const MIDITimingClock();

  @override
  String get name => 'Timing Clock';
}

class MIDIStart extends MIDIMessage {
  const MIDIStart();

  @override
  String get name => 'Start';
}

class MIDIContinue extends MIDIMessage {
  const MIDIContinue();

  @override
  String get name => 'Continue';
}

class MIDIStop extends MIDIMessage {
  const MIDIStop();

  @override
  String get name => 'Stop';
}

class MIDIActiveSensing extends MIDIMessage {
  const MIDIActiveSensing();

  @override
  String get name => 'Active Sensing';
}

class MIDISystemReset extends MIDIMessage {
  const MIDISystemReset();

  @override
  String get name => 'System Reset';
}

class MIDIUndefinedSystemCommonMessage extends MIDIMessage {
  final int status;

  const MIDIUndefinedSystemCommonMessage({required this.status});

  @override
  String get name => 'Undefined System Common';

  @override
  String toString() {
    return 'MIDIUndefinedSystemCommonMessage{status: $status}';
  }
}

class MIDISysExMessage extends MIDIMessage {
  final List<int> data;

  const MIDISysExMessage({required this.data});

  @override
  String get name => 'System Exclusive';

  @override
  String toString() {
    return 'MIDISysExMessage{data: $data}';
  }
}

class MidiSysExMalformedMessage extends MIDIMessage {
  final List<int> data;

  const MidiSysExMalformedMessage({required this.data});

  @override
  String get name => 'System Exclusive Malformed';

  @override
  String toString() {
    return 'MidiSysExMalformedMessage{data: $data}';
  }
}

class MIDIUnrecognizedMessage extends MIDIMessage {
  final List<int> data;

  const MIDIUnrecognizedMessage({required this.data});

  @override
  String get name => 'Unrecognized';

  @override
  String toString() {
    return 'MIDIUnrecognizedMessage{data: $data}';
  }
}

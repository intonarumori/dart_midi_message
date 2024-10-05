abstract class MIDIMessage {
  const MIDIMessage();
}

class MIDIControlChangeMessage extends MIDIMessage {
  final int channel;
  final int controller;
  final int value;

  const MIDIControlChangeMessage({
    required this.channel,
    required this.controller,
    required this.value,
  });

  @override
  String toString() {
    return 'MIDIControlChangeMessage{channel: $channel, controller: $controller, value: $value}';
  }
}

class MidiProgramChangeMessage extends MIDIMessage {
  final int channel;
  final int program;

  const MidiProgramChangeMessage({required this.channel, required this.program});

  @override
  String toString() {
    return 'MidiProgramChangeMessage{channel: $channel, program: $program}';
  }
}

class MidiNoteOnMessage extends MIDIMessage {
  final int channel;
  final int note;
  final int velocity;

  const MidiNoteOnMessage({
    required this.channel,
    required this.note,
    required this.velocity,
  });

  @override
  String toString() {
    return 'MidiNoteOnMessage{channel: $channel, note: $note, velocity: $velocity}';
  }
}

class MIDINoteOffMessage extends MIDIMessage {
  final int channel;
  final int note;
  final int velocity;

  const MIDINoteOffMessage({
    required this.channel,
    required this.note,
    required this.velocity,
  });

  @override
  String toString() {
    return 'MIDINoteOffMessage{channel: $channel, note: $note, velocity: $velocity}';
  }
}

class MIDIPolyphonicKeyPressureMessage extends MIDIMessage {
  final int channel;
  final int note;
  final int pressure;

  const MIDIPolyphonicKeyPressureMessage({
    required this.channel,
    required this.note,
    required this.pressure,
  });

  @override
  String toString() {
    return 'MIDIPolyphonicKeyPressureMessage{channel: $channel, note: $note, pressure: $pressure}';
  }
}

class MIDIChannelPressureMessage extends MIDIMessage {
  final int channel;
  final int pressure;

  const MIDIChannelPressureMessage({
    required this.channel,
    required this.pressure,
  });

  @override
  String toString() {
    return 'MIDIChannelPressureMessage{channel: $channel, pressure: $pressure}';
  }
}

class MIDIPitchBendChangeMessage extends MIDIMessage {
  final int channel;
  final int value;

  const MIDIPitchBendChangeMessage({
    required this.channel,
    required this.value,
  });

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
  String toString() {
    return 'MIDISongSelect{songNumber: $songNumber}';
  }
}

class MIDITuneRequest extends MIDIMessage {
  const MIDITuneRequest();
}

class MIDITimingClock extends MIDIMessage {
  const MIDITimingClock();
}

class MIDIStart extends MIDIMessage {
  const MIDIStart();
}

class MIDIContinue extends MIDIMessage {
  const MIDIContinue();
}

class MIDIStop extends MIDIMessage {
  const MIDIStop();
}

class MIDIActiveSensing extends MIDIMessage {
  const MIDIActiveSensing();
}

class MIDISystemReset extends MIDIMessage {
  const MIDISystemReset();
}

class MIDIUndefinedSystemCommonMessage extends MIDIMessage {
  final int status;

  const MIDIUndefinedSystemCommonMessage({required this.status});

  @override
  String toString() {
    return 'MIDIUndefinedSystemCommonMessage{status: $status}';
  }
}

class MIDISysExMessage extends MIDIMessage {
  final List<int> data;

  const MIDISysExMessage({required this.data});

  @override
  String toString() {
    return 'MIDISysExMessage{data: $data}';
  }
}

class MidiSysExMalformedMessage extends MIDIMessage {
  final List<int> data;

  const MidiSysExMalformedMessage({required this.data});

  @override
  String toString() {
    return 'MidiSysExMalformedMessage{data: $data}';
  }
}

class MIDIUnrecognizedMessage extends MIDIMessage {
  final List<int> data;

  const MIDIUnrecognizedMessage({required this.data});

  @override
  String toString() {
    return 'MIDIUnrecognizedMessage{data: $data}';
  }
}

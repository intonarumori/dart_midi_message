import 'midi_messages.dart';

class MidiParser {
  static MIDIMessage parse(List<int> bytes) {
    if (bytes.isEmpty) {
      throw Exception('Invalid MIDI message: $bytes');
    }
    final status = bytes[0] & 0xF0;

    if (status < 0xF0) {
      switch (status) {
        case 0xB0:
          return MIDIControlChangeMessage(
            channel: bytes[0] & 0x0F,
            controller: bytes[1],
            value: bytes[2],
          );
        case 0xC0:
          return MidiProgramChangeMessage(
            channel: bytes[0] & 0x0F,
            program: bytes[1],
          );
        case 0x90:
          return MidiNoteOnMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            velocity: bytes[2],
          );
        case 0x80:
          return MIDINoteOffMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            velocity: bytes[2],
          );
        case 0xA0:
          return MIDIPolyphonicKeyPressureMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            pressure: bytes[2],
          );
        case 0xD0:
          return MIDIChannelPressureMessage(
            channel: bytes[0] & 0x0F,
            pressure: bytes[1],
          );
        case 0xE0:
          return MIDIPitchBendChangeMessage(
            channel: bytes[0] & 0x0F,
            value: (bytes[2] << 7) + bytes[1],
          );
        default:
          break;
      }
    } else {
      switch (status) {
        case 0xF0:
          if (bytes.last != 0xF7) {
            return MidiSysExMalformedMessage(data: bytes.sublist(1));
          } else {
            return MIDISysExMessage(data: bytes.sublist(1));
          }
        case 0xF1:
          return MIDITimeCodeQuarterFrame(messageType: bytes[0] & 0x0F, value: bytes[1]);
        case 0xF2:
          return MIDISongPositionPointer(value: (bytes[2] << 7) + bytes[1]);
        case 0xF3:
          return MIDISongSelect(songNumber: bytes[1]);
        case 0xF4:
          return MIDIUndefinedSystemCommonMessage(status: status);
        case 0xF5:
          return MIDIUndefinedSystemCommonMessage(status: status);
        case 0xF6:
          return const MIDITuneRequest();
        case 0xF8:
          return const MIDITimingClock();
        case 0xFA:
          return const MIDIStart();
        case 0xFB:
          return const MIDIContinue();
        case 0xFC:
          return const MIDIStop();
        case 0xFE:
          return const MIDIActiveSensing();
        case 0xFF:
          return const MIDISystemReset();
        default:
          break;
      }
    }
    return MIDIUnrecognizedMessage(data: bytes);
  }
}

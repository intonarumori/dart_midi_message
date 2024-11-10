import 'midi_messages.dart';
import 'midi_constants.dart';

class MidiParser {
  static MIDIMessage parse(List<int> bytes) {
    if (bytes.isEmpty) {
      throw Exception('Invalid MIDI message: $bytes');
    }
    final status = bytes[0] & 0xF0;

    if (status < 0xF0) {
      switch (status) {
        case MidiConstants.CONTROL_CHANGE:
          return MIDIControlChangeMessage(
            channel: bytes[0] & 0x0F,
            controller: bytes[1],
            value: bytes[2],
          );
        case MidiConstants.PROGRAM_CHANGE:
          return MIDIProgramChangeMessage(
            channel: bytes[0] & 0x0F,
            program: bytes[1],
          );
        case MidiConstants.NOTE_ON:
          return MIDINoteOnMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            velocity: bytes[2],
          );
        case MidiConstants.NOTE_OFF:
          return MIDINoteOffMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            velocity: bytes[2],
          );
        case MidiConstants.POLYPHONIC_KEY_PRESSURE:
          return MIDIPolyphonicKeyPressureMessage(
            channel: bytes[0] & 0x0F,
            note: bytes[1],
            pressure: bytes[2],
          );
        case MidiConstants.CHANNEL_PRESSURE:
          return MIDIChannelPressureMessage(
            channel: bytes[0] & 0x0F,
            pressure: bytes[1],
          );
        case MidiConstants.PITCH_BEND_CHANGE:
          return MIDIPitchBendChangeMessage(
            channel: bytes[0] & 0x0F,
            value: (bytes[2] << 7) + bytes[1],
          );
        default:
          break;
      }
    } else {
      switch (status) {
        case MidiConstants.SYSTEM_EXCLUSIVE_START:
          if (bytes.last != MidiConstants.SYSTEM_EXCLUSIVE_END) {
            return MidiSysExMalformedMessage(data: bytes.sublist(1));
          } else {
            return MIDISysExMessage(data: bytes.sublist(1, bytes.length - 1));
          }
        case MidiConstants.TIME_CODE_QUARTER_FRAME:
          return MIDITimeCodeQuarterFrame(messageType: bytes[0] & 0x0F, value: bytes[1]);
        case MidiConstants.SONG_POSITION_POINTER:
          return MIDISongPositionPointer(value: (bytes[2] << 7) + bytes[1]);
        case MidiConstants.SONG_SELECT:
          return MIDISongSelect(songNumber: bytes[1]);
        case MidiConstants.TUNE_REQUEST:
          return const MIDITuneRequest();
        case MidiConstants.TIMING_CLOCK:
          return const MIDITimingClock();
        case MidiConstants.START:
          return const MIDIStart();
        case MidiConstants.CONTINUE:
          return const MIDIContinue();
        case MidiConstants.STOP:
          return const MIDIStop();
        case MidiConstants.ACTIVE_SENSING:
          return const MIDIActiveSensing();
        case MidiConstants.SYSTEM_RESET:
          return const MIDISystemReset();
        default:
          return MIDIUndefinedSystemCommonMessage(status: status);
      }
    }
    return MIDIUnrecognizedMessage(data: bytes);
  }
}

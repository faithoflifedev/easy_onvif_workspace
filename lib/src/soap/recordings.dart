import 'package:easy_onvif/recordings.dart';
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class RecordingsRequest {
  /// XML for the [createRecording]
  static XmlDocumentFragment createRecording(
      RecordingConfiguration recordingConfiguration) {
    Transport.builder.element('CreateRecording', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      recordingConfiguration.toXml();
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [createRecordingJob]
  static XmlDocumentFragment createRecordingJob(
      RecordingJobConfiguration recordingJobConfiguration) {
    Transport.builder.element('CreateRecordingJob', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      recordingJobConfiguration.toXml();
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [deleteRecording]
  static XmlDocumentFragment deleteRecording(String recordingToken) {
    Transport.builder.element('DeleteRecordingJob', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      Transport.builder.element('JobToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(recordingToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [deleteRecordingJob]
  static XmlDocumentFragment deleteRecordingJob(String jobToken) {
    Transport.builder.element('DeleteRecordingJob', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      Transport.builder.element('JobToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(jobToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getRecordingJobs]
  static XmlDocumentFragment getRecordingJobs() =>
      Transport.quickTag('GetRecordingJobs', Xmlns.trc);

  /// XML for the [getRecordingJobState]
  static XmlDocumentFragment getRecordingJobState(String jobToken) {
    Transport.builder.element('GetRecordingJobState', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      Transport.builder.element('JobToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(jobToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getRecordingOptions]
  static XmlDocumentFragment getRecordingOptions(String recordingToken) {
    Transport.builder.element('GetRecordingOptions', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      Transport.builder.element('RecordingToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(recordingToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getRecordings]
  static XmlDocumentFragment getRecordings() =>
      Transport.quickTag('GetRecordings', Xmlns.trc);

  /// XML for the [getServiceCapabilities]
  static XmlDocumentFragment getServiceCapabilities() =>
      Transport.quickTag('GetServiceCapabilities', Xmlns.trc);

  /// XML for the [setRecordingJobMode]
  static XmlDocumentFragment setRecordingJobMode({
    required String jobToken,
    required RecordingJobConfigurationMode mode,
  }) {
    Transport.builder.element('SetRecordingJobMode', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      Transport.builder.element('JobToken', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(jobToken);
      });

      Transport.builder.element('Mode', nest: () {
        Transport.builder.namespace(Xmlns.tt);

        Transport.builder.text(mode.value);
      });
    });

    return Transport.builder.buildFragment();
  }
}

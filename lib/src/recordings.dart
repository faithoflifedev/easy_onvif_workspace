import 'package:easy_onvif/recordings.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Recordings with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Recordings({required this.transport, required this.uri});

  /// CreateRecording shall create a new recording. The new recording shall be
  /// created with a track for each supported TrackType see Recording Control
  /// Spec.
  ///
  /// This method is optional. It shall be available if the
  /// Recording/DynamicRecordings capability is TRUE.
  ///
  /// When successfully completed, CreateRecording shall have created three
  /// tracks with the following configurations:
  /// - TrackToken TrackType
  /// - VIDEO001 Video
  /// - AUDIO001 Audio
  /// - META001 Metadata
  /// All TrackConfigurations shall have the MaximumRetentionTime set to 0
  /// (unlimited), and the Description set to the empty string.
  Future<String> createRecording(
      RecordingConfiguration recordingConfiguration) async {
    loggy.debug('createRecording');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.RecordingsRequest.createRecording(recordingConfiguration)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return CreateRecordingResponse.fromJson(envelope.body.response!).token;
  }

  /// CreateRecordingJob shall create a new recording job.
  ///
  /// The JobConfiguration returned from CreateRecordingJob shall be identical
  /// to the JobConfiguration passed into CreateRecordingJob, except for the
  /// ReceiverToken and the AutoCreateReceiver. In the returned structure, the
  /// ReceiverToken shall be present and valid and the AutoCreateReceiver
  /// field shall be omitted.
  Future<CreateRecordingJobResponse> createRecordingJob(
      RecordingJobConfiguration recordingJobConfiguration) async {
    loggy.debug('createRecording');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.RecordingsRequest.createRecordingJob(
            recordingJobConfiguration)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return CreateRecordingJobResponse.fromJson(envelope.body.response!);
  }

  /// DeleteRecording shall delete a recording object. Whenever a recording is
  /// deleted, the device shall delete all the tracks that are part of the
  /// recording, and it shall delete all the Recording Jobs that record into the
  /// recording. For each deleted recording job, the device shall also delete
  /// all the receiver objects associated with the recording job that are
  /// automatically created using the AutoCreateReceiver field of the recording
  /// job configuration structure and are not used in any other recording job.
  ///
  /// This method is optional. It shall be available if the
  /// Recording/DynamicRecordings capability is TRUE.
  Future<bool> deleteRecording(String recordingToken) async {
    loggy.debug('deleteRecording');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.RecordingsRequest.deleteRecording(recordingToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  /// DeleteRecordingJob removes a recording job. It shall also implicitly
  /// delete all the receiver objects associated with the recording job that are
  /// automatically created using the AutoCreateReceiver field of the recording
  /// job configuration structure and are not used in any other recording job.
  Future<bool> deleteRecordingJob(String jobToken) async {
    loggy.debug('deleteRecordingJob');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.RecordingsRequest.deleteRecording(jobToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }

  Future<RecordingOptions> getRecordingOptions(String recordingToken) async {
    loggy.debug('getRecordingOptions');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.RecordingsRequest.getRecordingOptions(recordingToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingOptionsResponse.fromJson(envelope.body.response!)
        .options;
  }

  /// GetRecordings shall return a description of all the recordings in the
  /// device. This description shall include a list of all the tracks for each
  /// recording.
  Future<List<GetRecordingsResponseItem>> getRecordings() async {
    loggy.debug('getRecordings');

    final envelope = await transport.sendRequest(
        uri, transport.securedEnvelope(soap.RecordingsRequest.getRecordings()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingsResponse.fromJson(envelope.body.response!)
        .recordingItems;
  }

  /// GetRecordingJobs shall return a list of all the recording jobs in the
  /// device.
  Future<List<GetRecordingJobsResponseItem>> getRecordingJobs() async {
    loggy.debug('getRecordingJobs');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.RecordingsRequest.getRecordingJobs()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingJobsResponse.fromJson(envelope.body.response!).jobItems;
  }

  /// GetRecordingJobState returns the state of a recording job. It includes an
  /// aggregated state, and state for each track of the recording job.
  Future<RecordingJobStateInformation> getRecordingJobState(
      String jobToken) async {
    loggy.debug('getRecordingJobState');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.RecordingsRequest.getRecordingJobState(jobToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingJobStateResponse.fromJson(envelope.body.response!).state;
  }

  /// Returns the capabilities of the recording service. The result is returned
  /// in a typed answer.
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final envelope = await transport.sendRequest(
        uri,
        transport
            .securedEnvelope(soap.RecordingsRequest.getServiceCapabilities()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(envelope.body.response!)
        .capabilities;
  }

  /// SetRecordingJobMode shall change the mode of the recording job. Using this
  /// method shall be equivalent to retrieving the recording job configuration,
  /// and writing it back with a different mode.
  Future<bool> setRecordingJobMode({
    required String jobToken,
    required RecordingJobConfigurationMode mode,
  }) async {
    loggy.debug('setRecordingJobMode');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.RecordingsRequest.setRecordingJobMode(
          jobToken: jobToken,
          mode: mode,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return true;
  }
}

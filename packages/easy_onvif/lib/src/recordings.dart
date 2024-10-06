import 'package:easy_onvif/recordings.dart';
import 'package:easy_onvif/shared.dart';
import 'package:easy_onvif/soap.dart' as soap;

import 'operation.dart';

typedef RecordingsRequest = soap.RecordingsRequest;

/// This standard provides a set of interfaces that enable the support of
/// interoperable network storage devices, such as network video recorders
/// (NVR), digital video recorders (DVR) and cameras with embedded storage.
///
/// Default Access Policy Definition
/// | | Administrator | Operator | User | Anonymous |
/// | PRE_AUTH | X | X | X | X |
/// | READ_SYSTEM | X | X | X | |
/// | READ_SYSTEM_SENSITIVE | X | X | | |
/// | READ_SYSTEM_SECRET | X | | | |
/// | WRITE_SYSTEM | X | | | |
/// | UNRECOVERABLE | X | | | |
/// | READ_MEDIA | X | X | X | |
/// | ACTUATE | X | X | | |
class Recordings extends Operation {
  Recordings({
    required super.transport,
    required super.uri,
  });

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
  ///
  /// ACCESS CLASS: ACTUATE
  Future<String> createRecording(
      RecordingConfiguration recordingConfiguration) async {
    loggy.debug('createRecording');

    final responseEnvelope = await transport.securedRequest(
        uri,
        soap.Body(
          request: RecordingsRequest.createRecording(recordingConfiguration),
        ));

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return CreateRecordingResponse.fromJson(responseEnvelope.body.response!)
        .token;
  }

  /// CreateRecordingJob shall create a new recording job.
  ///
  /// The JobConfiguration returned from CreateRecordingJob shall be identical
  /// to the JobConfiguration passed into CreateRecordingJob, except for the
  /// ReceiverToken and the AutoCreateReceiver. In the returned structure, the
  /// ReceiverToken shall be present and valid and the AutoCreateReceiver
  /// field shall be omitted.
  ///
  /// ACCESS CLASS: ACTUATE
  Future<CreateRecordingJobResponse> createRecordingJob(
      RecordingJobConfiguration recordingJobConfiguration) async {
    loggy.debug('createRecording');

    final responseEnvelope = await transport.securedRequest(
        uri,
        soap.Body(
          request:
              RecordingsRequest.createRecordingJob(recordingJobConfiguration),
        ));

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return CreateRecordingJobResponse.fromJson(responseEnvelope.body.response!);
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
  ///
  /// ACCESS CLASS: ACTUATE
  Future<bool> deleteRecording(String recordingToken) async {
    loggy.debug('deleteRecording');

    final responseEnvelope = await transport.securedRequest(
        uri,
        soap.Body(
          request: RecordingsRequest.deleteRecording(recordingToken),
        ));

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }

  /// DeleteRecordingJob removes a recording job. It shall also implicitly
  /// delete all the receiver objects associated with the recording job that are
  /// automatically created using the AutoCreateReceiver field of the recording
  /// job configuration structure and are not used in any other recording job.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<bool> deleteRecordingJob(String jobToken) async {
    loggy.debug('deleteRecordingJob');

    final responseEnvelope = await transport.securedRequest(
        uri,
        soap.Body(
          request: RecordingsRequest.deleteRecording(jobToken),
        ));

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }

  /// GetRecordingOptions returns information for a recording identified by the
  /// [recordingToken]. The information includes the number of additional tracks
  /// as well as recording jobs that can be configured.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<RecordingOptions> getRecordingOptions(String recordingToken) async {
    loggy.debug('getRecordingOptions');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: RecordingsRequest.getRecordingOptions(
            ReferenceToken(recordingToken)),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingOptionsResponse.fromJson(responseEnvelope.body.response!)
        .options;
  }

  /// GetRecordings shall return a description of all the recordings in the
  /// device. This description shall include a list of all the tracks for each
  /// recording.
  ///
  /// ACCESS CLASS: ACTUATE
  Future<List<GetRecordingsResponseItem>> getRecordings() async {
    loggy.debug('getRecordings');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: RecordingsRequest.getRecordings(),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingsResponse.fromJson(responseEnvelope.body.response!)
        .recordingItems;
  }

  /// GetRecordingJobs shall return a list of all the recording jobs in the
  /// device.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<List<GetRecordingJobsResponseItem>> getRecordingJobs() async {
    loggy.debug('getRecordingJobs');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: RecordingsRequest.getRecordingJobs(),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingJobsResponse.fromJson(responseEnvelope.body.response!)
        .jobItems;
  }

  /// GetRecordingJobState returns the state of a recording job. It includes an
  /// aggregated state, and state for each track of the recording job.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<RecordingJobStateInformation> getRecordingJobState(
      String jobToken) async {
    loggy.debug('getRecordingJobState');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: RecordingsRequest.getRecordingJobState(jobToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingJobStateResponse.fromJson(
            responseEnvelope.body.response!)
        .state;
  }

  /// Returns the capabilities of the recording service. The result is returned
  /// in a typed answer.
  ///
  /// ACCESS CLASS: PRE_AUTH
  Future<Capabilities> getServiceCapabilities() async {
    loggy.debug('getServiceCapabilities');

    final responseEnvelope = await transport.request(
      uri,
      soap.Body(
        request: RecordingsRequest.getServiceCapabilities(),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetServiceCapabilitiesResponse.fromJson(
            responseEnvelope.body.response!)
        .capabilities;
  }

  /// SetRecordingJobMode shall change the mode of the recording job. Using this
  /// method shall be equivalent to retrieving the recording job configuration,
  /// and writing it back with a different mode.
  ///
  /// ACCESS CLASS: ACTUATE
  Future<bool> setRecordingJobMode({
    required String jobToken,
    required RecordingJobConfigurationMode mode,
  }) async {
    loggy.debug('setRecordingJobMode');

    final responseEnvelope = await transport.request(
      uri,
      soap.Body(
        request: RecordingsRequest.setRecordingJobMode(
          jobToken: jobToken,
          mode: mode,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return true;
  }
}

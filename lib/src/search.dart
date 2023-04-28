import 'package:easy_onvif/search.dart';
import 'package:easy_onvif/soap.dart' as soap;
import 'package:loggy/loggy.dart';

class Search with UiLoggy {
  final soap.Transport transport;

  final Uri uri;

  Search({
    required this.transport,
    required this.uri,
  });

  Future<String> findRecordings({
    SearchScope? searchScope,
    int? maxMatches,
    required int keepAliveTime,
  }) async {
    loggy.debug('findRecordings');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.SearchRequest.findRecordings(
          searchScope: searchScope,
          maxMatches: maxMatches,
          keepAliveTime: keepAliveTime,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return FindRecordingsResponse.fromJson(envelope.body.response!).searchToken;
  }

  Future<List<FindRecordingResult>> getRecordingSearchResults(
    String searchToken, {
    int? minResults,
    int? maxResults,
    String? waitTime,
  }) async {
    loggy.debug('getRecordingSearchResults');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(soap.SearchRequest.getRecordingSearchResults(
          searchToken,
          minResults: minResults,
          maxResults: maxResults,
          waitTime: waitTime,
        )));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingSearchResultsResponse.fromJson(envelope.body.response!)
        .findRecordingResults;
  }

  /// Returns information about a single Recording specified by a
  /// RecordingToken. This operation is mandatory to support for a device
  /// implementing the recording search service.
  Future<RecordingInformation> getRecordingInformation(
      String recordingToken) async {
    loggy.debug('getRecordingInformation');

    final envelope = await transport.sendRequest(
        uri,
        transport.securedEnvelope(
            soap.SearchRequest.getRecordingInformation(recordingToken)));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingInformationResponse.fromJson(envelope.body.response!)
        .recordingInformation;
  }

  /// GetRecordingSummary is used to get a summary description of all recorded
  /// data. This operation is mandatory to support for a device implementing the
  /// recording search service.
  Future<RecordingSummary> getRecordingSummary() async {
    loggy.debug('getRecordingSummary');

    final envelope = await transport.sendRequest(uri,
        transport.securedEnvelope(soap.SearchRequest.getRecordingSummary()));

    if (envelope.body.hasFault) {
      throw Exception(envelope.body.fault.toString());
    }

    return GetRecordingSummaryResponse.fromJson(envelope.body.response!)
        .summary;
  }
}

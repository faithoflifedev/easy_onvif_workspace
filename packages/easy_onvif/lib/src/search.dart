import 'package:easy_onvif/search.dart';
import 'package:easy_onvif/soap.dart' as soap;

import 'operation.dart';

typedef SearchRequest = soap.SearchRequest;

/// Search is performed from a start point on the time line, towards an end
/// point. If the end point is prior to the start point, search will be
/// performed backwards. This can be useful if only the newest matching event is
/// of interest, or if it is otherwise convenient to get the results in newest
/// to oldest order.
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
class Search extends Operation {
  Search({required super.transport, required super.uri});

  /// FindRecordings starts a search session, looking for recordings that matches
  /// the scope (See 20.2.4) defined in the request. Results from the search are
  /// acquired using the GetRecordingSearchResults request, specifying the search
  /// token returned from this request. The device shall continue searching until
  /// one of the following occurs:
  /// - The entire time range from StartPoint to EndPoint has been searched
  /// through.
  /// - The total number of matches has been found, defined by the MaxMatches
  /// parameter.
  /// - The session has been ended by a client EndSession request.
  /// - The session has been ended because KeepAliveTime since the last request
  /// related to this session has expired.
  /// The order of the results is undefined, to allow the device to return results
  /// in any order they are found. This operation is mandatory to support for a
  /// device implementing the recording search service.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<String> findRecordings({
    SearchScope? searchScope,
    int? maxMatches,
    required int keepAliveTime,
  }) async {
    loggy.debug('findRecordings');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: SearchRequest.findRecordings(
          searchScope: searchScope,
          maxMatches: maxMatches,
          keepAliveTime: keepAliveTime,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return FindRecordingsResponse.fromJson(
      responseEnvelope.body.response!,
    ).searchToken;
  }

  /// GetRecordingSearchResults acquires the results from a recording search
  /// session previously initiated by a FindRecordings operation. The response
  /// shall not include results already returned in previous requests for the
  /// same session. If MaxResults is specified, the response shall not contain
  /// more than MaxResults results. The number of results relates to the number
  /// of recordings. For viewing individual recorded data for a signal track use
  /// the FindEvents method.
  ///
  /// GetRecordingSearchResults shall block until:
  /// - MaxResults results are available for the response if MaxResults is
  /// specified.
  /// - MinResults results are available for the response if MinResults is
  /// specified.
  /// - WaitTime has expired.
  /// - Search is completed or stopped.
  /// This operation is mandatory to support for a device implementing the
  /// recording search service.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<List<FindRecordingResult>> getRecordingSearchResults(
    String searchToken, {
    int? minResults,
    int? maxResults,
    String? waitTime,
  }) async {
    loggy.debug('getRecordingSearchResults');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(
        request: SearchRequest.getRecordingSearchResults(
          searchToken,
          minResults: minResults,
          maxResults: maxResults,
          waitTime: waitTime,
        ),
      ),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingSearchResultsResponse.fromJson(
      responseEnvelope.body.response!,
    ).findRecordingResults;
  }

  /// Returns information about a single Recording specified by a
  /// RecordingToken. This operation is mandatory to support for a device
  /// implementing the recording search service.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<RecordingInformation> getRecordingInformation(
    String recordingToken,
  ) async {
    loggy.debug('getRecordingInformation');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: SearchRequest.getRecordingInformation(recordingToken)),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingInformationResponse.fromJson(
      responseEnvelope.body.response!,
    ).recordingInformation;
  }

  /// GetRecordingSummary is used to get a summary description of all recorded
  /// data. This operation is mandatory to support for a device implementing the
  /// recording search service.
  ///
  /// ACCESS CLASS: READ_MEDIA
  Future<RecordingSummary> getRecordingSummary() async {
    loggy.debug('getRecordingSummary');

    final responseEnvelope = await transport.securedRequest(
      uri,
      soap.Body(request: SearchRequest.getRecordingSummary()),
    );

    if (responseEnvelope.body.hasFault) {
      throw Exception(responseEnvelope.body.fault.toString());
    }

    return GetRecordingSummaryResponse.fromJson(
      responseEnvelope.body.response!,
    ).summary;
  }
}

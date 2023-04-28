import 'package:easy_onvif/search.dart' show SearchScope;
import 'package:xml/xml.dart';

import 'transport.dart';
import 'xmlns.dart';

class SearchRequest {
  /// XML for the [findRecordings]
  static XmlDocumentFragment findRecordings({
    SearchScope? searchScope,
    int? maxMatches,
    required int keepAliveTime,
  }) {
    Transport.builder.element('FindRecordings', nest: () {
      Transport.builder.namespace(Xmlns.tse);

      if (searchScope != null) {
        Transport.builder.element('RecordingToken', nest: () {
          searchScope.toXml();
        });
      }

      if (maxMatches != null) {
        Transport.builder.element('MaxMatches', nest: () {
          Transport.builder.text(maxMatches);
        });
      }

      Transport.builder.element('KeepAliveTime', nest: () {
        Transport.builder.text(keepAliveTime);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getRecordingSummary]
  static XmlDocumentFragment getRecordingSummary() =>
      Transport.quickTag('GetRecordingSummary', Xmlns.tse);

  /// XML for the [getRecordingInformation]
  static XmlDocumentFragment getRecordingInformation(String recordingToken) {
    Transport.builder.element('GetRecordingInformation', nest: () {
      Transport.builder.namespace(Xmlns.tse);

      Transport.builder.element('RecordingToken', nest: () {
        Transport.builder.text(recordingToken);
      });
    });

    return Transport.builder.buildFragment();
  }

  /// XML for the [getRecordingSearchResults]
  static XmlDocumentFragment getRecordingSearchResults(
    String searchToken, {
    int? minResults,
    int? maxResults,
    String? waitTime,
  }) {
    Transport.builder.element('GetRecordingSearchResults', nest: () {
      Transport.builder.namespace(Xmlns.tse);

      Transport.builder.element('SearchToken', nest: () {
        Transport.builder.text(searchToken);
      });

      if (minResults != null) {
        Transport.builder.element('MinResults', nest: () {
          Transport.builder.text(minResults);
        });
      }

      if (maxResults != null) {
        Transport.builder.element('MaxResults', nest: () {
          Transport.builder.text(maxResults);
        });
      }

      if (waitTime != null) {
        Transport.builder.element('WaitTime', nest: () {
          Transport.builder.text(waitTime);
        });
      }
    });

    return Transport.builder.buildFragment();
  }
}

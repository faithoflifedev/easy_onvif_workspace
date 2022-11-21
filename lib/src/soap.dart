import 'package:dio/dio.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:xml/xml.dart';

class Xmlns {
  static final s = 'http://www.w3.org/2003/05/soap-envelope';
  static final ter = 'http://www.onvif.org/ver10/error';
  static final xsd = 'http://www.w3.org/2001/XMLSchema';
  static final tt = 'http://www.onvif.org/ver10/schema';
  static final tptz = 'http://www.onvif.org/ver20/ptz/wsdl';
  static final tds = 'http://www.onvif.org/ver10/device/wsdl';
  static final dn = 'http://www.onvif.org/ver10/network/wsdl';
  static final trt = 'http://www.onvif.org/ver10/media/wsdl';
}

///Utility class for interacting through the SOAP protocol
class Soap {
  static Dio? dio;

  static Dio get _http => dio != null
      ? dio!
      : throw Exception('dio needs to be configured and set');

  ///Send the SOAP [requestData] to the given [url] endpoint.
  static Future<String> send(Uri uri, String requestData) async {
    Response? response;

    try {
      response = await _http.post(uri.toString(),
          data: requestData,
          options: Options(headers: {
            Headers.contentTypeHeader: 'application/soap+xml; charset=utf-8',
            Headers.contentLengthHeader: requestData.length
          }));
    } on DioError catch (error) {
      if (error.response?.statusCode == 500 ||
          error.response?.statusCode == 400) {
        final jsonMap = OnvifUtil.xmlToMap(error.response?.data);

        final envelope = Envelope.fromJson(jsonMap);

        if (envelope.body.hasFault) {
          throw Exception('Error code: ${envelope.body.fault}');
        }
      }

      throw Exception(error);
    }

    return response.data;
  }

  ///Retrieve an onvif SOAP envelope
  static Future<Envelope> retrieveEnvelope(
    Uri uri,
    XmlDocument soapRequest,
    // {Function? postProcess}
  ) async {
    final soapResponse = await Soap.send(uri, soapRequest.toString());

    // final envelope = Envelope.fromXml(soapResponse);

    // if (postProcess != null) {
    //   postProcess(soapResponse, envelope);
    // }

    return Envelope.fromXml(soapResponse);
  }
}

///Helper methods for building the [SoapRequest]
class SoapRequest {
  static final builder = XmlBuilder();

  ///XML for the SOAP envelope
  static XmlDocument envelope(
      XmlDocumentFragment? header, XmlDocumentFragment body) {
    builder.declaration(encoding: 'UTF-8');

    builder.element('Envelope',
        namespace: Xmlns.s,
        namespaces: {Xmlns.s: 's', 'http://www.w3.org/2005/08/addressing': 'a'},
        nest: () {
      builder.element('Header', namespace: Xmlns.s, nest: header);

      builder.element('Body',
          namespace: Xmlns.s,
          namespaces: {
            'http://www.w3.org/2001/XMLSchema-instance': 'xsi',
            Xmlns.xsd: 'xsd'
          },
          nest: body);
    });

    return builder.buildDocument();
  }

  ///XML for the SOAP security header
  static XmlDocumentFragment header(XmlDocumentFragment security) => security;

  ///XML for the SOAP [security]
  static XmlDocumentFragment security(
      {required String username,
      required String password,
      required String nonce,
      required String created}) {
    builder.element('Security', namespaces: {Xmlns.s: 's'}, nest: () {
      builder.namespace(
          'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd');
      builder.attribute('mustUnderstand', 1, namespace: Xmlns.s);
      builder.element('UsernameToken', nest: () {
        builder.element('Username', nest: username);
        builder.element('Password',
            attributes: {
              'Type':
                  'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordDigest'
            },
            nest: password);
        builder.element('Nonce',
            attributes: {
              'EncodingType':
                  'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary'
            },
            nest: nonce);
        builder.element('Created', nest: () {
          builder.namespace(
              'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd');
          builder.text(created);
        });
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [systemDateAndTime]
  static XmlDocumentFragment systemDateAndTime() {
    builder.element('GetSystemDateAndTime', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  ///XML for the [capabilities]
  static XmlDocumentFragment capabilities(String category) {
    builder.element('GetCapabilities', nest: () {
      builder.namespace(Xmlns.tds);
      builder.element('Category', nest: () {
        builder.text(category);
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [services]
  static XmlDocumentFragment services([includeCapability = false]) {
    builder.element('GetServices', nest: () {
      builder.namespace(Xmlns.tds);

      builder.element('IncludeCapability', nest: () {
        builder.text(includeCapability ? 'true' : false);
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [videoSources]
  static XmlDocumentFragment videoSources() {
    builder.element('GetVideoSources', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  ///XML for the [videoSources]
  static XmlDocumentFragment metadataConfigurations() {
    builder.element('GetMetadataConfigurations', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  ///XML for the [profiles]
  static XmlDocumentFragment profiles() {
    builder.element('GetProfiles', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  ///XML for the [presets], requires a [profileToken]
  static XmlDocumentFragment presets(String profileToken) {
    builder.element('GetPresets', nest: () {
      builder.namespace(Xmlns.tds);
      builder.element('ProfileToken', nest: () {
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [deviceInformation]
  static XmlDocumentFragment deviceInformation() {
    builder.element('GetDeviceInformation', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  ///XML for the [endpointReference]
  static XmlDocumentFragment endpointReference() {
    builder.element('GetEndpointReference', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  ///XML for the [status], requires a [profileToken]
  static XmlDocumentFragment status(String profileToken) {
    builder.element('GetStatus', nest: () {
      builder.namespace(Xmlns.tptz);
      builder.element('ProfileToken', nest: () {
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [streamUri], requires a [profileToken]
  static XmlDocumentFragment streamUri(String profileToken,
      {String streamType = 'RTP-Unicast', String transportProtocol = 'RTSP'}) {
    builder.element('GetStreamUri', nest: () {
      builder.namespace(Xmlns.trt);
      builder.element('StreamSetup', nest: () {
        builder.element('Stream', nest: () {
          builder.namespace(Xmlns.tt);
          builder.text(streamType);
        });
        builder.element('Transport', nest: () {
          builder.namespace(Xmlns.tt);
          builder.element('Protocol', nest: () {
            builder.text(transportProtocol);
          });
        });
      });
      builder.element('ProfileToken', nest: () {
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  ///XML for the [snapshotUri], requires a [profileToken]
  static XmlDocumentFragment snapshotUri(String profileToken) {
    builder.element('GetSnapshotUri', nest: () {
      builder.namespace(Xmlns.trt);
      builder.element('ProfileToken', nest: () {
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  /// XML for the [serviceCapabilities]
  static XmlDocumentFragment serviceCapabilities() {
    builder.element('GetServiceCapabilities', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  /// XML for the [gotoHomePosition], requires a [profileToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoHomePosition(
      String profileToken, PtzSpeed? speed) {
    builder.element('GotoHomePosition', nest: () {
      builder.namespace(Xmlns.tds);
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });

      if (speed != null) {
        builder.element('PanTilt', nest: () {
          builder.namespace(Xmlns.tt);
          builder.attribute('x', speed.panTilt!.x);
          builder.attribute('y', speed.panTilt!.x);
        });

        if (speed.zoom != null) {
          builder.element('Zoom', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', speed.zoom!.x);
          });
        }
      }
    });

    return builder.buildFragment();
  }

  /// XML for the [gotoPreset], requires a [profileToken], [presetToken] and optionally [PtzSpeed]
  static XmlDocumentFragment gotoPreset(
      String profileToken, String presetToken, PtzSpeed? speed) {
    builder.element('GotoPreset', nest: () {
      builder.namespace(Xmlns.tds);
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });
      builder.element('PresetToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(presetToken);
      });
      builder.element('Speed', nest: () {
        if (speed != null) {
          builder.element('PanTilt', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', speed.panTilt!.x);
            builder.attribute('y', speed.panTilt!.x);
          });
        }
        if (speed?.zoom != null) {
          builder.element('Zoom', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', speed!.zoom!.x);
          });
        }
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment networkProtocols() {
    builder.element('GetNetworkProtocols', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment createUsers(List<User> users) {
    builder.element('CreateUsers', nest: () {
      builder.namespace(Xmlns.tds);

      for (var user in users) {
        builder.element('User', nest: () {
          builder.namespace(Xmlns.tds);
          builder.element('Username', nest: () {
            builder.namespace(Xmlns.tt);
            builder.text(user.username);
          });

          if (user.password != null) {
            builder.element('Password', nest: () {
              builder.namespace(Xmlns.tt);
              builder.text(user.password!);
            });
          }

          builder.element('UserLevel', nest: () {
            builder.namespace(Xmlns.tt);
            builder.text(user.userLevel);
          });
        });
      }
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment deleteUsers(List<String> userNames) {
    builder.element('DeleteUsers', nest: () {
      builder.namespace(Xmlns.tds);

      for (var userName in userNames) {
        builder.element('Username', nest: userName);
      }
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment hostname() {
    builder.element('GetHostname', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment ntp() {
    builder.element('GetNTP', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment systemUris() {
    builder.element('GetSystemUris', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment users() {
    builder.element('GetUsers', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment absoluteMove(
      String profileToken, PtzPosition place, PtzPosition? speed) {
    builder.element('AbsoluteMove', nest: () {
      builder.namespace(Xmlns.tptz); //tptz
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });
      builder.element('Position', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.element('PanTilt', nest: () {
          builder.namespace(Xmlns.tt);
          builder.attribute('x', place.panTilt!.x);
          builder.attribute('y', place.panTilt!.y);
        });
        if (place.zoom != null) {
          builder.element('Zoom', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', place.zoom!.x);
          });
        }
      });
      if (speed != null) {
        builder.element('Speed', nest: () {
          builder.namespace(Xmlns.tptz);
          if (speed.panTilt != null) {
            builder.element('PanTilt', nest: () {
              builder.namespace(Xmlns.tt);
              builder.attribute('x', speed.panTilt!.x);
              builder.attribute('y', speed.panTilt!.y);
            });
          }
          if (speed.zoom != null) {
            builder.element('Zoom', nest: () {
              builder.namespace(Xmlns.tt);
              builder.attribute('x', speed.zoom!.x);
            });
          }
        });
      }
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment relativeMove(
      String profileToken, PtzPosition move) {
    builder.element('RelativeMove', nest: () {
      builder.namespace(Xmlns.tptz); //tptz
      builder.element('ProfileToken', nest: () => builder.text(profileToken));
      builder.element('Translation', nest: () {
        if (move.panTilt != null) {
          builder.element('PanTilt', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', move.panTilt!.x);
            builder.attribute('y', move.panTilt!.y);
          });
        }

        if (move.zoom != null) {
          builder.element('Zoom', nest: () {
            builder.namespace(Xmlns.tt);
            builder.attribute('x', move.zoom!.x);
          });
        }
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment removePreset(String profileToken, Preset preset) {
    builder.element('RemovePreset', nest: () {
      builder.namespace(Xmlns.tptz);
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });
      builder.element('PresetToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(preset.token);
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment setPreset(String profileToken,
      [String? name, String? token]) {
    builder.element('SetPreset', nest: () {
      builder.namespace(Xmlns.tptz);
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });

      if (name != null) {
        builder.element('PresetName', nest: () {
          builder.namespace(Xmlns.tptz);
          builder.text(name);
        });
      }

      if (token != null) {
        builder.element('PresetToken', nest: () {
          builder.namespace(Xmlns.tptz);
          builder.text(token);
        });
      }
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment stop(String profileToken,
      {bool panTilt = false, bool zoom = false}) {
    builder.element('Stop', nest: () {
      builder.namespace(Xmlns.tptz); //tptz
      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });

      builder.element('PanTilt', nest: () {
        builder.namespace(Xmlns.tt);
        builder.text('$panTilt');
      });

      builder.element('Zoom', nest: () {
        builder.namespace(Xmlns.tt);
        builder.text('$zoom');
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment continuousMove(
      String profileToken, PtzPosition velocity, int? timeout) {
    builder.element('ContinuousMove', nest: () {
      builder.namespace(Xmlns.tptz); //tptz

      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });

      builder.element('Velocity', nest: () {
        builder.namespace(Xmlns.tptz);

        builder.element('PanTilt', nest: () {
          builder.namespace(Xmlns.tt);
          builder.attribute('x', velocity.panTilt!.x);
          builder.attribute('y', velocity.panTilt!.y);
        });

        builder.element('Zoom', nest: () {
          builder.namespace(Xmlns.tt);

          builder.attribute('x', velocity.zoom != null ? velocity.zoom!.x : 0);
        });
      });

      builder.element('Timeout', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text('PT${timeout}S');
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment getCompatibleConfigurations(String profileToken) {
    builder.element('GetCompatibleConfigurations', nest: () {
      builder.namespace(Xmlns.tptz);

      builder.element('ProfileToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment getPtzConfigurations() {
    builder.element('GetConfigurations', nest: () {
      builder.namespace(Xmlns.tptz);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment getPtzConfiguration(String profileToken) {
    builder.element('GetConfiguration', nest: () {
      builder.namespace(Xmlns.tptz);

      builder.element('PTZConfigurationToken', nest: () {
        builder.namespace(Xmlns.tptz);
        builder.text(profileToken);
      });
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment audioSources() {
    builder.element('GetAudioSources', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment discoveryMode() {
    builder.element('GetDiscoveryMode', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment dns() {
    builder.element('GetDNS', nest: () {
      builder.namespace(Xmlns.tds);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment startMulticastStreaming() {
    builder.element('StartMulticastStreaming', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  static XmlDocumentFragment stopMulticastStreaming() {
    builder.element('StopMulticastStreaming', nest: () {
      builder.namespace(Xmlns.trt);
    });

    return builder.buildFragment();
  }

  static XmlDocument probe(String messageId) {
    builder.declaration(encoding: 'UTF-8');

    builder.element('Envelope',
        namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
      builder.namespace('http://www.w3.org/2003/05/soap-envelope', 's');
      builder.namespace(
          'http://schemas.xmlsoap.org/ws/2004/08/addressing', 'a');
      builder.namespace('http://schemas.xmlsoap.org/ws/2005/04/discovery', 'd');

      builder.element('Header',
          namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
        builder.element('MessageID',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: 'uuid:$messageId');
        builder.element('To',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.attribute('mustUnderstand', 'true',
              namespace: 'http://www.w3.org/2003/05/soap-envelope');
          builder.text('urn:schemas-xmlsoap-org:ws:2005:04:discovery');
        });
        builder.element('ReplyTo',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.element('Address',
              namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
              nest: () {
            builder.text(
                'http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous');
          });
        });
        builder.element('Action',
            namespace: 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
            nest: () {
          builder.attribute('mustUnderstand', 'true',
              namespace: 'http://www.w3.org/2003/05/soap-envelope');
          builder.text('http://schemas.xmlsoap.org/ws/2005/04/discovery/Probe');
        });
      });

      builder.element('Body',
          namespace: 'http://www.w3.org/2003/05/soap-envelope', nest: () {
        builder.element('Probe',
            namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
            nest: () {
          builder.element('Types',
              namespace: 'http://schemas.xmlsoap.org/ws/2005/04/discovery',
              nest: () {
            builder.namespace(Xmlns.dn, 'dn');
            builder.namespace(Xmlns.tds, 'tds');

            builder.text('dn:NetworkVideoTransmitter  tds:Device');
          });
        });
      });
    });

    return builder.buildDocument();
  }
}

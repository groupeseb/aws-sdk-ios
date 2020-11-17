//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTDataResources.h"
#import "AWSCocoaLumberjack.h"

@interface AWSIoTDataResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTDataResources

+ (instancetype)sharedInstance {
    static AWSIoTDataResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTDataResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-05-28\",\
    \"endpointPrefix\":\"data.iot\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS IoT Data Plane\",\
    \"serviceId\":\"IoT Data Plane\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"iotdata\",\
    \"uid\":\"iot-data-2015-05-28\"\
  },\
  \"operations\":{\
    \"DeleteThingShadow\":{\
      \"name\":\"DeleteThingShadow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"DeleteThingShadowRequest\"},\
      \"output\":{\"shape\":\"DeleteThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html\\\">DeleteThingShadow</a> in the AWS IoT Developer Guide.</p>\"\
    },\
    \"GetThingShadow\":{\
      \"name\":\"GetThingShadow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"GetThingShadowRequest\"},\
      \"output\":{\"shape\":\"GetThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Gets the shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html\\\">GetThingShadow</a> in the AWS IoT Developer Guide.</p>\"\
    },\
    \"ListNamedShadowsForThing\":{\
      \"name\":\"ListNamedShadowsForThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/api/things/shadow/ListNamedShadowsForThing/{thingName}\"\
      },\
      \"input\":{\"shape\":\"ListNamedShadowsForThingRequest\"},\
      \"output\":{\"shape\":\"ListNamedShadowsForThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"}\
      ],\
      \"documentation\":\"<p>Lists the shadows for the specified thing.</p>\"\
    },\
    \"Publish\":{\
      \"name\":\"Publish\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/topics/{topic}\"\
      },\
      \"input\":{\"shape\":\"PublishRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"MethodNotAllowedException\"}\
      ],\
      \"documentation\":\"<p>Publishes state information.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http\\\">HTTP Protocol</a> in the AWS IoT Developer Guide.</p>\"\
    },\
    \"UpdateThingShadow\":{\
      \"name\":\"UpdateThingShadow\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"UpdateThingShadowRequest\"},\
      \"output\":{\"shape\":\"UpdateThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"RequestEntityTooLargeException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Updates the shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html\\\">UpdateThingShadow</a> in the AWS IoT Developer Guide.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified version does not match the version of the document.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"DeleteThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThingShadow operation.</p>\"\
    },\
    \"DeleteThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"payload\"],\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DeleteThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"GetThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetThingShadow operation.</p>\"\
    },\
    \"GetThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"JsonDocument\":{\"type\":\"blob\"},\
    \"ListNamedShadowsForThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        }\
      }\
    },\
    \"ListNamedShadowsForThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"results\":{\
          \"shape\":\"NamedShadowList\",\
          \"documentation\":\"<p>The list of shadows for the specified thing.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no additional results.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The Epoch date and time the response was generated by AWS IoT.</p>\"\
        }\
      }\
    },\
    \"MethodNotAllowedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":405},\
      \"exception\":true\
    },\
    \"NamedShadowList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ShadowName\"}\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Payload\":{\"type\":\"blob\"},\
    \"PublishRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"topic\"],\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The name of the MQTT topic.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"topic\"\
        },\
        \"qos\":{\
          \"shape\":\"Qos\",\
          \"documentation\":\"<p>The Quality of Service (QoS) level.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"qos\"\
        },\
        \"payload\":{\
          \"shape\":\"Payload\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the Publish operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"Qos\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"RequestEntityTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The payload exceeds the maximum size allowed.</p>\",\
      \"error\":{\"httpStatusCode\":413},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"ShadowName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The rate exceeds the limit.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"long\"},\
    \"Topic\":{\"type\":\"string\"},\
    \"UnauthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UnsupportedDocumentEncodingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The document encoding is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UpdateThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"payload\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        },\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"UpdateThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the UpdateThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"errorMessage\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>AWS IoT</fullname> <p>AWS IoT-Data enables secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. It implements a broker for applications and things to publish messages over HTTP (Publish) and retrieve, update, and delete shadows. A shadow is a persistent representation of your things and their state in the AWS cloud.</p> <p>Find the endpoint address for actions in the AWS IoT data plane by running this CLI command:</p> <p> <code>aws iot describe-endpoint --endpoint-type iot:Data-ATS</code> </p> <p>The service name used by <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">AWS Signature Version 4</a> to sign requests is: <i>iotdevicegateway</i>.</p>\"\
}\
";
}

@end

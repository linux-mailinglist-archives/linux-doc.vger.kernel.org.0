Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A3579D113
	for <lists+linux-doc@lfdr.de>; Tue, 12 Sep 2023 14:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbjILM3Y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Sep 2023 08:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbjILM3E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 08:29:04 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47BB10DD;
        Tue, 12 Sep 2023 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694521737; x=1726057737;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4CN7m+JjcYcgmKiwUHc/hTOAl+98qGot7DMSFFqYPYE=;
  b=R7Xu1w+kmdPTf2VX91pdvjTIiktPZAL3x943K3qofKqJSok6lOt8+Zqe
   A9whdVeMOXGdqePfwQ0U5Zi5d9ffutef+DqH7yHPOYQ/4gvuZy2wDC+ZQ
   cnTncluYAlVQq0j7laadYQK9HiCDy/Mkul6JRbYfY05sg1NnCDnXJ9sDB
   cFRCN8NTNw5PIPmeKBCrTFUuqiCxEKfURqoqbrQDq4GPzDNDDfi1FlfMx
   iFGmZTg8PL3dAZo61aZgTuWRguKzgNvaciRrI8GbbJUWUF2rmC7iUsllX
   Dq0YVPJNoQHdfT0y2UQ1QDPDyMxFd4pCqXjPMp3z1MIsbcmXpzCYIhm2Q
   w==;
X-CSE-ConnectionGUID: /6YbR9LkT2msUIZIPgV1FA==
X-CSE-MsgGUID: ZeJ4odsZQQ+M+09YfEwpsQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="4080836"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2023 05:28:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 12 Sep 2023 05:28:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 12 Sep 2023 05:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYr+0uIEDAcKwzUGggZi78oM5yR6vQ46BQGNvndU8McH3OGpoZYKr/YHLtYtbDb4FUkaN9nrCSmfpQUmbbzPv9+RNNErljmGxxU8Ej5JaoA4wNMfg4/6hDKnv3rV8F26ocPxIrLFNj3T3K3A8JbBC1t/e1F4gZ/Tx2OZAgn57jEI9txLLpi/0tvwxCkjfRDx3ZKKn+yoXQQ0Yhe+LyMiEDx/VjTXMUnAz8mtqGqrNbkjgN/GpUglSQxxHx9VdRzl4+a9Y3ccvb2jjvmcz/KDyX4RVcVnRYdR9rDZvK+q7JvlqQ2lSWXvKIHz8IDGY746hBROnd9m2VrDscHd91VOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CN7m+JjcYcgmKiwUHc/hTOAl+98qGot7DMSFFqYPYE=;
 b=YV1n89B/mXTRS6O6NTTyW5gddD/nyvL4flxsqk/5PP24LfqfhA5unU655wIlSpPo95jvQjgcMpvMYXZW7OxoQLbIXR602IKF7eyEWj4ieHB+lM0dBFqCDHIDuyylRcRtYLawsFNwo/Z2bhl1P/e/b8MwkI4qs/xBhSSUI9M53OBPwn4GJBju1OVRYZL7eycpV0BqYTeRTK8DTXb3aKpLTHlLDvlThoirDTKeBnCpCvjsxK8R83ynFRd/6fXIIwbiLs+gpi1DSfiEU8Lgs/bAejOajcvSFmjQvtP2BQYZjqnhyyXmwGmjX5po6rmrDC7NGBDfHopc7+5wkCy4xgSNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CN7m+JjcYcgmKiwUHc/hTOAl+98qGot7DMSFFqYPYE=;
 b=urRvMQQwQFCAK9TgmAJH1LVwlAkw7pOWA4gMiSRaypNknsNSkJ5/KG5g0W6KTdOsZRtqlKCzKKQ/8l8b5oqEzxnK4ccPyCjfaQoVUWTG6V8+afa+/3J8z6irdHomEjEMGfv/GepqVrXfTG/ILmpCcR+P8Cg6shdcAm3rc614v4k=
Received: from DM6PR11MB3532.namprd11.prod.outlook.com (2603:10b6:5:70::25) by
 SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Tue, 12 Sep 2023 12:28:53 +0000
Received: from DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9]) by DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9%3]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 12:28:53 +0000
From:   <Parthiban.Veerasooran@microchip.com>
To:     <william.xuanziyang@huawei.com>
CC:     <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <Horatiu.Vultur@microchip.com>, <Woojung.Huh@microchip.com>,
        <Nicolas.Ferre@microchip.com>, <UNGLinuxDriver@microchip.com>,
        <Thorsten.Kummermehr@microchip.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <corbet@lwn.net>,
        <Steen.Hegelund@microchip.com>, <rdunlap@infradead.org>,
        <horms@kernel.org>, <casper.casan@gmail.com>, <andrew@lunn.ch>
Subject: Re: [RFC PATCH net-next 2/6] net: ethernet: add mac-phy interrupt
 support with reset complete handling
Thread-Topic: [RFC PATCH net-next 2/6] net: ethernet: add mac-phy interrupt
 support with reset complete handling
Thread-Index: AQHZ4mEM4q/YL0tg8UaR0849XBWWbrAVmKgAgAGL7AA=
Date:   Tue, 12 Sep 2023 12:28:53 +0000
Message-ID: <bc5ac28d-a514-dd8a-31ee-25dfa4536a38@microchip.com>
References: <20230908142919.14849-1-Parthiban.Veerasooran@microchip.com>
 <20230908142919.14849-3-Parthiban.Veerasooran@microchip.com>
 <5f434392-0e87-ecbc-9c9a-ad08a809206a@huawei.com>
In-Reply-To: <5f434392-0e87-ecbc-9c9a-ad08a809206a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3532:EE_|SJ2PR11MB7501:EE_
x-ms-office365-filtering-correlation-id: 6eafb485-cb77-46c7-f04c-08dbb38bd374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eN1ZwyFQhyQ0N4r7V1MmvtNYO5/eMQrqLf4wmQiBxyVVJh2fywDGd7FEyyXpsczVpZaTu21KB/HDju4dyBPMWZdqgkGlnUoc7cG2aNmL80XsXcpWbNB6eQz69uZtfGUJ2HkRT49ajnS7exprjSBMHhR+qL9Tqhgp3Xzdra/DQvJ/jQDsUkGSG4hS9YCUONdaQgxDKhGaZ0B34wNM0O4F3U7dS5U6ymukaLd2jh2keXcGQCBjxc5VGUN+RsikUUNM4aaJ9sLFfbXsxHCu1Jo9brIHMCcx3yn8AQ3ppsbMHADWfkDJ3DTvSwjRjFIOP1nc2qsFAWuC9kPZzmIm2z4Pe9TAHuvIU4NipXCfFQn6zrqdg4RE5Rb7mYes8K7i6w0qhldPBXzQRErnBawBh11KXXGlR748isAjcaWpUSBoJtRP9xQ/YbKzuT3RjexLuC7nOUdPZgdYJHgqGrCsUAC0KamU78EbohO8IAkneyq+EaRP7n7FbituVzwWA5kwH/9e9rh3RNh3oNcx4wN+mwCz5mvvJu4/QKI1k4LjRZjreozsiv6dIj0v3gTqT+MAGesrB1LhEcZLh1HpaVBMx0pEIw+f1z1YG6XyFJ1YBWQSudGucjl9tHGtdi/sX/ru1V/aEl4ZmzncaPMyioY5v99Fc4EDBH8oVCXrImwu/4qly8+Dy36RJ8LLsAqQ05aB72yK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199024)(1800799009)(186009)(6916009)(316002)(31696002)(53546011)(66946007)(64756008)(76116006)(91956017)(66556008)(66476007)(54906003)(71200400001)(66446008)(8676002)(8936002)(4326008)(6512007)(26005)(41300700001)(6486002)(31686004)(478600001)(6506007)(86362001)(2616005)(36756003)(38100700002)(5660300002)(38070700005)(7416002)(2906002)(122000001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEdaVnBoWTFzbnlJZTh2NTgvQXR4ekh6VDdmMmVDRGh3S3B6RWF2dWd2bmFz?=
 =?utf-8?B?ZzByWHhjR1VYcXBPem9sMUcrNzNYU2xTYmNLQjlTbkdNem9TZnI0QTVFb1lM?=
 =?utf-8?B?ZXducnB2c3VSSC9nRkVBQnkwMFQxRkNoTEZsK2ZIRHNSZ1RDYXhzSFc5dzhj?=
 =?utf-8?B?OHllNGpoSUFVR3dMNnl3eGRGZzhmSCtydmgwYUsvcHk4RjZlMXhReEdhZi8y?=
 =?utf-8?B?MzE3czRvMjlvWS9qWnBFQ1MyOWVET1RGQ3dVckFGdy9QT2t5akJ5UGlmK2Iv?=
 =?utf-8?B?UlRLdHMrbGhqSi9FcTNPcnpvbytydHUvZUtNWlk5am94RWZZUkNyeVdiWVQy?=
 =?utf-8?B?RVJyTnhTcTVTQmpWMlo3NWtEU04wY0FVb2NVUU1rUHZLK2E4WWNyU0hnNDlE?=
 =?utf-8?B?NmVSdVk1ZDA0N25BalFiMmFNd0wzcXpzV2NqdzFDTzBRZ1FSSUN1R2gzOHRI?=
 =?utf-8?B?RFlPZUlpRFJpMURFOCtMRlV5TUR1VHVKcHJ2MnFtMFNJSHJFaklYeWZMUDg0?=
 =?utf-8?B?UnJGTER4T1p2Tzh1WXBqUEJ3bEZCUk5JakdwUWordlFVcjkrN05GNHRNL2dX?=
 =?utf-8?B?Ky82VU9GZDZMdnAwbG9JOVkrcXQ4Q0hjeHVZVEhDaElSb2NINDB3SXA4STl0?=
 =?utf-8?B?YVI3T0Rndnl6dUJKcm81ZFRGWFdXb0ZGN0drOEdkRWg4Tk9ZWDlWeENSeHJO?=
 =?utf-8?B?TmRoOG80RDE3MTZTZER2cC85YmxLYm1acUtwbjVqNW1kSmVhZTdSWU9aTmt4?=
 =?utf-8?B?Sytnenh5eUREd1RWN1JOa1JXY21BbUQvbk82S1RlWHRUQjViVk8wcGxVbVF4?=
 =?utf-8?B?Q0xzeTMxZlJ6WlRQNXhKZTVXcjBtVHg1WExYYTlqdUd4ZVYwVVE2WkIvYklv?=
 =?utf-8?B?Rit1RUU0eEdzcFJsUnptYnVkSXpJQldmaVhQcUZwbktPZFBQSWYzTzhRZkxJ?=
 =?utf-8?B?aGJ6L1B5czRIS2VtR0hJQ1Z4bFlkUVFqdkJkVTM2eDFud3R2NVpONmt0VzlC?=
 =?utf-8?B?MXNTbmJZR1ptRkpsbkhNc29zZVJMRXlHMTZOdFZUODZMUi93NFg1R1FCWUJR?=
 =?utf-8?B?KzlHNDdJbXJHRFMyY2ZQWDhTNytTcTRQRHhPMVRXcDhqWWhWMzJBRTd3TGxJ?=
 =?utf-8?B?THc1RHFCdDRGWjQrUGlveGI4dHpyM2VRVk1adTM4WnVSTldnN2hDSjEwZllt?=
 =?utf-8?B?SWtOTmR3NG1idmhxOXYyblZ6SW9LMDNWRkQ5alFvOVhac2lFTldabisrM081?=
 =?utf-8?B?QnVBd0FEVXJITXMzYy9hZytsOHM0RWxGZVpta3V3T0JWd2RwdU01c2ZxVXZ2?=
 =?utf-8?B?VTF0cVFkOXM1dXZsSFhZdEs5OFJMRHE3bnBBUExrVjJISkdPTUNqWlN5VGFM?=
 =?utf-8?B?UzNiaUFxVlpOSEVNOHd1MzVVdWZVZnRoZHh2ZFlHbkRQT25YdjlESnR5L3pJ?=
 =?utf-8?B?clpRVm1NVUNZU3VjS0ZPQVAyYUdUemtPUzRUYzhIL1RDcFo3QXlaSkFSTDc2?=
 =?utf-8?B?dWFNS2tlWk5heDlIT3NMYlFmdmtOVU80SHZSa3V1ajJBYW1jeUNlbEN6TFJl?=
 =?utf-8?B?aGRScnNLT2UrMlEzQTR5Y0o4WG8xaGMvM3Z6ZU94UVdEeGE0b2h0cXpCaE5X?=
 =?utf-8?B?RnRKN2JhdVpCK1MybEc0NTRlSTFYY0hmNEVpeGpDcFFCVDFjVE1zOHB1Z1Jx?=
 =?utf-8?B?Rkt2THNNQUJYQnBpdGlwOUVzTG5YQUcwVGtjTDBpelB4OEZrTnBNbncwdVB3?=
 =?utf-8?B?cGV3dGpnT291eFN6QUh1Q0k4L1paZ2dKeUhvS2VPMkN1Rkg5SVlOc3NySGUv?=
 =?utf-8?B?YjhKaWlOb0JEOXhsWXdGdjBYSGhuQkFZL3ovVlZKczZuODR4ci8zOXhHTkVN?=
 =?utf-8?B?VVV1VSs1YUlZM2dnY091eVdjNVA3dWRZcGtMVldJWGVWRUxYNVFtQmhtbFAv?=
 =?utf-8?B?d2g1ZG1CbmV6dHhYTXBKUDdDQjdKSnhoYWhCc3RhZ0ZTZnkxcHZEQnJnbGZP?=
 =?utf-8?B?REhIL2dJa3A0THREQ29sdk5HdGN2c09aQnhMK05aVGVxTEp4K3pCVGtoTDVR?=
 =?utf-8?B?cWN6LzJoU3grVGxXQkFLY2h6TW9ablVvSW8wbnIyOW50RDJSVHRiNFNIRVJ1?=
 =?utf-8?B?amI2VzYxS0FmWmdua2JwcVEzdGlWNGo4NUlKODlPL25xWFNCa3ZTL05hZGhi?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A904E1AABF3D044699CC282C3AEA4509@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eafb485-cb77-46c7-f04c-08dbb38bd374
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 12:28:53.2484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOFj00csMonXeUw/Q4ShCuUQu26JcMF8BtyghqyMK7F80JmPXlzaCLeXOwOtNazCW08PyuvpzNqc+UqDz3sWLDSAnGzErBslCGq6BKmdtQcBcgNibd3KZaLL7k0jVtKk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgWml5YW5nLA0KDQpPbiAxMS8wOS8yMyA2OjIxIHBtLCBaaXlhbmcgWHVhbiAoV2lsbGlhbSkg
d3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4+IFJlZ2lz
dGVyIE1BQy1QSFkgaW50ZXJydXB0IGFuZCBoYW5kbGUgcmVzZXQgY29tcGxldGUgaW50ZXJydXB0
LiBSZXNldA0KPj4gY29tcGxldGUgYml0IGlzIHNldCB3aGVuIHRoZSBNQUMtUEhZIHJlc2V0IGNv
bXBsZXRlIGFuZCByZWFkeSBmb3INCj4+IGNvbmZpZ3VyYXRpb24uIFdoZW4gaXQgaXMgc2V0LCBp
dCB3aWxsIGdlbmVyYXRlIGEgbm9uLW1hc2thYmxlIGludGVycnVwdA0KPj4gdG8gYWxlcnQgdGhl
IFNQSSBob3N0LiBBZGRpdGlvbmFsbHkgcmVzZXQgY29tcGxldGUgYml0IGluIHRoZSBTVFMwDQo+
PiByZWdpc3RlciBoYXMgdG8gYmUgd3JpdHRlbiBieSBvbmUgdXBvbiByZXNldCBjb21wbGV0ZSB0
byBjbGVhciB0aGUNCj4+IGludGVycnVwdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXJ0aGli
YW4gVmVlcmFzb29yYW4gPFBhcnRoaWJhbi5WZWVyYXNvb3JhbkBtaWNyb2NoaXAuY29tPg0KPj4g
LS0tDQo+PiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L29hX3RjNi5jIHwgMTQxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0NCj4+ICAgaW5jbHVkZS9saW51eC9vYV90YzYuaCAgICAg
ICAgfCAgMTYgKysrLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9v
YV90YzYuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L29hX3RjNi5jDQo+PiBpbmRleCA2MTNjZjAz
NDQzMGEuLjAwMTlmNzAzNDViNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L29hX3RjNi5jDQo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9vYV90YzYuYw0KPj4gQEAg
LTYsNiArNiw3IEBADQo+PiAgICAqLw0KPj4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxk
Lmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPj4gICAjaW5jbHVkZSA8bGlu
dXgvb2FfdGM2Lmg+DQo+Pg0KPj4gICBzdGF0aWMgaW50IG9hX3RjNl9zcGlfdHJhbnNmZXIoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSwgdTggKnB0eCwgdTggKnByeCwNCj4+IEBAIC0xNjAsMTAgKzE2
MSwxNiBAQCBpbnQgb2FfdGM2X3BlcmZvcm1fY3RybChzdHJ1Y3Qgb2FfdGM2ICp0YzYsIHUzMiBh
ZGRyLCB1MzIgdmFsW10sIHU4IGxlbiwNCj4+ICAgICAgICBpZiAocmV0KQ0KPj4gICAgICAgICAg
ICAgICAgZ290byBlcnJfY3RybDsNCj4+DQo+PiAtICAgICAvKiBDaGVjayBlY2hvZWQvcmVjZWl2
ZWQgY29udHJvbCByZXBseSAqLw0KPj4gLSAgICAgcmV0ID0gb2FfdGM2X2NoZWNrX2NvbnRyb2wo
dGM2LCB0eF9idWYsIHJ4X2J1ZiwgbGVuLCB3bnIsIGN0cmxfcHJvdCk7DQo+PiAtICAgICBpZiAo
cmV0KQ0KPj4gLSAgICAgICAgICAgICBnb3RvIGVycl9jdHJsOw0KPj4gKyAgICAgLyogSW4gY2Fz
ZSBvZiByZXNldCB3cml0ZSwgdGhlIGVjaG9lZCBjb250cm9sIGNvbW1hbmQgZG9lc24ndCBoYXZl
IGFueQ0KPj4gKyAgICAgICogdmFsaWQgZGF0YS4gU28gbm8gbmVlZCB0byBjaGVjayBmb3IgZXJy
b3IuDQo+PiArICAgICAgKi8NCj4+ICsgICAgIGlmIChhZGRyICE9IE9BX1RDNl9SRVNFVCkgew0K
Pj4gKyAgICAgICAgICAgICAvKiBDaGVjayBlY2hvZWQvcmVjZWl2ZWQgY29udHJvbCByZXBseSAq
Lw0KPj4gKyAgICAgICAgICAgICByZXQgPSBvYV90YzZfY2hlY2tfY29udHJvbCh0YzYsIHR4X2J1
ZiwgcnhfYnVmLCBsZW4sIHduciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY3RybF9wcm90KTsNCj4+ICsgICAgICAgICAgICAgaWYgKHJldCkNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICBnb3RvIGVycl9jdHJsOw0KPj4gKyAgICAgfQ0KPj4NCj4+ICAgICAg
ICBpZiAoIXducikgew0KPj4gICAgICAgICAgICAgICAgLyogQ29weSByZWFkIGRhdGEgZnJvbSB0
aGUgcnggZGF0YSBpbiBjYXNlIG9mIGN0cmwgcmVhZCAqLw0KPj4gQEAgLTE4Niw2ICsxOTMsODgg
QEAgaW50IG9hX3RjNl9wZXJmb3JtX2N0cmwoc3RydWN0IG9hX3RjNiAqdGM2LCB1MzIgYWRkciwg
dTMyIHZhbFtdLCB1OCBsZW4sDQo+PiAgICAgICAgcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4NCj4+
ICtzdGF0aWMgaW50IG9hX3RjNl9oYW5kbGVyKHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICAg
c3RydWN0IG9hX3RjNiAqdGM2ID0gZGF0YTsNCj4+ICsgICAgIHUzMiByZWd2YWw7DQo+PiArICAg
ICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICAgd2hpbGUgKGxpa2VseSgha3RocmVhZF9zaG91bGRf
c3RvcCgpKSkgew0KPj4gKyAgICAgICAgICAgICB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUodGM2
LT50YzZfd3EsIHRjNi0+aW50X2ZsYWcgfHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGt0aHJlYWRfc2hvdWxkX3N0b3AoKSk7DQo+PiArICAgICAgICAgICAgIGlm
ICh0YzYtPmludF9mbGFnKSB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgdGM2LT5pbnRfZmxh
ZyA9IGZhbHNlOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IG9hX3RjNl9wZXJmb3Jt
X2N0cmwodGM2LCBPQV9UQzZfU1RTMCwgJnJlZ3ZhbCwgMSwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlLCBmYWxzZSk7DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X2VycigmdGM2LT5zcGktPmRldiwgIkZhaWxlZCB0byByZWFkIFNUUzBcbiIpOw0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIC8qIENoZWNrIGZvciByZXNldCBj
b21wbGV0ZSBpbnRlcnJ1cHQgc3RhdHVzICovDQo+PiArICAgICAgICAgICAgICAgICAgICAgaWYg
KHJlZ3ZhbCAmIFJFU0VUQykgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
dmFsID0gUkVTRVRDOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogU1BJIGhv
c3Qgc2hvdWxkIHdyaXRlIFJFU0VUQyBiaXQgd2l0aCBvbmUgdG8NCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIGNsZWFyIHRoZSByZXNldCBpbnRlcnJ1cHQgc3RhdHVzLg0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBvYV90YzZfcGVyZm9ybV9jdHJsKHRjNiwgT0FfVEM2X1NUUzAsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZyZWd2YWwsIDEsIHRydWUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZhbHNlKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X2VycigmdGM2LT5zcGktPmRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIHdyaXRlIFNUUzBcbiIpOw0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBsZXRlKCZ0YzYtPnJzdF9jb21wbGV0ZSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgfQ0K
Pj4gKyAgICAgICAgICAgICB9DQo+PiArICAgICB9DQo+PiArICAgICByZXR1cm4gMDsNCj4+ICt9
DQo+PiArDQo+PiArc3RhdGljIGlycXJldHVybl90IG1hY3BoeV9pcnEoaW50IGlycSwgdm9pZCAq
ZGV2X2lkKQ0KPj4gK3sNCj4+ICsgICAgIHN0cnVjdCBvYV90YzYgKnRjNiA9IGRldl9pZDsNCj4+
ICsNCj4+ICsgICAgIC8qIFdha2UgdGM2IHRhc2sgdG8gcGVyZm9ybSBpbnRlcnJ1cHQgYWN0aW9u
ICovDQo+PiArICAgICB0YzYtPmludF9mbGFnID0gdHJ1ZTsNCj4+ICsgICAgIHdha2VfdXBfaW50
ZXJydXB0aWJsZSgmdGM2LT50YzZfd3EpOw0KPj4gKw0KPj4gKyAgICAgcmV0dXJuIElSUV9IQU5E
TEVEOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IG9hX3RjNl9zd19yZXNldChzdHJ1Y3Qg
b2FfdGM2ICp0YzYpDQo+PiArew0KPj4gKyAgICAgbG9uZyB0aW1lbGVmdDsNCj4+ICsgICAgIHUz
MiByZWd2YWw7DQo+PiArICAgICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICAgLyogUGVyZm9ybSBz
b2Z0d2FyZSByZXNldCB3aXRoIGJvdGggcHJvdGVjdGVkIGFuZCB1bnByb3RlY3RlZCBjb250cm9s
DQo+PiArICAgICAgKiBjb21tYW5kcyBiZWNhdXNlIHRoZSBkcml2ZXIgZG9lc24ndCBrbm93IHRo
ZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUNCj4+ICsgICAgICAqIE1BQy1QSFkuDQo+PiArICAgICAg
Ki8NCj4+ICsgICAgIHJlZ3ZhbCA9IFNXX1JFU0VUOw0KPj4gKyAgICAgcmVpbml0X2NvbXBsZXRp
b24oJnRjNi0+cnN0X2NvbXBsZXRlKTsNCj4+ICsgICAgIHJldCA9IG9hX3RjNl9wZXJmb3JtX2N0
cmwodGM2LCBPQV9UQzZfUkVTRVQsICZyZWd2YWwsIDEsIHRydWUsIGZhbHNlKTsNCj4+ICsgICAg
IGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgZGV2X2VycigmdGM2LT5zcGktPmRldiwgIlJF
U0VUIHJlZ2lzdGVyIHdyaXRlIGZhaWxlZFxuIik7DQo+PiArICAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+PiArICAgICB9DQo+PiArDQo+PiArICAgICByZXQgPSBvYV90YzZfcGVyZm9ybV9jdHJs
KHRjNiwgT0FfVEM2X1JFU0VULCAmcmVndmFsLCAxLCB0cnVlLCB0cnVlKTsNCj4+ICsgICAgIGlm
IChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgZGV2X2VycigmdGM2LT5zcGktPmRldiwgIlJFU0VU
IHJlZ2lzdGVyIHdyaXRlIGZhaWxlZFxuIik7DQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+PiArICAgICB9DQo+PiArICAgICB0aW1lbGVmdCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50
ZXJydXB0aWJsZV90aW1lb3V0KCZ0YzYtPnJzdF9jb21wbGV0ZSwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNlY3NfdG9famlm
ZmllcygxKSk7DQo+PiArICAgICBpZiAodGltZWxlZnQgPD0gMCkgew0KPj4gKyAgICAgICAgICAg
ICBkZXZfZXJyKCZ0YzYtPnNwaS0+ZGV2LCAiTUFDLVBIWSByZXNldCBmYWlsZWRcbiIpOw0KPj4g
KyAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAg
IHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICAgaW50IG9hX3RjNl93cml0ZV9yZWdpc3Rlcihz
dHJ1Y3Qgb2FfdGM2ICp0YzYsIHUzMiBhZGRyLCB1MzIgdmFsW10sIHU4IGxlbikNCj4+ICAgew0K
Pj4gICAgICAgIHJldHVybiBvYV90YzZfcGVyZm9ybV9jdHJsKHRjNiwgYWRkciwgdmFsLCBsZW4s
IHRydWUsIHRjNi0+Y3RybF9wcm90KTsNCj4+IEBAIC0yMDEsNiArMjkwLDcgQEAgRVhQT1JUX1NZ
TUJPTF9HUEwob2FfdGM2X3JlYWRfcmVnaXN0ZXIpOw0KPj4gICBzdHJ1Y3Qgb2FfdGM2ICpvYV90
YzZfaW5pdChzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPj4gICB7DQo+PiAgICAgICAgc3RydWN0
IG9hX3RjNiAqdGM2Ow0KPj4gKyAgICAgaW50IHJldDsNCj4+DQo+PiAgICAgICAgaWYgKCFzcGkp
DQo+PiAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4+IEBAIC0yMTEsMTIgKzMwMSw1MSBA
QCBzdHJ1Y3Qgb2FfdGM2ICpvYV90YzZfaW5pdChzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPj4N
Cj4+ICAgICAgICB0YzYtPnNwaSA9IHNwaTsNCj4+DQo+PiArICAgICAvKiBVc2VkIGZvciB0cmln
Z2VyaW5nIHRoZSBPQSBUQzYgdGFzayAqLw0KPj4gKyAgICAgaW5pdF93YWl0cXVldWVfaGVhZCgm
dGM2LT50YzZfd3EpOw0KPj4gKw0KPj4gKyAgICAgaW5pdF9jb21wbGV0aW9uKCZ0YzYtPnJzdF9j
b21wbGV0ZSk7DQo+PiArDQo+PiArICAgICAvKiBUaGlzIHRhc2sgcGVyZm9ybXMgdGhlIFNQSSB0
cmFuc2ZlciAqLw0KPj4gKyAgICAgdGM2LT50YzZfdGFzayA9IGt0aHJlYWRfcnVuKG9hX3RjNl9o
YW5kbGVyLCB0YzYsICJPQSBUQzYgVGFzayIpOw0KPj4gKyAgICAgaWYgKElTX0VSUih0YzYtPnRj
Nl90YXNrKSkNCj4+ICsgICAgICAgICAgICAgZ290byBlcnJfdGM2X3Rhc2s7DQo+PiArDQo+PiAr
ICAgICAvKiBTZXQgdGhlIGhpZ2hlc3QgcHJpb3JpdHkgdG8gdGhlIHRjNiB0YXNrIGFzIGl0IGlz
IHRpbWUgY3JpdGljYWwgKi8NCj4+ICsgICAgIHNjaGVkX3NldF9maWZvKHRjNi0+dGM2X3Rhc2sp
Ow0KPj4gKw0KPj4gKyAgICAgLyogUmVnaXN0ZXIgTUFDLVBIWSBpbnRlcnJ1cHQgc2VydmljZSBy
b3V0aW5lICovDQo+PiArICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZzcGktPmRldiwgc3Bp
LT5pcnEsIG1hY3BoeV9pcnEsIDAsICJtYWNwaHkgaW50IiwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdGM2KTsNCj4+ICsgICAgIGlmICgocmV0ICE9IC1FTk9UQ09OTikgJiYgcmV0
IDwgMCkgew0KPj4gKyAgICAgICAgICAgICBkZXZfZXJyKCZzcGktPmRldiwgIkVycm9yIGF0dGFj
aGluZyBtYWNwaHkgaXJxICVkXG4iLCByZXQpOw0KPj4gKyAgICAgICAgICAgICBnb3RvIGVycl9t
YWNwaHlfaXJxOw0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgLyogUGVyZm9ybSBNQUMtUEhZ
IHNvZnR3YXJlIHJlc2V0ICovDQo+PiArICAgICBpZiAob2FfdGM2X3N3X3Jlc2V0KHRjNikpDQo+
PiArICAgICAgICAgICAgIGdvdG8gZXJyX21hY3BoeV9yZXNldDsNCj4+ICsNCj4+ICAgICAgICBy
ZXR1cm4gdGM2Ow0KPj4gKw0KPj4gK2Vycl9tYWNwaHlfcmVzZXQ6DQo+PiArICAgICBkZXZtX2Zy
ZWVfaXJxKCZ0YzYtPnNwaS0+ZGV2LCB0YzYtPnNwaS0+aXJxLCB0YzYpOw0KPj4gK2Vycl9tYWNw
aHlfaXJxOg0KPj4gKyAgICAga3RocmVhZF9zdG9wKHRjNi0+dGM2X3Rhc2spOw0KPj4gK2Vycl90
YzZfdGFzazoNCj4+ICsgICAgIGtmcmVlKHRjNik7DQo+PiArICAgICByZXR1cm4gTlVMTDsNCj4+
ICAgfQ0KPj4gICBFWFBPUlRfU1lNQk9MX0dQTChvYV90YzZfaW5pdCk7DQo+Pg0KPj4gLXZvaWQg
b2FfdGM2X2RlaW5pdChzdHJ1Y3Qgb2FfdGM2ICp0YzYpDQo+PiAraW50IG9hX3RjNl9kZWluaXQo
c3RydWN0IG9hX3RjNiAqdGM2KQ0KPj4gICB7DQo+PiAtICAgICBrZnJlZSh0YzYpOw0KPj4gKyAg
ICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgIGRldm1fZnJlZV9pcnEoJnRjNi0+c3BpLT5kZXYs
IHRjNi0+c3BpLT5pcnEsIHRjNik7DQo+PiArICAgICByZXQgPSBrdGhyZWFkX3N0b3AodGM2LT50
YzZfdGFzayk7DQo+IA0KPiBrdGhyZWFkX3N0b3AoKSB3aWxsIHRoZSByZXN1bHQgb2YgdGhyZWFk
Zm4oKS4gSGVyZSBtZWFuIHRoYXQgaWYgdGhyZWFkZm4oKQ0KPiByZXR1cm4gbm9uLXplcm8sIGRl
aW5pdCgpIHdpbGwgZmFpbC4gQnV0IHRoZSBLVEhSRUFEX1NIT1VMRF9TVE9QIGFscmVhZHkgYmUg
c2V0Lg0KPiBBbmQgb2FfdGM2X2hhbmRsZXIoKSB3aWxsIGVuZC4gUGxlYXNlIGNoZWNrIGl0IGlz
IHdoYXQgeW91IHdhbnQuDQpPayB3aWxsIGhhbmRsZSBpdCBwcm9wZXJseSBpbiB0aGUgbmV4dCBy
ZXZpc2lvbi4NCg0KQmVzdCBSZWdhcmRzLA0KUGFydGhpYmFuIFYNCj4gDQo+PiArICAgICBpZiAo
IXJldCkNCj4+ICsgICAgICAgICAgICAga2ZyZWUodGM2KTsNCj4+ICsgICAgIHJldHVybiByZXQ7
DQo+PiAgIH0NCj4+ICAgRVhQT1JUX1NZTUJPTF9HUEwob2FfdGM2X2RlaW5pdCk7DQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9vYV90YzYuaCBiL2luY2x1ZGUvbGludXgvb2FfdGM2LmgN
Cj4+IGluZGV4IDVlMGE1OGFiMWRjZC4uMzE1ZjA2MWMyZGZlIDEwMDY0NA0KPj4gLS0tIGEvaW5j
bHVkZS9saW51eC9vYV90YzYuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9vYV90YzYuaA0KPj4g
QEAgLTE3LDE1ICsxNywyOSBAQA0KPj4gICAjZGVmaW5lIENUUkxfSERSX0xFTiBHRU5NQVNLKDcs
IDEpICAgLyogTGVuZ3RoICovDQo+PiAgICNkZWZpbmUgQ1RSTF9IRFJfUCAgIEJJVCgwKSAgICAg
ICAgICAvKiBQYXJpdHkgQml0ICovDQo+Pg0KPj4gKy8qIE9wZW4gQWxsaWFuY2UgVEM2IFN0YW5k
YXJkIENvbnRyb2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMgKi8NCj4+ICsjZGVmaW5lIE9BX1RDNl9S
RVNFVCAweDAwMDMgICAgICAgICAgLyogUmVzZXQgQ29udHJvbCBhbmQgU3RhdHVzIFJlZ2lzdGVy
ICovDQo+PiArI2RlZmluZSBPQV9UQzZfU1RTMCAgMHgwMDA4ICAgICAgICAgIC8qIFN0YXR1cyBS
ZWdpc3RlciAjMCAqLw0KPj4gKw0KPj4gKy8qIFJFU0VUIHJlZ2lzdGVyIGZpZWxkICovDQo+PiAr
I2RlZmluZSBTV19SRVNFVCAgICAgQklUKDApICAgICAgICAgIC8qIFNvZnR3YXJlIFJlc2V0ICov
DQo+PiArDQo+PiArLyogU1RBVFVTMCByZWdpc3RlciBmaWVsZCAqLw0KPj4gKyNkZWZpbmUgUkVT
RVRDICAgICAgICAgICAgICAgQklUKDYpICAgICAgICAgIC8qIFJlc2V0IENvbXBsZXRlICovDQo+
PiArDQo+PiAgICNkZWZpbmUgVEM2X0hEUl9TSVpFIDQgICAgICAgICAgICAgICAvKiBDdHJsIGNv
bW1hbmQgaGVhZGVyIHNpemUgYXMgcGVyIE9BICovDQo+PiAgICNkZWZpbmUgVEM2X0ZUUl9TSVpF
IDQgICAgICAgICAgICAgICAvKiBDdHJsIGNvbW1hbmQgZm9vdGVyIHNpemUgc3MgcGVyIE9BICov
DQo+Pg0KPj4gICBzdHJ1Y3Qgb2FfdGM2IHsNCj4+ICAgICAgICBzdHJ1Y3Qgc3BpX2RldmljZSAq
c3BpOw0KPj4gICAgICAgIGJvb2wgY3RybF9wcm90Ow0KPj4gKyAgICAgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0YzZfdGFzazsNCj4+ICsgICAgIHdhaXRfcXVldWVfaGVhZF90IHRjNl93cTsNCj4+ICsg
ICAgIGJvb2wgaW50X2ZsYWc7DQo+PiArICAgICBzdHJ1Y3QgY29tcGxldGlvbiByc3RfY29tcGxl
dGU7DQo+PiAgIH07DQo+Pg0KPj4gICBzdHJ1Y3Qgb2FfdGM2ICpvYV90YzZfaW5pdChzdHJ1Y3Qg
c3BpX2RldmljZSAqc3BpKTsNCj4+IC12b2lkIG9hX3RjNl9kZWluaXQoc3RydWN0IG9hX3RjNiAq
dGM2KTsNCj4+ICtpbnQgb2FfdGM2X2RlaW5pdChzdHJ1Y3Qgb2FfdGM2ICp0YzYpOw0KPj4gICBp
bnQgb2FfdGM2X3dyaXRlX3JlZ2lzdGVyKHN0cnVjdCBvYV90YzYgKnRjNiwgdTMyIGFkZHIsIHUz
MiB2YWx1ZVtdLCB1OCBsZW4pOw0KPj4gICBpbnQgb2FfdGM2X3JlYWRfcmVnaXN0ZXIoc3RydWN0
IG9hX3RjNiAqdGM2LCB1MzIgYWRkciwgdTMyIHZhbHVlW10sIHU4IGxlbik7DQo+Pg0KDQo=

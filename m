Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CCE3DAB6C
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jul 2021 20:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhG2Sz2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Jul 2021 14:55:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:62679 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhG2Sz2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Jul 2021 14:55:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="276734850"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; 
   d="scan'208";a="276734850"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2021 11:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; 
   d="scan'208";a="476516539"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2021 11:55:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 11:55:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 11:55:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 11:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct3v2W03OAujGa0kXOMfzSzXoZhWykjy73prUqdnCG8cz+iysZgUwGB1U6UQw+TORItgT6pTEwu+GP7+il5cpTCJVvn46wX8/uT9idQzNrWiHFtvd6V2iE43NgXgHB7VXlzkOv8foff3Qc1n5yZGV8tWgxluys3WyarIYrwLL1ixPpp2i01jfNJFtxSbwUjR+lDzzOQzwNZCdUkUPM0wRBWz+yIdsmzEKN0OkNJKE2kQ54myLL77FYA+CAn6gSf8I4D0R+iKnjhPKTCIbEid3tWMEX00R3RVtmFymEfWCGHdxhI4FUmLJWVQVTUrqkTSNOtHwSYqbvVkhrpPlgR+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcMZDECExFrPzWBRc/U4wjp1tO5ZQcrUOIN2dWar4Q0=;
 b=lEfbWRNMvUG423XWRcsFPfIXr//jrPT1sUsKXIs/5w9osXZfK+lIlHXyu6MS7NY2aFqmNxz7blPTE95rLdX2YNO6x1v30cS6pJK7EKyKG53IgIqBLM1caC5sDirkEH2RbvT3RJB5t2Sah2bBl8C/Q9s6LLSxZ38MYheVnPgxVwb/2HkNyjVVos0kTVr3VsiKfxa2xyMFEh3HoanjJVDqdsp1HVPRN8aOKWPje9of2kknn3Izs2SbRTDK8Yql71rHHchobVh4501Fy3oXitWRjFQ1iFOMHjZWtA7dTv43npUa9d+0uw/U/9stnR/CqEPY0yUEWL1tlu+ac/g8cziqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcMZDECExFrPzWBRc/U4wjp1tO5ZQcrUOIN2dWar4Q0=;
 b=ef7WUZWoUWJG26zaWbeG+vWn+BoMZnokk672dbBrnvKZP5H7LB9Kw9VNEfdaTD3hts+xnKSK1D239gYiNCGzPRr1TpvE4hyi7LasMf8NAGQIticm8zU11p2jp6P+LPlWjv8Tk+rYR/7CkscpqwbWpBr6c4HJHVJnrZOVNo1aQqQ=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 18:55:19 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 18:55:19 +0000
From:   "Winiarska, Iwona" <iwona.winiarska@intel.com>
To:     "zweiss@equinix.com" <zweiss@equinix.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Luck, Tony" <tony.luck@intel.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "bp@alien8.de" <bp@alien8.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 08/14] peci: Add device detection
Thread-Topic: [PATCH 08/14] peci: Add device detection
Thread-Index: AQHXd2qtFXm2JAdbHEufB6KAlx+zw6tXMIiAgAM3LgA=
Date:   Thu, 29 Jul 2021 18:55:19 +0000
Message-ID: <47440a8329ce06c41ca9746db42cb1d66154ea46.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
         <20210712220447.957418-9-iwona.winiarska@intel.com>
         <20210727174900.GR8018@packtop>
In-Reply-To: <20210727174900.GR8018@packtop>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: equinix.com; dkim=none (message not signed)
 header.d=none;equinix.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e696015-699a-42c5-3380-08d952c26985
x-ms-traffictypediagnostic: SA0PR11MB4656:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB46566622A6C2A965FC246F53ECEB9@SA0PR11MB4656.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JuHEdkP+smGnc785SXl5sxQ+QHXs52LLtKRtowoFZFZSm/1cmgbvE6T+NAdc2h9IxWRPphej0gBRB2G/2NKPcOioMs6JUkkB5d4ATaIGZyUKrdVGDf89X65e01QvOzgf62yCvglybuCaxS3lpgdMs0b6TR40E2m+D/vU4nJswT1BRMTxXZyiy1CwTGoAZ+C67mrRB+SE2kcao14pSrbVciyckkVYjjBLwlZKbD6ACKuYDmQcnT7eDNob4n4pNG8O9rrK4tQg8iZgGMEgV5zPRMjjn2bcKBRSaje/UgCPf1xoiINKv2icVfJZS8p5wjLclmocRb6bG/AjZ/gInLmC1F5LVWKYefFId2gisSrag76EIEQr5k1NQ0He8FZt1ZYsS+u0Ye+p1p2/OWoTO7kXOyYp+e0la43/0K23T+CVVc1+AWmNaFMNy8f8LmV1ayW+8mBmJ+KB1mczuOpvUwws5jEWhxg7lMaKPfEXlpi2PEzq0khDs8gS+yZgzFTR+HmQ0QvsgaVn+J+kQZ23ZVf9LsQfUq5FwB3y9nDEQ7TZfd1p79/NROd74Z/uISuVAZj/54K06CRZDIq46bqIUMMvIA7wrjFxCz1SrLix+2fdZ4Un3yj3awgxLhV+BL4TecdYUt3k70YjvIwHWoQ5B043TDXnYygEeCp4hG+aSFUi2LxR8b1a/gJI3PjZSaD/GzJHMaWkVV8dlTbbdlgpqibdCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(122000001)(5660300002)(6916009)(86362001)(38100700002)(71200400001)(478600001)(66446008)(66476007)(76116006)(64756008)(91956017)(66556008)(66946007)(26005)(54906003)(38070700005)(7416002)(186003)(6486002)(316002)(30864003)(8936002)(6506007)(4326008)(2616005)(6512007)(36756003)(8676002)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1kxakszRHpUTVBmbm9hTFN6Rm9QZ2t0cUkxUVVhb0tsck8yUVBFWHU2QmxX?=
 =?utf-8?B?T0hHaXhxV1BnLzFVTVdQaFFJUmFpbmY5elhUT2kxNHVXVDhMcHlWLzh1OWFQ?=
 =?utf-8?B?VWhqcjkyNzRGd3B5WDBCRzlUUTVxQ3Jra2ZHQVFwTEZrMy9OdEk5RXhLWkJE?=
 =?utf-8?B?VjZ5S001eDZETzZ5UlFwN0k0cGpsZGJtTktUQVlXRTRBMVZHekdxM1pQMkN0?=
 =?utf-8?B?S1Jwdm9MdGszZC96UlB2cmhHWWRERUgvQVJJbmdpNWdMREFURkdqR1pZZUZD?=
 =?utf-8?B?S2draWQ0RTZhQ1c2NlpXRHhJdEZFRlJOaHByVHd2dHJGZ1JlWTRFZnVvQXMx?=
 =?utf-8?B?RmRKRCt3bGNjOXc2L2JLalpYbHR5K2RMdUNCZzMraFBLTmNPckxSa21GVXEv?=
 =?utf-8?B?WHdsOC92UTVVUGVzVzFuODRxNnR1bVZqTFJBZzZkdER2TStqYUQ5OG1kU0Z5?=
 =?utf-8?B?VnpJR1U3bmJncmVxcDFUbUx0RlhtL0RpbXc1VS9ZR1JrRTRKTEdNa3FVUysv?=
 =?utf-8?B?cjZZWW5EdWlHT0F1RVQyOHFwTmhaS1Q5bnVwMmpTZ0hlajdzcFVVN2NQaFpB?=
 =?utf-8?B?SWIxT2J0UlZKUzdtY3RIRWp4anBtdFp5ajRieFhtNWVvNmxXalNGOXRRd2VW?=
 =?utf-8?B?d0h2azdDSTlITjA0YlFqb2RLQzMyU2cvN0R6clBpTGlaKzRqVW5JNXVkSlcy?=
 =?utf-8?B?ZHZSZzdCTzRWK3JET01HejgwVTNleDVCQ2ViRFpSNFhSdmdBWDJZQnBqUjFE?=
 =?utf-8?B?Z2ZjeWtYK0tUQzFPWmxpMllyRHFTUFlRREx3bzRUblVSa001SmRlOTlLNS9W?=
 =?utf-8?B?STJGNHBlLzJRSGVOUU1DRFlFcUFMNjk3LzVycllEbzU1UncrT1pBcFozcnFu?=
 =?utf-8?B?RXJtcnhNYlRsZzdneXpCYW1SYklrd21JK3dwT0UzS2oyZmV2N0p2cGRQNW1k?=
 =?utf-8?B?ek14RG1aYmVhbUtGV0NzUW1nTmttamZacnBBWHBuNDd6TjJWUmJBaFRxd1B3?=
 =?utf-8?B?QXlxRHNIRVVQMjZNN00wcUt0WDRqRXhxOFF0dU1uWjRqaTBmdWlseFZZVUVV?=
 =?utf-8?B?amR1ZmZjTGlCaFFMSUI1VXArZWZtcDluSVdoYkUvMFpOamJIa2c3NjlKYnBN?=
 =?utf-8?B?emN1WTVYRm5xMVdUeGx4b0pNa1NkanFDOW5kcmhaV0pRT2s1aGE3RWVDVzJF?=
 =?utf-8?B?ZzVLRVBUNG1BM3dwOVVlTC9ZMk5jNDdteXdEUzlBQ2RBYXM0di9PVTRudFd6?=
 =?utf-8?B?TEY4THBtT0gvUjFRRUJjNkpab3Y0cFVEV3NncnpGbmo0Sm93U08yOFpXYjdB?=
 =?utf-8?B?UUpRbUZQUXlkL2JSQXprUFYwRDduZ00yc1drdEhzaERsaVlmNjZJSG1nRmc0?=
 =?utf-8?B?SFM2RG8wUnEzLzJZN0VEMXpzVkVmOUlibERtVmhkeXo1dWorYkhwbHFJeksr?=
 =?utf-8?B?MWNrVmxtQnd5ZEZmVjExWnFlaUY3OUdFbmMwZUtmUUQzd2k3V2ZLcStJRlpl?=
 =?utf-8?B?NEgxaDlSVGRkWEQrMk10R2UzSjR0SmJOb1gyQ0ZYOTZHSVFzVDI2cHpEdXJD?=
 =?utf-8?B?cW9zSEpEdENKRzEzeEN4SXNXa0xLY0VTOGhFS25uTkFTVHhWdXZ0QWhwRHV2?=
 =?utf-8?B?VnlLMC9RYmJ0TzcxWEdWenNVcWEyVFUyUzBhaytIeEZXLzQ3Ymdkb1VJUW9P?=
 =?utf-8?B?OTZFSDU1a2hUSFJJN0hvTldCZkpoMHhwUmdWSE9HcUtPTUdkOE4vQ21YWHFO?=
 =?utf-8?B?UHEva29WQTI0OVdZWWVYWW9KdnJzZTkxa1Y5SndJMWI4Q2FRcnZjRFdYL1Zv?=
 =?utf-8?B?ekYvSExNNHJWY0pFb1lrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78471EE16ADCFC4294757F52C1CF04CE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e696015-699a-42c5-3380-08d952c26985
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 18:55:19.5936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEs65+zOvkkbW0P1qpbxedCB3RQSvfdvrjrOX9QtD6w0KAsRffM9m8cY70kXFtKVMLuwelMM9Vvw0nJLvKK2zvVuIGWSPGZTCvAOxM2C2lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCAyMDIxLTA3LTI3IGF0IDE3OjQ5ICswMDAwLCBaZXYgV2Vpc3Mgd3JvdGU6DQo+IE9u
IE1vbiwgSnVsIDEyLCAyMDIxIGF0IDA1OjA0OjQxUE0gQ0RULCBJd29uYSBXaW5pYXJza2Egd3Jv
dGU6DQo+ID4gU2luY2UgUEVDSSBkZXZpY2VzIGFyZSBkaXNjb3ZlcmFibGUsIHdlIGNhbiBkeW5h
bWljYWxseSBkZXRlY3QgZGV2aWNlcw0KPiA+IHRoYXQgYXJlIGFjdHVhbGx5IGF2YWlsYWJsZSBp
biB0aGUgc3lzdGVtLg0KPiA+IA0KPiA+IFRoaXMgY2hhbmdlIGNvbXBsZW1lbnRzIHRoZSBlYXJs
aWVyIGltcGxlbWVudGF0aW9uIGJ5IHJlc2Nhbm5pbmcgUEVDSQ0KPiA+IGJ1cyB0byBkZXRlY3Qg
YXZhaWxhYmxlIGRldmljZXMuIEZvciB0aGlzIHB1cnBvc2UsIGl0IGFsc28gaW50cm9kdWNlcyB0
aGUNCj4gPiBtaW5pbWFsIEFQSSBmb3IgUEVDSSByZXF1ZXN0cy4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+ID4g
UmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBs
aW51eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gZHJpdmVycy9wZWNpL01ha2VmaWxlwqDCoCB8
wqDCoCAyICstDQo+ID4gZHJpdmVycy9wZWNpL2NvcmUuY8KgwqDCoMKgIHzCoCAxMyArKysrLQ0K
PiA+IGRyaXZlcnMvcGVjaS9kZXZpY2UuY8KgwqAgfCAxMTEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+IGRyaXZlcnMvcGVjaS9pbnRlcm5hbC5oIHzCoCAxNSAr
KysrKysNCj4gPiBkcml2ZXJzL3BlY2kvcmVxdWVzdC5jwqAgfMKgIDc0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+IGRyaXZlcnMvcGVjaS9zeXNmcy5jwqDCoMKgIHzCoCAzNCArKysr
KysrKysrKysNCj4gPiA2IGZpbGVzIGNoYW5nZWQsIDI0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4g
PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvTWFrZWZpbGUgYi9kcml2ZXJzL3BlY2kvTWFrZWZpbGUN
Cj4gPiBpbmRleCA2MjFhOTkzZTMwNmEuLjkxN2Y2ODllMTQ3YSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BlY2kvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL3BlY2kvTWFrZWZpbGUNCj4g
PiBAQCAtMSw3ICsxLDcgQEANCj4gPiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkNCj4gPiANCj4gPiAjIENvcmUgZnVuY3Rpb25hbGl0eQ0KPiA+IC1wZWNpLXkgOj0gY29y
ZS5vIHN5c2ZzLm8NCj4gPiArcGVjaS15IDo9IGNvcmUubyByZXF1ZXN0Lm8gZGV2aWNlLm8gc3lz
ZnMubw0KPiA+IG9iai0kKENPTkZJR19QRUNJKSArPSBwZWNpLm8NCj4gPiANCj4gPiAjIEhhcmR3
YXJlIHNwZWNpZmljIGJ1cyBkcml2ZXJzDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9j
b3JlLmMgYi9kcml2ZXJzL3BlY2kvY29yZS5jDQo+ID4gaW5kZXggMGFkMDAxMTA0NTlkLi5hZTdh
OTU3MmNkZjMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wZWNpL2NvcmUuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGVjaS9jb3JlLmMNCj4gPiBAQCAtMzEsNyArMzEsMTUgQEAgc3RydWN0IGRldmlj
ZV90eXBlIHBlY2lfY29udHJvbGxlcl90eXBlID0gew0KPiA+IA0KPiA+IGludCBwZWNpX2NvbnRy
b2xsZXJfc2Nhbl9kZXZpY2VzKHN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIpDQo+
ID4gew0KPiA+IC3CoMKgwqDCoMKgwqDCoC8qIEp1c3QgYSBzdHViLCBubyBzdXBwb3J0IGZvciBh
Y3R1YWwgZGV2aWNlcyB5ZXQgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ICvC
oMKgwqDCoMKgwqDCoHU4IGFkZHI7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoYWRk
ciA9IFBFQ0lfQkFTRV9BRERSOyBhZGRyIDwgUEVDSV9CQVNFX0FERFIgKw0KPiA+IFBFQ0lfREVW
SUNFX05VTV9NQVg7IGFkZHIrKykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBwZWNpX2RldmljZV9jcmVhdGUoY29udHJvbGxlciwgYWRkcik7DQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ICvCoMKgwqDCoMKg
wqDCoH0NCj4gPiArDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+IH0NCj4gPiAN
Cj4gPiBAQCAtMTA2LDcgKzExNCw4IEBAIEVYUE9SVF9TWU1CT0xfTlNfR1BMKHBlY2lfY29udHJv
bGxlcl9hZGQsIFBFQ0kpOw0KPiA+IA0KPiA+IHN0YXRpYyBpbnQgX3VucmVnaXN0ZXIoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpkdW1teSkNCj4gPiB7DQo+ID4gLcKgwqDCoMKgwqDCoMKgLyog
SnVzdCBhIHN0dWIsIG5vIHN1cHBvcnQgZm9yIGFjdHVhbCBkZXZpY2VzIHlldCAqLw0KPiA+ICvC
oMKgwqDCoMKgwqDCoHBlY2lfZGV2aWNlX2Rlc3Ryb3kodG9fcGVjaV9kZXZpY2UoZGV2KSk7DQo+
ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiB9DQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGVjaS9kZXZpY2UuYyBiL2RyaXZlcnMvcGVjaS9kZXZpY2UuYw0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4xMTI0ODYy
MjExZTINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9wZWNpL2RldmljZS5j
DQo+ID4gQEAgLTAsMCArMSwxMTEgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQ0KPiA+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMTgtMjAyMSBJbnRlbCBDb3Jw
b3JhdGlvbg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BlY2kuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpbnRlcm5hbC5oIg0KPiA+
ICsNCj4gPiArc3RhdGljIGludCBwZWNpX2RldGVjdChzdHJ1Y3QgcGVjaV9jb250cm9sbGVyICpj
b250cm9sbGVyLCB1OCBhZGRyKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHBl
Y2lfcmVxdWVzdCAqcmVxOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4gKw0KPiA+
ICvCoMKgwqDCoMKgwqDCoHJlcSA9IHBlY2lfcmVxdWVzdF9hbGxvYyhOVUxMLCAwLCAwKTsNCj4g
PiArwqDCoMKgwqDCoMKgwqBpZiAoIXJlcSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiANCj4gTWlnaHQgYmUgd29ydGggYSBicmll
ZiBjb21tZW50IGhlcmUgbm90aW5nIHRoYXQgYW4gZW1wdHkgcmVxdWVzdCBoYXBwZW5zDQo+IHRv
IGJlIHRoZSBmb3JtYXQgb2YgYSBQRUNJIHBpbmcgY29tbWFuZCAoYW5kL29yIGNoYW5nZSB0aGUg
bmFtZSBvZiB0aGUNCj4gZnVuY3Rpb24gdG8gcGVjaV9waW5nKCkpLg0KDQpJJ2xsIGFkZCBhIGNv
bW1lbnQ6DQoiV2UgYXJlIHVzaW5nIFBFQ0kgUGluZyBjb21tYW5kIHRvIGRldGVjdCBwcmVzZW5j
ZSBvZiBQRUNJIGRldmljZXMuIg0KDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2so
JmNvbnRyb2xsZXItPmJ1c19sb2NrKTsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBjb250cm9s
bGVyLT54ZmVyKGNvbnRyb2xsZXIsIGFkZHIsIHJlcSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgbXV0
ZXhfdW5sb2NrKCZjb250cm9sbGVyLT5idXNfbG9jayk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKg
wqDCoHBlY2lfcmVxdWVzdF9mcmVlKHJlcSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBib29sIHBlY2lfYWRkcl92YWxp
ZCh1OCBhZGRyKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGFkZHIgPj0gUEVD
SV9CQVNFX0FERFIgJiYgYWRkciA8IFBFQ0lfQkFTRV9BRERSICsNCj4gPiBQRUNJX0RFVklDRV9O
VU1fTUFYOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHBlY2lfZGV2X2V4aXN0cyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgcGVjaV9kZXZpY2UgKmRldmljZSA9IHRvX3BlY2lfZGV2aWNlKGRldik7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgdTggKmFkZHIgPSBkYXRhOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKg
wqBpZiAoZGV2aWNlLT5hZGRyID09ICphZGRyKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVCVVNZOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IHBlY2lfZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgcGVj
aV9jb250cm9sbGVyICpjb250cm9sbGVyLCB1OCBhZGRyKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IHBlY2lfZGV2aWNlICpkZXZpY2U7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaW50
IHJldDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKFdBUk5fT04oIXBlY2lfYWRkcl92
YWxpZChhZGRyKSkpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAt
RUlOVkFMOw0KPiANCj4gV29uZGVyaW5nIGFib3V0IHRoZSBuZWNlc3NpdHkgb2YgdGhpcyBjaGVj
ayAoYW5kIHRoZSBwZWNpX2FkZHJfdmFsaWQoKQ0KPiBmdW5jdGlvbikgLS0gYXMgb2YgdGhlIGVu
ZCBvZiB0aGlzIHBhdGNoIHNlcmllcywgdGhlcmUncyBvbmx5IG9uZSBjYWxsZXINCj4gb2YgcGVj
aV9kZXZpY2VfY3JlYXRlKCksIGFuZCBpdCdzIHBlY2lfY29udHJvbGxlcl9zY2FuX2RldmljZXMo
KSBsb29waW5nDQo+IGZyb20gUEVDSV9CQVNFX0FERFIgdG8gUEVDSV9CQVNFX0FERFIgKyBQRUNJ
X0RFVklDRV9OVU1fTUFYLCBzbw0KPiBjaGVja2luZyB0aGF0IHRoZSBhZGRyZXNzIGlzIGluIHRo
YXQgcmFuZ2Ugc2VlbXMgYSBiaXQgcmVkdW5kYW50LsKgIERvIHdlDQo+IGFudGljaXBhdGUgdGhh
dCB3ZSBtaWdodCBnYWluIGFkZGl0aW9uYWwgY2FsbGVycyBpbiB0aGUgZnV0dXJlIHRoYXQNCj4g
Y291bGQgcnVuIGEgbm9uLXplcm8gcmlzayBvZiBwYXNzaW5nIGEgYmFkIGFkZHJlc3M/DQoNCkl0
J3MganVzdCBhIHNhbml0eSBjaGVjayB0byBhdm9pZCBhbnkgc3VycHJpc2VzIGlmIHRoZSBjb2Rl
IGNoYW5nZXMgaW4gdGhlDQpmdXR1cmUuDQoNCj4gDQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDC
oC8qIENoZWNrIGlmIHdlIGhhdmUgYWxyZWFkeSBkZXRlY3RlZCB0aGlzIGRldmljZSBiZWZvcmUu
ICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKCZjb250
cm9sbGVyLT5kZXYsICZhZGRyLA0KPiA+IHBlY2lfZGV2X2V4aXN0cyk7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHBlY2lfZGV0ZWN0KGNvbnRyb2xs
ZXIsIGFkZHIpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogRGV2aWNlIG5vdCBwcmVzZW50IG9yIGhvc3Qgc3RhdGUgZG9lc24ndCBhbGxvdyBzdWNj
ZXNzZnVsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRldGVjdGlvbiBh
dCB0aGlzIHRpbWUuDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0ID09IC1FSU8gfHwgcmV0ID09
IC1FVElNRURPVVQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsNCj4gDQo+IERvIHdlIHJlYWxseSB3YW50IHRvIGJlIGlnbm9yaW5n
IEVJTyBoZXJlP8KgIEZyb20gYSBsb29rIGF0DQo+IGFzcGVlZF9wZWNpX3hmZXIoKSwgaXQgbG9v
a3MgbGlrZSB0aGUgb25seSBwYXRoIHRoYXQgd291bGQgcHJvZHVjZSB0aGF0DQo+IGlzIHRoZSBu
b24tdGltZW91dCwgbm9uLUNNRF9ET05FIGNhc2UsIHdoaWNoIEkgZ3Vlc3MgaGFwcGVucyBvbg0K
PiBjb250ZW50aW9uIG9yIEZDUyBlcnJvcnMgYW5kIHN1Y2guwqAgU2hvdWxkIHdlIG1heWJlIGhh
dmUgc29tZSBhdXRvbWF0aWMNCj4gKGxpbWl0ZWQpIHJldHJ5IGxvb3AgZm9yIGNhc2VzIGxpa2Ug
dGhvc2U/DQoNClllcywgd2Ugd2FudCB0byBpZ25vcmUgRUlPIGhlcmUuDQpJdCBtYXkgYmUgcmV0
dXJuZWQgd2hlbiB3ZSBnZXQgIkJhZCBXcml0ZSBGQ1MiLCBhZnRlciB3ZSB0cnkgdG8gcGluZyBu
b24tDQpleGlzdGluZyBQRUNJIGRldmljZS4NCg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+
ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBkZXZpY2UgPSBremFsbG9jKHNpemVvZigqZGV2aWNlKSwg
R0ZQX0tFUk5FTCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFkZXZpY2UpDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgwqBkZXZpY2UtPmNvbnRyb2xsZXIgPSBjb250cm9sbGVyOw0KPiA+ICvCoMKgwqDC
oMKgwqDCoGRldmljZS0+YWRkciA9IGFkZHI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgZGV2aWNlLT5k
ZXYucGFyZW50ID0gJmRldmljZS0+Y29udHJvbGxlci0+ZGV2Ow0KPiA+ICvCoMKgwqDCoMKgwqDC
oGRldmljZS0+ZGV2LmJ1cyA9ICZwZWNpX2J1c190eXBlOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGRl
dmljZS0+ZGV2LnR5cGUgPSAmcGVjaV9kZXZpY2VfdHlwZTsNCj4gPiArDQo+ID4gK8KgwqDCoMKg
wqDCoMKgcmV0ID0gZGV2X3NldF9uYW1lKCZkZXZpY2UtPmRldiwgIiVkLSUwMngiLCBjb250cm9s
bGVyLT5pZCwgZGV2aWNlLQ0KPiA+ID5hZGRyKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0
KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9mcmVlOw0KPiA+
ICsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBkZXZpY2VfcmVnaXN0ZXIoJmRldmljZS0+ZGV2
KTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBnb3RvIGVycl9wdXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biAwOw0KPiA+ICsNCj4gPiArZXJyX3B1dDoNCj4gPiArwqDCoMKgwqDCoMKgwqBwdXRfZGV2aWNl
KCZkZXZpY2UtPmRldik7DQo+ID4gK2Vycl9mcmVlOg0KPiA+ICvCoMKgwqDCoMKgwqDCoGtmcmVl
KGRldmljZSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3ZvaWQgcGVjaV9kZXZpY2VfZGVzdHJveShzdHJ1Y3QgcGVjaV9kZXZpY2Ug
KmRldmljZSkNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqDCoGRldmljZV91bnJlZ2lzdGVyKCZk
ZXZpY2UtPmRldik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHBlY2lfZGV2aWNl
X3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
c3RydWN0IHBlY2lfZGV2aWNlICpkZXZpY2UgPSB0b19wZWNpX2RldmljZShkZXYpOw0KPiA+ICsN
Cj4gPiArwqDCoMKgwqDCoMKgwqBrZnJlZShkZXZpY2UpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dHJ1Y3QgZGV2aWNlX3R5cGUgcGVjaV9kZXZpY2VfdHlwZSA9IHsNCj4gPiArwqDCoMKgwqDCoMKg
wqAuZ3JvdXBzwqDCoMKgwqDCoMKgwqDCoMKgPSBwZWNpX2RldmljZV9ncm91cHMsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLnJlbGVhc2XCoMKgwqDCoMKgwqDCoMKgPSBwZWNpX2RldmljZV9yZWxlYXNl
LA0KPiA+ICt9Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvaW50ZXJuYWwuaCBiL2Ry
aXZlcnMvcGVjaS9pbnRlcm5hbC5oDQo+ID4gaW5kZXggODBjNjFiY2RmYzZiLi42YjEzOWFkYWY2
YjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gPiArKysgYi9k
cml2ZXJzL3BlY2kvaW50ZXJuYWwuaA0KPiA+IEBAIC05LDYgKzksMjEgQEANCj4gPiANCj4gPiBz
dHJ1Y3QgcGVjaV9jb250cm9sbGVyOw0KPiA+IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXA7DQo+ID4g
K3N0cnVjdCBwZWNpX2RldmljZTsNCj4gPiArc3RydWN0IHBlY2lfcmVxdWVzdDsNCj4gPiArDQo+
ID4gKy8qIFBFQ0kgQ1BVIGFkZHJlc3MgcmFuZ2UgMHgzMC0weDM3ICovDQo+ID4gKyNkZWZpbmUg
UEVDSV9CQVNFX0FERFLCoMKgwqDCoMKgwqDCoMKgwqAweDMwDQo+ID4gKyNkZWZpbmUgUEVDSV9E
RVZJQ0VfTlVNX01BWMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDgNCj4gPiArDQo+ID4gK3N0cnVj
dCBwZWNpX3JlcXVlc3QgKnBlY2lfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgcGVjaV9kZXZpY2UgKmRl
dmljZSwgdTgNCj4gPiB0eF9sZW4sIHU4IHJ4X2xlbik7DQo+ID4gK3ZvaWQgcGVjaV9yZXF1ZXN0
X2ZyZWUoc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxKTsNCj4gPiArDQo+ID4gK2V4dGVybiBzdHJ1
Y3QgZGV2aWNlX3R5cGUgcGVjaV9kZXZpY2VfdHlwZTsNCj4gPiArZXh0ZXJuIGNvbnN0IHN0cnVj
dCBhdHRyaWJ1dGVfZ3JvdXAgKnBlY2lfZGV2aWNlX2dyb3Vwc1tdOw0KPiA+ICsNCj4gPiAraW50
IHBlY2lfZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgcGVjaV9jb250cm9sbGVyICpjb250cm9sbGVyLCB1
OCBhZGRyKTsNCj4gPiArdm9pZCBwZWNpX2RldmljZV9kZXN0cm95KHN0cnVjdCBwZWNpX2Rldmlj
ZSAqZGV2aWNlKTsNCj4gPiANCj4gPiBleHRlcm4gc3RydWN0IGJ1c190eXBlIHBlY2lfYnVzX3R5
cGU7DQo+ID4gZXh0ZXJuIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKnBlY2lfYnVzX2dy
b3Vwc1tdOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlY2kvcmVxdWVzdC5jIGIvZHJpdmVy
cy9wZWNpL3JlcXVlc3QuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi43OGNlZTUxZGZhZTENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJp
dmVycy9wZWNpL3JlcXVlc3QuYw0KPiA+IEBAIC0wLDAgKzEsNzQgQEANCj4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvLyBDb3B5cmlnaHQgKGMpIDIw
MjEgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9leHBvcnQu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BlY2kuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVk
ZSAiaW50ZXJuYWwuaCINCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBwZWNpX3JlcXVlc3RfYWxs
b2MoKSAtIGFsbG9jYXRlICZzdHJ1Y3QgcGVjaV9yZXF1ZXN0IHdpdGggYnVmZmVycyB3aXRoDQo+
ID4gZ2l2ZW4gbGVuZ3Rocw0KPiA+ICsgKiBAZGV2aWNlOiBQRUNJIGRldmljZSB0byB3aGljaCBy
ZXF1ZXN0IGlzIGdvaW5nIHRvIGJlIHNlbnQNCj4gPiArICogQHR4X2xlbjogcmVxdWVzdGVkIFRY
IGJ1ZmZlciBsZW5ndGgNCj4gPiArICogQHJ4X2xlbjogcmVxdWVzdGVkIFJYIGJ1ZmZlciBsZW5n
dGgNCj4gPiArICoNCj4gPiArICogUmV0dXJuOiBBIHBvaW50ZXIgdG8gYSBuZXdseSBhbGxvY2F0
ZWQgJnN0cnVjdCBwZWNpX3JlcXVlc3Qgb24gc3VjY2Vzcw0KPiA+IG9yIE5VTEwgb3RoZXJ3aXNl
Lg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHBlY2lfcmVxdWVzdCAqcGVjaV9yZXF1ZXN0X2FsbG9j
KHN0cnVjdCBwZWNpX2RldmljZSAqZGV2aWNlLCB1OA0KPiA+IHR4X2xlbiwgdTggcnhfbGVuKQ0K
PiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoHU4ICp0eF9idWYsICpyeF9idWY7DQo+ID4gKw0KPiA+ICvCoMKgwqDC
oMKgwqDCoHJlcSA9IGt6YWxsb2Moc2l6ZW9mKCpyZXEpLCBHRlBfS0VSTkVMKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqBpZiAoIXJlcSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIE5VTEw7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJlcS0+ZGV2aWNlID0gZGV2
aWNlOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAq
IFBFQ0kgY29udHJvbGxlcnMgdGhhdCB3ZSBhcmUgdXNpbmcgbm93IGRvbid0IHN1cHBvcnQgRE1B
LCB0aGlzDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBETUEg
QVBJIG9uY2Ugc3VwcG9ydCBmb3IgY29udHJvbGxlcnMgdGhhdA0KPiA+IGRvDQo+ID4gK8KgwqDC
oMKgwqDCoMKgICogYWxsb3cgaXQgaXMgYWRkZWQgdG8gYXZvaWQgYW4gZXh0cmEgY29weS4NCj4g
PiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAodHhfbGVuKSB7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHR4X2J1ZiA9IGt6YWxsb2ModHhfbGVu
LCBHRlBfS0VSTkVMKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF0
eF9idWYpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBnb3RvIGVycl9mcmVlX3JlcTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlcS0+dHguYnVmID0gdHhfYnVmOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXEtPnR4LmxlbiA9IHR4X2xlbjsNCj4gPiArwqDCoMKgwqDCoMKgwqB9DQo+ID4g
Kw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyeF9sZW4pIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcnhfYnVmID0ga3phbGxvYyhyeF9sZW4sIEdGUF9LRVJORUwpOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJ4X2J1ZikNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2ZyZWVfdHg7
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXEtPnJ4LmJ1ZiA9
IHJ4X2J1ZjsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVxLT5yeC5sZW4g
PSByeF9sZW47DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gDQo+IEFzIGxvbmcgYXMg
d2UncmUgcHVudGluZyBvbiBETUEgc3VwcG9ydCwgY291bGQgd2UgZG8gdGhlIHdob2xlIHRoaW5n
IGluDQo+IGEgc2luZ2xlIGFsbG9jYXRpb24gaW5zdGVhZCBvZiB0aHJlZT/CoCBJdCdkIGFkZCBz
b21lIHBvaW50ZXIgYXJpdGhtZXRpYywNCj4gYnV0IHdvdWxkIGFsc28gc2ltcGxpZnkgdGhlIGVy
cm9yLWhhbmRsaW5nL2RlYWxsb2NhdGlvbiBwYXRocyBhIGJpdC4NCj4gDQo+IE9yLCBnaXZlbiB0
aGF0IHRoZSBvbmUgY29udHJvbGxlciB3ZSdyZSBjdXJyZW50bHkgc3VwcG9ydGluZyBoYXMgYQ0K
PiBoYXJkd2FyZSBsaW1pdCBvZiAzMiBieXRlcyBwZXIgdHJhbnNmZXIgYW55d2F5LCBtYXliZSBq
dXN0IGlubGluZQ0KPiBmaXhlZC1zaXplIHJ4L3R4IGJ1ZmZlcnMgaW50byBzdHJ1Y3QgcGVjaV9y
ZXF1ZXN0IGFuZCBoYXZlIGNhbGxlcnMga2VlcA0KPiB0aGVtIG9uIHRoZSBzdGFjayBpbnN0ZWFk
IG9mIGttYWxsb2MoKS1pbmcgdGhlbT8NCg0KSSBkaXNhZ3JlZSBvbiBlcnJvciBoYW5kbGluZyAo
aXQncyBub3QgY29tcGxpY2F0ZWQpIC0gaG93ZXZlciwgb25lIGFyZ3VtZW50IGZvcg0KZG9pbmcg
YSBzaW5nbGUgYWxsb2MgKG9yIG1vdmluZyB0aGUgYnVmZmVycyBhcyBmaXhlZC1zaXplIGFycmF5
cyBpbnNpZGUgc3RydWN0DQpwZWNpX3JlcXVlc3QpIGlzIHRoYXQgc2luZ2xlIGt6YWxsb2MgaXMg
Z29pbmcgdG8gYmUgZmFzdGVyIHRoYW4gMy4gQnV0IEkgZG9uJ3QNCmV4cGVjdCBpdCB0byBzaG93
IHVwIG9uIGFueSBwZXJmIHByb2ZpbGVzIGZvciBub3cgKHNpbmNlIHBlY2ktd2lyZSBpbnRlcmZh
Y2UgaXMNCm5vdCBhIHNwZWVkIGRlbW9uKS4NCg0KSSB3YW50ZWQgdG8gYXZvaWQgZGVmaW5pbmcg
bWF4IHNpemUgZm9yIFRYIGFuZCBSWCBpbiBwZWNpLWNvcmUuDQpEbyB5b3UgaGF2ZSBhIHN0cm9u
ZyBvcGluaW9uIGFnYWluc3QgbXVsdGlwbGUgYWxsb2M/IElmIHllcywgSSBjYW4gZ28gd2l0aA0K
Zml4ZWQtc2l6ZSBhcnJheXMgaW5zaWRlIHN0cnVjdCBwZWNpX3JlcXVlc3QuDQoNClRoYW5rcw0K
LUl3b25hDQoNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJlcTsNCj4gPiArDQo+ID4g
K2Vycl9mcmVlX3R4Og0KPiA+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKHJlcS0+dHguYnVmKTsNCj4g
PiArZXJyX2ZyZWVfcmVxOg0KPiA+ICvCoMKgwqDCoMKgwqDCoGtmcmVlKHJlcSk7DQo+ID4gKw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBOVUxMOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1C
T0xfTlNfR1BMKHBlY2lfcmVxdWVzdF9hbGxvYywgUEVDSSk7DQo+ID4gKw0KPiA+ICsvKioNCj4g
PiArICogcGVjaV9yZXF1ZXN0X2ZyZWUoKSAtIGZyZWUgcGVjaV9yZXF1ZXN0DQo+ID4gKyAqIEBy
ZXE6IHRoZSBQRUNJIHJlcXVlc3QgdG8gYmUgZnJlZWQNCj4gPiArICovDQo+ID4gK3ZvaWQgcGVj
aV9yZXF1ZXN0X2ZyZWUoc3RydWN0IHBlY2lfcmVxdWVzdCAqcmVxKQ0KPiA+ICt7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKga2ZyZWUocmVxLT5yeC5idWYpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGtmcmVl
KHJlcS0+dHguYnVmKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBrZnJlZShyZXEpOw0KPiA+ICt9DQo+
ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BMKHBlY2lfcmVxdWVzdF9mcmVlLCBQRUNJKTsNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZWNpL3N5c2ZzLmMgYi9kcml2ZXJzL3BlY2kvc3lzZnMuYw0K
PiA+IGluZGV4IDM2YzVlMmExOGE5Mi4uZGI5ZWYwNTc3NmUzIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvcGVjaS9zeXNmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9wZWNpL3N5c2ZzLmMNCj4gPiBA
QCAtMSw2ICsxLDggQEANCj4gPiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5DQo+ID4gLy8gQ29weXJpZ2h0IChjKSAyMDIxIEludGVsIENvcnBvcmF0aW9uDQo+ID4gDQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPg0KPiA+ICNpbmNsdWRlIDxsaW51eC9wZWNpLmg+DQo+ID4gDQo+ID4gI2luY2x1ZGUgImlu
dGVybmFsLmgiDQo+ID4gQEAgLTQ2LDMgKzQ4LDM1IEBAIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVf
Z3JvdXAgKnBlY2lfYnVzX2dyb3Vwc1tdID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAmcGVjaV9i
dXNfZ3JvdXAsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoE5VTEwNCj4gPiB9Ow0KPiA+ICsNCj4gPiAr
c3RhdGljIHNzaXplX3QgcmVtb3ZlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUNCj4gPiAqYXR0ciwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3Vu
dCkNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBwZWNpX2RldmljZSAqZGV2aWNl
ID0gdG9fcGVjaV9kZXZpY2UoZGV2KTsNCj4gPiArwqDCoMKgwqDCoMKgwqBib29sIHJlczsNCj4g
PiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXQg
PSBrc3RydG9ib29sKGJ1ZiwgJnJlcyk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKHJlcyAmJiBkZXZpY2VfcmVtb3ZlX2ZpbGVfc2VsZihkZXYsIGF0
dHIpKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZWNpX2RldmljZV9kZXN0
cm95KGRldmljZSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBjb3VudDsNCj4g
PiArfQ0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfSUdOT1JFX0xPQ0tERVAocmVtb3ZlLCAwMjAw
LCBOVUxMLCByZW1vdmVfc3RvcmUpOw0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1
dGUgKnBlY2lfZGV2aWNlX2F0dHJzW10gPSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgJmRldl9hdHRy
X3JlbW92ZS5hdHRyLA0KPiA+ICvCoMKgwqDCoMKgwqDCoE5VTEwNCj4gPiArfTsNCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIHBlY2lfZGV2aWNlX2dyb3Vw
ID0gew0KPiA+ICvCoMKgwqDCoMKgwqDCoC5hdHRycyA9IHBlY2lfZGV2aWNlX2F0dHJzLA0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqcGVjaV9kZXZp
Y2VfZ3JvdXBzW10gPSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgJnBlY2lfZGV2aWNlX2dyb3VwLA0K
PiA+ICvCoMKgwqDCoMKgwqDCoE5VTEwNCj4gPiArfTsNCj4gPiAtLSANCj4gPiAyLjMxLjENCg0K

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DF042C4C
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2019 18:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408103AbfFLQal (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Jun 2019 12:30:41 -0400
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:59883
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405901AbfFLQal (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Jun 2019 12:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncffr8ucm/9RwM9/2pyUDUeJp+BVq2pphMnhUfpcM6Y=;
 b=pRLRf+XNxm3uE8xmMwk8Dg4e1gzmD6Gr8/88mloKrvMiadmeIySIsS3MZZuygzx9bKgCEAfpXsMyLl0aNSuGB2uDx8/RucAsdHNCq0h6NI/TU0gMpUiYXxRKfi000i52lpHb+JeEmTwocQISME98RmqD0cBvmXeJjg3nP7AY/Vc=
Received: from VE1PR08MB4637.eurprd08.prod.outlook.com (10.255.27.14) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.112.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 16:30:35 +0000
Received: from VE1PR08MB4637.eurprd08.prod.outlook.com
 ([fe80::6574:1efb:6972:2b37]) by VE1PR08MB4637.eurprd08.prod.outlook.com
 ([fe80::6574:1efb:6972:2b37%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 16:30:35 +0000
From:   Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To:     Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     nd <nd@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>,
        Will Deacon <Will.Deacon@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v4 1/2] arm64: Define
 Documentation/arm64/tagged-address-abi.txt
Thread-Topic: [PATCH v4 1/2] arm64: Define
 Documentation/arm64/tagged-address-abi.txt
Thread-Index: AQHVIS/jNTMPiNHftkW5Mto9lMl3oKaYNfCA
Date:   Wed, 12 Jun 2019 16:30:34 +0000
Message-ID: <a90da586-8ff6-4bed-d940-9306d517a18c@arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <20190612142111.28161-1-vincenzo.frascino@arm.com>
 <20190612142111.28161-2-vincenzo.frascino@arm.com>
In-Reply-To: <20190612142111.28161-2-vincenzo.frascino@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P265CA0447.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::27) To VE1PR08MB4637.eurprd08.prod.outlook.com
 (2603:10a6:802:b1::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Szabolcs.Nagy@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbf6d76f-efbe-4260-e688-08d6ef534b80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB4799;
x-ms-traffictypediagnostic: VE1PR08MB4799:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB47998090B67B43085F32CBD3EDEC0@VE1PR08MB4799.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(386003)(64126003)(66066001)(229853002)(25786009)(65806001)(6512007)(66476007)(66446008)(81166006)(26005)(66946007)(58126008)(73956011)(64756008)(8936002)(256004)(3846002)(66556008)(6116002)(102836004)(31686004)(81156014)(4326008)(6246003)(99286004)(6486002)(2906002)(53936002)(71200400001)(71190400001)(36756003)(76176011)(6506007)(53546011)(52116002)(6436002)(14454004)(305945005)(486006)(8676002)(476003)(14444005)(478600001)(44832011)(68736007)(31696002)(316002)(110136005)(186003)(446003)(7736002)(54906003)(86362001)(2616005)(11346002)(72206003)(2201001)(65826007)(2501003)(5660300002)(65956001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4799;H:VE1PR08MB4637.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qGopdaSsNzczqizDbqa+McsMu1mGevfKHFAMAie4WTruLkO+bO4oncXDpHeQ+sM+9Of9VZVu65MKii52lL4zgWYktkrPTIFAovR5S0PVSXVbAvSzpS3bZXZdbWR+4A1pRYno4fKM4aj1RsHUme6Tsyyf/W7SZQfioQthg9c5ZtgN1XoDHIx/p8EOAK8KaCWUAXTj2y4JbVpzKX7bn/iSMVrVoXMjL683NORtOGtmMNbOUizWQjbb+H8cUsgx8AC64CDMs1gqcyI8+v8x4AEjfA5YRqJxTcgrASdtRhlMTKKeBFa9Jyv7t4M9H1yBOwGBL7nAZb0b0H63SSGD+8wxJdbbc6nf8USdl/DnB/GkPKHAMN2HipUlPnZgs3rZxFGI3b60/f+NpF20Xp+f0hsFn5G9NjtWb4qWbPFUMzPb3Yk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17BB69DB38AF7C4FA55AEAE05410EF68@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf6d76f-efbe-4260-e688-08d6ef534b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 16:30:35.0095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Szabolcs.Nagy@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gMTIvMDYvMjAxOSAxNToyMSwgVmluY2Vuem8gRnJhc2Npbm8gd3JvdGU6DQo+IE9uIGFybTY0
IHRoZSBUQ1JfRUwxLlRCSTAgYml0IGhhcyBiZWVuIGFsd2F5cyBlbmFibGVkIGhlbmNlDQo+IHRo
ZSB1c2Vyc3BhY2UgKEVMMCkgaXMgYWxsb3dlZCB0byBzZXQgYSBub24temVybyB2YWx1ZSBpbiB0
aGUNCj4gdG9wIGJ5dGUgYnV0IHRoZSByZXN1bHRpbmcgcG9pbnRlcnMgYXJlIG5vdCBhbGxvd2Vk
IGF0IHRoZQ0KPiB1c2VyLWtlcm5lbCBzeXNjYWxsIEFCSSBib3VuZGFyeS4NCj4gDQo+IFdpdGgg
dGhlIHJlbGF4ZWQgQUJJIHByb3Bvc2VkIHRocm91Z2ggdGhpcyBkb2N1bWVudCwgaXQgaXMgbm93
IHBvc3NpYmxlDQo+IHRvIHBhc3MgdGFnZ2VkIHBvaW50ZXJzIHRvIHRoZSBzeXNjYWxscywgd2hl
biB0aGVzZSBwb2ludGVycyBhcmUgaW4NCj4gbWVtb3J5IHJhbmdlcyBvYnRhaW5lZCBieSBhbiBh
bm9ueW1vdXMgKE1BUF9BTk9OWU1PVVMpIG1tYXAoKS4NCj4gDQo+IFRoaXMgY2hhbmdlIGluIHRo
ZSBBQkkgcmVxdWlyZXMgYSBtZWNoYW5pc20gdG8gcmVxdWlyZXMgdGhlIHVzZXJzcGFjZQ0KPiB0
byBvcHQtaW4gdG8gc3VjaCBhbiBvcHRpb24uDQo+IA0KPiBTcGVjaWZ5IGFuZCBkb2N1bWVudCB0
aGUgd2F5IGluIHdoaWNoIHN5c2N0bCBhbmQgcHJjdGwoKSBjYW4gYmUgdXNlZA0KPiBpbiBjb21i
aW5hdGlvbiB0byBhbGxvdyB0aGUgdXNlcnNwYWNlIHRvIG9wdC1pbiB0aGlzIGZlYXR1cmUuDQo+
IA0KPiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4NCj4gQ2M6
IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNvbkBhcm0uY29tPg0KPiBDQzogQW5kcmV5IEtvbm92YWxv
diA8YW5kcmV5a252bEBnb29nbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW56byBGcmFz
Y2lubyA8dmluY2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9u
L2FybTY0L3RhZ2dlZC1hZGRyZXNzLWFiaS50eHQgfCAxMTEgKysrKysrKysrKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTExIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2FybTY0L3RhZ2dlZC1hZGRyZXNzLWFiaS50eHQNCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FybTY0L3RhZ2dlZC1hZGRyZXNzLWFiaS50eHQgYi9E
b2N1bWVudGF0aW9uL2FybTY0L3RhZ2dlZC1hZGRyZXNzLWFiaS50eHQNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi45NmUxNDllMmM1NWMNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FybTY0L3RhZ2dlZC1hZGRyZXNzLWFiaS50eHQN
Cj4gQEAgLTAsMCArMSwxMTEgQEANCj4gK0FSTTY0IFRBR0dFRCBBRERSRVNTIEFCSQ0KPiArPT09
PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRo
ZSB1c2FnZSBhbmQgc2VtYW50aWNzIG9mIHRoZSBUYWdnZWQgQWRkcmVzcw0KPiArQUJJIG9uIGFy
bTY0Lg0KPiArDQo+ICsxLiBJbnRyb2R1Y3Rpb24NCj4gKy0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+
ICtPbiBhcm02NCB0aGUgVENSX0VMMS5UQkkwIGJpdCBoYXMgYmVlbiBhbHdheXMgZW5hYmxlZCBv
biB0aGUgYXJtNjQga2VybmVsLA0KPiAraGVuY2UgdGhlIHVzZXJzcGFjZSAoRUwwKSBpcyBhbGxv
d2VkIHRvIHNldCBhIG5vbi16ZXJvIHZhbHVlIGluIHRoZSB0b3ANCj4gK2J5dGUgYnV0IHRoZSBy
ZXN1bHRpbmcgcG9pbnRlcnMgYXJlIG5vdCBhbGxvd2VkIGF0IHRoZSB1c2VyLWtlcm5lbCBzeXNj
YWxsDQo+ICtBQkkgYm91bmRhcnkuDQo+ICsNCj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIGEg
cmVsYXhhdGlvbiBvZiB0aGUgQUJJIHdpdGggd2hpY2ggaXQgaXMgcG9zc2libGUNCj4gK3RvIHBh
c3MgdGFnZ2VkIHRhZ2dlZCBwb2ludGVycyB0byB0aGUgc3lzY2FsbHMsIHdoZW4gdGhlc2UgcG9p
bnRlcnMgYXJlIGluDQogICAgICAgICAgIF5eXl5eXl5eXl5eXl4NCnR5cG8uDQoNCj4gK21lbW9y
eSByYW5nZXMgb2J0YWluZWQgYXMgZGVzY3JpYmVkIGluIHBhcmFncmFwaCAyLg0KPiArDQo+ICtT
aW5jZSBpdCBpcyBub3QgZGVzaXJhYmxlIHRvIHJlbGF4IHRoZSBBQkkgdG8gYWxsb3cgdGFnZ2Vk
IHVzZXIgYWRkcmVzc2VzDQo+ICtpbnRvIHRoZSBrZXJuZWwgaW5kaXNjcmltaW5hdGVseSwgYXJt
NjQgcHJvdmlkZXMgYSBuZXcgc3lzY3RsIGludGVyZmFjZQ0KPiArKC9wcm9jL3N5cy9hYmkvdGFn
Z2VkX2FkZHIpIHRoYXQgaXMgdXNlZCB0byBwcmV2ZW50IHRoZSBhcHBsaWNhdGlvbnMgZnJvbQ0K
PiArZW5hYmxpbmcgdGhlIHJlbGF4ZWQgQUJJIGFuZCBhIG5ldyBwcmN0bCgpIGludGVyZmFjZSB0
aGF0IGNhbiBiZSB1c2VkIHRvDQo+ICtlbmFibGUgb3IgZGlzYWJsZSB0aGUgcmVsYXhlZCBBQkku
DQo+ICsNCj4gK1RoZSBzeXNjdGwgaXMgbWVhbnQgYWxzbyBmb3IgdGVzdGluZyBwdXJwb3NlcyBp
biBvcmRlciB0byBwcm92aWRlIGEgc2ltcGxlDQo+ICt3YXkgZm9yIHRoZSB1c2Vyc3BhY2UgdG8g
dmVyaWZ5IHRoZSByZXR1cm4gZXJyb3IgY2hlY2tpbmcgb2YgdGhlIHByY3RsKCkNCj4gK2NvbW1h
bmQgd2l0aG91dCBoYXZpbmcgdG8gcmVjb25maWd1cmUgdGhlIGtlcm5lbC4NCj4gKw0KPiArVGhl
IEFCSSBwcm9wZXJ0aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0aGUgc2FtZSBhcHBs
aWNhdGlvbiBhbmQNCj4gK2ZvcmsoKSdlZCBjaGlsZHJlbiBidXQgY2xlYXJlZCB3aGVuIGEgbmV3
IHByb2Nlc3MgaXMgc3Bhd24gKGV4ZWN2ZSgpKS4NCg0KT0suDQoNCj4gKw0KPiArMi4gQVJNNjQg
VGFnZ2VkIEFkZHJlc3MgQUJJDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0K
PiArRnJvbSB0aGUga2VybmVsIHN5c2NhbGwgaW50ZXJmYWNlIHByb3NwZWN0aXZlLCB3ZSBkZWZp
bmUsIGZvciB0aGUgcHVycG9zZXMNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeXl5eXl5eXl5eXg0KcGVyc3BlY3RpdmUNCg0KPiArb2YgdGhpcyBkb2N1bWVudCwgYSAidmFs
aWQgdGFnZ2VkIHBvaW50ZXIiIGFzIGEgcG9pbnRlciB0aGF0IGVpdGhlciBpdCBoYXMNCj4gK2Eg
emVybyB2YWx1ZSBzZXQgaW4gdGhlIHRvcCBieXRlIG9yIGl0IGhhcyBhIG5vbi16ZXJvIHZhbHVl
LCBpdCBpcyBpbiBtZW1vcnkNCj4gK3JhbmdlcyBwcml2YXRlbHkgb3duZWQgYnkgYSB1c2Vyc3Bh
Y2UgcHJvY2VzcyBhbmQgaXQgaXMgb2J0YWluZWQgaW4gb25lIG9mDQo+ICt0aGUgZm9sbG93aW5n
IHdheXM6DQo+ICsgIC0gbW1hcCgpIGRvbmUgYnkgdGhlIHByb2Nlc3MgaXRzZWxmLCB3aGVyZSBl
aXRoZXI6DQo+ICsgICAgKiBmbGFncyA9IE1BUF9QUklWQVRFIHwgTUFQX0FOT05ZTU9VUw0KPiAr
ICAgICogZmxhZ3MgPSBNQVBfUFJJVkFURSBhbmQgdGhlIGZpbGUgZGVzY3JpcHRvciByZWZlcnMg
dG8gYSByZWd1bGFyDQo+ICsgICAgICBmaWxlIG9yICIvZGV2L3plcm8iDQoNCnRoaXMgZG9lcyBu
b3QgbWFrZSBpdCBjbGVhciBpZiBNQVBfRklYRUQgb3Igb3RoZXINCmZsYWdzIGFyZSB2YWxpZCAo
dGhlcmUgYXJlIG1hbnkgbWFwIGZsYWdzIGkgZG9uJ3QNCmtub3csIGJ1dCBhdCBsZWFzdCBmaXhl
ZCBzaG91bGQgd29yayBhbmQgc3RhY2svZ3Jvd3Nkb3duLg0KaSdkIGV4cGVjdCBhbnl0aGluZyB0
aGF0J3Mgbm90IGluY29tcGF0aWJsZSB3aXRoDQpwcml2YXRlfGFub24gdG8gd29yaykuDQoNCj4g
KyAgLSBhIG1hcHBpbmcgYmVsb3cgc2JyaygwKSBkb25lIGJ5IHRoZSBwcm9jZXNzIGl0c2VsZg0K
DQpkb2Vzbid0IHRoZSBtbWFwIHJ1bGUgY292ZXIgdGhpcz8NCg0KPiArICAtIGFueSBtZW1vcnkg
bWFwcGVkIGJ5IHRoZSBrZXJuZWwgaW4gdGhlIHByb2Nlc3MncyBhZGRyZXNzIHNwYWNlIGR1cmlu
Zw0KPiArICAgIGNyZWF0aW9uIGFuZCBmb2xsb3dpbmcgdGhlIHJlc3RyaWN0aW9ucyBwcmVzZW50
ZWQgYWJvdmUgKGkuZS4gZGF0YSwgYnNzLA0KPiArICAgIHN0YWNrKS4NCg0KT0suDQoNCkNhbiBh
IG51bGwgcG9pbnRlciBoYXZlIGEgdGFnPw0KKGluIGNhc2UgTlVMTCBpcyB2YWxpZCB0byBwYXNz
IHRvIGEgc3lzY2FsbCkNCg0KPiArDQo+ICtUaGUgQVJNNjQgVGFnZ2VkIEFkZHJlc3MgQUJJIGlz
IGFuIG9wdC1pbiBmZWF0dXJlLCBhbmQgYW4gYXBwbGljYXRpb24gY2FuDQo+ICtjb250cm9sIGl0
IHVzaW5nIHRoZSBmb2xsb3dpbmcgcHJjdGwoKXM6DQo+ICsgIC0gUFJfU0VUX1RBR0dFRF9BRERS
X0NUUkw6IGNhbiBiZSB1c2VkIHRvIGVuYWJsZSB0aGUgVGFnZ2VkIEFkZHJlc3MgQUJJLg0KPiAr
ICAtIFBSX0dFVF9UQUdHRURfQUREUl9DVFJMOiBjYW4gYmUgdXNlZCB0byBjaGVjayB0aGUgc3Rh
dHVzIG9mIHRoZSBUYWdnZWQNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQWRkcmVz
cyBBQkkuDQo+ICsNCj4gK0FzIGEgY29uc2VxdWVuY2Ugb2YgaW52b2tpbmcgUFJfU0VUX1RBR0dF
RF9BRERSX0NUUkwgcHJjdGwoKSBieSBhbiBhcHBsaWNhdGlvbnMsDQo+ICt0aGUgQUJJIGd1YXJh
bnRlZXMgdGhlIGZvbGxvd2luZyBiZWhhdmlvdXJzOg0KPiArDQo+ICsgIC0gRXZlcnkgY3VycmVu
dCBvciBuZXdseSBpbnRyb2R1Y2VkIHN5c2NhbGwgY2FuIGFjY2VwdCBhbnkgdmFsaWQgdGFnZ2Vk
DQo+ICsgICAgcG9pbnRlcnMuDQo+ICsNCj4gKyAgLSBJZiBhIG5vbiB2YWxpZCB0YWdnZWQgcG9p
bnRlciBpcyBwYXNzZWQgdG8gYSBzeXNjYWxsIHRoZW4gdGhlIGJlaGF2aW91cg0KPiArICAgIGlz
IHVuZGVmaW5lZC4NCj4gKw0KPiArICAtIEV2ZXJ5IHZhbGlkIHRhZ2dlZCBwb2ludGVyIGlzIGV4
cGVjdGVkIHRvIHdvcmsgYXMgYW4gdW50YWdnZWQgb25lLg0KPiArDQo+ICsgIC0gVGhlIGtlcm5l
bCBwcmVzZXJ2ZXMgYW55IHZhbGlkIHRhZ2dlZCBwb2ludGVycyBhbmQgcmV0dXJucyB0aGVtIHRv
IHRoZQ0KPiArICAgIHVzZXJzcGFjZSB1bmNoYW5nZWQgaW4gYWxsIHRoZSBjYXNlcyBleGNlcHQg
dGhlIG9uZXMgZG9jdW1lbnRlZCBpbiB0aGUNCj4gKyAgICAiUHJlc2VydmluZyB0YWdzIiBwYXJh
Z3JhcGggb2YgdGFnZ2VkLXBvaW50ZXJzLnR4dC4NCg0KT0suDQoNCmkgZ3Vlc3MgcG9pbnRlcnMg
b2YgYW5vdGhlciBwcm9jZXNzIGFyZSBub3QgInZhbGlkIHRhZ2dlZA0KcG9pbnRlcnMiIGZvciB0
aGUgY3VycmVudCBvbmUsIHNvIGUuZy4gaW4gcHRyYWNlIHRoZQ0KcHRyYWNlciBoYXMgdG8gY2xl
YXIgdGhlIHRhZ3MgYmVmb3JlIFBFRUsgZXRjLg0KDQo+ICsNCj4gK0EgZGVmaW5pdGlvbiBvZiB0
aGUgbWVhbmluZyBvZiB0YWdnZWQgcG9pbnRlcnMgb24gYXJtNjQgY2FuIGJlIGZvdW5kIGluOg0K
PiArRG9jdW1lbnRhdGlvbi9hcm02NC90YWdnZWQtcG9pbnRlcnMudHh0Lg0KPiArDQo+ICszLiBB
Uk02NCBUYWdnZWQgQWRkcmVzcyBBQkkgRXhjZXB0aW9ucw0KPiArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiArVGhlIGJlaGF2aW91cnMgZGVzY3JpYmVkIGlu
IHBhcmFncmFwaCAyLCB3aXRoIHBhcnRpY3VsYXIgcmVmZXJlbmNlIHRvIHRoZQ0KPiArYWNjZXB0
YW5jZSBieSB0aGUgc3lzY2FsbHMgb2YgYW55IHZhbGlkIHRhZ2dlZCBwb2ludGVyIGFyZSBub3Qg
YXBwbGljYWJsZQ0KPiArdG8gdGhlIGZvbGxvd2luZyBjYXNlczoNCj4gKyAgLSBtbWFwKCkgYWRk
ciBwYXJhbWV0ZXIuDQo+ICsgIC0gbXJlbWFwKCkgbmV3X2FkZHJlc3MgcGFyYW1ldGVyLg0KPiAr
ICAtIHByY3RsX3NldF9tbSgpIHN0cnVjdCBwcmN0bF9tYXAgZmllbGRzLg0KPiArICAtIHByY3Rs
X3NldF9tbV9tYXAoKSBzdHJ1Y3QgcHJjdGxfbWFwIGZpZWxkcy4NCg0KaSBkb24ndCB1bmRlcnN0
YW5kIHRoZSBleGNlcHRpb246IGRvZXMgaXQgbWVhbg0KdGhhdCBwYXNzaW5nIGEgdGFnZ2VkIGFk
ZHJlc3MgdG8gdGhlc2Ugc3lzY2FsbHMNCmlzIHVuZGVmaW5lZD8NCg0KPiArDQo+ICs0LiBFeGFt
cGxlIG9mIGNvcnJlY3QgdXNhZ2UNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAr
DQo+ICt2b2lkIG1haW4odm9pZCkNCj4gK3sNCj4gKwlzdGF0aWMgaW50IHRiaV9lbmFibGVkID0g
MDsNCj4gKwl1bnNpZ25lZCBsb25nIHRhZyA9IDA7DQo+ICsNCj4gKwljaGFyICpwdHIgPSBtbWFw
KE5VTEwsIFBBR0VfU0laRSwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwNCj4gKwkJCSBNQVBfQU5P
TllNT1VTLCAtMSwgMCk7DQo+ICsNCj4gKwlpZiAocHJjdGwoUFJfU0VUX1RBR0dFRF9BRERSX0NU
UkwsIFBSX1RBR0dFRF9BRERSX0VOQUJMRSwNCj4gKwkJICAwLCAwLCAwKSA9PSAwKQ0KPiArCQl0
YmlfZW5hYmxlZCA9IDE7DQo+ICsNCj4gKwlpZiAoIXB0cikNCj4gKwkJcmV0dXJuIC0xOw0KDQpt
bWFwIHJldHVybnMgTUFQX0ZBSUxFRCBvbiBmYWlsdXJlLg0KDQo+ICsNCj4gKwlpZiAodGJpX2Vu
YWJsZWQpDQo+ICsJCXRhZyA9IHJhbmQoKSAmIDB4ZmY7DQo+ICsNCj4gKwlwdHIgPSAoY2hhciAq
KSgodW5zaWduZWQgbG9uZylwdHIgfCAodGFnIDw8IFRBR19TSElGVCkpOw0KPiArDQo+ICsJKnB0
ciA9ICdhJzsNCj4gKw0KPiArCS4uLg0KPiArfQ0KPiArDQo+IA0KDQo=

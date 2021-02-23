Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10FF322724
	for <lists+linux-doc@lfdr.de>; Tue, 23 Feb 2021 09:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhBWIhF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Feb 2021 03:37:05 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2907 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbhBWIhD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 03:37:03 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DlC5R23nvz5Ttb;
        Tue, 23 Feb 2021 16:34:19 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 23 Feb 2021 16:36:18 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 23 Feb 2021 16:36:18 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Tue, 23 Feb 2021 16:36:18 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [PATCH] scripts/gdb: document lx_current is only supported by x86
Thread-Topic: [PATCH] scripts/gdb: document lx_current is only supported by
 x86
Thread-Index: AQHXCJpVC2mxTpeLEU+cRe9pw7RQHqpjfh0AgAEkrZCAADBbAIAAlNTQ
Date:   Tue, 23 Feb 2021 08:36:18 +0000
Message-ID: <36dd33e32631405fb5635f764d361a9e@hisilicon.com>
References: <20210221213527.22076-1-song.bao.hua@hisilicon.com>
 <eac66671-f083-379a-c7b0-04b783e32d63@ideasonboard.com>
 <eb48406902a84282a400846607e7a37a@hisilicon.com>
 <940e936d-d35b-105c-201c-8f2126222d15@siemens.com>
In-Reply-To: <940e936d-d35b-105c-201c-8f2126222d15@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEtpc3prYSBbbWFp
bHRvOmphbi5raXN6a2FAc2llbWVucy5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDIz
LCAyMDIxIDg6MjcgUE0NCj4gVG86IFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykgPHNvbmcuYmFv
Lmh1YUBoaXNpbGljb24uY29tPjsNCj4ga2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbTsg
Y29yYmV0QGx3bi5uZXQ7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4YXJtQG9wZW5ldWxlci5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gc2NyaXB0cy9nZGI6IGRvY3VtZW50IGx4X2N1cnJlbnQgaXMgb25seSBzdXBw
b3J0ZWQgYnkgeDg2DQo+IA0KPiBPbiAyMi4wMi4yMSAyMjoxOCwgU29uZyBCYW8gSHVhIChCYXJy
eSBTb25nKSB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IEtpZXJhbiBCaW5naGFtIFttYWlsdG86a2llcmFuLmJpbmdoYW1AaWRlYXNv
bmJvYXJkLmNvbV0NCj4gPj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjMsIDIwMjEgMTI6MDYg
QU0NCj4gPj4gVG86IFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykgPHNvbmcuYmFvLmh1YUBoaXNp
bGljb24uY29tPjsgY29yYmV0QGx3bi5uZXQ7DQo+ID4+IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5v
cmc7IGphbi5raXN6a2FAc2llbWVucy5jb20NCj4gPj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4YXJtQG9wZW5ldWxlci5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gc2NyaXB0cy9nZGI6IGRvY3VtZW50IGx4X2N1cnJlbnQgaXMgb25seSBzdXBwb3J0ZWQgYnkN
Cj4geDg2DQo+ID4+DQo+ID4+IEhpIEJhcnJ5DQo+ID4+DQo+ID4+IE9uIDIxLzAyLzIwMjEgMjE6
MzUsIEJhcnJ5IFNvbmcgd3JvdGU6DQo+ID4+PiBseF9jdXJyZW50IGRlcGVuZHMgb24gdGhlIHBl
cl9jcHUgY3VycmVudF90YXNrIHdoaWNoIGV4aXN0cyBvbiB4ODYgb25seToNCj4gPj4+DQo+ID4+
PiBhcmNoJCBnaXQgZ3JlcCBjdXJyZW50X3Rhc2sgfCBncmVwIC1pIHBlcl9jcHUNCj4gPj4+IHg4
Ni9pbmNsdWRlL2FzbS9jdXJyZW50Lmg6REVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0YXNrX3N0cnVj
dCAqLA0KPiA+PiBjdXJyZW50X3Rhc2spOw0KPiA+Pj4geDg2L2tlcm5lbC9jcHUvY29tbW9uLmM6
REVGSU5FX1BFUl9DUFUoc3RydWN0IHRhc2tfc3RydWN0ICosDQo+IGN1cnJlbnRfdGFzaykNCj4g
Pj4gX19fX2NhY2hlbGluZV9hbGlnbmVkID0NCj4gPj4+IHg4Ni9rZXJuZWwvY3B1L2NvbW1vbi5j
OkVYUE9SVF9QRVJfQ1BVX1NZTUJPTChjdXJyZW50X3Rhc2spOw0KPiA+Pj4geDg2L2tlcm5lbC9j
cHUvY29tbW9uLmM6REVGSU5FX1BFUl9DUFUoc3RydWN0IHRhc2tfc3RydWN0ICosDQo+IGN1cnJl
bnRfdGFzaykNCj4gPj4gPSAmaW5pdF90YXNrOw0KPiA+Pj4geDg2L2tlcm5lbC9jcHUvY29tbW9u
LmM6RVhQT1JUX1BFUl9DUFVfU1lNQk9MKGN1cnJlbnRfdGFzayk7DQo+ID4+PiB4ODYva2VybmVs
L3NtcGJvb3QuYzoJcGVyX2NwdShjdXJyZW50X3Rhc2ssIGNwdSkgPSBpZGxlOw0KPiA+Pj4NCj4g
Pj4+IE9uIG90aGVyIGFyY2hpdGVjdHVyZXMsIGx4X2N1cnJlbnQoKSB3aWxsIGxlYWQgdG8gYSBw
eXRob24gZXhjZXB0aW9uOg0KPiA+Pj4gKGdkYikgcCAkbHhfY3VycmVudCgpLnBpZA0KPiA+Pj4g
UHl0aG9uIEV4Y2VwdGlvbiA8Y2xhc3MgJ2dkYi5lcnJvcic+IE5vIHN5bWJvbCAiY3VycmVudF90
YXNrIiBpbiBjdXJyZW50DQo+ID4+IGNvbnRleHQuOg0KPiA+Pj4gRXJyb3Igb2NjdXJyZWQgaW4g
UHl0aG9uOiBObyBzeW1ib2wgImN1cnJlbnRfdGFzayIgaW4gY3VycmVudCBjb250ZXh0Lg0KPiA+
Pj4NCj4gPj4+IFRvIGF2b2lkIG1vcmUgcGVvcGxlIHN0cnVnZ2xpbmcgYW5kIHdhc3RpbmcgdGlt
ZSBpbiBvdGhlciBhcmNoaXRlY3R1cmVzLA0KPiA+Pj4gZG9jdW1lbnQgaXQuDQo+ID4+Pg0KPiA+
Pj4gQ2M6IEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+DQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBCYXJyeSBTb25nIDxzb25nLmJhby5odWFAaGlzaWxpY29uLmNvbT4NCj4gPj4+IC0t
LQ0KPiA+Pj4gIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2dkYi1rZXJuZWwtZGVidWdnaW5nLnJz
dCB8ICAyICstDQo+ID4+PiAgc2NyaXB0cy9nZGIvbGludXgvY3B1cy5weSAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTAgKysrKysrKystLQ0KPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2Rldi10b29scy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QNCj4gPj4gYi9Eb2N1
bWVudGF0aW9uL2Rldi10b29scy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QNCj4gPj4+IGluZGV4
IDQ3NTZmNmIzYTA0ZS4uMTU4NjkwMWI2ODNjIDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMvZ2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0DQo+ID4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2Rldi10b29scy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QNCj4gPj4+IEBAIC0x
MTQsNyArMTE0LDcgQEAgRXhhbXBsZXMgb2YgdXNpbmcgdGhlIExpbnV4LXByb3ZpZGVkIGdkYiBo
ZWxwZXJzDQo+ID4+PiAgICAgIFsgICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0NCj4gMHgw
MDAwMDAwMDAwMDlmYzAwLTB4MDAwMDAwMDAwMDA5ZmZmZl0NCj4gPj4gcmVzZXJ2ZWQNCj4gPj4+
ICAgICAgLi4uLg0KPiA+Pj4NCj4gPj4+IC0tIEV4YW1pbmUgZmllbGRzIG9mIHRoZSBjdXJyZW50
IHRhc2sgc3RydWN0OjoNCj4gPj4+ICstIEV4YW1pbmUgZmllbGRzIG9mIHRoZSBjdXJyZW50IHRh
c2sgc3RydWN0KHN1cHBvcnRlZCBieSB4ODYgb25seSk6Og0KPiA+Pj4NCj4gPj4+ICAgICAgKGdk
YikgcCAkbHhfY3VycmVudCgpLnBpZA0KPiA+Pj4gICAgICAkMSA9IDQ5OTgNCj4gPj4+IGRpZmYg
LS1naXQgYS9zY3JpcHRzL2dkYi9saW51eC9jcHVzLnB5IGIvc2NyaXB0cy9nZGIvbGludXgvY3B1
cy5weQ0KPiA+Pj4gaW5kZXggMDA4ZTYyZjMxOTBkLi5mMzgyNzYyNTA5ZDMgMTAwNjQ0DQo+ID4+
PiAtLS0gYS9zY3JpcHRzL2dkYi9saW51eC9jcHVzLnB5DQo+ID4+PiArKysgYi9zY3JpcHRzL2dk
Yi9saW51eC9jcHVzLnB5DQo+ID4+PiBAQCAtMTU2LDYgKzE1NiwxMyBAQCBOb3RlIHRoYXQgVkFS
IGhhcyB0byBiZSBxdW90ZWQgYXMgc3RyaW5nLiIiIg0KPiA+Pj4NCj4gPj4+ICBQZXJDcHUoKQ0K
PiA+Pj4NCj4gPj4+ICtkZWYgZ2V0X2N1cnJlbnRfdGFzayhjcHUpOg0KPiA+Pj4gKyAgICBpZiB1
dGlscy5pc190YXJnZXRfYXJjaCgieDg2Iik6DQo+ID4+PiArICAgICAgICAgdmFyX3B0ciA9IGdk
Yi5wYXJzZV9hbmRfZXZhbCgiJmN1cnJlbnRfdGFzayIpDQo+ID4+PiArICAgICAgICAgcmV0dXJu
IHBlcl9jcHUodmFyX3B0ciwgY3B1KS5kZXJlZmVyZW5jZSgpDQo+ID4+PiArICAgIGVsc2U6DQo+
ID4+PiArICAgICAgICByYWlzZSBnZGIuR2RiRXJyb3IoIlNvcnJ5LCBvYnRhaW5pbmcgdGhlIGN1
cnJlbnQgdGFzayBpcyBub3QgeWV0DQo+ICINCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAic3VwcG9ydGVkIHdpdGggdGhpcyBhcmNoIikNCj4gPj4NCj4gPj4gSSd2ZSB3b25kZXJl
ZCBpbiB0aGUgcGFzdCBob3cgd2Ugc2hvdWxkIGhhbmRsZSB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNp
ZmljDQo+ID4+IGxheWVycy4NCj4gPj4NCj4gPj4gUGVyaGFwcyB3ZSBuZWVkIHRvIGhhdmUgYW4g
aW50ZXJmYWNlIG9mIGZ1bmN0aW9uYWxpdHkgdG8gaW1wbGVtZW50IG9uDQo+ID4+IGVhY2ggYXJj
aGl0ZWN0dXJlIHNvIHRoYXQgd2UgY2FuIGNyZWF0ZSBhIHBlci1hcmNoIHNldCBvZiBoZWxwZXJz
Lg0KPiA+Pg0KPiA+PiBvciBicmVhayBpdCB1cCBpbnRvIGFyY2ggc3BlY2lmaWMgc3ViZGlycyBh
dCBsZWFzdC4uLg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gIGNsYXNzIEx4Q3VycmVudEZ1bmMoZ2RiLkZ1
bmN0aW9uKToNCj4gPj4+ICAgICAgIiIiUmV0dXJuIGN1cnJlbnQgdGFzay4NCj4gPj4+IEBAIC0x
NjcsOCArMTc0LDcgQEAgbnVtYmVyLiBJZiBDUFUgaXMgb21pdHRlZCwgdGhlIENQVSBvZiB0aGUg
Y3VycmVudCBjb250ZXh0DQo+ID4+IGlzIHVzZWQuIiIiDQo+ID4+PiAgICAgICAgICBzdXBlcihM
eEN1cnJlbnRGdW5jLCBzZWxmKS5fX2luaXRfXygibHhfY3VycmVudCIpDQo+ID4+Pg0KPiA+Pj4g
ICAgICBkZWYgaW52b2tlKHNlbGYsIGNwdT0tMSk6DQo+ID4+PiAtICAgICAgICB2YXJfcHRyID0g
Z2RiLnBhcnNlX2FuZF9ldmFsKCImY3VycmVudF90YXNrIikNCj4gPj4+IC0gICAgICAgIHJldHVy
biBwZXJfY3B1KHZhcl9wdHIsIGNwdSkuZGVyZWZlcmVuY2UoKQ0KPiA+Pj4gKyAgICAgICAgcmV0
dXJuIGdldF9jdXJyZW50X3Rhc2soY3B1KQ0KPiA+Pj4NCj4gPj4NCj4gPj4gQW5kIHRoZW4gcGVy
aGFwcyB3ZSBzaW1wbHkgc2hvdWxkbid0IGV2ZW4gZXhwb3NlIGNvbW1hbmRzIHdoaWNoIGNhbiBu
b3QNCj4gPj4gYmUgc3VwcG9ydGVkIG9uIHRob3NlIGFyY2hpdGVjdHVyZXM/DQo+ID4NCj4gPiBJ
IGZlZWwgaXQgaXMgYmV0dGVyIHRvIHRlbGwgdXNlcnMgdGhpcyBmdW5jdGlvbiBpcyBub3Qgc3Vw
cG9ydGVkIG9uIGl0cyBhcmNoDQo+ID4gdGhhbiBzaW1wbHkgaGlkaW5nIHRoZSBmdW5jdGlvbi4N
Cj4gPg0KPiA+IElmIHdlIGhpZGUgaXQsIHVzZXJzIHN0aWxsIGhhdmUgbWFueSBjaGFuY2VzIHRv
IHRyeSBpdCBhcyB0aGV5IGhhdmUgZ290DQo+ID4gaW5mb3JtYXRpb24gb2YgbHhfY3VycmVudCBm
cm9tIGdvb2dsZSBvciBzb21ld2hlcmUuDQo+ID4gVGhleSB3aWxsIHRyeSwgaWYgaXQgdHVybnMg
b3V0IHRoZSBseF9jdXJyZW50IGlzIG5vdCBpbiB0aGUgbGlzdCBhbmQgYW4NCj4gPiBlcnJvciBs
aWtlICAiaW52YWxpZCBkYXRhIHR5cGUgZm9yIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZCIsIHRoZXkg
d2lsbA0KPiA+IHByb2JhYmx5IHN1c3BlY3QgdGhlaXIgZ2RiL3B5dGhvbiBlbnZpcm9ubWVudCBp
cyBub3Qgc2V0IHVwIGNvcnJlY3RseSwNCj4gPiBhbmQgY29udGludWUgdG8gd2FzdGUgdGltZSBp
biBjaGVja2luZyB0aGVpciBlbnZpcm9ubWVudC4NCj4gPiBGaW5hbGx5IHRoZXkgZmlndXJlIG91
dCB0aGlzIGZ1bmN0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgYnkgaXRzIGFyY2ggc28gaXQgaXMNCj4g
PiBub3QgZXhwb3NlZC4gQnV0IHRoZXkgaGF2ZSB3YXN0ZWQgYSBjb3VwbGUgb2YgaG91cnMgYmVm
b3JlIGtub3dpbmcgdGhhdC4NCj4gPg0KPiA+IEl0IHNlZW1zIGl0IGlzIG1vcmUgZnJpZW5kbHkg
dG8gZGlyZWN0bHkgdGVsbCB1c2VycyB0aGlzIGlzIG5vdCBzdXBwb3J0ZWQNCj4gPiBvbiBpdHMg
YXJjaCBleHBsaWNpdGx5IGFuZCBjbGVhcmx5IHRoYW4gcmVwb3J0aW5nIGEgImludmFsaWQgZGF0
YSB0eXBlDQo+ID4gZm9yIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZC4NCj4gPg0KPiA+Pg0KPiA+PiBJ
cyBpdCBlYXN5IHRvIGRpc2FibGUgdGhpcyBjb21tYW5kIGlmIGl0J3Mgbm90IHN1cHBvcnRhYmxl
IG9uIHRoZQ0KPiA+PiBhcmNoaXRlY3R1cmU/DQo+ID4+DQo+ID4NCj4gPiBUQkgsIEknbSBub3Qg
YSBweXRob24gZXhwZXJ0LiBJIGRvbid0IGtub3cgaG93IHRvIGRvIHRoYXQgaW4gYW4gZWxlZ2Fu
dA0KPiA+IHdheSA6LSkgIG9uIHRoZSBvdGhlciBoYW5kLCBpdCBzZWVtcyBseF9jdXJyZW50IGlz
buKAmXQgYSBjb21tYW5kIGxpa2UNCj4gPiBseC1kbWVzZy4gTHhfY3VycmVudCBpcyBhY3R1YWxs
eSBzaW1pbGFyIHdpdGggbHhfcGVyX2NwdSwgd2UgdXNlIGdkYidzDQo+ID4gcHJpbnQocCkgY29t
bWFuZCB0byBzaG93IGl0cyBjb250ZW50Lg0KPiA+DQo+ID4+IFByZXN1bWFibHkgeW91IGFyZSB3
b3JraW5nIG9uIG5vbi14ODYsIGhhdmUgeW91IGludmVzdGlnYXRlZCBhZGRpbmcgdGhpcw0KPiA+
PiBzdXBwb3J0IGZvciB5b3VyIGFyY2hpdGVjdHVyZSAoYXJtL2FybTY0Pyk/DQo+ID4NCj4gPiBZ
ZXMuIEkndmUgdGhvdWdodCBhYm91dCBpdC4gQnV0IEl0IHdvdWxkIGJlIHF1aXRlIHRyaXZpYWwg
dG8gYnJpbmcgdXANCj4gPiB0aGlzIGZ1bmN0aW9uIG9uIGFybTY0Lg0KPiA+DQo+ID4gYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9jdXJyZW50Lmg6DQo+ID4gc3RhdGljIF9fYWx3YXlzX2lubGluZSBz
dHJ1Y3QgdGFza19zdHJ1Y3QgKmdldF9jdXJyZW50KHZvaWQpDQo+ID4gew0KPiA+IAl1bnNpZ25l
ZCBsb25nIHNwX2VsMDsNCj4gPg0KPiA+IAlhc20gKCJtcnMgJTAsIHNwX2VsMCIgOiAiPXIiIChz
cF9lbDApKTsNCj4gPg0KPiA+IAlyZXR1cm4gKHN0cnVjdCB0YXNrX3N0cnVjdCAqKXNwX2VsMDsN
Cj4gPiB9DQo+ID4NCj4gPiBXZSBoYXZlIHRvIHJlYWQgYSBzcGVjaWFsIHJlZ2lzdGVyIG5hbWVk
IHNwX2VsMCBhbmQgY29udmVydCBpdCB0bw0KPiA+IHRhc2tfc3RydWN0IHdoaWxlIHdlIGFyZSBy
dW5uaW5nIGluIGtlcm5lbCBtb2RlLiBJbiBnZGIgSSBjYW4gZG8NCj4gPiBpdCBieToNCj4gPiAo
Z2RiKXAveCAkU1BfRUwwDQo+ID4gJDIwID0gMHhmZmZmZmZjMDExNDkyNDAwDQo+ID4gKGdkYilw
ICgoc3RydWN0IHRhc2tfc3RydWN0ICoweGZmZmZmZmMwMTE0OTI0MDApKS0+cGlkDQo+ID4gJDIx
ID0gMA0KPiA+DQo+ID4gV2hhdCBpcyBtb3JlIGNvbXBsZXggaXMgdGhhdCBpZiB3ZSBhcmUgcnVu
bmluZyBpbiB1c2VyIG1vZGUoRUwwKSwgdGhpcw0KPiA+IHJlZ2lzdGVyIGRvZXNuJ3QgZGVzY3Jp
YmUgY3VycmVudCB0YXNrIGFueSBtb3JlLiBzbyB3ZSBoYXZlIHRvDQo+ID4gZGlmZmVyZW50aWF0
ZSB0aGUgbW9kZXMgb2YgcHJvY2Vzc29yIGFuZCBtYWtlIHN1cmUgaXQgb25seSByZXR1cm5zDQo+
ID4gY3VycmVudCB0YXNrIHdoaWxlIHdlIGFyZSBydW5uaW5nIGluIEVMMShwcm9jZXNzb3IncyBr
ZXJuZWwgbW9kZSkuDQo+IA0KPiBJcyBhbGwgaW5mb3JtYXRpb24gbmVlZGVkIGZvciB0aGlzIGF2
YWlsYWJsZSB2aWEgZ2RiPw0KDQpJIGNhbid0IHJlYWQgY3VycmVudCBFTCBsZXZlbCBmcm9tIGdk
YiBhcyBDdXJyZW50RUwgaXMgbm90IHJlYWRhYmxlDQpmcm9tIEVMMCBhcyBzaG93biBvbiB0aGUg
QVJNdjggbWFudWFsIEM1LjIuMToNCiJDdXJyZW50RUwsIEN1cnJlbnQgRXhjZXB0aW9uIExldmVs
IiBzZWN0aW9uICJBY2Nlc3NpYmlsaXR5Ii4gDQpUcnlpbmcgdG8gcnVuIGl0IGluIExpbnV4IHVz
ZXJsYW5kIHJhaXNlcyBTSUdJTEwuDQoNCkJ1dCBhIHdvcmthcm91bmQgSSBjYW4gZG8gaXMgdGhh
dCB3aGlsZSBydW5uaW5nIGluIGtlcm5lbCwgU1BfRUwwDQppcyBhIHZhbHVlIGxpa2UgMHhmZmZm
eHh4eCB4eHh4eHh4eDsgb3RoZXJ3aXNlLCBpdCB3b3VsZCBiZSBhIHZhbHVlDQpsaWtlIDB4MDAw
MHh4eHggeHh4eHh4eHguDQoNClNvIEkgY291bGQgYWN0dWFsbHkgaW1wbGVtZW50IGx4X2N1cnJl
bnQgb24gYXJtNjQgYnk6DQoNCnAveCAkU1BfRUwwDQppZiB2YWx1ZSA+IDB4ZmZmZjAwMDAwMDAw
MDAwDQogICB0YXNrX3N0cnVjdF9hZGRyID0gdmFsdWUNCmVsc2UNCiAgIHVzZXJzcGFjZSwgbm8g
Y3VycmVudA0KDQp0aGUgcHJvYmxlbSBpcyB0aGF0IEkgZG9uJ3Qga25vdyBob3cgdG8gcmVhZCB0
aGUgcmVnaXN0ZXIgYW5kDQp0cmFuc2ZlciBhZGRyZXNzIGludG8gdGFza19zdHJ1Y3QgaW4gZ2Ri
L3NjcmlwdHMuIFdvdWxkIHlvdQ0KbGlrZSB0byBzaGFyZSBzb21lIGV4YW1wbGUgY29kZSBpZiB5
b3UgaGF2ZT8NCg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBUaGUgZmFjdCB5b3UgaGF2ZSBydW4gdGhl
IGNvbW1hbmQgaW1wbGllcyBpdCB3b3VsZCBiZSB1c2VmdWwgZm9yIHlvdSA/DQo+ID4+DQo+ID4N
Cj4gPiBZZXMuIEkgdGhpbmsgaXQgaXMgYSBjb21tb24gcmVxdWlyZW1lbnQgdG8gZ2V0IGN1cnJl
bnQgdGFzay4gbHhfY3VycmVudA0KPiA+IGNvbnZlbmllbmNlIGZ1bmN0aW9uIGNhbiBoZWxwIGV2
ZXJ5b25lLiBTaW5jZSB0aGVyZSBpcyBhIGRvY3VtZW50IHNheWluZw0KPiA+IHRoaXMgY29tbWFu
ZCBleGlzdHMsIGV2ZXJ5b25lIHVzaW5nIHNjcmlwdHMvZ2RiIHdvdWxkIGxpa2UgdG8gdHJ5IGl0
DQo+ID4gSSBndWVzcy4NCj4gPg0KPiA+IFRoZSBzaW1wbGVzdCB3YXkgd291bGQgYmUgYWRkaW5n
IGN1cnJlbnRfdGFzayBwZXJfY3B1IHZhcmlhYmxlIGZvciBvdGhlcg0KPiA+IGFyY2gsIGJ1dCBJ
IGJlbGlldmUgaGFyZGx5IGFyY2ggbWFpbnRhaW5lcnMgd2lsbCBhY2NlcHQgaXQgYXMgaXRzIG9u
bHkNCj4gPiBiZW5lZml0IGlzIGJyaW5naW5nIHVwIHRoZSBseF9jdXJyZW50LiBTbyA5OS45JSBu
byBtYWludGFpbmVyIHdhbnRzIGl0Lg0KPiA+DQo+ID4gVGh1cywgZm9yIHRoZSB0aW1lIGJlaW5n
LCBJIG1vdmVkIHRvIGp1c3Qgc3RvcCBwZW9wbGUgZnJvbSB3YXN0aW5nIHRpbWUNCj4gPiBsaWtl
IHdoYXQgSSBoYWQgZG9uZSB3aXRoIGEgY291cGxlIG9mIGhvdXJzLg0KPiA+DQo+IA0KPiBJIGFn
cmVlIHdpdGggdGhlIHdhcm5pbmcsIGFsc28gYXMgcG90ZW50aWFsIG1vdGl2YXRpb24gdG8gYWRk
IHN1cHBvcnQNCj4gZm9yIG90aGVyIGFyY2hzLg0KPiANCg0KWWVwLg0KDQo+IEphbg0KPiANCj4g
LS0NCj4gU2llbWVucyBBRywgVCBSREEgSU9UDQo+IENvcnBvcmF0ZSBDb21wZXRlbmNlIENlbnRl
ciBFbWJlZGRlZCBMaW51eA0KDQpUaGFua3MNCkJhcnJ5DQoNCg==

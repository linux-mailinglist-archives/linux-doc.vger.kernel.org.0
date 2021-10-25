Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14884394D3
	for <lists+linux-doc@lfdr.de>; Mon, 25 Oct 2021 13:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhJYLdb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Oct 2021 07:33:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:4027 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJYLdR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 07:33:17 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HdCNk19pCz67NwX;
        Mon, 25 Oct 2021 19:27:34 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 25 Oct 2021 13:30:45 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2308.015;
 Mon, 25 Oct 2021 13:30:45 +0200
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     "deven.desai@linux.microsoft.com" <deven.desai@linux.microsoft.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "agk@redhat.com" <agk@redhat.com>,
        "snitzer@redhat.com" <snitzer@redhat.com>,
        "ebiggers@kernel.org" <ebiggers@kernel.org>,
        "tytso@mit.edu" <tytso@mit.edu>,
        "paul@paul-moore.com" <paul@paul-moore.com>,
        "eparis@redhat.com" <eparis@redhat.com>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "serge@hallyn.com" <serge@hallyn.com>
CC:     "jannh@google.com" <jannh@google.com>,
        "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
        "linux-audit@redhat.com" <linux-audit@redhat.com>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
Subject: RE: [RFC PATCH v7 00/16] Integrity Policy Enforcement (IPE)
Thread-Topic: [RFC PATCH v7 00/16] Integrity Policy Enforcement (IPE)
Thread-Index: AQHXwGWW2AQMU2k7W0iAf+goQ1/2GavjhjlA
Date:   Mon, 25 Oct 2021 11:30:45 +0000
Message-ID: <0a61327839b841a1a9d915a09d1d8b8c@huawei.com>
References: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
In-Reply-To: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.98.153]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PiBGcm9tOiBkZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tDQo+IFttYWlsdG86ZGV2ZW4u
ZGVzYWlAbGludXgubWljcm9zb2Z0LmNvbV0NCj4gRnJvbTogRGV2ZW4gQm93ZXJzIDxkZXZlbi5k
ZXNhaUBsaW51eC5taWNyb3NvZnQuY29tPg0KPiANCj4gT3ZlcnZpZXc6DQo+IC0tLS0tLS0tLQ0K
PiANCj4gSVBFIGlzIGEgTGludXggU2VjdXJpdHkgTW9kdWxlIHdoaWNoIHRha2VzIGEgY29tcGxp
bWVudGFyeSBhcHByb2FjaCB0bw0KPiBhY2Nlc3MgY29udHJvbC4gV2hlcmVhcyBleGlzdGluZyBz
eXN0ZW1zIGFwcHJvYWNoIHVzZSBsYWJlbHMgb3IgcGF0aHMNCj4gd2hpY2ggY29udHJvbCBhY2Nl
c3MgdG8gYSByZXNvdXJjZSwgSVBFIGNvbnRyb2xzIGFjY2VzcyB0byBhIHJlc291cmNlDQo+IGJh
c2VkIG9uIHRoZSBzeXN0ZW0ncyB0cnVzdCBvZiBzYWlkIHJlc291cmNlLg0KDQpUbyBtZSwgaXQg
ZG9lcyBub3QgZ2l2ZSBhIHBhcnRpY3VsYXJseSBwcmVjaXNlIGlkZWEgb2Ygd2hhdCBJUEUgaXMg
YWJvdXQuDQoNCkl0IHdvdWxkIGhhdmUgYmVlbiBtb3JlIGNsZWFyLCBhc3N1bWluZyB0aGF0IEkg
dW5kZXJzdG9vZCBpdCBjb3JyZWN0bHksDQppZiB5b3UgaGF2ZSBzYWlkOg0KDQpXaGVyZWFzIGV4
aXN0aW5nIG1hbmRhdG9yeSBhY2Nlc3MgY29udHJvbCBtZWNoYW5pc21zIGJhc2UgdGhlaXINCmRl
Y2lzaW9ucyBvbiBsYWJlbHMgYW5kIHBhdGhzLCBJUEUgaW5zdGVhZCBkZXRlcm1pbmVzIHdoZXRo
ZXIgb3Igbm90DQphbiBvcGVyYXRpb24gc2hvdWxkIGJlIGFsbG93ZWQgYmFzZWQgb24gaW1tdXRh
YmxlIHNlY3VyaXR5IHByb3BlcnRpZXMNCm9mIHRoZSBzeXN0ZW0gY29tcG9uZW50IHRoZSBvcGVy
YXRpb24gaXMgYmVpbmcgcGVyZm9ybWVkIG9uLg0KDQpJUEUgaXRzZWxmIGRvZXMgbm90IG1hbmRh
dGUgaG93IHRoZSBzZWN1cml0eSBwcm9wZXJ0eSBzaG91bGQgYmUNCmV2YWx1YXRlZCwgYnV0IHJl
bGllcyBvbiBhbiBleHRlbnNpYmxlIHNldCBvZiBleHRlcm5hbCBwcm9wZXJ0eSBwcm92aWRlcnMN
CnRvIGV2YWx1YXRlIHRoZSBjb21wb25lbnQuIElQRSBtYWtlcyBpdHMgZGVjaXNpb24gYmFzZWQg
b24gcmVmZXJlbmNlDQp2YWx1ZXMgZm9yIHRoZSBzZWxlY3RlZCBwcm9wZXJ0aWVzLCBzcGVjaWZp
ZWQgaW4gdGhlIElQRSBwb2xpY3kuDQoNClRoZSByZWZlcmVuY2UgdmFsdWVzIHJlcHJlc2VudCB0
aGUgdmFsdWUgdGhhdCB0aGUgcG9saWN5IHdyaXRlciBhbmQgdGhlDQpsb2NhbCBzeXN0ZW0gYWRt
aW5pc3RyYXRvciAoYmFzZWQgb24gdGhlIHBvbGljeSBzaWduYXR1cmUpIHRydXN0IGZvciB0aGUN
CnN5c3RlbSB0byBhY2NvbXBsaXNoIHRoZSBkZXNpcmVkIHRhc2tzLg0KDQpPbmUgc3VjaCBwcm92
aWRlciBpcyBmb3IgZXhhbXBsZSBkbS12ZXJpdHksIHdoaWNoIGlzIGFibGUgdG8gcmVwcmVzZW50
DQp0aGUgaW50ZWdyaXR5IHByb3BlcnR5IG9mIGEgcGFydGl0aW9uIChpdHMgaW1tdXRhYmxlIHN0
YXRlKSB3aXRoIGEgZGlnZXN0Lg0KDQo+IFRydXN0IHJlcXVpcmVtZW50cyBhcmUgZXN0YWJsaXNo
ZWQgdmlhIElQRSdzIHBvbGljeSwgc291cmNpbmcgbXVsdGlwbGUNCj4gZGlmZmVyZW50IGltcGxl
bWVudGF0aW9ucyB3aXRoaW4gdGhlIGtlcm5lbCB0byBidWlsZCBhIGNvaGVzaXZlIHRydXN0DQo+
IG1vZGVsLCBiYXNlZCBvbiBob3cgdGhlIHN5c3RlbSB3YXMgYnVpbHQuDQo+IA0KPiBUcnVzdCwg
d2l0aCByZXNwZWN0IHRvIGNvbXB1dGluZywgaXMgYSBjb25jZXB0IHRoYXQgZGVzaWduYXRlcyBh
IHNldA0KPiBvZiBlbnRpdGllcyB3aG8gd2lsbCBlbmRvcnNlIGEgc2V0IG9mIHJlc291cmNlcyBh
cyBub24tbWFsaWNpb3VzLg0KPiBUcmFkaXRpb25hbGx5LCB0aGlzIGlzIGRvbmUgdmlhIHNpZ25h
dHVyZXMsIHdoaWNoIGlzIHRoZSBhY3Qgb2YgZW5kb3JzaW5nDQo+IGEgcmVzb3VyY2UuDQo+IA0K
PiBJbnRlZ3JpdHksIG9uIHRoZSBvdGhlciBoYW5kLCBpcyB0aGUgY29uY2VwdCBvZiBlbnN1cmlu
ZyB0aGF0IGEgcmVzb3VyY2UNCj4gaGFzIG5vdCBiZWVuIG1vZGlmaWVkIHNpbmNlIGEgcG9pbnQg
b2YgdGltZS4gVGhpcyBpcyB0eXBpY2FsbHkgZG9uZSB0aHJvdWdoDQo+IGNyeXB0b2dyYXBoaWMg
aGFzaGVzIG9yIHNpZ25hdHVyZXMuDQo+IA0KPiBUcnVzdCBhbmQgaW50ZWdyaXR5IGFyZSB2ZXJ5
IGNsb3NlbHkgdGllZCB0b2dldGhlciBjb25jZXB0cywgYXMgaW50ZWdyaXR5DQo+IGlzIHRoZSB3
YXkgeW91IGNhbiBwcm92ZSB0cnVzdCBmb3IgYSByZXNvdXJjZTsgb3RoZXJ3aXNlIGl0IGNvdWxk
IGhhdmUNCj4gYmVlbiBtb2RpZmllZCBieSBhbiBlbnRpdHkgd2hvIGlzIHVudHJ1c3RlZC4NCj4g
DQo+IElQRSBwcm92aWRlcyBhIHdheSBmb3IgYSB1c2VyIHRvIGV4cHJlc3MgdHJ1c3QgcmVxdWly
ZW1lbnRzIG9mIHJlc291cmNlcywNCj4gYnkgdXNpbmcgcHJlLWV4aXN0aW5nIHN5c3RlbXMgd2hp
Y2ggcHJvdmlkZSB0aGUgaW50ZWdyaXR5IGhhbGYgb2YgdGhlDQo+IGVxdWF0aW9uLg0KPiANCj4g
SVBFIGlzIGNvbXBpbGVkIHVuZGVyIENPTkZJR19TRUNVUklUWV9JUEUuDQo+IA0KPiBVc2UgQ2Fz
ZXMNCj4gLS0tLS0tLS0tDQo+IA0KPiBJUEUgd29ya3MgYmVzdCBpbiBmaXhlZC1mdW5jdGlvbiBk
ZXZpY2VzOiBEZXZpY2VzIGluIHdoaWNoIHRoZWlyIHB1cnBvc2UNCj4gaXMgY2xlYXJseSBkZWZp
bmVkIGFuZCBub3Qgc3VwcG9zZWQgdG8gYmUgY2hhbmdlZCAoZS5nLiBuZXR3b3JrIGZpcmV3YWxs
DQo+IGRldmljZSBpbiBhIGRhdGEgY2VudGVyLCBhbiBJb1QgZGV2aWNlLCBldGNldGVyYSksIHdo
ZXJlIGFsbCBzb2Z0d2FyZSBhbmQNCj4gY29uZmlndXJhdGlvbiBpcyBidWlsdCBhbmQgcHJvdmlz
aW9uZWQgYnkgdGhlIHN5c3RlbSBvd25lci4NCj4gDQo+IElQRSBpcyBhIGxvbmctd2F5IG9mZiBm
b3IgdXNlIGluIGdlbmVyYWwtcHVycG9zZSBjb21wdXRpbmc6DQo+IHRoZSBMaW51eCBjb21tdW5p
dHkgYXMgYSB3aG9sZSB0ZW5kcyB0byBmb2xsb3cgYSBkZWNlbnRyYWxpemVkIHRydXN0DQo+IG1v
ZGVsLCBrbm93biBhcyB0aGUgV2ViIG9mIFRydXN0LCB3aGljaCBJUEUgaGFzIG5vIHN1cHBvcnQg
Zm9yIGFzIG9mIHlldC4NCj4gSW5zdGVhZCwgSVBFIHN1cHBvcnRzIHRoZSBQS0kgVHJ1c3QgTW9k
ZWwsIHdoaWNoIGdlbmVyYWxseSBkZXNpZ25hdGVzIGENCj4gc2V0IG9mIGVudGl0aWVzIHRoYXQg
cHJvdmlkZSBhIG1lYXN1cmUgYWJzb2x1dGUgdHJ1c3QuDQoNCkl0IGlzIHRydWUgdGhhdCBwYWNr
YWdlcyBhcmUgc2lnbmVkIHdpdGggUEdQLCB3aGljaCBpcyBkZWNlbnRyYWxpemVkLA0KYnV0IHRo
ZXJlIGlzIGEgc3BlY2lhbCBjYXNlIHdoZXJlIExpbnV4IGRpc3RyaWJ1dGlvbiB2ZW5kb3JzIHRy
dXN0DQp0aGVpciBvd24ga2V5cy4gVGhpcywgYXQgbGVhc3QsIHdvdWxkIGFsbG93IHRvIHRydXN0
IHRoZSBzb2Z0d2FyZSBidWlsdA0KYnkgYSBwYXJ0aWN1bGFyIHZlbmRvciAoSSBwb3J0ZWQgRGF2
aWQgSG93ZWxscydzIHdvcmsgb24gUEdQIGtleXMgYW5kDQpzaWduYXR1cmUgdG8gdGhlIGN1cnJl
bnQga2VybmVsKS4NCg0KPiBBZGRpdGlvbmFsbHksIHdoaWxlIG1vc3QgcGFja2FnZXMgYXJlIHNp
Z25lZCB0b2RheSwgdGhlIGZpbGVzIGluc2lkZQ0KPiB0aGUgcGFja2FnZXMgKGZvciBpbnN0YW5j
ZSwgdGhlIGV4ZWN1dGFibGVzKSwgdGVuZCB0byBiZSB1bnNpZ25lZC4gVGhpcw0KPiBtYWtlcyBp
dCBkaWZmaWN1bHQgdG8gdXRpbGl6ZSBJUEUgaW4gc3lzdGVtcyB3aGVyZSBhIHBhY2thZ2UgbWFu
YWdlciBpcw0KPiBleHBlY3RlZCB0byBiZSBmdW5jdGlvbmFsLCB3aXRob3V0IG1ham9yIGNoYW5n
ZXMgdG8gdGhlIHBhY2thZ2UgbWFuYWdlcg0KPiBhbmQgZWNvc3lzdGVtIGJlaGluZCBpdC4NCg0K
WWVzLCBSUE1zIGRvbid0IGhhdmUgcGVyIGZpbGUgc2lnbmF0dXJlcyBidXQgaGF2ZSBhIHNpZ25h
dHVyZSBvZiB0aGUNCmxpc3Qgb2YgZmlsZSBkaWdlc3RzLCB3aGljaCBpcyBlcXVpdmFsZW50LiBU
aGV5IGNvdWxkIGhhdmUgYWxzbyB0aGUgZnN2ZXJpdHkNCmRpZ2VzdHMgKGluc3RlYWQgb2YgdGhl
IGZzdmVyaXR5IHNpZ25hdHVyZXMpIHRvIHJlZHVjZSBzaXplIG92ZXJoZWFkLg0KDQpHaXZlbiB0
aGF0IHRoZSBhdXRoZW50aWNpdHkgb2YgUlBNcyBoZWFkZXJzIGNhbiBiZSB2ZXJpZmllZCwgaWYg
dGhlDQpQR1Aga2V5IG9mIHRoZSB2ZW5kb3IgaXMgaW5jbHVkZWQgaW4gdGhlIHByaW1hcnkga2V5
cmluZyBvZiB0aGUga2VybmVsLA0KYmVpbmcgYWJsZSB0byBwcm90ZWN0IGZpbGUgb3IgZnN2ZXJp
dHkgZGlnZXN0cyBhZ2FpbnN0IHRhbXBlcmluZyBieQ0KdXNlciBzcGFjZSBhbmQgYmVpbmcgYWJs
ZSB0byBxdWVyeSB0aGVtIChlLmcuIHdpdGggRElHTElNKSBleHRlbmRzDQp0aGUgYXBwbGljYWJp
bGl0eSBvZiBJUEUgdG8gZ2VuZXJhbCBwdXJwb3NlIE9TZXMuDQoNCj4gUG9saWN5Og0KPiAtLS0t
LS0tDQo+IA0KPiBJUEUgcG9saWN5IGlzIGEgcGxhaW4tdGV4dCBbI11fIHBvbGljeSBjb21wb3Nl
ZCBvZiBtdWx0aXBsZSBzdGF0ZW1lbnRzDQo+IG92ZXIgc2V2ZXJhbCBsaW5lcy4gVGhlcmUgaXMg
b25lIHJlcXVpcmVkIGxpbmUsIGF0IHRoZSB0b3Agb2YgdGhlDQo+IHBvbGljeSwgaW5kaWNhdGlu
ZyB0aGUgcG9saWN5IG5hbWUsIGFuZCB0aGUgcG9saWN5IHZlcnNpb24sIGZvcg0KPiBpbnN0YW5j
ZToNCj4gDQo+ICAgcG9saWN5X25hbWU9IkV4IFBvbGljeSIgcG9saWN5X3ZlcnNpb249MC4wLjAN
Cj4gDQo+IFRoZSBwb2xpY3kgdmVyc2lvbiBpbmRpY2F0ZXMgdGhlIGN1cnJlbnQgdmVyc2lvbiBv
ZiB0aGUgcG9saWN5IChOT1QgdGhlDQo+IHBvbGljeSBzeW50YXggdmVyc2lvbikuIFRoaXMgaXMg
dXNlZCB0byBwcmV2ZW50IHJvbGwtYmFjayBvZiBwb2xpY3kgdG8NCj4gcG90ZW50aWFsbHkgaW5z
ZWN1cmUgcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhlIHBvbGljeS4NCj4gDQo+IFRoZSBuZXh0IHBv
cnRpb24gb2YgSVBFIHBvbGljeSwgYXJlIHJ1bGVzLiBSdWxlcyBhcmUgZm9ybWVkIGJ5IGtleT12
YWx1ZQ0KPiBwYWlycywga25vd24gYXMgcHJvcGVydGllcy4gSVBFIHJ1bGVzIHJlcXVpcmUgdHdv
IHByb3BlcnRpZXM6ICJhY3Rpb24iLA0KDQpCZXR0ZXI6DQoNCklQRSBydWxlcyByZXF1aXJlIHR3
byBrZXlzOg0KDQo+IHdoaWNoIGRldGVybWluZXMgd2hhdCBJUEUgZG9lcyB3aGVuIGl0IGVuY291
bnRlcnMgYSBtYXRjaCBhZ2FpbnN0IHRoZQ0KPiBwb2xpY3ksIGFuZCAib3AiLCB3aGljaCBkZXRl
cm1pbmVzIHdoZW4gdGhhdCBydWxlIHNob3VsZCBiZSBldmFsdWF0ZWQuDQo+IFRodXMsIGEgbWlu
aW1hbCBydWxlIGlzOg0KPiANCj4gICBvcD1FWEVDVVRFIGFjdGlvbj1BTExPVw0KPiANCj4gVGhp
cyBleGFtcGxlIHdpbGwgYWxsb3cgYW55IGV4ZWN1dGlvbi4gQWRkaXRpb25hbCBwcm9wZXJ0aWVz
IGFyZSB1c2VkIHRvDQo+IHJlc3RyaWN0IGF0dHJpYnV0ZXMgYWJvdXQgdGhlIGZpbGVzIGJlaW5n
IGV2YWx1YXRlZC4gVGhlc2UgcHJvcGVydGllcyBhcmUNCj4gaW50ZW5kZWQgdG8gYmUgZGV0ZXJt
aW5pc3RpYyBhdHRyaWJ1dGVzIHRoYXQgYXJlIHJlc2lkZW50IGluIHRoZSBrZXJuZWwuDQo+IEF2
YWlsYWJsZSBwcm9wZXJ0aWVzIGZvciBJUEUgZGVzY3JpYmVkIGluIHRoZSBkb2N1bWVudGF0aW9u
IHBhdGNoIG9mIHRoaXMNCj4gc2VyaWVzLg0KPiANCj4gQSBydWxlIGlzIHJlcXVpcmVkIHRvIGhh
dmUgdGhlICJvcCIgcHJvcGVydHkgYXMgdGhlIGZpcnN0IHRva2VuIG9mIGEgcnVsZSwNCj4gYW5k
IHRoZSAiYWN0aW9uIiBhcyB0aGUgbGFzdCB0b2tlbiBvZiB0aGUgcnVsZS4gUnVsZXMgYXJlIGV2
YWx1YXRlZA0KPiB0b3AtdG8tYm90dG9tLiBBcyBhIHJlc3VsdCwgYW55IHJldm9jYXRpb24gcnVs
ZXMsIG9yIGRlbmllcyBzaG91bGQgYmUNCj4gcGxhY2VkIGVhcmx5IGluIHRoZSBmaWxlIHRvIGVu
c3VyZSB0aGF0IHRoZXNlIHJ1bGVzIGFyZSBldmFsdWF0ZWQgYmVmb3JlDQo+IGEgcnVsZSB3aXRo
ICJhY3Rpb249QUxMT1ciIGlzIGhpdC4NCj4gDQo+IEFueSB1bmtub3duIHN5bnRheCBpbiBJUEUg
cG9saWN5IHdpbGwgcmVzdWx0IGluIGEgZmF0YWwgZXJyb3IgdG8gcGFyc2UNCj4gdGhlIHBvbGlj
eS4gVXNlciBtb2RlIGNhbiBpbnRlcnJvZ2F0ZSB0aGUga2VybmVsIHRvIHVuZGVyc3RhbmQgd2hh
dA0KPiBwcm9wZXJ0aWVzIGFuZCB0aGUgYXNzb2NpYXRlZCB2ZXJzaW9ucyB0aHJvdWdoIHRoZSBz
ZWN1cml0eWZzIG5vZGUsDQo+ICRzZWN1cml0eWZzL2lwZS9jb25maWcsIHdoaWNoIHdpbGwgcmV0
dXJuIGEgc3RyaW5nIG9mIGZvcm06DQo+IA0KPiAgIGtleTE9dmVyc2lvbjENCj4gICBrZXkyPXZl
cnNpb24yDQo+ICAgLg0KPiAgIC4NCj4gICAuDQo+ICAga2V5Tj12ZXJzaW9uTg0KPiANCj4gVXNl
ci1tb2RlIHNob3VsZCBjb3JyZWxhdGUgdGhlc2UgdmVyc2lvbnMgd2l0aCB0aGUgc3VwcG9ydGVk
IHZhbHVlcw0KPiBpZGVudGlmaWVkIGluIHRoZSBkb2N1bWVudGF0aW9uIHRvIGRldGVybWluZSB3
aGV0aGVyIGEgcG9saWN5IHNob3VsZA0KPiBiZSBhY2NlcHRlZCBieSB0aGUgc3lzdGVtIHdpdGhv
dXQgYWN0dWFsbHkgdHJ5aW5nIHRvIGRlcGxveSB0aGUgcG9saWN5Lg0KPiANCj4gQWRkaXRpb25h
bGx5LCBhIERFRkFVTFQgb3BlcmF0aW9uIG11c3QgYmUgc2V0IGZvciBhbGwgdW5kZXJzdG9vZA0K
PiBvcGVyYXRpb25zIHdpdGhpbiBJUEUuIEZvciBwb2xpY2llcyB0byByZW1haW4gY29tcGxldGVs
eSBmb3J3YXJkcw0KPiBjb21wYXRpYmxlLCBpdCBpcyByZWNvbW1lbmRlZCB0aGF0IHVzZXJzIGFk
ZCBhICJERUZBVUxUIGFjdGlvbj1BTExPVyINCj4gYW5kIG92ZXJyaWRlIHRoZSBkZWZhdWx0cyBv
biBhIHBlci1vcGVyYXRpb24gYmFzaXMuDQo+IA0KPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgcG9saWN5IHN5bnRheCwgdGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uDQo+IHBhZ2UuDQo+
IA0KPiBFYXJseSBVc2VybW9kZSBQcm90ZWN0aW9uOg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiANCj4gSVBFIGNhbiBiZSBwcm92aWRlZCB3aXRoIGEgcG9saWN5IGF0IHN0YXJ0dXAg
dG8gbG9hZCBhbmQgZW5mb3JjZS4NCj4gVGhpcyBpcyBpbnRlbmRlZCB0byBiZSBhIG1pbmltYWwg
cG9saWN5IHRvIGdldCB0aGUgc3lzdGVtIHRvIGEgc3RhdGUNCj4gd2hlcmUgdXNlcmxhbmQgaXMg
c2V0dXAgYW5kIHJlYWR5IHRvIHJlY2VpdmUgY29tbWFuZHMsIGF0IHdoaWNoDQo+IHBvaW50IGEg
cG9saWN5IGNhbiBiZSBkZXBsb3llZCB2aWEgc2VjdXJpdHlmcy4gVGhpcyAiYm9vdCBwb2xpY3ki
IGNhbiBiZQ0KPiBzcGVjaWZpZWQgdmlhIHRoZSBjb25maWcsIFNFQ1VSSVRZX0lQRV9CT09UX1BP
TElDWSwgd2hpY2ggYWNjZXB0cyBhIHBhdGgNCj4gdG8gYSBwbGFpbi10ZXh0IHZlcnNpb24gb2Yg
dGhlIElQRSBwb2xpY3kgdG8gYXBwbHkuIFRoaXMgcG9saWN5IHdpbGwgYmUNCj4gY29tcGlsZWQg
aW50byB0aGUga2VybmVsLiBJZiBub3Qgc3BlY2lmaWVkLCBJUEUgd2lsbCBiZSBkaXNhYmxlZCB1
bnRpbCBhDQo+IHBvbGljeSBpcyBkZXBsb3llZCBhbmQgYWN0aXZhdGVkIHRocm91Z2ggdGhlIG1l
dGhvZCBhYm92ZS4NCj4gDQo+IFBvbGljeSBFeGFtcGxlczoNCj4gLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gQWxsb3cgYWxsOg0KPiANCj4gICBwb2xpY3lfbmFtZT0iQWxsb3cgQWxsIiBwb2xpY3lf
dmVyc2lvbj0wLjAuMA0KPiAgIERFRkFVTFQgYWN0aW9uPUFMTE9XDQo+IA0KPiBBbGxvdyBvbmx5
IGluaXRpYWwgc3VwZXJibG9jazoNCj4gDQo+ICAgcG9saWN5X25hbWU9IkFsbG93IEFsbCBJbml0
aWFsIFNCIiBwb2xpY3lfdmVyc2lvbj0wLjAuMA0KPiAgIERFRkFVTFQgYWN0aW9uPURFTlkNCj4g
DQo+ICAgb3A9RVhFQ1VURSBib290X3ZlcmlmaWVkPVRSVUUgYWN0aW9uPUFMTE9XDQo+IA0KPiBB
bGxvdyBhbnkgc2lnbmVkIGRtLXZlcml0eSB2b2x1bWUgYW5kIHRoZSBpbml0aWFsIHN1cGVyYmxv
Y2s6DQo+IA0KPiAgIHBvbGljeV9uYW1lPSJBbGxvd1NpZ25lZEFuZEluaXRpYWwiIHBvbGljeV92
ZXJzaW9uPTAuMC4wDQo+ICAgREVGQVVMVCBhY3Rpb249REVOWQ0KPiANCj4gICBvcD1FWEVDVVRF
IGJvb3RfdmVyaWZpZWQ9VFJVRSBhY3Rpb249QUxMT1cNCj4gICBvcD1FWEVDVVRFIGRtdmVyaXR5
X3NpZ25hdHVyZT1UUlVFIGFjdGlvbj1BTExPVw0KPiANCj4gUHJvaGliaXQgZXhlY3V0aW9uIGZy
b20gYSBzcGVjaWZpYyBkbS12ZXJpdHkgdm9sdW1lOg0KPiANCj4gICBwb2xpY3lfbmFtZT0iQWxs
b3dTaWduZWRBbmRJbml0aWFsIiBwb2xpY3lfdmVyc2lvbj0wLjAuMA0KPiAgIERFRkFVTFQgYWN0
aW9uPURFTlkNCj4gDQo+ICAgb3A9RVhFQ1VURQ0KPiBkbXZlcml0eV9yb290aGFzaD00MDFmY2Vj
NTk0NDgyM2FlMTJmNjI3MjZlODE4NDQwN2E1ZmE5NTk5NzgzZjAzMGRlYw0KPiAxNDY5MzggYWN0
aW9uPURFTlkNCj4gICBvcD1FWEVDVVRFIGJvb3RfdmVyaWZpZWQ9VFJVRSBhY3Rpb249QUxMT1cN
Cj4gICBvcD1FWEVDVVRFIGRtdmVyaXR5X3NpZ25hdHVyZT1UUlVFIGFjdGlvbj1BTExPVw0KPiAN
Cj4gQWxsb3cgb25seSBhIHNwZWNpZmljIGRtLXZlcml0eSB2b2x1bWU6DQo+IA0KPiAgIHBvbGlj
eV9uYW1lPSJBbGxvd1NpZ25lZEFuZEluaXRpYWwiIHBvbGljeV92ZXJzaW9uPTAuMC4wDQo+ICAg
REVGQVVMVCBhY3Rpb249REVOWQ0KPiANCj4gICBvcD1FWEVDVVRFDQo+IGRtdmVyaXR5X3Jvb3Ro
YXNoPTQwMWZjZWM1OTQ0ODIzYWUxMmY2MjcyNmU4MTg0NDA3YTVmYTk1OTk3ODNmMDMwZGVjDQo+
IDE0NjkzOCBhY3Rpb249QUxMT1cNCj4gDQo+IERlcGxveWluZyBQb2xpY2llczoNCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiANCj4gRmlyc3Qgc2lnbiBhIHBsYWluIHRleHQgcG9saWN5LCB3aXRo
IGEgY2VydGlmaWNhdGUgdGhhdCBpcyBwcmVzZW50IGluDQo+IHRoZSBTWVNURU1fVFJVU1RFRF9L
RVlSSU5HIG9mIHlvdXIgdGVzdCBtYWNoaW5lLiBUaHJvdWdoIG9wZW5zc2wsIHRoZQ0KPiBzaWdu
aW5nIGNhbiBiZSBkb25lIHZpYToNCj4gDQo+ICAgb3BlbnNzbCBzbWltZSAtc2lnbiAtaW4gIiRN
WV9QT0xJQ1kiIC1zaWduZXIgIiRNWV9DRVJUSUZJQ0FURSIgXA0KPiAgICAgLWlua2V5ICIkTVlf
UFJJVkFURV9LRVkiIC1iaW5hcnkgLW91dGZvcm0gZGVyIC1ub2F0dHIgLW5vZGV0YWNoIFwNCj4g
ICAgIC1vdXQgIiRNWV9QT0xJQ1kucDdzIg0KPiANCj4gVGhlbiwgc2ltcGx5IGNhdCB0aGUgZmls
ZSBpbnRvIHRoZSBJUEUncyAibmV3X3BvbGljeSIgc2VjdXJpdHlmcyBub2RlOg0KPiANCj4gICBj
YXQgIiRNWV9QT0xJQ1kucDdzIiA+IC9zeXMva2VybmVsL3NlY3VyaXR5L2lwZS9uZXdfcG9saWN5
DQo+IA0KPiBUaGUgcG9saWN5IHNob3VsZCBub3cgYmUgcHJlc2VudCB1bmRlciB0aGUgcG9saWNp
ZXMvIHN1YmRpcmVjdG9yeSwgdW5kZXINCj4gaXRzICJwb2xpY3lfbmFtZSIgYXR0cmlidXRlLg0K
PiANCj4gVGhlIHBvbGljeSBpcyBub3cgcHJlc2VudCBpbiB0aGUga2VybmVsIGFuZCBjYW4gYmUg
bWFya2VkIGFzIGFjdGl2ZSwNCj4gdmlhIHRoZSBzZWN1cml0eWZzIG5vZGU6DQo+IA0KPiAgIGVj
aG8gIjEiID4gIi9zeXMva2VybmVsL3NlY3VyaXR5L2lwZS8kTVlfUE9MSUNZX05BTUUvYWN0aXZl
Ig0KPiANCj4gVGhpcyB3aWxsIG5vdyBtYXJrIHRoZSBwb2xpY3kgYXMgYWN0aXZlIGFuZCB0aGUg
c3lzdGVtIHdpbGwgYmUgZW5mb3JjaW5nDQo+ICRNWV9QT0xJQ1lfTkFNRS4NCj4gDQo+IFRoZXJl
IGlzIG9uZSByZXF1aXJlbWVudCB3aGVuIG1hcmtpbmcgYSBwb2xpY3kgYXMgYWN0aXZlLCB0aGUg
cG9saWN5X3ZlcnNpb24NCj4gYXR0cmlidXRlIG11c3QgZWl0aGVyIGluY3JlYXNlLCBvciByZW1h
aW4gdGhlIHNhbWUgYXMgdGhlIGN1cnJlbnRseSBydW5uaW5nDQo+IHBvbGljeS4NCj4gDQo+IFBv
bGljaWVzIGNhbiBiZSB1cGRhdGVkIHZpYToNCj4gDQo+ICAgY2F0ICIkTVlfVVBEQVRFRF9QT0xJ
Q1kucDdzIiA+IFwNCj4gICAgICIvc3lzL2tlcm5lbC9zZWN1cml0eS9pcGUvcG9saWNpZXMvJE1Z
X1BPTElDWV9OQU1FL3VwZGF0ZSINCj4gDQo+IEFkZGl0aW9uYWxseSwgcG9saWNpZXMgY2FuIGJl
IGRlbGV0ZWQgdmlhIHRoZSAiZGVsZXRlIiBzZWN1cml0eWZzDQo+IG5vZGUuIFNpbXBseSB3cml0
ZSAiMSIgdG8gdGhlIGNvcnJlc3BvbmRpbmcgbm9kZSBpbiB0aGUgcG9saWN5IGZvbGRlcjoNCj4g
DQo+ICAgZWNobyAiMSIgPiAiL3N5cy9rZXJuZWwvc2VjdXJpdHkvaXBlL3BvbGljaWVzLyRNWV9Q
T0xJQ1lfTkFNRS9kZWxldGUiDQo+IA0KPiBUaGVyZSBpcyBvbmx5IG9uZSByZXF1aXJlbWVudCB0
byBkZWxldGUgcG9saWNpZXMsIHRoZSBwb2xpY3kgYmVpbmcNCj4gZGVsZXRlZCBtdXN0IG5vdCBi
ZSB0aGUgYWN0aXZlIHBvbGljeS4NCj4gDQo+IE5PVEU6IFRoZSBzZWN1cml0eWZzIGNvbW1hbmRz
IHdpbGwgcmVxdWlyZSBDQVBfTUFDX0FETUlOLg0KPiANCj4gSW50ZWdyYXRpb25zOg0KPiAtLS0t
LS0tLS0tLS0tDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGZzdmVy
aXR5IHZpYSBkaWdlc3QgYW5kIHNpZ25hdHVyZQ0KPiAoZnN2ZXJpdHlfc2lnbmF0dXJlIGFuZCBm
c3Zlcml0eV9kaWdlc3QpLCBkbS12ZXJpdHkgYnkgZGlnZXN0IGFuZA0KPiBzaWduYXR1cmUgKGRt
dmVyaXR5X3NpZ25hdHVyZSBhbmQgZG12ZXJpdHlfcm9vdGhhc2gpLCBhbmQgdHJ1c3QgZm9yDQo+
IHRoZSBpbml0cmFtZnMgKGJvb3RfdmVyaWZpZWQpLg0KDQpWZXJpZnlpbmcgdGhlIGluaXRpYWwg
cmFtIGRpc2sgbG9va3MgbGlrZSBhIGJpZyBwcm9ibGVtLiBPbiBnZW5lcmFsDQpwdXJwb3NlIE9T
ZXMsIGhhdmluZyBhIHJlZmVyZW5jZSB2YWx1ZSBmb3IgaXQgd291bGQgYmUgdmVyeSBoYXJkLg0K
DQpJbnN0ZWFkLCB3ZSB3b3VsZCBzdGlsbCBiZSBhYmxlIHRvIHVzZSBwZXIgZmlsZSByZWZlcmVu
Y2UgdmFsdWVzLg0KRXhlY3V0YWJsZSBhbmQgc2hhcmVkIGxpYnJhcmllcyBpbiB0aGUgaW5pdGlh
bCByYW0gZGlzayBhcmUgY29waWVkDQpmcm9tIHRoZSBtYWluIE9TLiBXaXRob3V0IGZzdmVyaXR5
IHN1cHBvcnQgaW4gdG1wZnMsIEkgd29uZGVyDQppZiBpdCB3b3VsZCBiZSBzdGlsbCBwb3NzaWJs
ZSB0byBtYXJrIHRoZSBmaWxlIGFzIGltbXV0YWJsZSBhbmQgZG8NCmFuIG9uIHRoZSBmbHkgY2Fs
Y3VsYXRpb24gb2YgdGhlIHJvb3QgZGlnZXN0Lg0KDQpBcyBhbiBhbHRlcm5hdGl2ZSwgdGhlIElN
QSBhcHByb2FjaCBvZiBjYWxjdWxhdGluZyB0aGUgZmlsZSBkaWdlc3QNCmNvdWxkIGJlIHVzZWQg
KG9yIElQRSBjb3VsZCBnZXQgdGhlIGZpbGUgZGlnZXN0IGFzIGEgcHJvcGVydHkgZnJvbQ0KdGhl
IGludGVncml0eSBzdWJzeXN0ZW0pLg0KDQpSb2JlcnRvDQoNCkhVQVdFSSBURUNITk9MT0dJRVMg
RHVlc3NlbGRvcmYgR21iSCwgSFJCIDU2MDYzDQpNYW5hZ2luZyBEaXJlY3RvcjogTGkgUGVuZywg
WmhvbmcgUm9uZ2h1YQ0KDQo+IFBsZWFzZSBzZWUgdGhlIGRvY3VtZW50YXRpb24gcGF0Y2ggZm9y
IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlDQo+IGludGVncmF0aW9ucyBhdmFpbGFibGUuDQo+
IA0KPiBUZXN0aW5nOg0KPiAtLS0tLS0tLQ0KPiANCj4gS1VuaXQgVGVzdHMgYXJlIGF2YWlsYWJs
ZS4gUmVjb21tZW5kZWQga3VuaXRjb25maWc6DQo+IA0KPiAgICAgQ09ORklHX0tVTklUPXkNCj4g
ICAgIENPTkZJR19TRUNVUklUWT15DQo+ICAgICBDT05GSUdfU0VDVVJJVFlGUz15DQo+ICAgICBD
T05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVI9eQ0KPiAgICAgQ09ORklHX1NZU1RFTV9EQVRBX1ZF
UklGSUNBVElPTj15DQo+ICAgICBDT05GSUdfRlNfVkVSSVRZPXkNCj4gICAgIENPTkZJR19GU19W
RVJJVFlfQlVJTFRJTl9TSUdOQVRVUkVTPXkNCj4gICAgIENPTkZJR19CTE9DSz15DQo+ICAgICBD
T05GSUdfTUQ9eQ0KPiAgICAgQ09ORklHX0JMS19ERVZfRE09eQ0KPiAgICAgQ09ORklHX0RNX1ZF
UklUWT15DQo+ICAgICBDT05GSUdfRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUc9eQ0KPiAN
Cj4gICAgIENPTkZJR19TRUNVUklUWV9JUEU9eQ0KPiAgICAgQ09ORklHX1NFQ1VSSVRZX0lQRV9L
VU5JVF9URVNUPXkNCj4gICAgIENPTkZJR19JUEVfUFJPUF9CT09UX1ZFUklGSUVEPXkNCj4gICAg
IENPTkZJR19JUEVfUFJPUF9ETV9WRVJJVFlfU0lHTkFUVVJFPXkNCj4gICAgIENPTkZJR19JUEVf
UFJPUF9ETV9WRVJJVFlfUk9PVEhBU0g9eQ0KPiAgICAgQ09ORklHX0lQRV9QUk9QX0ZTX1ZFUklU
WV9TSUdOQVRVUkU9eQ0KPiAgICAgQ09ORklHX0lQRV9QUk9QX0ZTX1ZFUklUWV9ESUdFU1Q9eQ0K
PiANCj4gU2ltcGx5IHJ1bjoNCj4gDQo+ICAgICBtYWtlIEFSQ0g9dW0gbXJwcm9wZXINCj4gICAg
IC4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4gLS1rdW5pdGNvbmZpZyA8cGF0aC90
by9jb25maWc+DQo+IA0KPiBBbmQgdGhlIHRlc3RzIHdpbGwgZXhlY3V0ZSBhbmQgcmVwb3J0IHRo
ZSByZXN1bHQuIEZvciBtb3JlIGluZGVwdGggdGVzdGluZywNCj4gaXQgd2lsbCByZXF1aXJlIHlv
dSB0byBjcmVhdGUgYW5kIG1vdW50IGEgZG0tdmVyaXR5IHZvbHVtZSBvciBmcy12ZXJpdHkNCj4g
ZW5hYmxlZCBmaWxlLg0KPiANCj4gRG9jdW1lbnRhdGlvbjoNCj4gLS0tLS0tLS0tLS0tLS0NCj4g
DQo+IFRoZXJlIGlzIGJvdGggZG9jdW1lbnRhdGlvbiBhdmFpbGFibGUgb24gZ2l0aHViIGF0DQo+
IGh0dHBzOi8vbWljcm9zb2Z0LmdpdGh1Yi5pby9pcGUsIGFuZCBEb2N1bWVudGF0aW9uIGluIHRo
aXMgcGF0Y2ggc2VyaWVzLA0KPiB0byBiZSBhZGRlZCBpbi10cmVlLiBUaGlzIGluY2x1ZGVzIGFy
Y2hpdGVjdHVyYWwgYmxvY2sgZGlhZ3JhbXMuDQo+IA0KPiBLbm93biBHYXBzOg0KPiAtLS0tLS0t
LS0tLQ0KPiANCj4gSVBFIGhhcyB0d28ga25vd24gZ2FwczoNCj4gDQo+IDEuIElQRSBjYW5ub3Qg
dmVyaWZ5IHRoZSBpbnRlZ3JpdHkgb2YgYW5vbnltb3VzIGV4ZWN1dGFibGUgbWVtb3J5LCBzdWNo
IGFzDQo+ICAgdGhlIHRyYW1wb2xpbmVzIGNyZWF0ZWQgYnkgZ2NjIGNsb3N1cmVzIGFuZCBsaWJm
ZmkgKDwzLjQuMiksIG9yIEpJVCdkIGNvZGUuDQo+ICAgVW5mb3J0dW5hdGVseSwgYXMgdGhpcyBp
cyBkeW5hbWljYWxseSBnZW5lcmF0ZWQgY29kZSwgdGhlcmUgaXMgbm8gd2F5DQo+ICAgZm9yIElQ
RSB0byBlbnN1cmUgdGhlIGludGVncml0eSBvZiB0aGlzIGNvZGUgdG8gZm9ybSBhIHRydXN0IGJh
c2lzLiBJbiBhbGwNCj4gICBjYXNlcywgdGhlIHJldHVybiByZXN1bHQgZm9yIHRoZXNlIG9wZXJh
dGlvbnMgd2lsbCBiZSB3aGF0ZXZlciB0aGUgYWRtaW4NCj4gICBjb25maWd1cmVzIHRoZSBERUZB
VUxUIGFjdGlvbiBmb3IgIkVYRUNVVEUiLg0KPiANCj4gMi4gSVBFIGNhbm5vdCB2ZXJpZnkgdGhl
IGludGVncml0eSBvZiBpbnRlcnByZXRlZCBsYW5ndWFnZXMnIHByb2dyYW1zIHdoZW4NCj4gICB0
aGVzZSBzY3JpcHRzIGludm9rZWQgdmlhIGBgPGludGVycHJldGVyPiA8ZmlsZT5gYC4gVGhpcyBp
cyBiZWNhdXNlIHRoZQ0KPiAgIHdheSBpbnRlcnByZXRlcnMgZXhlY3V0ZSB0aGVzZSBmaWxlcywg
dGhlIHNjcmlwdHMgdGhlbXNlbHZlcyBhcmUgbm90DQo+ICAgZXZhbHVhdGVkIGFzIGV4ZWN1dGFi
bGUgY29kZSB0aHJvdWdoIG9uZSBvZiBJUEUncyBob29rcy4gSW50ZXJwcmV0ZXJzDQo+ICAgY2Fu
IGJlIGVubGlnaHRlbmVkIHRvIHRoZSB1c2FnZSBvZiBJUEUgYnkgdHJ5aW5nIHRvIG1tYXAgYSBm
aWxlIGludG8NCj4gICBleGVjdXRhYmxlIG1lbW9yeSAoK1gpLCBhZnRlciBvcGVuaW5nIHRoZSBm
aWxlIGFuZCByZXNwb25kaW5nIHRvIHRoZQ0KPiAgIGVycm9yIGNvZGUgYXBwcm9wcmlhdGVseS4g
VGhpcyBhbHNvIGFwcGxpZXMgdG8gaW5jbHVkZWQgZmlsZXMsIG9yIGhpZ2gNCj4gICB2YWx1ZSBm
aWxlcywgc3VjaCBhcyBjb25maWd1cmF0aW9uIGZpbGVzIG9mIGNyaXRpY2FsIHN5c3RlbSBjb21w
b25lbnRzLg0KPiAgIEhvd2V2ZXIsIHRoZXJlIGlzIGEgcGF0Y2hzZXQgdGhhdCBpcyBsb29raW5n
IHRvIGFkZHJlc3MgdGhpcyBnYXAgWzFdLg0KPiANCj4gQXBwZW5kaXg6DQo+IC0tLS0tLS0tLQ0K
PiANCj4gQS4gSVBFIEdpdGh1YiBSZXBvc2l0b3J5OiBodHRwczovL2dpdGh1Yi5jb20vbWljcm9z
b2Z0L2lwZQ0KPiBCLiBJUEUgVXNlcnMnIEd1aWRlOiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L0xTTS9pcGUucnN0DQo+IA0KPiBSZWZlcmVuY2VzOg0KPiAtLS0tLS0tLS0tLQ0KPiANCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMTAxMjE5MjQxMC4yMzU2MDkwLTEtbWlj
QGRpZ2lrb2QubmV0Lw0KPiANCj4gRkFROg0KPiAtLS0tDQo+IA0KPiBROiBXaGF0J3MgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiBvdGhlciBMU01zIHdoaWNoIHByb3ZpZGUgdHJ1c3QtYmFzZWQNCj4g
ICBhY2Nlc3MgY29udHJvbCwgZm9yIGluc3RhbmNlLCBJTUE/DQo+IA0KPiBBOiBJTUEgaXMgYSBm
YW50YXN0aWMgb3B0aW9uIHdoZW4gbmVlZGluZyBtZWFzdXJlbWVudCBpbiBhZGRpdGlvbiB0byB0
aGUNCj4gICB0cnVzdC1iYXNlZCBhY2Nlc3MgbW9kZWwuIEFsbCBvZiBJTUEgaXMgY2VudGVyZWQg
YXJvdW5kIHRoZWlyIG1lYXN1cmVtZW50DQo+ICAgaGFzaGVzLCBzbyB5b3Ugc2F2ZSB0aW1lIHdo
ZW4gZG9pbmcgYm90aCBhY3Rpb25zLiBJUEUsIG9uIHRoZSBvdGhlciBoYW5kLA0KPiAgIGlzIGEg
aGlnaGx5IHBlcmZvcm1hbnQgc3lzdGVtIHRoYXQgZG9lcyBub3QgcmVseSAoYW5kIGV4cGxpY2l0
bHkgcHJvaGliaXRzKSwNCj4gICBnZW5lcmF0aW5nIGl0cyBvd24gaW50ZWdyaXR5IG1lY2hhbmlz
bXMgLSBzZXBhcmF0aW5nIG1lYXN1cmVtZW50IGFuZCBhY2Nlc3MNCj4gICBjb250cm9sLiBTaW1w
bHkgcHV0LCBJUEUgcHJvdmlkZXMgb25seSB0aGUgZW5mb3JjZW1lbnQgb2YgdHJ1c3QsIHdoaWxl
IG90aGVyDQo+ICAgc3Vic3lzdGVtcyBwcm92aWRlIHRoZSBpbnRlZ3JpdHkgZ3VhcmFudGVlIHRo
YXQgSVBFIG5lZWRzIHRvIGRldGVybWluZSB0aGUNCj4gICB0cnVzdCBvZiBhIHJlc291cmNlLiBJ
TUEgcHJvdmlkZXMgYm90aCB0aGUgaW50ZWdyaXR5IGd1YXJhbnRlZSwgdGhlDQo+ICAgZW5mb3Jj
ZW1lbnQgb2YgdHJ1c3QsIGFuZCBhIHdob2xlIGhvc3Qgb2Ygb3RoZXIgZmVhdHVyZXMgdGhhdCBt
YXkgbm90IGJlDQo+ICAgbmVlZGVkLg0KPiANCj4gQ2hhbmdlbG9nOg0KPiAtLS0tLS0tLS0tDQo+
IA0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgIFNwbGl0IHRoZSBzZWNvbmQgcGF0Y2ggb2YgdGhl
IHByZXZpb3VzIHNlcmllcyBpbnRvIHR3by4NCj4gICBNaW5vciBjb3JyZWN0aW9ucyBpbiB0aGUg
Y292ZXItbGV0dGVyIGFuZCBkb2N1bWVudGF0aW9uDQo+ICAgY29tbWVudHMgcmVnYXJkaW5nIENB
UF9NQUNfQURNSU4gY2hlY2tzIGluIElQRS4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+ICAg
QWRkcmVzcyB2YXJpb3VzIGNvbW1lbnRzIGJ5IEphbm4gSG9ybi4gSGlnaGxpZ2h0czoNCj4gICAg
IFN3aXRjaCB2YXJpb3VzIGF1ZGl0IGFsbG9jYXRvcnMgdG8gR0ZQX0tFUk5FTC4NCj4gICAgIFV0
aWxpemUgcmN1X2FjY2Vzc19wb2ludGVyKCkgaW4gdmFyaW91cyBsb2NhdGlvbnMuDQo+ICAgICBT
dHJpcCBvdXQgdGhlIGNhY2hpbmcgc3lzdGVtIGZvciBwcm9wZXJ0aWVzDQo+ICAgICBTdHJpcCBj
b21tZW50cyBmcm9tIGhlYWRlcnMNCj4gICAgIE1vdmUgZnVuY3Rpb25zIGFyb3VuZCBpbiBwYXRj
aGVzDQo+ICAgICBSZW1vdmUga2VybmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXJzDQo+ICAgICBS
ZWNvbmNpbGUgdGhlIHJhY2UgY29uZGl0aW9uIG9uIHRoZSBkZWxldGUgbm9kZSBmb3IgcG9saWN5
IGJ5DQo+ICAgICAgIGV4cGFuZGluZyB0aGUgcG9saWN5IGNyaXRpY2FsIHNlY3Rpb24uDQo+IA0K
PiAgIEFkZHJlc3MgYSBmZXcgY29tbWVudHMgYnkgSm9uYXRoYW4gQ29yYmV0IGFyb3VuZCB0aGUg
ZG9jdW1lbnRhdGlvbg0KPiAgICAgcGFnZXMgZm9yIElQRS4NCj4gDQo+ICAgRml4IGFuIGlzc3Vl
IHdpdGggdGhlIGluaXRpYWxpemF0aW9uIG9mIElQRSBwb2xpY3kgd2l0aCBhICItMCINCj4gICAg
IHZlcnNpb24sIGNhdXNlZCBieSBub3QgaW5pdGlhbGl6aW5nIHRoZSBobGlzdCBlbnRyaWVzIGJl
Zm9yZQ0KPiAgICAgZnJlZWluZy4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjM6DQo+ICAgQWRkcmVz
cyBhIGNvbmNlcm4gYXJvdW5kIElQRSdzIGJlaGF2aW9yIHdpdGggdW5rbm93biBzeW50YXguDQo+
ICAgICBTcGVjaWZpY2FsbHksIG1ha2UgYW55IHVua25vd24gc3ludGF4IGEgZmF0YWwgZXJyb3Ig
aW5zdGVhZCBvZiBhDQo+ICAgICB3YXJuaW5nLCBhcyBzdWdnZXN0ZWQgYnkgTWlja2HDq2wgU2Fs
YcO8bi4NCj4gICBJbnRyb2R1Y2UgYSBuZXcgc2VjdXJpdHlmcyBub2RlLCAkc2VjdXJpdHlmcy9p
cGUvcHJvcGVydHlfY29uZmlnLA0KPiAgICAgd2hpY2ggcHJvdmlkZXMgYSBsaXN0aW5nIG9mIHdo
YXQgcHJvcGVydGllcyBhcmUgZW5hYmxlZCBieSB0aGUNCj4gICAgIGtlcm5lbCBhbmQgdGhlaXIg
dmVyc2lvbnMuIFRoaXMgYWxsb3dzIHVzZXJtb2RlIHRvIHByZWRpY3Qgd2hhdA0KPiAgICAgcG9s
aWNpZXMgc2hvdWxkIGJlIGFsbG93ZWQuDQo+ICAgU3RyaXAgc29tZSBjb21tZW50cyBmcm9tIGMg
ZmlsZXMgdGhhdCBJIG1pc3NlZC4NCj4gICBDbGFyaWZ5IHNvbWUgZG9jdW1lbnRhdGlvbiBjb21t
ZW50cyBhcm91bmQgJ2Jvb3RfdmVyaWZpZWQnLg0KPiAgICAgV2hpbGUgdGhpcyBjdXJyZW50bHkg
ZG9lcyBub3QgZnVuY3Rpb25hbGx5IGNoYW5nZSB0aGUgcHJvcGVydHkNCj4gICAgIGl0c2VsZiwg
dGhlIGRpc3RpbmN0aW9uIGlzIGltcG9ydGFudCB3aGVuIElQRSBjYW4gZW5mb3JjZSB2ZXJpZmll
ZA0KPiAgICAgcmVhZHMuIEFkZGl0aW9uYWxseSwgJ0tFUk5FTF9SRUFEJyB3YXMgb21pdHRlZCBm
cm9tIHRoZSBkb2N1bWVudGF0aW9uLg0KPiAgICAgVGhpcyBoYXMgYmVlbiBjb3JyZWN0ZWQuDQo+
ICAgQ2hhbmdlIFNlY3VyaXR5RlMgYW5kIFNIQTEgdG8gYSByZXZlcnNlIGRlcGVuZGVuY3kuDQo+
ICAgVXBkYXRlIHRoZSBjb3Zlci1sZXR0ZXIgd2l0aCB0aGUgdXBkYXRlZCBiZWhhdmlvciBvZiB1
bmtub3duIHN5bnRheC4NCj4gICBSZW1vdmUgYWxsIHN5c2N0bHMsIG1ha2luZyBhbiBlcXVpdmFs
ZW50IGZ1bmN0aW9uIGluIHNlY3VyaXR5ZnMuDQo+ICAgUmV3b3JrIHRoZSBhY3RpdmUvZGVsZXRl
IG1lY2hhbmlzbSB0byBiZSBhIG5vZGUgdW5kZXIgdGhlIHBvbGljeSBpbg0KPiAgICAgJHNlY3Vy
aXR5ZnMvaXBlL3BvbGljaWVzLg0KPiAgIFRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRl
cnMgaXBlLmVuZm9yY2UgYW5kIGlwZS5zdWNjZXNzX2F1ZGl0DQo+ICAgICBoYXZlIHJldHVybmVk
IGFzIHRoaXMgZnVuY3Rpb25hbGl0eSBpcyBubyBsb25nZXIgZXhwb3NlZCB0aHJvdWdoDQo+ICAg
ICBzeXNmcy4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjQ6DQo+ICAgQ29ycmVjdCBzb21lIGdyYW1t
YXRpY2FsIGVycm9ycyByZXBvcnRlZCBieSBSYW5keSBEdW5sYXAuDQo+ICAgRml4IHNvbWUgd2Fy
bmluZ3MgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3QgYm90Lg0KPiAgIENoYW5nZSBjb252ZW50aW9u
IGFyb3VuZCBzZWN1cml0eV9iZGV2X3NldHNlY3VyaXR5LiAtRU5PU1lTDQo+ICAgICBpcyBub3cg
ZXhwZWN0ZWQgaWYgYW4gTFNNIGRvZXMgbm90IGltcGxlbWVudCBhIHBhcnRpY3VsYXIgQG5hbWUs
DQo+ICAgICBhcyBzdWdnZXN0ZWQgYnkgQ2FzZXkgU2NoYXVmbGVyLg0KPiAgIE1pbm9yIHN0cmlu
ZyBjb3JyZWN0aW9ucyByZWxhdGVkIHRvIHRoZSBtb3ZlIGZyb20gc3lzZnMgdG8gc2VjdXJpdHlm
cw0KPiAgIENvcnJlY3QgYSBzcGVsbGluZyBvZiBhbiAjaWZkZWYgZm9yIHRoZSBwZXJtaXNzaXZl
IGFyZ3VtZW50Lg0KPiAgIEFkZCB0aGUga2VybmVsIHBhcmFtZXRlcnMgcmUtYWRkZWQgdG8gdGhl
IGRvY3VtZW50YXRpb24uDQo+ICAgRml4IGEgbWlub3IgYnVnIHdoZXJlIHRoZSBtb2RlIGJlaW5n
IGF1ZGl0ZWQgb24gcGVybWlzc2l2ZSBzd2l0Y2gNCj4gICAgIHdhcyB0aGUgb3JpZ2luYWwgbW9k
ZSwgbm90IHRoZSBtb2RlIGJlaW5nIHN3YXBwZWQgdG8uDQo+ICAgQ2xlYW51cCBkb2MgY29tbWVu
dHMsIGZpeCBzb21lIHdoaXRlc3BhY2UgYWxpZ25tZW50IGlzc3Vlcy4NCj4gDQo+IENoYW5nZXMg
c2luY2UgdjU6DQo+ICAgQ2hhbmdlIGlmIHN0YXRlbWVudCBjb25kaXRpb24gaW4gc2VjdXJpdHlf
YmRldl9zZXRzZWN1cml0eSB0byBiZQ0KPiAgICAgbW9yZSBjb25jaXNlLCBhcyBzdWdnZXN0ZWQg
YnkgQ2FzZXkgU2NoYXVmbGVyIGFuZCBBbCBWaXJvDQo+ICAgRHJvcCB0aGUgNnRoIHBhdGNoIGlu
IHRoZSBzZXJpZXMsICJkbS12ZXJpdHkgbW92ZSBzaWduYXR1cmUgY2hlY2suLi4iDQo+ICAgICBk
dWUgdG8gbnVtZXJvdXMgaXNzdWVzLCBhbmQgaXQgdWx0aW1hdGVseSBwcm92aWRpbmcgbm8gcmVh
bCB2YWx1ZS4NCj4gICBGaXggdGhlIHBhdGNoIHRyZWUgLSB0aGUgcHJldmlvdXMgaXRlcmF0aW9u
IGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGluIGENCj4gICAgIHRvcm4gc3RhdGUgKHBhdGNoZXMgOCs5
IHdlcmUgbWVyZ2VkKS4gVGhpcyBoYXMgc2luY2UgYmVlbiBjb3JyZWN0ZWQuDQo+IA0KPiBDaGFu
Z2VzIHNpbmNlIHY2Og0KPiAgICogUmV3b3JkIGNvdmVyIGxldHRlciB0byBtb3JlIGFjY3VyYXRl
IGNvbnZleSBJUEUncyBwdXJwb3NlDQo+ICAgICBhbmQgbGF0ZXN0IHVwZGF0ZXMuDQo+ICAgKiBS
ZWZhY3RvciBzZXJpZXMgdG86DQo+ICAgICAgIDEuIFN1cHBvcnQgYSBjb250ZXh0IHN0cnVjdHVy
ZSwgZW5hYmxpbmc6DQo+ICAgICAgICAgICAxLiBFYXNpZXIgVGVzdGluZyB2aWEgS1VOSVQNCj4g
ICAgICAgICAgIDIuIEEgYmV0dGVyIGFyY2hpdGVjdHVyZSBmb3IgZnV0dXJlIGRlc2lnbnMNCj4g
ICAgICAgMi4gTWFrZSBwYXJzZXIgY29kZSBjbGVhbmVyDQo+ICAgKiBNb3ZlIHBhdGNoIDAxLzEy
IHRvIFsxNC8xNl0gb2YgdGhlIHNlcmllcw0KPiAgICogU3BsaXQgdXAgcGF0Y2ggMDIvMTIgaW50
byBmb3VyIHBhcnRzOg0KPiAgICAgICAxLiBjb250ZXh0IGNyZWF0aW9uIFswMS8xNl0NCj4gICAg
ICAgMi4gYXVkaXQgWzA3LzE2XQ0KPiAgICAgICAzLiBldmFsdWF0aW9uIGxvb3AgWzAzLzE2XQ0K
PiAgICAgICA0LiBhY2Nlc3MgY29udHJvbCBob29rcyBbMDUvMTZdDQo+ICAgICAgIDUuIHBlcm1p
c3NpdmUgbW9kZSBbMDgvMTZdDQo+ICAgKiBTcGxpdCB1cCBwYXRjaCAwMy8xMiBpbnRvIHR3byBw
YXJ0czoNCj4gICAgICAgMS4gcGFyc2VyIFswMi8xNl0NCj4gICAgICAgMi4gdXNlcnNwYWNlIGlu
dGVyZmFjZSBbMDQvMTZdDQo+ICAgKiBSZXdvcmQgYW5kIHJlZmFjdG9yIHBhdGNoIDA0LzEyIHRv
IFswOS8xNl0NCj4gICAqIFNxdWFzaCBwYXRjaCAwNS8xMiwgMDcvMTIsIDA5LzEyIHRvIFsxMC8x
Nl0NCj4gICAqIFNxdWFzaCBwYXRjaCAwOC8xMiwgMTAvMTIgdG8gWzExLzE2XQ0KPiAgICogQ2hh
bmdlIGF1ZGl0IHJlY29yZHMgdG8gTUFDIHJlZ2lvbiAoMTRYWCkgZnJvbSBJbnRlZ3JpdHkgcmVn
aW9uICgxOFhYKQ0KPiAgICogQWRkIEZTVmVyaXR5IFN1cHBvcnQNCj4gICAqIEludGVyZmFjZSBj
aGFuZ2VzOg0KPiAgICAgICAxLiAicmF3IiB3YXMgcmVuYW1lZCB0byAicGtjczciIGFuZCBtYWRl
IHJlYWQgb25seQ0KPiAgICAgICAyLiAicmF3IidzIHdyaXRlIGZ1bmN0aW9uYWxpdHkgKHVwZGF0
ZSBhIHBvbGljeSkgbW92ZWQgdG8gInVwZGF0ZSINCj4gICAgICAgMy4gaW50cm9kdWNlZCAidmVy
c2lvbiIsICJwb2xpY3lfbmFtZSIgbm9kZXMuDQo+ICAgICAgIDQuICJjb250ZW50IiByZW5hbWVk
IHRvICJwb2xpY3kiDQo+ICAgICAgIDUuIFRoZSBib290IHBvbGljeSBjYW4gbm93IGJlIHVwZGF0
ZWQgbGlrZSBhbnkgb3RoZXIgcG9saWN5Lg0KPiAgICogQWRkIGFkZGl0aW9uYWwgZGV2ZWxvcGVy
LWxldmVsIGRvY3VtZW50YXRpb24NCj4gICAqIFVwZGF0ZSBhZG1pbi1ndWlkZSBkb2NzIHRvIHJl
ZmxlY3QgY2hhbmdlcy4NCj4gICAqIEt1bml0IHRlc3RzDQo+ICAgKiBEcm9wcGVkIENPTkZJR19T
RUNVUklUWV9JUEVfUEVSTUlTU0lWRV9TV0lUQ0ggLSBmdW5jdGlvbmFsaXR5IGNhbg0KPiAgICAg
ZWFzaWx5IGNvbWUgbGF0ZXIgd2l0aCBhIHNtYWxsIHBhdGNoLg0KPiAgICogVXNlIHBhcnRpdGlv
bjAgZm9yIGJsb2NrX2RldmljZSBmb3IgZG0tdmVyaXR5IHBhdGNoDQo+IA0KPiBEZXZlbiBCb3dl
cnMgKDE0KToNCj4gICBzZWN1cml0eTogYWRkIGlwZSBsc20gJiBpbml0aWFsIGNvbnRleHQgY3Jl
YXRpb24NCj4gICBpcGU6IGFkZCBwb2xpY3kgcGFyc2VyDQo+ICAgaXBlOiBhZGQgZXZhbHVhdGlv
biBsb29wDQo+ICAgaXBlOiBhZGQgdXNlcnNwYWNlIGludGVyZmFjZQ0KPiAgIGlwZTogYWRkIExT
TSBob29rcyBvbiBleGVjdXRpb24gYW5kIGtlcm5lbCByZWFkDQo+ICAgdWFwaXxhdWRpdDogYWRk
IHRydXN0IGF1ZGl0IG1lc3NhZ2UgZGVmaW5pdGlvbnMNCj4gICBpcGU6IGFkZCBhdWRpdGluZyBz
dXBwb3J0DQo+ICAgaXBlOiBhZGQgcGVybWlzc2l2ZSB0b2dnbGUNCj4gICBpcGU6IGludHJvZHVj
ZSAnYm9vdF92ZXJpZmllZCcgYXMgYSB0cnVzdCBwcm92aWRlcg0KPiAgIGZzfGRtLXZlcml0eTog
YWRkIGJsb2NrX2RldiBMU00gYmxvYiBhbmQgc3VibWl0IGRtLXZlcml0eSBkYXRhDQo+ICAgaXBl
OiBhZGQgc3VwcG9ydCBmb3IgZG0tdmVyaXR5IGFzIGEgdHJ1c3QgcHJvdmlkZXINCj4gICBzY3Jp
cHRzOiBhZGQgYm9vdCBwb2xpY3kgZ2VuZXJhdGlvbiBwcm9ncmFtDQo+ICAgaXBlOiBrdW5pdCB0
ZXN0cw0KPiAgIGRvY3VtZW50YXRpb246IGFkZCBpcGUgZG9jdW1lbnRhdGlvbg0KPiANCj4gRmFu
IFd1ICgyKToNCj4gICBmc3Zlcml0eXxzZWN1cml0eTogYWRkIHNlY3VyaXR5IGhvb2tzIHRvIGZz
dmVyaXR5IGRpZ2VzdCBhbmQgc2lnbmF0dXJlDQo+ICAgaXBlOiBlbmFibGUgc3VwcG9ydCBmb3Ig
ZnMtdmVyaXR5IGFzIGEgdHJ1c3QgcHJvdmlkZXINCj4gDQo+ICBEb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL0xTTS9pbmRleC5yc3QgICAgICAgfCAgICAxICsNCj4gIERvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvTFNNL2lwZS5yc3QgICAgICAgICB8ICA1ODcgKysrKysrKysrKw0KPiAgLi4uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgICAxMiArDQo+ICBEb2N1
bWVudGF0aW9uL3NlY3VyaXR5L2luZGV4LnJzdCAgICAgICAgICAgICAgfCAgICAxICsNCj4gIERv
Y3VtZW50YXRpb24vc2VjdXJpdHkvaXBlLnJzdCAgICAgICAgICAgICAgICB8ICAzMzkgKysrKysr
DQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5
ICsNCj4gIGJsb2NrL2JkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
IDcgKw0KPiAgZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMgICAgICAgICAgICAgICAgIHwg
ICAyMCArLQ0KPiAgZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5jICAgICAgICAgICAg
IHwgICAxNiArLQ0KPiAgZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5oICAgICAgICAg
ICAgIHwgICAxMCArLQ0KPiAgZnMvdmVyaXR5L29wZW4uYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxMiArDQo+ICBmcy92ZXJpdHkvc2lnbmF0dXJlLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICA1ICstDQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3ZtbGludXgubGRzLmgg
ICAgICAgICAgICAgfCAgIDE2ICsNCj4gIGluY2x1ZGUvbGludXgvYmxrX3R5cGVzLmggICAgICAg
ICAgICAgICAgICAgICB8ICAgIDEgKw0KPiAgaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmgg
ICAgICAgICAgICAgICAgIHwgICAgMyArDQo+ICBpbmNsdWRlL2xpbnV4L2ZzdmVyaXR5LmggICAg
ICAgICAgICAgICAgICAgICAgfCAgICAzICsNCj4gIGluY2x1ZGUvbGludXgvbHNtX2hvb2tfZGVm
cy5oICAgICAgICAgICAgICAgICB8ICAgIDUgKw0KPiAgaW5jbHVkZS9saW51eC9sc21faG9va3Mu
aCAgICAgICAgICAgICAgICAgICAgIHwgICAxMiArDQo+ICBpbmNsdWRlL2xpbnV4L3NlY3VyaXR5
LmggICAgICAgICAgICAgICAgICAgICAgfCAgIDIyICsNCj4gIGluY2x1ZGUvdWFwaS9saW51eC9h
dWRpdC5oICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKw0KPiAgc2NyaXB0cy9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ICBzY3JpcHRzL2lwZS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICsNCj4gIHNjcmlwdHMvaXBlL3Bv
bGdlbi8uZ2l0aWdub3JlICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiAgc2NyaXB0cy9pcGUv
cG9sZ2VuL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAgNiArDQo+ICBzY3JpcHRzL2lw
ZS9wb2xnZW4vcG9sZ2VuLmMgICAgICAgICAgICAgICAgICAgfCAgMTQ1ICsrKw0KPiAgc2VjdXJp
dHkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMSArLQ0KPiAgc2Vj
dXJpdHkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ICBz
ZWN1cml0eS9pcGUvLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4g
IHNlY3VyaXR5L2lwZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMDAgKysN
Cj4gIHNlY3VyaXR5L2lwZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMzkg
Kw0KPiAgc2VjdXJpdHkvaXBlL2F1ZGl0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMw
NCArKysrKw0KPiAgc2VjdXJpdHkvaXBlL2F1ZGl0LmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA0MSArDQo+ICBzZWN1cml0eS9pcGUvY3R4LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMzgxICsrKysrKw0KPiAgc2VjdXJpdHkvaXBlL2N0eC5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA0MyArDQo+ICBzZWN1cml0eS9pcGUvY3R4X3Rlc3QuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNzMyICsrKysrKysrKysrKw0KPiAgc2VjdXJpdHkvaXBlL2V2YWwuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIzNyArKysrDQo+ICBzZWN1cml0eS9pcGUvZXZh
bC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDU3ICsNCj4gIHNlY3VyaXR5L2lwZS9m
cy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzMjcgKysrKysrDQo+ICBzZWN1cml0
eS9pcGUvZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEzICsNCj4gIHNlY3Vy
aXR5L2lwZS9ob29rcy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzMjggKysrKysrDQo+
ICBzZWN1cml0eS9pcGUvaG9va3MuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDU2ICsN
Cj4gIHNlY3VyaXR5L2lwZS9pcGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNDMg
KysrDQo+ICBzZWN1cml0eS9pcGUvaXBlLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDI3ICsNCj4gIHNlY3VyaXR5L2lwZS9pcGVfcGFyc2VyLmggICAgICAgICAgICAgICAgICAgICB8
ICAgNTkgKw0KPiAgc2VjdXJpdHkvaXBlL21vZHVsZXMuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEzNCArKysNCj4gIHNlY3VyaXR5L2lwZS9tb2R1bGVzLmggICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMTcgKw0KPiAgc2VjdXJpdHkvaXBlL21vZHVsZXMvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgICA2NiArKw0KPiAgc2VjdXJpdHkvaXBlL21vZHVsZXMvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgIHwgICAxMiArDQo+ICBzZWN1cml0eS9pcGUvbW9kdWxlcy9ib290X3ZlcmlmaWVk
LmMgICAgICAgICAgfCAgIDI0ICsNCj4gIHNlY3VyaXR5L2lwZS9tb2R1bGVzL2RtdmVyaXR5X3Jv
b3RoYXNoLmMgICAgICB8ICAgODAgKysNCj4gIHNlY3VyaXR5L2lwZS9tb2R1bGVzL2RtdmVyaXR5
X3NpZ25hdHVyZS5jICAgICB8ICAgMjUgKw0KPiAgc2VjdXJpdHkvaXBlL21vZHVsZXMvZnN2ZXJp
dHlfZGlnZXN0LmMgICAgICAgIHwgICA4MCArKw0KPiAgc2VjdXJpdHkvaXBlL21vZHVsZXMvZnN2
ZXJpdHlfc2lnbmF0dXJlLmMgICAgIHwgICAzMyArDQo+ICBzZWN1cml0eS9pcGUvbW9kdWxlcy9p
cGVfbW9kdWxlLmggICAgICAgICAgICAgfCAgIDQwICsNCj4gIHNlY3VyaXR5L2lwZS9wYXJzZXJz
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMzkgKysrDQo+ICBzZWN1cml0eS9pcGUvcGFy
c2Vycy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEyICsNCj4gIHNlY3VyaXR5L2lwZS9w
YXJzZXJzL2RlZmF1bHQuYyAgICAgICAgICAgICAgICB8ICAxMDYgKysNCj4gIHNlY3VyaXR5L2lw
ZS9wYXJzZXJzL3BvbGljeV9oZWFkZXIuYyAgICAgICAgICB8ICAxMjYgKysNCj4gIHNlY3VyaXR5
L2lwZS9wb2xpY3kuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwMzcgKysrKysrKysrKysr
KysrKysNCj4gIHNlY3VyaXR5L2lwZS9wb2xpY3kuaCAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxMTMgKysNCj4gIHNlY3VyaXR5L2lwZS9wb2xpY3lfcGFyc2VyX3Rlc3RzLmMgICAgICAgICAg
ICB8ICAyOTkgKysrKysNCj4gIHNlY3VyaXR5L2lwZS9wb2xpY3lmcy5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICA1MjggKysrKysrKysrDQo+ICBzZWN1cml0eS9zZWN1cml0eS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDc2ICstDQo+ICA2MyBmaWxlcyBjaGFuZ2VkLCA3MDY5IGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvTFNNL2lwZS5yc3QNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3NlY3VyaXR5L2lwZS5yc3QNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3Jp
cHRzL2lwZS9NYWtlZmlsZQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvaXBlL3BvbGdl
bi8uZ2l0aWdub3JlDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9pcGUvcG9sZ2VuL01h
a2VmaWxlDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9pcGUvcG9sZ2VuL3BvbGdlbi5j
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlLy5naXRpZ25vcmUNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvS2NvbmZpZw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHNlY3VyaXR5L2lwZS9NYWtlZmlsZQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lw
ZS9hdWRpdC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2F1ZGl0LmgNCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvY3R4LmMNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzZWN1cml0eS9pcGUvY3R4LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9p
cGUvY3R4X3Rlc3QuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9ldmFsLmMN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvZXZhbC5oDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2ZzLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0
eS9pcGUvZnMuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9ob29rcy5jDQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2hvb2tzLmgNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzZWN1cml0eS9pcGUvaXBlLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0
eS9pcGUvaXBlLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvaXBlX3BhcnNl
ci5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL21vZHVsZXMuYw0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzLmgNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzZWN1cml0eS9pcGUvbW9kdWxlcy9LY29uZmlnDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
c2VjdXJpdHkvaXBlL21vZHVsZXMvTWFrZWZpbGUNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1
cml0eS9pcGUvbW9kdWxlcy9ib290X3ZlcmlmaWVkLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
ZWN1cml0eS9pcGUvbW9kdWxlcy9kbXZlcml0eV9yb290aGFzaC5jDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgc2VjdXJpdHkvaXBlL21vZHVsZXMvZG12ZXJpdHlfc2lnbmF0dXJlLmMNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvbW9kdWxlcy9mc3Zlcml0eV9kaWdlc3QuYw0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9tb2R1bGVzL2ZzdmVyaXR5X3NpZ25hdHVy
ZS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL21vZHVsZXMvaXBlX21vZHVs
ZS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BhcnNlcnMuYw0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9wYXJzZXJzL01ha2VmaWxlDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BhcnNlcnMvZGVmYXVsdC5jDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BhcnNlcnMvcG9saWN5X2hlYWRlci5jDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL3BvbGljeS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
c2VjdXJpdHkvaXBlL3BvbGljeS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBl
L3BvbGljeV9wYXJzZXJfdGVzdHMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lw
ZS9wb2xpY3lmcy5jDQo+IA0KPiAtLQ0KPiAyLjMzLjANCg0K

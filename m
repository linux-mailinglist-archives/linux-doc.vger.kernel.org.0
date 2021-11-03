Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1076D444179
	for <lists+linux-doc@lfdr.de>; Wed,  3 Nov 2021 13:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhKCMap (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Nov 2021 08:30:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:4054 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhKCMao (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 08:30:44 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HkmDS5FzXz67v0C;
        Wed,  3 Nov 2021 20:24:40 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 13:28:04 +0100
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2308.015;
 Wed, 3 Nov 2021 13:28:04 +0100
From:   Roberto Sassu <roberto.sassu@huawei.com>
To:     Deven Bowers <deven.desai@linux.microsoft.com>,
        Eric Biggers <ebiggers@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "agk@redhat.com" <agk@redhat.com>,
        "snitzer@redhat.com" <snitzer@redhat.com>,
        "tytso@mit.edu" <tytso@mit.edu>,
        "paul@paul-moore.com" <paul@paul-moore.com>,
        "eparis@redhat.com" <eparis@redhat.com>,
        "jmorris@namei.org" <jmorris@namei.org>,
        "serge@hallyn.com" <serge@hallyn.com>,
        "jannh@google.com" <jannh@google.com>,
        "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
        "linux-audit@redhat.com" <linux-audit@redhat.com>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
Subject: RE: [RFC PATCH v7 12/16] fsverity|security: add security hooks to
 fsverity digest and signature
Thread-Topic: [RFC PATCH v7 12/16] fsverity|security: add security hooks to
 fsverity digest and signature
Thread-Index: AQHXwGWUN6BqcPCg3Uma5jdt5usPz6vRLYAAgAMlHYCAHWTKcA==
Date:   Wed, 3 Nov 2021 12:28:04 +0000
Message-ID: <0b4c9a91afb441b085ec914118617ee7@huawei.com>
References: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
 <1634151995-16266-13-git-send-email-deven.desai@linux.microsoft.com>
 <YWcyYBuNppjrVOe2@gmail.com>
 <9089bdb0-b28a-9fa0-c510-00fa275af621@linux.microsoft.com>
In-Reply-To: <9089bdb0-b28a-9fa0-c510-00fa275af621@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.204.63.33]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PiBGcm9tOiBEZXZlbiBCb3dlcnMgW21haWx0bzpkZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQu
Y29tXQ0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTUsIDIwMjEgOToyNiBQTQ0KPiBPbiAxMC8x
My8yMDIxIDEyOjI0IFBNLCBFcmljIEJpZ2dlcnMgd3JvdGU6DQo+ID4gT24gV2VkLCBPY3QgMTMs
IDIwMjEgYXQgMTI6MDY6MzFQTSAtMDcwMCwNCj4gZGV2ZW4uZGVzYWlAbGludXgubWljcm9zb2Z0
LmNvbSB3cm90ZToNCj4gPj4gRnJvbTogRmFuIFd1IDx3dWZhbkBsaW51eC5taWNyb3NvZnQuY29t
Pg0KPiA+Pg0KPiA+PiBBZGQgc2VjdXJpdHlfaW5vZGVfc2V0c2VjdXJpdHkgdG8gZnN2ZXJpdHkg
c2lnbmF0dXJlIHZlcmlmaWNhdGlvbi4NCj4gPj4gVGhpcyBjYW4gbGV0IExTTXMgc2F2ZSB0aGUg
c2lnbmF0dXJlIGRhdGEgYW5kIGRpZ2VzdCBoYXNoZXMgcHJvdmlkZWQNCj4gPj4gYnkgZnN2ZXJp
dHkuDQo+ID4gQ2FuIHlvdSBlbGFib3JhdGUgb24gd2h5IExTTXMgbmVlZCB0aGlzIGluZm9ybWF0
aW9uPw0KPiANCj4gVGhlIHByb3Bvc2VkIExTTSAoSVBFKSBvZiB0aGlzIHNlcmllcyB3aWxsIGJl
IHRoZSBvbmx5IG9uZSB0byBuZWVkDQo+IHRoaXMgaW5mb3JtYXRpb24gYXQgdGhlwqAgbW9tZW50
LiBJUEXigJlzIGdvYWwgaXMgdG8gaGF2ZSBwcm92aWRlDQo+IHRydXN0LWJhc2VkIGFjY2VzcyBj
b250cm9sLiBUcnVzdCBhbmQgSW50ZWdyaXR5IGFyZSB0aWVkIHRvZ2V0aGVyLA0KPiBhcyB5b3Ug
Y2Fubm90IHByb3ZlIHRydXN0IHdpdGhvdXQgcHJvdmluZyBpbnRlZ3JpdHkuDQoNCkkgd2FudGVk
IHRvIGdvIGJhY2sgb24gdGhpcyBxdWVzdGlvbi4NCg0KSXQgc2VlbXMsIGF0IGxlYXN0IGZvciBm
c3Zlcml0eSwgdGhhdCB5b3UgY291bGQgb2J0YWluIHRoZQ0Kcm9vdCBkaWdlc3QgYXQgcnVuLXRp
bWUsIHdpdGhvdXQgc3RvcmluZyBpdCBpbiBhIHNlY3VyaXR5IGJsb2IuDQoNCkkgdGhvdWdodCBJ
IHNob3VsZCB1c2UgZnN2ZXJpdHlfZ2V0X2luZm8oKSBidXQgdGhlIGZzdmVyaXR5X2luZm8NCnN0
cnVjdHVyZSBpcyBub3QgZXhwb3J0ZWQgKGl0IGlzIGRlZmluZWQgaW4gZnMvdmVyaXR5L2ZzdmVy
aXR5X3ByaXZhdGUuaCkuDQoNClRoZW4sIEkgZGVmaW5lZCBhIG5ldyBmdW5jdGlvbiwgZnN2ZXJp
dHlfZ2V0X2ZpbGVfZGlnZXN0KCkgdG8gY29weQ0KdGhlIGZpbGVfZGlnZXN0IG1lbWJlciBvZiBm
c3Zlcml0eV9pbmZvIHRvIGEgYnVmZmVyIGFuZCB0byBwYXNzDQp0aGUgYXNzb2NpYXRlZCBoYXNo
IGFsZ29yaXRobS4NCg0KV2l0aCB0aGF0LCB0aGUgY29kZSBvZiBldmFsdWF0ZSgpIGZvciBESUdM
SU0gYmVjb21lczoNCg0KICAgICAgICBpbmZvID0gZnN2ZXJpdHlfZ2V0X2luZm8oZmlsZV9pbm9k
ZShjdHgtPmZpbGUpKTsNCiAgICAgICAgaWYgKGluZm8pDQogICAgICAgICAgICAgICAgcmV0ID0g
ZnN2ZXJpdHlfZ2V0X2ZpbGVfZGlnZXN0KGluZm8sIGJ1ZmZlciwgc2l6ZW9mKGJ1ZmZlciksICZh
bGdvKTsNCg0KICAgICAgICBpZiAoIXN0cmNtcChleHBlY3QtPmRhdGEsICJkaWdsaW0iKSAmJiBy
ZXQgPiAwKSB7DQogICAgICAgICAgICAgICAgcmV0ID0gZGlnbGltX2RpZ2VzdF9nZXRfaW5mbyhi
dWZmZXIsIGFsZ28sIENPTVBBQ1RfRklMRSwgJm1vZGlmaWVycywgJmFjdGlvbnMpOw0KICAgICAg
ICAgICAgICAgIGlmICghcmV0KQ0KICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
DQogICAgICAgIH0NCg0KUm9iZXJ0bw0KDQpIVUFXRUkgVEVDSE5PTE9HSUVTIER1ZXNzZWxkb3Jm
IEdtYkgsIEhSQiA1NjA2Mw0KTWFuYWdpbmcgRGlyZWN0b3I6IExpIFBlbmcsIFpob25nIFJvbmdo
dWENCg0KPiBJUEUgbmVlZHMgdGhlIGRpZ2VzdCBpbmZvcm1hdGlvbiB0byBiZSBhYmxlIHRvIGNv
bXBhcmUgYSBkaWdlc3QNCj4gcHJvdmlkZWQgYnkgdGhlIHBvbGljeSBhdXRob3IsIGFnYWluc3Qg
dGhlIGRpZ2VzdCBjYWxjdWxhdGVkIGJ5DQo+IGZzdmVyaXR5IHRvIG1ha2UgYSBkZWNpc2lvbiBv
biB3aGV0aGVyIHRoYXQgc3BlY2lmaWMgZmlsZSwgcmVwcmVzZW50ZWQNCj4gYnkgdGhlIGRpZ2Vz
dCBpcyBhdXRob3JpemVkIGZvciB0aGUgYWN0aW9ucyBzcGVjaWZpZWQgaW4gdGhlIHBvbGljeS4N
Cj4gDQo+IEEgbW9yZSBjb25jcmV0ZSBleGFtcGxlLCBpZiBhbiBJUEUgcG9saWN5IGF1dGhvciB3
cml0ZXM6DQo+IA0KPiAgwqDCoMKgIG9wPUVYRUNVVEUgZnN2ZXJpdHlfZGlnZXN0PTxIZXhEaWdl
c3QgPiBhY3Rpb249REVOWQ0KPiANCj4gSVBFIHRha2VzIHRoZSBkaWdlc3QgcHJvdmlkZWQgYnkg
dGhpcyBzZWN1cml0eSBob29rLCBzdG9yZXMgaXQNCj4gaW4gSVBFJ3Mgc2VjdXJpdHkgYmxvYiBv
biB0aGUgaW5vZGUuIElmIHRoaXMgZmlsZSBpcyBsYXRlcg0KPiBleGVjdXRlZCwgSVBFIGNvbXBh
cmVzIHRoZSBkaWdlc3Qgc3RvcmVkIGluIHRoZSBMU00gYmxvYiwNCj4gcHJvdmlkZWQgYnkgdGhp
cyBob29rLCBhZ2FpbnN0IDxIZXhEaWdlc3Q+IGluIHRoZSBwb2xpY3ksIGlmDQo+IGl0IG1hdGNo
ZXMsIGl0IGRlbmllcyB0aGUgYWNjZXNzLCBwZXJmb3JtaW5nIGEgcmV2b2NhdGlvbg0KPiBvZiB0
aGF0IGZpbGUuDQo+IA0KPiBUaGlzIGJyaW5ncyBtZSB0byB5b3VyIG5leHQgY29tbWVudDoNCj4g
DQo+ICA+IFRoZSBkaWdlc3QgaXNuJ3QgbWVhbmluZ2Z1bCB3aXRob3V0IGtub3dpbmcgdGhlIGhh
c2ggYWxnb3JpdGhtIGl0IHVzZXMuDQo+IEl0J3MgYXZhaWxhYmxlIGhlcmUsIGJ1dCB5b3UgYXJl
bid0IHBhc3NpbmcgaXQgdG8gdGhpcyBmdW5jdGlvbi4NCj4gDQo+IFRoZSBkaWdlc3QgaXMgbWVh
bmluZ2Z1bCB3aXRob3V0IHRoZSBhbGdvcml0aG0gaW4gdGhpcyBjYXNlLg0KPiBJUEUgZG9lcyBu
b3Qgd2FudCB0byByZWNhbGN1bGF0ZSBhIGRpZ2VzdCwgdGhhdOKAmXMgZXhwZW5zaXZlIGFuZA0K
PiBkb2VzbuKAmXQgcHJvdmlkZSBhbnkgdmFsdWUuIElQRSwgaW4gdGhpcyBjYXNlLCB0cmVhdHMg
dGhpcyBhcyBhDQo+IGJ1ZmZlciB0byBjb21wYXJlIHRoZSBwb2xpY3ktcHJvdmlkZWQgb25lIGFi
b3ZlIHRvIG1ha2UgYQ0KPiBwb2xpY3kgZGVjaXNpb24gYWJvdXQgYWNjZXNzIHRvIHRoZSByZXNv
dXJjZS4NCj4gDQo+ID4+IEFsc28gY2hhbmdlcyB0aGUgaW1wbGVtZW50YWlvbiBpbnNpZGUgdGhl
IGhvb2sgZnVuY3Rpb24gdG8gbGV0DQo+ID4+IG11bHRpcGxlIExTTXMgY2FuIGFkZCBob29rcy4N
Cj4gPiBQbGVhc2Ugc3BsaXQgZnMvdmVyaXR5LyBjaGFuZ2VzIGFuZCBzZWN1cml0eS8gY2hhbmdl
cyBpbnRvIHNlcGFyYXRlIHBhdGNoZXMsIGlmDQo+ID4gcG9zc2libGUuDQo+IA0KPiBTb3JyeSwg
d2lsbCBkbywgbm90IGEgcHJvYmxlbS4NCj4gDQo+ID4+IEBAIC0xNzcsNiArMTc4LDE3IEBAIHN0
cnVjdCBmc3Zlcml0eV9pbmZvICpmc3Zlcml0eV9jcmVhdGVfaW5mbyhjb25zdA0KPiBzdHJ1Y3Qg
aW5vZGUgKmlub2RlLA0KPiA+PiAgIAkJZnN2ZXJpdHlfZXJyKGlub2RlLCAiRXJyb3IgJWQgY29t
cHV0aW5nIGZpbGUgZGlnZXN0IiwgZXJyKTsNCj4gPj4gICAJCWdvdG8gb3V0Ow0KPiA+PiAgIAl9
DQo+ID4+ICsNCj4gPj4gKwllcnIgPSBzZWN1cml0eV9pbm9kZV9zZXRzZWN1cml0eSgoc3RydWN0
IGlub2RlICopaW5vZGUsDQo+ID4gSWYgYSBub24tY29uc3QgaW5vZGUgaXMgbmVlZGVkLCBwbGVh
c2UgcHJvcGFnYXRlIHRoYXQgaW50byB0aGUgY2FsbGVycyByYXRoZXINCj4gPiB0aGFuIHJhbmRv
bWx5IGNhc3RpbmcgYXdheSB0aGUgY29uc3QuDQo+ID4NCj4gPj4gKwkJCQkJIEZTX1ZFUklUWV9E
SUdFU1RfU0VDX05BTUUsDQo+ID4+ICsJCQkJCSB2aS0+ZmlsZV9kaWdlc3QsDQo+ID4+ICsJCQkJ
CSB2aS0+dHJlZV9wYXJhbXMuaGFzaF9hbGctDQo+ID5kaWdlc3Rfc2l6ZSwNCj4gPj4gKwkJCQkJ
IDApOw0KPiA+PiBAQCAtODQsNyArODUsOSBAQCBpbnQgZnN2ZXJpdHlfdmVyaWZ5X3NpZ25hdHVy
ZShjb25zdCBzdHJ1Y3QgZnN2ZXJpdHlfaW5mbw0KPiAqdmksDQo+ID4+DQo+ID4+ICAgCXByX2Rl
YnVnKCJWYWxpZCBzaWduYXR1cmUgZm9yIGZpbGUgZGlnZXN0ICVzOiUqcGhOXG4iLA0KPiA+PiAg
IAkJIGhhc2hfYWxnLT5uYW1lLCBoYXNoX2FsZy0+ZGlnZXN0X3NpemUsIHZpLT5maWxlX2RpZ2Vz
dCk7DQo+ID4+IC0JcmV0dXJuIDA7DQo+ID4+ICsJcmV0dXJuIHNlY3VyaXR5X2lub2RlX3NldHNl
Y3VyaXR5KChzdHJ1Y3QgaW5vZGUgKilpbm9kZSwNCj4gPj4NCj4gPiBMaWtld2lzZSwgcGxlYXNl
IGRvbid0IGNhc3QgYXdheSBjb25zdC4NCj4gDQo+IFNvcnJ5LCBJIHNob3VsZCd2ZSBjYXVnaHQg
dGhlc2UgbXlzZWxmLiBJJ2xsIGNoYW5nZQ0KPiBmc3Zlcml0eV9jcmVhdGVfaW5mbyB0byBhY2Nl
cHQgdGhlIG5vbi1jb25zdCBpbm9kZSwgYW5kDQo+IGNoYW5nZSBmc3Zlcml0eV92ZXJpZnlfc2ln
bmF0dXJlIHRvIGFjY2VwdCBhbiBhZGRpdGlvbmFsIGlub2RlDQo+IHN0cnVjdCBhcyB0aGUgZmly
c3QgYXJnIGluc3RlYWQgb2YgY2hhbmdpbmcgdGhlIGZzdmVyaXR5X2luZm8NCj4gc3RydWN0dXJl
IHRvIGhhdmUgYSBub24tY29uc3QgaW5vZGUgZmllbGQuDQo+IA0KPiA+PiArCQkJCQlGU19WRVJJ
VFlfU0lHTkFUVVJFX1NFQ19OQU1FLA0KPiA+PiArCQkJCQlzaWduYXR1cmUsIHNpZ19zaXplLCAw
KTsNCj4gPiBUaGlzIGlzIG9ubHkgZm9yIGZzLXZlcml0eSBidWlsdC1pbiBzaWduYXR1cmVzIHdo
aWNoIGFyZW4ndCB0aGUgb25seSB3YXkgdG8gZG8NCj4gPiBzaWduYXR1cmVzIHdpdGggZnMtdmVy
aXR5LiAgQXJlIHlvdSBzdXJlIHRoaXMgaXMgd2hhdCB5b3UncmUgbG9va2luZyBmb3I/DQo+IA0K
PiBDb3VsZCB5b3UgZWxhYm9yYXRlIG9uIHRoZSBvdGhlciBzaWduYXR1cmUgdHlwZXMgdGhhdCBj
YW4gYmUgdXNlZA0KPiB3aXRoIGZzLXZlcml0eT8gSeKAmW0gOTklIHN1cmUgdGhpcyBpcyB3aGF0
IEnigJltIGxvb2tpbmcgZm9yIGFzIHRoaXMNCj4gaXMgYSBzaWduYXR1cmUgdmFsaWRhdGVkIGlu
IHRoZSBrZXJuZWwgYWdhaW5zdCB0aGUgZnMtdmVyaXR5IGtleXJpbmcNCj4gYXMgcGFydCBvZiB0
aGUg4oCcZnN2ZXJpdHkgZW5hYmxl4oCdIHV0aWxpdHkuDQo+IA0KPiBJdCdzIGltcG9ydGFudCB0
aGF0IHRoZSBzaWduYXR1cmUgaXMgdmFsaWRhdGVkIGluIHRoZSBrZXJuZWwsIGFzDQo+IHVzZXJz
cGFjZSBpcyBjb25zaWRlcmVkIHVudHJ1c3RlZCB1bnRpbCB0aGUgc2lnbmF0dXJlIGlzIHZhbGlk
YXRlZA0KPiBmb3IgdGhpcyBjYXNlLg0KPiANCj4gPiBDYW4geW91IGVsYWJvcmF0ZSBvbiB5b3Vy
IHVzZSBjYXNlIGZvciBmcy12ZXJpdHkgYnVpbHQtaW4gc2lnbmF0dXJlcywNCj4gU3VyZSwgc2ln
bmF0dXJlcywgbGlrZSBkaWdlc3RzLCBhbHNvIHByb3ZpZGUgYSB3YXkgdG8gcHJvdmUgaW50ZWdy
aXR5LA0KPiBhbmQgdGhlIHRydXN0IGNvbXBvbmVudCBjb21lcyBmcm9tIHRoZSB2YWxpZGF0aW9u
IGFnYWluc3QgdGhlIGtleXJpbmcsDQo+IGFzIG9wcG9zZWQgdG8gYSBmaXhlZCB2YWx1ZSBpbiBJ
UEXigJlzIHBvbGljeS4gVGhlIHVzZSBjYXNlIGZvciBmcy12ZXJpdHkNCj4gYnVpbHQtaW4gc2ln
bmF0dXJlcyBpcyB0aGF0IHdlIGhhdmUgYSBydyBleHQ0IGZpbGVzeXN0ZW0gdGhhdCBoYXMgc29t
ZQ0KPiBleGVjdXRhYmxlIGZpbGVzLCBhbmQgd2Ugd2FudCB0byBoYXZlIGEgZXhlY3V0aW9uIHBv
bGljeSAodGhyb3VnaCBJUEUpDQo+IHRoYXQgb25seSBfdHJ1c3RlZF8gZXhlY3V0YWJsZXMgY2Fu
IHJ1bi4gUGVyZiBpcyBpbXBvcnRhbnQgaGVyZSwgaGVuY2UNCj4gZnMtdmVyaXR5Lg0KPiANCj4g
PiBhbmQgd2hhdCB0aGUgTFNNIGhvb2sgd2lsbCBkbyB3aXRoIHRoZW0/DQo+IA0KPiBBdCB0aGUg
bW9tZW50LCB0aGlzIHdpbGwganVzdCBzaWduYWwgdG8gSVBFIHRoYXQgdGhlc2UgZnMtdmVyaXR5
IGZpbGVzIHdlcmUNCj4gZW5hYmxlZCB3aXRoIGEgYnVpbHQtaW4gc2lnbmF0dXJlIGFzIG9wcG9z
ZWQgdG8gZW5hYmxlZCB3aXRob3V0IGEgc2lnbmF0dXJlLg0KPiBJbiB2NywgaXQgY29waWVzIHRo
ZSBzaWduYXR1cmUgZGF0YSBpbnRvIElQRSdzIExTTSBibG9iIGF0dGFjaGVkIHRvIHRoZQ0KPiBp
bm9kZS4NCj4gSW4gdjgrLCBJJ20gY2hhbmdpbmcgdGhpcyB0byBzdG9yZSDigJx0cnVl4oCdIGlu
IElQRSdzIExTTSBibG9iIGluc3RlYWQsIGFzDQo+IGNvcHlpbmcNCj4gdGhlIHNpZ25hdHVyZSBk
YXRhIGlzIGFuIHVubmVjZXNzYXJ5IHdhc3RlIG9mIHNwYWNlIGFuZCBwb2ludCBvZg0KPiBmYWls
dXJlLiBUaGlzDQo+IGhhcyBhIF9zbGlnaHRseV8gZGlmZmVyZW50IGZ1bmN0aW9uYWxpdHkgdGhl
biBmcy52ZXJpdHkucmVxdWlyZV9zaWduYXR1cmVzLA0KPiBiZWNhdXNlIGV2ZW4gaWYgc29tZW9u
ZSB3ZXJlIHRvIGRpc2FibGUgdGhlIHJlcXVpcmUgc2lnbmF0dXJlcyBvcHRpb24sIElQRQ0KPiB3
b3VsZCBzdGlsbCBrbm93IGlmIHRoZXNlIGZpbGVzIHdlcmUgc2lnbmVkIG9yIG5vdCBhbmQgYmUg
YWJsZSB0byBtYWtlIHRoZQ0KPiBhY2Nlc3MgY29udHJvbCBkZWNpc2lvbiBiYXNlZCBJUEUncyBw
b2xpY3kuDQo+IA0KPiBWZXJ5IGNvbmNyZXRlbHksIHRoaXMgcG93ZXJzIHRoaXMga2luZCBvZiBy
dWxlIGluIElQRToNCj4gDQo+ICDCoCBvcD1FWEVDVVRFIGZzdmVyaXR5X3NpZ25hdHVyZT1UUlVF
IGFjdGlvbj1BTExPVw0KPiANCj4gaWYgdGhhdCBmc3Zlcml0eV9zaWduYXR1cmUgdmFsdWUgaW4g
SVBF4oCZcyBMU00gYmxvYiBhdHRhY2hlZCB0byB0aGUgaW5vZGUgaXMNCj4gdHJ1ZSwgdGhlbiBm
c3Zlcml0eV9zaWduYXR1cmUgaW4gSVBF4oCZcyBwb2xpY3kgd2lsbCBldmFsdWF0ZSB0byB0cnVl
IGFuZA0KPiBtYXRjaA0KPiB0aGlzIHJ1bGUuIFRoZSBpbnZlcnNlIGlzIGFsc28gYXBwbGljYWJs
ZS4NCg0K

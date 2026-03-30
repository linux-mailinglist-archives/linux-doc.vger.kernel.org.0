Return-Path: <linux-doc+bounces-81711-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFMEWzpyWmP3QUAu9opvQ
	(envelope-from <linux-doc+bounces-81711-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 05:09:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1B354F84
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 05:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE823004F5B
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 03:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FF323A984;
	Mon, 30 Mar 2026 03:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="QYOA/yCF"
X-Original-To: linux-doc@vger.kernel.org
Received: from outbound.baidu.com (jpmx.baidu.com [119.63.196.201])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9DB3A26ED35;
	Mon, 30 Mar 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.63.196.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840162; cv=none; b=I4zNIAP3DUB34vx1t6VNE2CbVLuWxAzdGwcVLlsPPJlpb6cstgklR7hWpDC9LnAmoRCxo6V+w8saNHZRs+Q5K8M+yNczaShLxm74uL3gu5GXBnEZ22uZ+S0YG1xObHKzcXHaakCWUHTp54d0HkQ3vv4wa/TNOz5d9+k6RppseyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840162; c=relaxed/simple;
	bh=4LvOygNpK8r2wOycZQH+/HOfjcETQ2mAGUh+7YUmwpA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FGvmPv447xpLkAYdwSUFx5wYmnZYHZpPb9CB+M3hIXAahdtH0Wjb2S8WZxRCEmsnKQWSQkSvQHCe+INm24CHwXSpoNDhd3mzoKV0jaF5Xgs+ZwCLWhcxlwRtN0JnS2yTlwLbutXH4QybWTqpvfI9jZ7i8pZ+L4TyLQt9o9eDPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=QYOA/yCF; arc=none smtp.client-ip=119.63.196.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.45
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton
	<akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra
	<peterz@infradead.org>, Feng Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSBkb2NzOiBrZXJu?=
 =?utf-8?B?ZWwtcGFyYW1ldGVyczogZml4IGFyY2hpdGVjdHVyZSBhbGlnbm1lbnQgZm9y?=
 =?utf-8?Q?_pt,_nopt,_and_nobypass?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gZG9jczoga2VybmVsLXBhcmFt?=
 =?utf-8?B?ZXRlcnM6IGZpeCBhcmNoaXRlY3R1cmUgYWxpZ25tZW50IGZvciBwdCwgbm9w?=
 =?utf-8?Q?t,_and_nobypass?=
Thread-Index: AQHcvPTDWTTbIwKqpUejx9Xe/DuiO7XAdU2AgAX0LIA=
Date: Mon, 30 Mar 2026 03:08:58 +0000
Message-ID: <16386e7715284b22b5f72e7106ed5619@baidu.com>
References: <20260326074658.1899-1-lirongqing@baidu.com>
 <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
In-Reply-To: <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1774840145;
	bh=4LvOygNpK8r2wOycZQH+/HOfjcETQ2mAGUh+7YUmwpA=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=QYOA/yCFZb+yGBTWH0UjEwkau/Qb1jkN+EYiOUcydEUn6d1GMDYi6ylOnERL2qGQ0
	 tERkzaGYkP9A5UqGXJfxS9K8GHrYJTqbAFG+ByDqP0+V0az1qs2TKSQWvCh+RSaRX/
	 9TSHxwNtzT/atkObF9v8Hg1R0mmgmt1EkfMgcy/l5RwP0iJiRijp9WL7Ldp2yr5w57
	 RNc1uvS8Io+8tvqKOoxJesq6BLdnmDnPi8POcbMw/TNJr9qGsIaUsfPw3vQ//+gWWz
	 +zDDUOTlS6rLLbF56BvP6J/67tLEjlyevF1+KZyuKYXqch48jiu2YQPR2/C3JiFvDr
	 myF2Kfz+Q7cQw==
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81711-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[infradead.org,lwn.net,linuxfoundation.org,linux-foundation.org,alien8.de,linux.alibaba.com,linux.intel.com,kernel.org,google.com,gmail.com,intel.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[baidu.com:?];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lirongqing@baidu.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.941];
	DMARC_DNSFAIL(0.00)[baidu.com : SPF/DKIM temp error,quarantine];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[baidu.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88B1B354F84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiDlj5HpgIHml7bpl7Q6IDIwMjblubQz5pyIMjfml6Ug
MDowOA0KPiDmlLbku7bkuro6IExpLFJvbmdxaW5nKEFDRyBDQ04pIDxsaXJvbmdxaW5nQGJhaWR1
LmNvbT47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5uZXQ+OyBTaHVhaCBLaGFuIDxz
a2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPjsgQW5kcmV3IE1vcnRvbg0KPiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz47IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgUGV0ZXIgWmlq
bHN0cmENCj4gPHBldGVyekBpbmZyYWRlYWQub3JnPjsgRmVuZyBUYW5nIDxmZW5nLnRhbmdAbGlu
dXguYWxpYmFiYS5jb20+OyBQYXdhbg0KPiBHdXB0YSA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXgu
aW50ZWwuY29tPjsgRGFwZW5nIE1pDQo+IDxkYXBlbmcxLm1pQGxpbnV4LmludGVsLmNvbT47IEtl
ZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPjsgTWFyY28gRWx2ZXINCj4gPGVsdmVyQGdvb2dsZS5j
b20+OyBQYXVsIEUgLiBNY0tlbm5leSA8cGF1bG1ja0BrZXJuZWwub3JnPjsgQXNrYXIgU2FmaW4N
Cj4gPHNhZmluYXNrYXJAZ21haWwuY29tPjsgQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xl
LmNvbT47IFNvaGlsIE1laHRhDQo+IDxzb2hpbC5tZWh0YUBpbnRlbC5jb20+OyBsaW51eC1kb2NA
dmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IOS4u+mi
mDogW+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gZG9jczoga2VybmVsLXBhcmFtZXRlcnM6IGZp
eCBhcmNoaXRlY3R1cmUNCj4gYWxpZ25tZW50IGZvciBwdCwgbm9wdCwgYW5kIG5vYnlwYXNzDQo+
IA0KPiBIaSwNCj4gDQo+IE9uIDMvMjYvMjYgMTI6NDYgQU0sIGxpcm9uZ3Fpbmcgd3JvdGU6DQo+
ID4gRnJvbTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KPiA+DQo+ID4gQ29t
bWl0IGFiMGU3ZjIwNzY4YSAoIkRvY3VtZW50YXRpb246IE1lcmdlIHg4Ni1zcGVjaWZpYyBib290
IG9wdGlvbnMNCj4gPiBkb2MgaW50byBrZXJuZWwtcGFyYW1ldGVycy50eHQiKSBpbnRyb2R1Y2Vk
IGEgZm9ybWF0dGluZyByZWdyZXNzaW9uDQo+ID4gd2hlcmUgYXJjaGl0ZWN0dXJlIHRhZ3Mgd2Vy
ZSBwbGFjZWQgb24gc2VwYXJhdGUgbGluZXMgd2l0aCBicm9rZW4NCj4gaW5kZW50YXRpb24uDQo+
ID4gVGhpcyBjYXVzZWQgdGhlICdub3B0JyBbWDg2XSBwYXJhbWV0ZXIgdG8gYXBwZWFyIGFzIGlm
IGl0IGJlbG9uZ2VkIHRvDQo+ID4gdGhlIFtQUEMvUE9XRVJOVl0gc2VjdGlvbi4NCj4gPg0KPiA+
IEZpeCB0aGUgZm9ybWF0dGluZyBieSBwbGFjaW5nIHRoZSBhcmNoaXRlY3R1cmUgdGFncyBvbiB0
aGUgc2FtZSBsaW5lDQo+ID4gYXMgdGhlaXIgcmVzcGVjdGl2ZSBwYXJhbWV0ZXJzICgncHQnLCAn
bm9wdCcsIGFuZCAnbm9ieXBhc3MnKSBhbmQNCj4gPiByZXN0b3JpbmcgcHJvcGVyIGluZGVudGF0
aW9uLg0KPiA+DQo+ID4gRml4ZXM6IGFiMGU3ZjIwNzY4YSAoIkRvY3VtZW50YXRpb246IE1lcmdl
IHg4Ni1zcGVjaWZpYyBib290IG9wdGlvbnMNCj4gPiBkb2MgaW50byBrZXJuZWwtcGFyYW1ldGVy
cy50eHQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IExpIFJvbmdRaW5nIDxsaXJvbmdxaW5nQGJhaWR1
LmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQgfCA5ICsrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiA+IGluZGV4IDAzYTU1MDYuLmRj
MWM1YmQgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwt
cGFyYW1ldGVycy50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5l
bC1wYXJhbWV0ZXJzLnR4dA0KPiA+IEBAIC0yNjE1LDEyICsyNjE1LDkgQEAgS2VybmVsIHBhcmFt
ZXRlcnMNCj4gPiAgCQkJSW50ZWwgbWFjaGluZXMpLiBUaGlzIGNhbiBiZSB1c2VkIHRvIHByZXZl
bnQgdGhlIHVzYWdlDQo+ID4gIAkJCW9mIGFuIGF2YWlsYWJsZSBoYXJkd2FyZSBJT01NVS4NCj4g
Pg0KPiA+IC0JCQlbWDg2XQ0KPiA+IC0JCXB0DQo+ID4gLQkJCVtYODZdDQo+ID4gLQkJbm9wdA0K
PiA+IC0JCQlbUFBDL1BPV0VSTlZdDQo+ID4gLQkJbm9ieXBhc3MNCj4gPiArCQlwdCAgCVtYODZd
DQo+ID4gKwkJbm9wdAlbWDg2XQ0KPiA+ICsJCW5vYnlwYXNzCVtQUEMvUE9XRVJOVl0NCj4gPiAg
CQkJRGlzYWJsZSBJT01NVSBieXBhc3MsIHVzaW5nIElPTU1VIGZvciBQQ0kgZGV2aWNlcy4NCj4g
Pg0KPiA+ICAJCVtYODZdDQo+IA0KPiBUaGlzIGxvb2tzIGdvb2QgYXMgZmFyIGFzIGl0IGdvZXMs
IGJ1dCB0aGVyZSBhcmUgc3RpbGwgc29tZSBwcm9ibGVtcyBJTU8uDQo+IA0KPiBUaGVzZSBhcmUg
YWxsIGlvbW11PSBvcHRpb25zLCBidXQgaW9tbXUgc2F5cyB0aGF0IGl0J3MgZm9yIFtYODYsRUFS
TFldLg0KPiBObyBQUEMvUE9XRVJOViBtZW50aW9uZWQgdGhlcmUuDQoNCkkgdGhpbmsgW1BQQy9Q
T1dFUk5WXSBzaG91bGQgbm90IGJlIGFkZGVkIHRvIHRoZSBtYWluIGlvbW11PSBoZWFkZXIuIFNp
bmNlIHRoYXQgaGVhZGVyIGlzIGFscmVhZHkgdGFnZ2VkIGFzIFtYODYsIEVBUkxZXSwgYWRkaW5n
IFBvd2VyUEMgdGhlcmUgd291bGQgaW1wbHkgYWxsIHN1YnNlcXVlbnQgb3B0aW9ucyBhcmUgY3Jv
c3MtcGxhdGZvcm0uIEluc3RlYWQsIGl0IGlzIGNsZWFuZXIgdG8ga2VlcCB0aGUgbWFpbiBoZWFk
ZXIgYXMgWDg2LXNwZWNpZmljIGFuZCBleHBsaWNpdGx5IHRhZyB0aGUgaW5kaXZpZHVhbCBub2J5
cGFzcyBvcHRpb24gZm9yIFtQUEMvUE9XRVJOVl0uIFRoaXMgYXZvaWRzIHRoZSBuZWVkIHRvIHJl
ZHVuZGFudGx5IGxhYmVsIGV2ZXJ5IG90aGVyIFg4Ni1vbmx5IG9wdGlvbiAobGlrZSBwdCBvciBu
b3B0KSB3aXRoaW4gdGhlIHNlY3Rpb24uDQoNCj4gDQo+IFRoZW4gaW1tZWRpYXRlbHkgZm9sbG93
aW5nIG5vYnlwYXNzLCB0aGVyZSBpcyB0aGlzOg0KPiAJCVtYODZdDQo+IAkJQU1EIEdhcnQgSFcg
SU9NTVUtc3BlY2lmaWMgb3B0aW9uczoNCj4gDQo+IHdoaWNoIGlzIGFsc28gaW4gcXVlc3Rpb25h
YmxlIGZvcm1hdC4gVGhlIFtYODZdIGlzbid0IG5lZWRlZCBhdCBhbGwgSU1PLCBvciBpZiBpdCdz
DQo+IGRlc2lyYWJsZSwgdGhvc2UgMiBsaW5lcyBzaG91bGQgYmUgb24gb25lIGxpbmUuDQo+IA0K
WW91IGFyZSByaWdodCAsIFtYODZdIGlzbid0IG5lZWRlZCAsIEhvdyBhYm91dCB0byByZW1vdmUg
dGhlIFtYODZdLCBsaWtlIGJlbG93IA0KDQogICAgRG9jdW1lbnRhdGlvbi9rZXJuZWwtcGFyYW1l
dGVyczogZml4IGFyY2hpdGVjdHVyZSBhbGlnbm1lbnQgZm9yIHB0LCBub3B0LCBhbmQgbm9ieXBh
c3MNCg0KICAgIENvbW1pdCBhYjBlN2YyMDc2OGEgKCJEb2N1bWVudGF0aW9uOiBNZXJnZSB4ODYt
c3BlY2lmaWMgYm9vdCBvcHRpb25zIGRvYw0KICAgIGludG8ga2VybmVsLXBhcmFtZXRlcnMudHh0
IikgaW50cm9kdWNlZCBhIGZvcm1hdHRpbmcgcmVncmVzc2lvbiB3aGVyZQ0KICAgIGFyY2hpdGVj
dHVyZSB0YWdzIHdlcmUgcGxhY2VkIG9uIHNlcGFyYXRlIGxpbmVzIHdpdGggYnJva2VuIGluZGVu
dGF0aW9uLg0KICAgIFRoaXMgY2F1c2VkIHRoZSAnbm9wdCcgW1g4Nl0gcGFyYW1ldGVyIHRvIGFw
cGVhciBhcyBpZiBpdCBiZWxvbmdlZCB0bw0KICAgIHRoZSBbUFBDL1BPV0VSTlZdIHNlY3Rpb24u
DQoNCiAgICBGdXJ0aGVybW9yZSwgc2luY2UgdGhlIG1haW4gJ2lvbW11PScgcGFyYW1ldGVyIGhl
YWRpbmcgYWxyZWFkeSBzcGVjaWZpZXMNCiAgICBpdCBpcyBmb3IgW1g4NiwgRUFSTFldLCB0aGUg
c3Vic2VxdWVudCBzdGFuZGFsb25lIFtYODZdIHRhZ3MgZm9yICdwdCcsDQogICAgJ25vcHQnLCBh
bmQgdGhlIEFNRCBHQVJUIG9wdGlvbnMgYXJlIHJlZHVuZGFudCBhbmQgY2x1dHRlciB0aGUNCiAg
ICBkb2N1bWVudGF0aW9uLg0KDQogICAgQ2xlYW4gdXAgdGhlIGZvcm1hdHRpbmcgYnkgcmVtb3Zp
bmcgdGhlc2UgcmVkdW5kYW50IHRhZ3MgYW5kIHByb3Blcmx5DQogICAgYXR0cmlidXRpbmcgdGhl
ICdub2J5cGFzcycgb3B0aW9uIHRvIFtQUEMvUE9XRVJOVl0uDQoNCiAgICBGaXhlczogYWIwZTdm
MjA3NjhhICgiRG9jdW1lbnRhdGlvbjogTWVyZ2UgeDg2LXNwZWNpZmljIGJvb3Qgb3B0aW9ucyBk
b2MgaW50byBrZXJuZWwtcGFyYW1ldGVycy50eHQiKQ0KICAgIFNpZ25lZC1vZmYtYnk6IExpIFJv
bmdRaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4NCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCmluZGV4IDAzYTU1MDYuLjUyNTNjMjMgMTAw
NjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQN
CkBAIC0yNjE1LDE1ICsyNjE1LDExIEBAIEtlcm5lbCBwYXJhbWV0ZXJzDQogICAgICAgICAgICAg
ICAgICAgICAgICBJbnRlbCBtYWNoaW5lcykuIFRoaXMgY2FuIGJlIHVzZWQgdG8gcHJldmVudCB0
aGUgdXNhZ2UNCiAgICAgICAgICAgICAgICAgICAgICAgIG9mIGFuIGF2YWlsYWJsZSBoYXJkd2Fy
ZSBJT01NVS4NCg0KLSAgICAgICAgICAgICAgICAgICAgICAgW1g4Nl0NCiAgICAgICAgICAgICAg
ICBwdA0KLSAgICAgICAgICAgICAgICAgICAgICAgW1g4Nl0NCiAgICAgICAgICAgICAgICBub3B0
DQotICAgICAgICAgICAgICAgICAgICAgICBbUFBDL1BPV0VSTlZdDQotICAgICAgICAgICAgICAg
bm9ieXBhc3MNCisgICAgICAgICAgICAgICBub2J5cGFzcyAgICAgICAgW1BQQy9QT1dFUk5WXQ0K
ICAgICAgICAgICAgICAgICAgICAgICAgRGlzYWJsZSBJT01NVSBieXBhc3MsIHVzaW5nIElPTU1V
IGZvciBQQ0kgZGV2aWNlcy4NCg0KLSAgICAgICAgICAgICAgIFtYODZdDQogICAgICAgICAgICAg
ICAgQU1EIEdhcnQgSFcgSU9NTVUtc3BlY2lmaWMgb3B0aW9uczoNCg0KICAgICAgICAgICAgICAg
IDxzaXplPg0KW0xpLFJvbmdxaW5nXSANCg0KDQo+IEFueXdheSwgZm9yIHRoaXMgcGF0Y2g6DQo+
IEFja2VkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gDQo+IFRo
YW5rcy4NCj4gDQo+IC0tDQo+IH5SYW5keQ0K


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF5A29073A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Oct 2020 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408876AbgJPOdc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Oct 2020 10:33:32 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:3944 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405628AbgJPOdb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Oct 2020 10:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1602858807; x=1634394807;
  h=from:to:cc:subject:date:message-id:content-id:
   mime-version:content-transfer-encoding;
  bh=pfaGduKidVxkNab4teQ9Xu1ZhfUUWNOdjzWqvypR40g=;
  b=Y+BRcqio6ZlsL6sPCCIelpcJT9VCdTIzY/2i11JdRrA2n+YL085Vk1IL
   mK0L6Ig7fJ7u//+vyyHzO192wGCgPbDo/kmR8SBR+qDoVN2nqV4BZr0Tp
   SEgsK2rzw8LUquMt5ZKucnmc8nYPHrPy8f/cb8ORJW+6Htq7t+u8feFpk
   Q=;
X-IronPort-AV: E=Sophos;i="5.77,383,1596499200"; 
   d="scan'208";a="84066588"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 16 Oct 2020 14:33:20 +0000
Received: from EX13D07EUB003.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS id 20E231010D7;
        Fri, 16 Oct 2020 14:33:16 +0000 (UTC)
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13D07EUB003.ant.amazon.com (10.43.166.173) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 16 Oct 2020 14:33:15 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.006;
 Fri, 16 Oct 2020 14:33:15 +0000
From:   "Catangiu, Adrian Costin" <acatan@amazon.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
CC:     "Catangiu, Adrian Costin" <acatan@amazon.com>,
        "Graf (AWS), Alexander" <graf@amazon.de>,
        "MacCarthaigh, Colm" <colmmacc@amazon.com>,
        "Woodhouse, David" <dwmw@amazon.co.uk>,
        "bonzini@gnu.org" <bonzini@gnu.org>,
        "Singh, Balbir" <sblbir@amazon.com>,
        "Weiss, Radu" <raduweis@amazon.com>,
        "oridgar@gmail.com" <oridgar@gmail.com>,
        "ghammer@redhat.com" <ghammer@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] drivers/virt: vmgenid: add vm generation id driver
Thread-Topic: [PATCH] drivers/virt: vmgenid: add vm generation id driver
Thread-Index: AQHWo8lIfZnFKGe8nkGmhTCXwq5R3w==
Date:   Fri, 16 Oct 2020 14:33:15 +0000
Message-ID: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C382C99929CCB4694096B3E1A69ABA1@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LSBCYWNrZ3JvdW5kDQoNClRoZSBWTSBHZW5lcmF0aW9uIElEIGlzIGEgZmVhdHVyZSBkZWZpbmVk
IGJ5IE1pY3Jvc29mdCAocGFwZXI6DQpodHRwOi8vZ28ubWljcm9zb2Z0LmNvbS9md2xpbmsvP0xp
bmtJZD0yNjA3MDkpIGFuZCBzdXBwb3J0ZWQgYnkNCm11bHRpcGxlIGh5cGVydmlzb3IgdmVuZG9y
cy4NCg0KVGhlIGZlYXR1cmUgaXMgcmVxdWlyZWQgaW4gdmlydHVhbGl6ZWQgZW52aXJvbm1lbnRz
IGJ5IGFwcHMgdGhhdCB3b3JrDQp3aXRoIGxvY2FsIGNvcGllcy9jYWNoZXMgb2Ygd29ybGQtdW5p
cXVlIGRhdGEgc3VjaCBhcyByYW5kb20gdmFsdWVzLA0KdXVpZHMsIG1vbm90b25pY2FsbHkgaW5j
cmVhc2luZyBjb3VudGVycywgZXRjLg0KU3VjaCBhcHBzIGNhbiBiZSBuZWdhdGl2ZWx5IGFmZmVj
dGVkIGJ5IFZNIHNuYXBzaG90dGluZyB3aGVuIHRoZSBWTQ0KaXMgZWl0aGVyIGNsb25lZCBvciBy
ZXR1cm5lZCB0byBhbiBlYXJsaWVyIHBvaW50IGluIHRpbWUuDQoNClRoZSBWTSBHZW5lcmF0aW9u
IElEIGlzIGEgc2ltcGxlIGNvbmNlcHQgbWVhbnQgdG8gYWxsZXZpYXRlIHRoZSBpc3N1ZQ0KYnkg
cHJvdmlkaW5nIGEgdW5pcXVlIElEIHRoYXQgY2hhbmdlcyBlYWNoIHRpbWUgdGhlIFZNIGlzIHJl
c3RvcmVkDQpmcm9tIGEgc25hcHNob3QuIFRoZSBodyBwcm92aWRlZCBVVUlEIHZhbHVlIGNhbiBi
ZSB1c2VkIHRvDQpkaWZmZXJlbnRpYXRlIGJldHdlZW4gVk1zIG9yIGRpZmZlcmVudCBnZW5lcmF0
aW9ucyBvZiB0aGUgc2FtZSBWTS4NCg0KLSBQcm9ibGVtDQoNClRoZSBWTSBHZW5lcmF0aW9uIElE
IGlzIGV4cG9zZWQgdGhyb3VnaCBhbiBBQ1BJIGRldmljZSBieSBtdWx0aXBsZQ0KaHlwZXJ2aXNv
ciB2ZW5kb3JzIGJ1dCBuZWl0aGVyIHRoZSB2ZW5kb3JzIG9yIHVwc3RyZWFtIExpbnV4IGhhdmUg
bm8NCmRlZmF1bHQgZHJpdmVyIGZvciBpdCBsZWF2aW5nIHVzZXJzIHRvIGZlbmQgZm9yIHRoZW1z
ZWx2ZXMuDQoNCkZ1cnRoZXJtb3JlLCBzaW1wbHkgZmluZGluZyBvdXQgYWJvdXQgYSBWTSBnZW5l
cmF0aW9uIGNoYW5nZSBpcyBvbmx5DQp0aGUgc3RhcnRpbmcgcG9pbnQgb2YgYSBwcm9jZXNzIHRv
IHJlbmV3IGludGVybmFsIHN0YXRlcyBvZiBwb3NzaWJseQ0KbXVsdGlwbGUgYXBwbGljYXRpb25z
IGFjcm9zcyB0aGUgc3lzdGVtLiBUaGlzIHByb2Nlc3MgY291bGQgYmVuZWZpdA0KZnJvbSBhIGRy
aXZlciB0aGF0IHByb3ZpZGVzIGFuIGludGVyZmFjZSB0aHJvdWdoIHdoaWNoIG9yY2hlc3RyYXRp
b24NCmNhbiBiZSBlYXNpbHkgZG9uZS4NCg0KLSBTb2x1dGlvbg0KDQpUaGlzIHBhdGNoIGlzIGEg
ZHJpdmVyIHdoaWNoIGV4cG9zZXMgdGhlIFZpcnR1YWwgTWFjaGluZSBHZW5lcmF0aW9uIElEDQp2
aWEgYSBjaGFyLWRldiBGUyBpbnRlcmZhY2UgdGhhdCBwcm92aWRlcyBJRCB1cGRhdGUgc3luYyBh
bmQgYXN5bmMNCm5vdGlmaWNhdGlvbiwgcmV0cmlldmFsIGFuZCBjb25maXJtYXRpb24gbWVjaGFu
aXNtczoNCg0KV2hlbiB0aGUgZGV2aWNlIGlzICdvcGVuKCknZWQgYSBjb3B5IG9mIHRoZSBjdXJy
ZW50IHZtIFVVSUQgaXMNCmFzc29jaWF0ZWQgd2l0aCB0aGUgZmlsZSBoYW5kbGUuICdyZWFkKCkn
IG9wZXJhdGlvbnMgYmxvY2sgdW50aWwgdGhlDQphc3NvY2lhdGVkIFVVSUQgaXMgbm8gbG9uZ2Vy
IHVwIHRvIGRhdGUgLSB1bnRpbCBIVyB2bSBnZW4gaWQgY2hhbmdlcyAtDQphdCB3aGljaCBwb2lu
dCB0aGUgbmV3IFVVSUQgaXMgcHJvdmlkZWQvcmV0dXJuZWQuIE5vbmJsb2NraW5nICdyZWFkKCkn
DQp1c2VzIEVXT1VMREJMT0NLIHRvIHNpZ25hbCB0aGF0IHRoZXJlIGlzIG5vIF9uZXdfIFVVSUQg
YXZhaWxhYmxlLg0KDQoncG9sbCgpJyBpcyBpbXBsZW1lbnRlZCB0byBhbGxvdyBwb2xsaW5nIGZv
ciBVVUlEIHVwZGF0ZXMuIFN1Y2gNCnVwZGF0ZXMgcmVzdWx0IGluICdFUE9MTElOJyBldmVudHMu
DQoNClN1YnNlcXVlbnQgcmVhZCgpcyBmb2xsb3dpbmcgYSBVVUlEIHVwZGF0ZSBubyBsb25nZXIg
YmxvY2ssIGJ1dCByZXR1cm4NCnRoZSB1cGRhdGVkIFVVSUQuIFRoZSBhcHBsaWNhdGlvbiBuZWVk
cyB0byBhY2tub3dsZWRnZSB0aGUgVVVJRCB1cGRhdGUNCmJ5IGNvbmZpcm1pbmcgaXQgdGhyb3Vn
aCBhICd3cml0ZSgpJy4NCk9ubHkgb24gd3JpdGluZyBiYWNrIHRvIHRoZSBkcml2ZXIgdGhlIHJp
Z2h0L2xhdGVzdCBVVUlELCB3aWxsIHRoZQ0KZHJpdmVyIG1hcmsgdGhpcyAid2F0Y2hlciIgYXMg
dXAgdG8gZGF0ZSBhbmQgcmVtb3ZlIEVQT0xMSU4gc3RhdHVzLg0KDQonbW1hcCgpJyBzdXBwb3J0
IGFsbG93cyBtYXBwaW5nIGEgc2luZ2xlIHJlYWQtb25seSBzaGFyZWQgcGFnZSB3aGljaA0Kd2ls
bCBhbHdheXMgY29udGFpbiB0aGUgbGF0ZXN0IFVVSUQgdmFsdWUgYXQgb2Zmc2V0IDAuDQoNClRo
ZSBkcml2ZXIgYWxzbyBhZGRzIHN1cHBvcnQgZm9yIHRyYWNraW5nIGNvdW50IG9mIG9wZW4gZmls
ZSBoYW5kbGVzDQp0aGF0IGhhdmVuJ3QgYWNrbm93bGVkZ2VkIGFuIFVVSUQgdXBkYXRlLiBUaGlz
IGlzIGV4cG9zZWQgdGhyb3VnaA0KdHdvIElPQ1RMczoNCiAqIFZNR0VOSURfR0VUX09VVERBVEVE
X1dBVENIRVJTOiBpbW1lZGlhdGVseSByZXR1cm5zIHRoZSBudW1iZXIgb2YNCiAgIF9vdXRkYXRl
ZF8gd2F0Y2hlcnMgLSBudW1iZXIgb2YgZmlsZSBoYW5kbGVzIHRoYXQgd2VyZSBvcGVuIGR1cmlu
Zw0KICAgYSBWTSBnZW5lcmF0aW9uIGNoYW5nZSwgYW5kIHdoaWNoIGhhdmUgbm90IHlldCBjb25m
aXJtZWQgdGhlIG5ldw0KICAgVm0tR2VuLUlkLg0KICogVk1HRU5JRF9XQUlUX1dBVENIRVJTOiBi
bG9ja3MgdW50aWwgdGhlcmUgYXJlIG5vIG1vcmUgX291dGRhdGVkXw0KICAgd2F0Y2hlcnMsIG9y
IGlmIGEgJ3RpbWVvdXQnIGFyZ3VtZW50IGlzIHByb3ZpZGVkLCB1bnRpbCB0aGUgdGltZW91dA0K
ICAgZXhwaXJlcy4NCg0KVGhpcyBwYXRjaCBidWlsZHMgb24gdG9wIG9mIE9yIElkZ2FyIDxvcmlk
Z2FyQGdtYWlsLmNvbT4ncyBwcm9wb3NhbA0KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMy8x
LzQ5OA0KDQotIEZ1dHVyZSBpbXByb3ZlbWVudHMNCg0KSWRlYWxseSB3ZSB3b3VsZCB3YW50IHRo
ZSBkcml2ZXIgdG8gcmVnaXN0ZXIgaXRzZWxmIGJhc2VkIG9uIGRldmljZXMnDQpfQ0lEIGFuZCBu
b3QgX0hJRCwgYnV0IHVuZm9ydHVuYXRlbHkgSSBjb3VsZG4ndCBmaW5kIGEgd2F5IHRvIGRvIHRo
YXQuDQpUaGUgcHJvYmxlbSBpcyB0aGF0IEFDUEkgZGV2aWNlIG1hdGNoaW5nIGlzIGRvbmUgYnkN
CidfX2FjcGlfbWF0Y2hfZGV2aWNlKCknIHdoaWNoIGV4Y2x1c2l2ZWx5IGxvb2tzIGF0DQonYWNw
aV9oYXJkd2FyZV9pZCAqaHdpZCcuDQoNClRoZXJlIGlzIGEgcGF0aCBmb3IgcGxhdGZvcm0gZGV2
aWNlcyB0byBtYXRjaCBvbiBfQ0lEIHdoZW4gX0hJRCBpcw0KJ1BSUDAwMDEnIC0gd2hpY2ggaXMg
bm90IHRoZSBjYXNlIGZvciB0aGUgUWVtdSB2bWdlbmlkIGRldmljZS4NCg0KR3VpZGFuY2UgYW5k
IGhlbHAgaGVyZSB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLg0KDQpTaWduZWQtb2ZmLWJ5
OiBBZHJpYW4gQ2F0YW5naXUgPGFjYXRhbkBhbWF6b24uY29tPg0KLS0tDQogRG9jdW1lbnRhdGlv
bi92aXJ0L3ZtZ2VuaWQucnN0IHwgMjExICsrKysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMv
dmlydC9LY29uZmlnICAgICAgICAgICB8ICAxMyArKw0KIGRyaXZlcnMvdmlydC9NYWtlZmlsZSAg
ICAgICAgICB8ICAgMSArDQogZHJpdmVycy92aXJ0L3ZtZ2VuaWQuYyAgICAgICAgIHwgNDE5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS91YXBpL2xp
bnV4L3ZtZ2VuaWQuaCAgIHwgIDIyICsrKw0KIDUgZmlsZXMgY2hhbmdlZCwgNjY2IGluc2VydGlv
bnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi92aXJ0L3ZtZ2VuaWQucnN0
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlydC92bWdlbmlkLmMNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L3ZtZ2VuaWQuaA0KDQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi92aXJ0L3ZtZ2VuaWQucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L3ZtZ2VuaWQu
cnN0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uNTIyNDQxNQ0KLS0tIC9k
ZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L3ZtZ2VuaWQucnN0DQpAQCAtMCwwICsx
LDIxMSBAQA0KKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorDQorPT09PT09
PT09PT09DQorVk1HRU5JRA0KKz09PT09PT09PT09PQ0KKw0KK1RoZSBWTSBHZW5lcmF0aW9uIElE
IGlzIGEgZmVhdHVyZSBkZWZpbmVkIGJ5IE1pY3Jvc29mdCAocGFwZXI6DQoraHR0cDovL2dvLm1p
Y3Jvc29mdC5jb20vZndsaW5rLz9MaW5rSWQ9MjYwNzA5KSBhbmQgc3VwcG9ydGVkIGJ5DQorbXVs
dGlwbGUgaHlwZXJ2aXNvciB2ZW5kb3JzLg0KKw0KK1RoZSBmZWF0dXJlIGlzIHJlcXVpcmVkIGlu
IHZpcnR1YWxpemVkIGVudmlyb25tZW50cyBieSBhcHBzIHRoYXQgd29yaw0KK3dpdGggbG9jYWwg
Y29waWVzL2NhY2hlcyBvZiB3b3JsZC11bmlxdWUgZGF0YSBzdWNoIGFzIHJhbmRvbSB2YWx1ZXMs
DQordXVpZHMsIG1vbm90b25pY2FsbHkgaW5jcmVhc2luZyBjb3VudGVycywgZXRjLg0KK1N1Y2gg
YXBwcyBjYW4gYmUgbmVnYXRpdmVseSBhZmZlY3RlZCBieSBWTSBzbmFwc2hvdHRpbmcgd2hlbiB0
aGUgVk0NCitpcyBlaXRoZXIgY2xvbmVkIG9yIHJldHVybmVkIHRvIGFuIGVhcmxpZXIgcG9pbnQg
aW4gdGltZS4NCisNCitUaGUgVk0gR2VuZXJhdGlvbiBJRCBpcyBhIHNpbXBsZSBjb25jZXB0IG1l
YW50IHRvIGFsbGV2aWF0ZSB0aGUgaXNzdWUNCitieSBwcm92aWRpbmcgYSB1bmlxdWUgSUQgdGhh
dCBjaGFuZ2VzIGVhY2ggdGltZSB0aGUgVk0gaXMgcmVzdG9yZWQNCitmcm9tIGEgc25hcHNob3Qu
IFRoZSBodyBwcm92aWRlZCBVVUlEIHZhbHVlIGNhbiBiZSB1c2VkIHRvDQorZGlmZmVyZW50aWF0
ZSBiZXR3ZWVuIFZNcyBvciBkaWZmZXJlbnQgZ2VuZXJhdGlvbnMgb2YgdGhlIHNhbWUgVk0uDQor
DQorVGhlIFZNIEdlbmVyYXRpb24gSUQgaXMgZXhwb3NlZCB0aHJvdWdoIGFuIEFDUEkgZGV2aWNl
IGJ5IG11bHRpcGxlDQoraHlwZXJ2aXNvciB2ZW5kb3JzLiBUaGUgZHJpdmVyIGZvciBpdCBsaXZl
cyBhdA0KK2BgZHJpdmVycy92aXJ0L3ZtZ2VuaWQuY2BgDQorDQorVGhlIGRyaXZlciBleHBvc2Vz
IHRoZSBWaXJ0dWFsIE1hY2hpbmUgR2VuZXJhdGlvbiBJRCB2aWEgYSBjaGFyLWRldiBGUw0KK2lu
dGVyZmFjZSB0aGF0IHByb3ZpZGVzIElEIHVwZGF0ZSBzeW5jL2FzeW5jIG5vdGlmaWNhdGlvbiwg
cmV0cmlldmFsDQorYW5kIGNvbmZpcm1hdGlvbiBtZWNoYW5pc21zOg0KKw0KK2Bgb3BlbigpYGA6
DQorICBXaGVuIHRoZSBkZXZpY2UgaXMgb3BlbmVkLCBhIGNvcHkgb2YgdGhlIGN1cnJlbnQgdm0g
VVVJRCBpcw0KKyAgYXNzb2NpYXRlZCB3aXRoIHRoZSBmaWxlIGhhbmRsZS4gVGhlIGRyaXZlciBu
b3cgdHJhY2tzIHRoaXMgZmlsZQ0KKyAgaGFuZGxlIGFzIGFuIGluZGVwZW5kZW50ICp3YXRjaGVy
Ki4gVGhlIGRyaXZlciB0cmFja3MgaG93IG1hbnkNCisgIHdhdGNoZXJzIGFyZSBhd2FyZSBvZiB0
aGUgbGF0ZXN0IFZtLUdlbi1JZCB1dWlkIGFuZCBob3cgbWFueSBvZg0KKyAgdGhlbSBhcmUgKm91
dGRhdGVkKiwgb3V0ZGF0ZWQgYmVpbmcgdGhvc2UgdGhhdCBoYXZlIGxpdmVkIHRocm91Z2gNCisg
IGEgVm0tR2VuLUlkIGNoYW5nZSBidXQgbm90IHlldCBjb25maXJtZWQgdGhlIGdlbmVyYXRpb24g
Y2hhbmdlIGV2ZW50Lg0KKw0KK2BgcmVhZCgpYGA6DQorICBSZWFkIGlzIG1lYW50IHRvIHByb3Zp
ZGUgdGhlICpuZXcqIFZtLUdlbi1JZCB3aGVuIGEgZ2VuZXJhdGlvbiBjaGFuZ2UNCisgIHRha2Vz
IHBsYWNlLiBUaGUgcmVhZCBvcGVyYXRpb24gYmxvY2tzIHVudGlsIHRoZSBhc3NvY2lhdGVkIFVV
SUQgaXMNCisgIG5vIGxvbmdlciB1cCB0byBkYXRlIC0gdW50aWwgSFcgdm0gZ2VuIGlkIGNoYW5n
ZXMgLSBhdCB3aGljaCBwb2ludA0KKyAgdGhlIG5ldyBVVUlEIGlzIHByb3ZpZGVkL3JldHVybmVk
LiBOb25ibG9ja2luZyBgYHJlYWQoKWBgDQorICB1c2VzIGBgRUFHQUlOYGAgdG8gc2lnbmFsIHRo
YXQgdGhlcmUgaXMgbm8gKm5ldyogVVVJRCBhdmFpbGFibGUuDQorICBUaGUgaHcgVVVJRCBpcyBj
b25zaWRlcmVkICpuZXcqIGZvciBlYWNoIG9wZW4gZmlsZSBoYW5kbGUgdGhhdCBoYXNuJ3QNCisg
IGNvbmZpcm1lZCB0aGUgbmV3IHZhbHVlLCBmb2xsb3dpbmcgYSBnZW5lcmF0aW9uIGNoYW5nZS4g
VGhlcmVmb3JlLA0KKyAgb25jZSBhIGdlbmVyYXRpb24gY2hhbmdlIHRha2VzIHBsYWNlLCBhbGwg
YGByZWFkKClgYCBjYWxscyB3aWxsDQorICBpbW1lZGlhdGVseSByZXR1cm4gdGhlIG5ldyB1dWlk
IGFuZCB3aWxsIGNvbnRpbnVlIHRvIGRvIHNvIHVudGlsIHRoZQ0KKyAgbmV3IHZhbHVlIGlzIGNv
bmZpcm1lZCBiYWNrIHRvIHRoZSBkcml2ZXIgdGhyb3VnaCBgYHdyaXRlKClgYC4NCisgIFBhcnRp
YWwgcmVhZHMgYXJlIG5vdCBhbGxvd2VkIC0gcmVhZCBidWZmZXIgbmVlZHMgdG8gYmUgYXQgbGVh
c3QNCisgIGBgc2l6ZW9mKHV1aWRfdClgYCBpbiBzaXplLg0KKw0KK2Bgd3JpdGUoKWBgOg0KKyAg
V3JpdGUgaXMgdXNlZCB0byBjb25maXJtIHRoZSB1cC10by1kYXRlIFZtLUdlbi1JZCBiYWNrIHRv
IHRoZSBkcml2ZXIuDQorICBGb2xsb3dpbmcgYSBWTSBnZW5lcmF0aW9uIGNoYW5nZSwgYWxsIGV4
aXN0aW5nIHdhdGNoZXJzIGFyZSBtYXJrZWQNCisgIGFzICpvdXRkYXRlZCouIEVhY2ggZmlsZSBo
YW5kbGUgd2lsbCBtYWludGFpbiB0aGUgKm91dGRhdGVkKiBzdGF0dXMNCisgIHVudGlsIGEgYGB3
cml0ZSgpYGAgY29uZmlybXMgdGhlIHVwLXRvLWRhdGUgVVVJRCBiYWNrIHRvIHRoZSBkcml2ZXIu
DQorICBQYXJ0aWFsIHdyaXRlcyBhcmUgbm90IGFsbG93ZWQgLSB3cml0ZSBidWZmZXIgc2hvdWxk
IGJlIGV4YWN0bHkNCisgIGBgc2l6ZW9mKHV1aWRfdClgYCBpbiBzaXplLg0KKw0KK2BgcG9sbCgp
YGA6DQorICBQb2xsIGlzIGltcGxlbWVudGVkIHRvIGFsbG93IHBvbGxpbmcgZm9yIFVVSUQgdXBk
YXRlcy4gU3VjaA0KKyAgdXBkYXRlcyByZXN1bHQgaW4gYGBFUE9MTElOYGAgcG9sbGluZyBzdGF0
dXMgdW50aWwgdGhlIG5ldyB1cC10by1kYXRlDQorICBVVUlEIGlzIGNvbmZpcm1lZCBiYWNrIHRv
IHRoZSBkcml2ZXIgdGhyb3VnaCBhIGBgd3JpdGUoKWBgLg0KKw0KK2BgaW9jdGwoKWBgOg0KKyAg
VGhlIGRyaXZlciBhbHNvIGFkZHMgc3VwcG9ydCBmb3IgdHJhY2tpbmcgY291bnQgb2Ygb3BlbiBm
aWxlIGhhbmRsZXMNCisgIHRoYXQgaGF2ZW4ndCBhY2tub3dsZWRnZWQgYW4gVVVJRCB1cGRhdGUu
IFRoaXMgaXMgZXhwb3NlZCB0aHJvdWdoDQorICB0d28gSU9DVExzOg0KKw0KKyAgLSBWTUdFTklE
X0dFVF9PVVREQVRFRF9XQVRDSEVSUzogaW1tZWRpYXRlbHkgcmV0dXJucyB0aGUgbnVtYmVyIG9m
DQorICAgICpvdXRkYXRlZCogd2F0Y2hlcnMgLSBudW1iZXIgb2YgZmlsZSBoYW5kbGVzIHRoYXQg
d2VyZSBvcGVuIGR1cmluZw0KKyAgICBhIFZNIGdlbmVyYXRpb24gY2hhbmdlLCBhbmQgd2hpY2gg
aGF2ZSBub3QgeWV0IGNvbmZpcm1lZCB0aGUgbmV3DQorICAgIFZtLUdlbi1JZC4NCisgIC0gVk1H
RU5JRF9XQUlUX1dBVENIRVJTOiBibG9ja3MgdW50aWwgdGhlcmUgYXJlIG5vIG1vcmUgKm91dGRh
dGVkKg0KKyAgICB3YXRjaGVycywgb3IgaWYgYSBgYHRpbWVvdXRgYCBhcmd1bWVudCBpcyBwcm92
aWRlZCwgdW50aWwgdGhlDQorICAgIHRpbWVvdXQgZXhwaXJlcy4NCisNCitgYG1tYXAoKWBgOg0K
KyAgVGhlIGRyaXZlciBzdXBwb3J0cyBgYFBST1RfUkVBRCwgTUFQX1NIQVJFRGBgIG1tYXBzIG9m
IGEgc2luZ2xlIHBhZ2UNCisgIGluIHNpemUuIFRoZSBmaXJzdCAxNiBieXRlcyBvZiB0aGUgbWFw
cGVkIHBhZ2Ugd2lsbCBjb250YWluIGFuDQorICB1cC10by1kYXRlIGNvcHkgb2YgdGhlIFZNIGdl
bmVyYXRpb24gVVVJRC4NCisgIFRoZSBtYXBwZWQgbWVtb3J5IGNhbiBiZSB1c2VkIGFzIGEgbG93
LWxhdGVuY3kgVVVJRCBwcm9iZSBtZWNoYW5pc20NCisgIGluIGNyaXRpY2FsIHNlY3Rpb25zIC0g
c2VlIGV4YW1wbGVzLg0KKw0KK2BgY2xvc2UoKWBgOg0KKyAgUmVtb3ZlcyB0aGUgZmlsZSBoYW5k
bGUgYXMgYSBWbS1HZW4tSWQgd2F0Y2hlci4NCisNCitFeGFtcGxlIGFwcGxpY2F0aW9uIHdvcmtm
bG93cw0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorDQorMSkgV2F0Y2hkb2cgdGhy
ZWFkIHNpbXBsaWZpZWQgZXhhbXBsZTo6DQorDQorCXZvaWQgd2F0Y2hkb2dfdGhyZWFkX2hhbmRs
ZXIoaW50ICp0aHJlYWRfYWN0aXZlKQ0KKwl7DQorCQl1dWlkX3QgdXVpZDsNCisJCWludCBmZCA9
IG9wZW4oIi9kZXYvdm1nZW5pZCIsIE9fUkRXUiwgU19JUlVTUiB8IFNfSVdVU1IpOw0KKw0KKwkJ
ZG8gew0KKwkJCS8vIHJlYWQgbmV3IFVVSUQgLSBibG9ja3MgdW50aWwgVk0gZ2VuZXJhdGlvbiBj
aGFuZ2VzDQorCQkJcmVhZChmZCwgJnV1aWQsIHNpemVvZih1dWlkKSk7DQorDQorCQkJLy8gYmVj
YXVzZSBvZiBWTSBnZW5lcmF0aW9uIGNoYW5nZSwgd2UgbmVlZCB0byByZWJ1aWxkIHdvcmxkDQor
CQkJcmVzZWVkX2FwcF9lbnYoKTsNCisNCisJCQkvLyBjb25maXJtIHdlJ3JlIGRvbmUgaGFuZGxp
bmcgVVVJRCB1cGRhdGUNCisJCQl3cml0ZShmZCwgJnV1aWQsIHNpemVvZih1dWlkKSk7DQorCQl9
IHdoaWxlIChhdG9taWNfcmVhZCh0aHJlYWRfYWN0aXZlKSk7DQorDQorCQljbG9zZShmZCk7DQor
CX0NCisNCisyKSBBU1lOQyBzaW1wbGlmaWVkIGV4YW1wbGU6Og0KKw0KKwl2b2lkIGhhbmRsZV9p
b19vbl92bWdlbmZkKGludCB2bWdlbmZkKQ0KKwl7DQorCQl1dWlkX3QgdXVpZDsNCisNCisJCS8v
IGJlY2F1c2Ugb2YgVk0gZ2VuZXJhdGlvbiBjaGFuZ2UsIHdlIG5lZWQgdG8gcmVidWlsZCB3b3Js
ZA0KKwkJcmVzZWVkX2FwcF9lbnYoKTsNCisNCisJCS8vIHJlYWQgbmV3IFVVSUQgLSB3ZSBuZWVk
IGl0IHRvIGNvbmZpcm0gd2UndmUgaGFuZGxlZCB1cGRhdGUNCisJCXJlYWQoZmQsICZ1dWlkLCBz
aXplb2YodXVpZCkpOw0KKw0KKwkJLy8gY29uZmlybSB3ZSdyZSBkb25lIGhhbmRsaW5nIFVVSUQg
dXBkYXRlDQorCQl3cml0ZShmZCwgJnV1aWQsIHNpemVvZih1dWlkKSk7DQorCX0NCisNCisJaW50
IG1haW4oKSB7DQorCQlpbnQgZXBmZCwgdm1nZW5mZDsNCisJCXN0cnVjdCBlcG9sbF9ldmVudCBl
djsNCisNCisJCWVwZmQgPSBlcG9sbF9jcmVhdGUoRVBPTExfUVVFVUVfTEVOKTsNCisNCisJCXZt
Z2VuZmQgPSBvcGVuKCIvZGV2L3ZtZ2VuaWQiLCBPX1JEV1IsIFNfSVJVU1IgfCBTX0lXVVNSKTsN
CisNCisJCS8vIHJlZ2lzdGVyIHZtZ2VuaWQgZm9yIHBvbGxpbmcNCisJCWV2LmV2ZW50cyA9IEVQ
T0xMSU47DQorCQlldi5kYXRhLmZkID0gdm1nZW5mZDsNCisJCWVwb2xsX2N0bChlcGZkLCBFUE9M
TF9DVExfQURELCB2bWdlbmZkLCAmZXYpOw0KKw0KKwkJLy8gcmVnaXN0ZXIgb3RoZXIgcGFydHMg
b2YgeW91ciBhcHAgZm9yIHBvbGxpbmcNCisJCS8vIC4uLg0KKw0KKwkJd2hpbGUgKDEpIHsNCisJ
CQkvLyB3YWl0IGZvciBzb21ldGhpbmcgdG8gZG8uLi4NCisJCQlpbnQgbmZkcyA9IGVwb2xsX3dh
aXQoZXBmZCwgZXZlbnRzLA0KKwkJCQlNQVhfRVBPTExfRVZFTlRTX1BFUl9SVU4sDQorCQkJCUVQ
T0xMX1JVTl9USU1FT1VUKTsNCisJCQlpZiAobmZkcyA8IDApIGRpZSgiRXJyb3IgaW4gZXBvbGxf
d2FpdCEiKTsNCisNCisJCQkvLyBmb3IgZWFjaCByZWFkeSBmZA0KKwkJCWZvcihpbnQgaSA9IDA7
IGkgPCBuZmRzOyBpKyspIHsNCisJCQkJaW50IGZkID0gZXZlbnRzW2ldLmRhdGEuZmQ7DQorDQor
CQkJCWlmIChmZCA9PSB2bWdlbmZkKQ0KKwkJCQkJaGFuZGxlX2lvX29uX3ZtZ2VuZmQodm1nZW5m
ZCk7DQorCQkJCWVsc2UNCisJCQkJCWhhbmRsZV9zb21lX290aGVyX3BhcnRfb2ZfdGhlX2FwcChm
ZCk7DQorCQkJfQ0KKwkJfQ0KKw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCiszKSBNYXBwZWQgbWVt
b3J5IHBvbGxpbmcgc2ltcGxpZmllZCBleGFtcGxlOjoNCisNCisJLyoNCisJICogYXBwL2xpYnJh
cnkgZnVuY3Rpb24gdGhhdCBwcm92aWRlcyBjYWNoZWQgc2VjcmV0cw0KKwkgKi8NCisJY2hhciAq
IHNhZmVfY2FjaGVkX3NlY3JldChhcHBfZGF0YV90ICphcHApDQorCXsNCisJCWNoYXIgKnNlY3Jl
dDsNCisJCXZvbGF0aWxlIHV1aWRfdCAqY29uc3QgdXVpZF9wdHIgPSBnZXRfdm1nZW5pZF9tYXBw
aW5nKGFwcCk7DQorCWFnYWluOg0KKwkJc2VjcmV0ID0gX19jYWNoZWRfc2VjcmV0KGFwcCk7DQor
DQorCQlpZiAodW5saWtlbHkoKnV1aWRfcHRyICE9IGFwcC0+Y2FjaGVkX3V1aWQpKSB7DQorCQkJ
YXBwLT5jYWNoZWRfdXVpZCA9ICp1dWlkX3B0cjsNCisNCisJCQkvLyByZWJ1aWxkIHdvcmxkIHRo
ZW4gY29uZmlybSB0aGUgdXVpZCB1cGRhdGUgKHRocnUgd3JpdGUpDQorCQkJcmVidWlsZF9jYWNo
ZXMoYXBwKTsNCisJCQlhY2tfdm1nZW5pZF91cGRhdGUoYXBwKTsNCisNCisJCQlnb3RvIGFnYWlu
Ow0KKwkJfQ0KKw0KKwkJcmV0dXJuIHNlY3JldDsNCisJfQ0KKw0KKzQpIE9yY2hlc3RyYXRvciBz
aW1wbGlmaWVkIGV4YW1wbGU6Og0KKw0KKwkvKg0KKwkgKiBvcmNoZXN0cmF0b3IgLSBtYW5hZ2Vz
IG11bHRpcGxlIGFwcHMgYW5kIGxpYnJhcmllcyB1c2VkIGJ5IGEgc2VydmljZQ0KKwkgKiBhbmQg
dHJpZXMgdG8gbWFrZSBzdXJlIGFsbCBzZW5zaXRpdmUgY29tcG9uZW50cyBncmFjZWZ1bGx5IGhh
bmRsZQ0KKwkgKiBWTSBnZW5lcmF0aW9uIGNoYW5nZXMuDQorCSAqIEZvbGxvd2luZyBmdW5jdGlv
biBpcyBjYWxsZWQgb24gZGV0ZWN0aW9uIG9mIGEgVk0gZ2VuZXJhdGlvbiBjaGFuZ2UuDQorCSAq
Lw0KKwlpbnQgaGFuZGxlX3ZtZ2VuX3VwZGF0ZShpbnQgdm1nZW5mZCwgdXVpZF90IG5ld191dWlk
KQ0KKwl7DQorCQkvLyBwYXVzZSB1bnRpbCBhbGwgY29tcG9uZW50cyBoYXZlIGhhbmRsZWQgZXZl
bnQNCisJCXBhdXNlX3NlcnZpY2UoKTsNCisNCisJCS8vIGNvbmZpcm0gKnRoaXMqIHdhdGNoZXIg
YXMgdXAtdG8tZGF0ZQ0KKwkJd3JpdGUoZmQsICZuZXdfdXVpZCwgc2l6ZW9mKHV1aWRfdCkpOw0K
Kw0KKwkJLy8gd2FpdCBmb3IgYWxsICpvdGhlcnMqDQorCQlpb2N0bChmZCwgVk1HRU5JRF9XQUlU
X1dBVENIRVJTLCBOVUxMKTsNCisNCisJCS8vIGFsbCBhcHBzIG9uIHRoZSBzeXN0ZW0gaGF2ZSBy
ZWJ1aWx0IHdvcmxkcw0KKwkJcmVzdW1lX3NlcnZpY2UoKTsNCisJfQ0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlydC9LY29uZmlnIGIvZHJpdmVycy92aXJ0L0tjb25maWcNCmluZGV4IDM2M2FmMmUu
LmM4MGYxY2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3ZpcnQvS2NvbmZpZw0KKysrIGIvZHJpdmVy
cy92aXJ0L0tjb25maWcNCkBAIC0xMyw2ICsxMywxOSBAQCBtZW51Y29uZmlnIFZJUlRfRFJJVkVS
Uw0KIA0KIGlmIFZJUlRfRFJJVkVSUw0KIA0KK2NvbmZpZyBWTUdFTklEDQorCXRyaXN0YXRlICJW
aXJ0dWFsIE1hY2hpbmUgR2VuZXJhdGlvbiBJRCBkcml2ZXIiDQorCWRlcGVuZHMgb24gQUNQSQ0K
KwlkZWZhdWx0IE0NCisJaGVscA0KKwkgIFRoaXMgaXMgYSBWaXJ0dWFsIE1hY2hpbmUgR2VuZXJh
dGlvbiBJRCBkcml2ZXIgd2hpY2ggcHJvdmlkZXMNCisJICBhIHZpcnR1YWwgbWFjaGluZSB1bmlx
dWUgaWRlbnRpZmllci4gVGhlIHByb3ZpZGVkIFVVSUQgY2FuIGJlDQorCSAgd2F0Y2hlZCB0aHJv
dWdoIHRoZSBGUyBpbnRlcmZhY2UgZXhwb3NlZCBieSB0aGlzIGRyaXZlciwgYW5kDQorCSAgdGh1
cyBjYW4gcHJvdmlkZSBub3RpZmljYXRpb25zIGZvciBWTSBzbmFwc2hvdCBvciBjbG9uaW5nIGV2
ZW50cy4NCisJICBUaGlzIGVuYWJsZXMgYXBwbGljYXRpb25zIGFuZCBsaWJyYXJpZXMgdGhhdCBz
dG9yZSBvciBjYWNoZQ0KKwkgIHNlbnNpdGl2ZSBpbmZvcm1hdGlvbiwgdG8ga25vdyB0aGF0IHRo
ZXkgbmVlZCB0byByZWdlbmVyYXRlIGl0DQorCSAgYWZ0ZXIgcHJvY2VzcyBtZW1vcnkgaGFzIGJl
ZW4gZXhwb3NlZCB0byBwb3RlbnRpYWwgY29weWluZy4NCisNCiBjb25maWcgRlNMX0hWX01BTkFH
RVINCiAJdHJpc3RhdGUgIkZyZWVzY2FsZSBoeXBlcnZpc29yIG1hbmFnZW1lbnQgZHJpdmVyIg0K
IAlkZXBlbmRzIG9uIEZTTF9TT0MNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQvTWFrZWZpbGUg
Yi9kcml2ZXJzL3ZpcnQvTWFrZWZpbGUNCmluZGV4IGZkMzMxMjQuLmExZjhkY2MgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL3ZpcnQvTWFrZWZpbGUNCisrKyBiL2RyaXZlcnMvdmlydC9NYWtlZmlsZQ0K
QEAgLTQsNCArNCw1IEBADQogIw0KIA0KIG9iai0kKENPTkZJR19GU0xfSFZfTUFOQUdFUikJKz0g
ZnNsX2h5cGVydmlzb3Iubw0KK29iai0kKENPTkZJR19WTUdFTklEKQkJKz0gdm1nZW5pZC5vDQog
b2JqLXkJCQkJKz0gdmJveGd1ZXN0Lw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC92bWdlbmlk
LmMgYi9kcml2ZXJzL3ZpcnQvdm1nZW5pZC5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXgg
MDAwMDAwMC4uZDMxNGM3Mg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvZHJpdmVycy92aXJ0L3ZtZ2Vu
aWQuYw0KQEAgLTAsMCArMSw0MTkgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMA0KKy8qDQorICogVmlydHVhbCBNYWNoaW5lIEdlbmVyYXRpb24gSUQgZHJpdmVyDQorICoN
CisgKiBDb3B5cmlnaHQgKEMpIDIwMTggUmVkIEhhdCBJbmMsIENvcHlyaWdodCAoQykgMjAyMCBB
bWF6b24uY29tIEluYw0KKyAqIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQorICoJQXV0aG9yczoNCisg
KgkgIEFkcmlhbiBDYXRhbmdpdSA8YWNhdGFuQGFtYXpvbi5jb20+DQorICoJICBPciBJZGdhciA8
b3JpZGdhckBnbWFpbC5jb20+DQorICoJICBHYWwgSGFtbWVyIDxnaGFtbWVyQHJlZGhhdC5jb20+
DQorICoNCisgKi8NCisjaW5jbHVkZSA8bGludXgvYWNwaS5oPg0KKyNpbmNsdWRlIDxsaW51eC9j
ZGV2Lmg+DQorI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KKyNpbmNsdWRlIDxsaW51eC9tbS5o
Pg0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCisjaW5jbHVkZSA8bGludXgvcG9sbC5oPg0K
KyNpbmNsdWRlIDxsaW51eC91dWlkLmg+DQorI2luY2x1ZGUgPGxpbnV4L3ZtZ2VuaWQuaD4NCisN
CisjZGVmaW5lIERFVl9OQU1FICJ2bWdlbmlkIg0KK0FDUElfTU9EVUxFX05BTUUoREVWX05BTUUp
Ow0KKw0KK3N0cnVjdCBkZXZfZGF0YSB7DQorCXN0cnVjdCBjZGV2ICAgICAgIGNkZXY7DQorCWRl
dl90ICAgICAgICAgICAgIGRldl9pZDsNCisJdW5zaWduZWQgbG9uZyAgICAgbWFwX2J1ZjsNCisN
CisJdm9pZCAgICAgICAgICAgICAgKnV1aWRfaW9tYXA7DQorCXV1aWRfdCAgICAgICAgICAgIHV1
aWQ7DQorCXdhaXRfcXVldWVfaGVhZF90IHJlYWRfd2FpdDsNCisNCisJYXRvbWljX3QgICAgICAg
ICAgd2F0Y2hlcnM7DQorCWF0b21pY190ICAgICAgICAgIG91dGRhdGVkX3dhdGNoZXJzOw0KKwl3
YWl0X3F1ZXVlX2hlYWRfdCBvdXRkYXRlZF93YWl0Ow0KK307DQorDQorc3RydWN0IGZpbGVfZGF0
YSB7DQorCXN0cnVjdCBkZXZfZGF0YSAgKmRldl9kYXRhOw0KKwl1dWlkX3QgICAgICAgICAgIGFj
a2VkX3V1aWQ7DQorfTsNCisNCitzdGF0aWMgYm9vbCB2bWdlbmlkX3V1aWRfbWF0Y2hlcyhzdHJ1
Y3QgZGV2X2RhdGEgKnByaXYsIHV1aWRfdCAqdXVpZCkNCit7DQorCXJldHVybiAhbWVtY21wKHV1
aWQsICZwcml2LT51dWlkLCBzaXplb2YodXVpZF90KSk7DQorfQ0KKw0KK3N0YXRpYyB2b2lkIHZt
Z2VuaWRfcHV0X291dGRhdGVkX3dhdGNoZXJzKHN0cnVjdCBkZXZfZGF0YSAqcHJpdikNCit7DQor
CWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZwcml2LT5vdXRkYXRlZF93YXRjaGVycykpDQorCQl3
YWtlX3VwX2ludGVycnVwdGlibGUoJnByaXYtPm91dGRhdGVkX3dhaXQpOw0KK30NCisNCitzdGF0
aWMgaW50IHZtZ2VuaWRfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmls
ZSkNCit7DQorCXN0cnVjdCBkZXZfZGF0YSAqcHJpdiA9DQorCQljb250YWluZXJfb2YoaW5vZGUt
PmlfY2Rldiwgc3RydWN0IGRldl9kYXRhLCBjZGV2KTsNCisJc3RydWN0IGZpbGVfZGF0YSAqZmls
ZV9kYXRhID0NCisJCWt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBmaWxlX2RhdGEpLCBHRlBfS0VSTkVM
KTsNCisNCisJaWYgKCFmaWxlX2RhdGEpDQorCQlyZXR1cm4gLUVOT01FTTsNCisNCisJZmlsZV9k
YXRhLT5hY2tlZF91dWlkID0gcHJpdi0+dXVpZDsNCisJZmlsZV9kYXRhLT5kZXZfZGF0YSA9IHBy
aXY7DQorDQorCWZpbGUtPnByaXZhdGVfZGF0YSA9IGZpbGVfZGF0YTsNCisJYXRvbWljX2luYygm
cHJpdi0+d2F0Y2hlcnMpOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGludCB2bWdl
bmlkX2Nsb3NlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQ0KK3sNCisJ
c3RydWN0IGZpbGVfZGF0YSAqZmlsZV9kYXRhID0gKHN0cnVjdCBmaWxlX2RhdGEgKikgZmlsZS0+
cHJpdmF0ZV9kYXRhOw0KKwlzdHJ1Y3QgZGV2X2RhdGEgKnByaXYgPSBmaWxlX2RhdGEtPmRldl9k
YXRhOw0KKw0KKwlpZiAoIXZtZ2VuaWRfdXVpZF9tYXRjaGVzKHByaXYsICZmaWxlX2RhdGEtPmFj
a2VkX3V1aWQpKQ0KKwkJdm1nZW5pZF9wdXRfb3V0ZGF0ZWRfd2F0Y2hlcnMocHJpdik7DQorCWF0
b21pY19kZWMoJnByaXYtPndhdGNoZXJzKTsNCisJa2ZyZWUoZmlsZS0+cHJpdmF0ZV9kYXRhKTsN
CisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBzc2l6ZV90DQordm1nZW5pZF9yZWFkKHN0
cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqdWJ1Ziwgc2l6ZV90IG5ieXRlcywgbG9mZl90
ICpwcG9zKQ0KK3sNCisJc3RydWN0IGZpbGVfZGF0YSAqZmlsZV9kYXRhID0NCisJCShzdHJ1Y3Qg
ZmlsZV9kYXRhICopIGZpbGUtPnByaXZhdGVfZGF0YTsNCisJc3RydWN0IGRldl9kYXRhICpwcml2
ID0gZmlsZV9kYXRhLT5kZXZfZGF0YTsNCisJc3NpemVfdCByZXQ7DQorDQorCWlmIChuYnl0ZXMg
PT0gMCkNCisJCXJldHVybiAwOw0KKwkvKiBkaXNhbGxvdyBwYXJ0aWFsIFVVSUQgcmVhZHMgKi8N
CisJaWYgKG5ieXRlcyA8IHNpemVvZih1dWlkX3QpKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCW5i
eXRlcyA9IHNpemVvZih1dWlkX3QpOw0KKw0KKwlpZiAodm1nZW5pZF91dWlkX21hdGNoZXMocHJp
diwgJmZpbGVfZGF0YS0+YWNrZWRfdXVpZCkpIHsNCisJCWlmIChmaWxlLT5mX2ZsYWdzICYgT19O
T05CTE9DSykNCisJCQlyZXR1cm4gLUVBR0FJTjsNCisJCXJldCA9IHdhaXRfZXZlbnRfaW50ZXJy
dXB0aWJsZSgNCisJCQlwcml2LT5yZWFkX3dhaXQsDQorCQkJIXZtZ2VuaWRfdXVpZF9tYXRjaGVz
KHByaXYsICZmaWxlX2RhdGEtPmFja2VkX3V1aWQpDQorCQkpOw0KKwkJaWYgKHJldCkNCisJCQly
ZXR1cm4gcmV0Ow0KKwl9DQorDQorCXJldCA9IGNvcHlfdG9fdXNlcih1YnVmLCAmcHJpdi0+dXVp
ZCwgbmJ5dGVzKTsNCisJaWYgKHJldCkNCisJCXJldHVybiAtRUZBVUxUOw0KKw0KKwlyZXR1cm4g
bmJ5dGVzOw0KK30NCisNCitzdGF0aWMgc3NpemVfdCB2bWdlbmlkX3dyaXRlKHN0cnVjdCBmaWxl
ICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqdWJ1ZiwNCisJCQkJc2l6ZV90IGNvdW50LCBsb2Zm
X3QgKnBwb3MpDQorew0KKwlzdHJ1Y3QgZmlsZV9kYXRhICpmaWxlX2RhdGEgPSAoc3RydWN0IGZp
bGVfZGF0YSAqKSBmaWxlLT5wcml2YXRlX2RhdGE7DQorCXN0cnVjdCBkZXZfZGF0YSAqcHJpdiA9
IGZpbGVfZGF0YS0+ZGV2X2RhdGE7DQorCXV1aWRfdCBhY2tfdXVpZDsNCisNCisJLyogZGlzYWxs
b3cgcGFydGlhbCBVVUlEIHdyaXRlcyAqLw0KKwlpZiAoY291bnQgIT0gc2l6ZW9mKHV1aWRfdCkp
DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJaWYgKGNvcHlfZnJvbV91c2VyKCZhY2tfdXVpZCwgdWJ1
ZiwgY291bnQpKQ0KKwkJcmV0dXJuIC1FRkFVTFQ7DQorCS8qIHdyb25nIFVVSUQgYWNrbm93bGVk
Z2VkICovDQorCWlmICghdm1nZW5pZF91dWlkX21hdGNoZXMocHJpdiwgJmFja191dWlkKSkNCisJ
CXJldHVybiAtRUlOVkFMOw0KKw0KKwlpZiAoIXZtZ2VuaWRfdXVpZF9tYXRjaGVzKHByaXYsICZm
aWxlX2RhdGEtPmFja2VkX3V1aWQpKSB7DQorCQkvKiB1cGRhdGUgbG9jYWwgdmlldyBvZiBVVUlE
ICovDQorCQlmaWxlX2RhdGEtPmFja2VkX3V1aWQgPSBhY2tfdXVpZDsNCisJCXZtZ2VuaWRfcHV0
X291dGRhdGVkX3dhdGNoZXJzKHByaXYpOw0KKwl9DQorDQorCXJldHVybiAoc3NpemVfdCljb3Vu
dDsNCit9DQorDQorc3RhdGljIF9fcG9sbF90DQordm1nZW5pZF9wb2xsKHN0cnVjdCBmaWxlICpm
aWxlLCBwb2xsX3RhYmxlICp3YWl0KQ0KK3sNCisJX19wb2xsX3QgbWFzayA9IDA7DQorCXN0cnVj
dCBmaWxlX2RhdGEgKmZpbGVfZGF0YSA9DQorCQkoc3RydWN0IGZpbGVfZGF0YSAqKSBmaWxlLT5w
cml2YXRlX2RhdGE7DQorCXN0cnVjdCBkZXZfZGF0YSAqcHJpdiA9IGZpbGVfZGF0YS0+ZGV2X2Rh
dGE7DQorDQorCWlmICghdm1nZW5pZF91dWlkX21hdGNoZXMocHJpdiwgJmZpbGVfZGF0YS0+YWNr
ZWRfdXVpZCkpDQorCQlyZXR1cm4gRVBPTExJTiB8IEVQT0xMUkROT1JNOw0KKw0KKwlwb2xsX3dh
aXQoZmlsZSwgJnByaXYtPnJlYWRfd2FpdCwgd2FpdCk7DQorDQorCWlmICghdm1nZW5pZF91dWlk
X21hdGNoZXMocHJpdiwgJmZpbGVfZGF0YS0+YWNrZWRfdXVpZCkpDQorCQltYXNrID0gRVBPTExJ
TiB8IEVQT0xMUkROT1JNOw0KKw0KKwlyZXR1cm4gbWFzazsNCit9DQorDQorc3RhdGljIGxvbmcg
dm1nZW5pZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwNCisJCXVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQ0KK3sNCisJc3RydWN0IGZpbGVfZGF0YSAqZmlsZV9kYXRhID0NCisJ
CShzdHJ1Y3QgZmlsZV9kYXRhICopIGZpbGUtPnByaXZhdGVfZGF0YTsNCisJc3RydWN0IGRldl9k
YXRhICpwcml2ID0gZmlsZV9kYXRhLT5kZXZfZGF0YTsNCisJc3RydWN0IHRpbWVzcGVjIF9fdXNl
ciAqdGltZW91dCA9ICh2b2lkICopIGFyZzsNCisJc3RydWN0IHRpbWVzcGVjIGt0czsNCisJa3Rp
bWVfdCB1bnRpbDsNCisJaW50IHJldDsNCisNCisJc3dpdGNoIChjbWQpIHsNCisJY2FzZSBWTUdF
TklEX0dFVF9PVVREQVRFRF9XQVRDSEVSUzoNCisJCXJldCA9IGF0b21pY19yZWFkKCZwcml2LT5v
dXRkYXRlZF93YXRjaGVycyk7DQorCQlicmVhazsNCisJY2FzZSBWTUdFTklEX1dBSVRfV0FUQ0hF
UlM6DQorCQlpZiAodGltZW91dCkgew0KKwkJCXJldCA9IGNvcHlfZnJvbV91c2VyKCZrdHMsIHRp
bWVvdXQsIHNpemVvZihrdHMpKTsNCisJCQlpZiAocmV0KQ0KKwkJCQlyZXR1cm4gLUVGQVVMVDsN
CisJCQl1bnRpbCA9IHRpbWVzcGVjX3RvX2t0aW1lKGt0cyk7DQorCQl9IGVsc2Ugew0KKwkJCXVu
dGlsID0gS1RJTUVfTUFYOw0KKwkJfQ0KKw0KKwkJcmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRp
YmxlX2hydGltZW91dCgNCisJCQlwcml2LT5vdXRkYXRlZF93YWl0LA0KKwkJCSFhdG9taWNfcmVh
ZCgmcHJpdi0+b3V0ZGF0ZWRfd2F0Y2hlcnMpLA0KKwkJCXVudGlsDQorCQkpOw0KKwkJYnJlYWs7
DQorCWRlZmF1bHQ6DQorCQlyZXQgPSAtRUlOVkFMOw0KKwkJYnJlYWs7DQorCX0NCisJcmV0dXJu
IHJldDsNCit9DQorDQorc3RhdGljIHZtX2ZhdWx0X3Qgdm1nZW5pZF92bV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZikNCit7DQorCXN0cnVjdCBwYWdlICpwYWdlOw0KKwlzdHJ1Y3QgZmlsZV9k
YXRhICpmaWxlX2RhdGEgPQ0KKwkJCShzdHJ1Y3QgZmlsZV9kYXRhICopIHZtZi0+dm1hLT52bV9w
cml2YXRlX2RhdGE7DQorCXN0cnVjdCBkZXZfZGF0YSAqcHJpdiA9IGZpbGVfZGF0YS0+ZGV2X2Rh
dGE7DQorDQorCWlmIChwcml2LT5tYXBfYnVmKSB7DQorCQlwYWdlID0gdmlydF90b19wYWdlKHBy
aXYtPm1hcF9idWYpOw0KKwkJZ2V0X3BhZ2UocGFnZSk7DQorCQl2bWYtPnBhZ2UgPSBwYWdlOw0K
Kwl9DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJh
dGlvbnNfc3RydWN0IHZtZ2VuaWRfdm1fb3BzID0gew0KKwkuZmF1bHQgPSB2bWdlbmlkX3ZtX2Zh
dWx0LA0KK307DQorDQorc3RhdGljIGludCB2bWdlbmlkX21tYXAoc3RydWN0IGZpbGUgKmZpbGUs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KK3sNCisJaWYgKHZtYS0+dm1fcGdvZmYgIT0g
MCB8fCB2bWFfcGFnZXModm1hKSA+IDEpDQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJaWYgKCh2
bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpICE9IDApDQorCQlyZXR1cm4gLUVQRVJNOw0KKw0KKwl2
bWEtPnZtX29wcyA9ICZ2bWdlbmlkX3ZtX29wczsNCisJdm1hLT52bV9mbGFncyB8PSBWTV9ET05U
RVhQQU5EIHwgVk1fRE9OVERVTVA7DQorCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gZmlsZS0+cHJp
dmF0ZV9kYXRhOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBm
aWxlX29wZXJhdGlvbnMgZm9wcyA9IHsNCisJLm93bmVyICAgICAgICAgID0gVEhJU19NT0RVTEUs
DQorCS5tbWFwICAgICAgICAgICA9IHZtZ2VuaWRfbW1hcCwNCisJLm9wZW4gICAgICAgICAgID0g
dm1nZW5pZF9vcGVuLA0KKwkucmVsZWFzZSAgICAgICAgPSB2bWdlbmlkX2Nsb3NlLA0KKwkucmVh
ZCAgICAgICAgICAgPSB2bWdlbmlkX3JlYWQsDQorCS53cml0ZSAgICAgICAgICA9IHZtZ2VuaWRf
d3JpdGUsDQorCS5wb2xsICAgICAgICAgICA9IHZtZ2VuaWRfcG9sbCwNCisJLmNvbXBhdF9pb2N0
bCAgID0gdm1nZW5pZF9pb2N0bCwNCisJLnVubG9ja2VkX2lvY3RsID0gdm1nZW5pZF9pb2N0bCwN
Cit9Ow0KKw0KK3N0YXRpYyBpbnQgdm1nZW5pZF9hY3BpX21hcChzdHJ1Y3QgZGV2X2RhdGEgKnBy
aXYsIGFjcGlfaGFuZGxlIGhhbmRsZSkNCit7DQorCWludCBpOw0KKwlwaHlzX2FkZHJfdCBwaHlz
X2FkZHI7DQorCXN0cnVjdCBhY3BpX2J1ZmZlciBidWZmZXIgPSB7IEFDUElfQUxMT0NBVEVfQlVG
RkVSLCBOVUxMIH07DQorCWFjcGlfc3RhdHVzIHN0YXR1czsNCisJdW5pb24gYWNwaV9vYmplY3Qg
KnBzczsNCisJdW5pb24gYWNwaV9vYmplY3QgKmVsZW1lbnQ7DQorDQorCXN0YXR1cyA9IGFjcGlf
ZXZhbHVhdGVfb2JqZWN0KGhhbmRsZSwgIkFERFIiLCBOVUxMLCAmYnVmZmVyKTsNCisJaWYgKEFD
UElfRkFJTFVSRShzdGF0dXMpKSB7DQorCQlBQ1BJX0VYQ0VQVElPTigoQUVfSU5GTywgc3RhdHVz
LCAiRXZhbHVhdGluZyBBRERSIikpOw0KKwkJcmV0dXJuIC1FTk9ERVY7DQorCX0NCisJcHNzID0g
YnVmZmVyLnBvaW50ZXI7DQorCWlmICghcHNzIHx8IHBzcy0+dHlwZSAhPSBBQ1BJX1RZUEVfUEFD
S0FHRSB8fCBwc3MtPnBhY2thZ2UuY291bnQgIT0gMikNCisJCXJldHVybiAtRUlOVkFMOw0KKw0K
KwlwaHlzX2FkZHIgPSAwOw0KKwlmb3IgKGkgPSAwOyBpIDwgcHNzLT5wYWNrYWdlLmNvdW50OyBp
KyspIHsNCisJCWVsZW1lbnQgPSAmKHBzcy0+cGFja2FnZS5lbGVtZW50c1tpXSk7DQorCQlpZiAo
ZWxlbWVudC0+dHlwZSAhPSBBQ1BJX1RZUEVfSU5URUdFUikNCisJCQlyZXR1cm4gLUVJTlZBTDsN
CisJCXBoeXNfYWRkciB8PSBlbGVtZW50LT5pbnRlZ2VyLnZhbHVlIDw8IGkgKiAzMjsNCisJfQ0K
Kw0KKwlwcml2LT51dWlkX2lvbWFwID0gYWNwaV9vc19tYXBfbWVtb3J5KHBoeXNfYWRkciwgc2l6
ZW9mKHV1aWRfdCkpOw0KKwlpZiAoIXByaXYtPnV1aWRfaW9tYXApIHsNCisJCXByX2VycigiQ291
bGQgbm90IG1hcCBtZW1vcnkgYXQgMHglbGx4LCBzaXplICV1IiwNCisJCQkgICBwaHlzX2FkZHIs
DQorCQkJICAgKHUzMilzaXplb2YodXVpZF90KSk7DQorCQlyZXR1cm4gLUVOT01FTTsNCisJfQ0K
Kw0KKwltZW1jcHlfZnJvbWlvKCZwcml2LT51dWlkLCBwcml2LT51dWlkX2lvbWFwLCBzaXplb2Yo
dXVpZF90KSk7DQorCW1lbWNweSgodm9pZCAqKSBwcml2LT5tYXBfYnVmLCAmcHJpdi0+dXVpZCwg
c2l6ZW9mKHV1aWRfdCkpOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGludCB2bWdl
bmlkX2FjcGlfYWRkKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQ0KK3sNCisJaW50IHJldDsN
CisJc3RydWN0IGRldl9kYXRhICpwcml2Ow0KKw0KKwlpZiAoIWRldmljZSkNCisJCXJldHVybiAt
RUlOVkFMOw0KKw0KKwlwcml2ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGRldl9kYXRhKSwgR0ZQ
X0tFUk5FTCk7DQorCWlmICghcHJpdikNCisJCXJldHVybiAtRU5PTUVNOw0KKw0KKwlwcml2LT5t
YXBfYnVmID0gZ2V0X3plcm9lZF9wYWdlKEdGUF9LRVJORUwpOw0KKwlpZiAoIXByaXYtPm1hcF9i
dWYpIHsNCisJCXJldCA9IC1FTk9NRU07DQorCQlnb3RvIGZyZWU7DQorCX0NCisNCisJZGV2aWNl
LT5kcml2ZXJfZGF0YSA9IHByaXY7DQorDQorCWluaXRfd2FpdHF1ZXVlX2hlYWQoJnByaXYtPnJl
YWRfd2FpdCk7DQorCWF0b21pY19zZXQoJnByaXYtPndhdGNoZXJzLCAwKTsNCisJYXRvbWljX3Nl
dCgmcHJpdi0+b3V0ZGF0ZWRfd2F0Y2hlcnMsIDApOw0KKwlpbml0X3dhaXRxdWV1ZV9oZWFkKCZw
cml2LT5vdXRkYXRlZF93YWl0KTsNCisNCisJcmV0ID0gdm1nZW5pZF9hY3BpX21hcChwcml2LCBk
ZXZpY2UtPmhhbmRsZSk7DQorCWlmIChyZXQgPCAwKQ0KKwkJZ290byBlcnI7DQorDQorCXJldCA9
IGFsbG9jX2NocmRldl9yZWdpb24oJnByaXYtPmRldl9pZCwgMCwgMSwgREVWX05BTUUpOw0KKwlp
ZiAocmV0IDwgMCkgew0KKwkJcHJfZXJyKCJhbGxvY19jaHJkZXZfcmVnaW9uKCkgZmFpbGVkIGZv
ciB2bWdlbmlkXG4iKTsNCisJCWdvdG8gZXJyOw0KKwl9DQorDQorCWNkZXZfaW5pdCgmcHJpdi0+
Y2RldiwgJmZvcHMpOw0KKwljZGV2X2FkZCgmcHJpdi0+Y2RldiwgcHJpdi0+ZGV2X2lkLCAxKTsN
CisNCisJcmV0dXJuIDA7DQorDQorZXJyOg0KKwlpZiAocHJpdi0+dXVpZF9pb21hcCkNCisJCWFj
cGlfb3NfdW5tYXBfbWVtb3J5KHByaXYtPnV1aWRfaW9tYXAsIHNpemVvZih1dWlkX3QpKTsNCisN
CisJZnJlZV9wYWdlcyhwcml2LT5tYXBfYnVmLCAwKTsNCisNCitmcmVlOg0KKwlrZnJlZShwcml2
KTsNCisNCisJcmV0dXJuIHJldDsNCit9DQorDQorc3RhdGljIGludCB2bWdlbmlkX2FjcGlfcmVt
b3ZlKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQ0KK3sNCisJc3RydWN0IGRldl9kYXRhICpw
cml2Ow0KKw0KKwlpZiAoIWRldmljZSB8fCAhYWNwaV9kcml2ZXJfZGF0YShkZXZpY2UpKQ0KKwkJ
cmV0dXJuIC1FSU5WQUw7DQorCXByaXYgPSBhY3BpX2RyaXZlcl9kYXRhKGRldmljZSk7DQorDQor
CWNkZXZfZGVsKCZwcml2LT5jZGV2KTsNCisJdW5yZWdpc3Rlcl9jaHJkZXZfcmVnaW9uKHByaXYt
PmRldl9pZCwgMSk7DQorCWRldmljZS0+ZHJpdmVyX2RhdGEgPSBOVUxMOw0KKw0KKwlpZiAocHJp
di0+dXVpZF9pb21hcCkNCisJCWFjcGlfb3NfdW5tYXBfbWVtb3J5KHByaXYtPnV1aWRfaW9tYXAs
IHNpemVvZih1dWlkX3QpKTsNCisJZnJlZV9wYWdlcyhwcml2LT5tYXBfYnVmLCAwKTsNCisJa2Zy
ZWUocHJpdik7DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgdm9pZCB2bWdlbmlkX2Fj
cGlfbm90aWZ5KHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlLCB1MzIgZXZlbnQpDQorew0KKwl1
dWlkX3Qgb2xkX3V1aWQ7DQorCXN0cnVjdCBkZXZfZGF0YSAqcHJpdjsNCisNCisJcHJfZGVidWco
IlZNR0VOSUQgbm90aWZpZWQsIGV2ZW50ICV1IiwgZXZlbnQpOw0KKw0KKwlpZiAoIWRldmljZSB8
fCAhYWNwaV9kcml2ZXJfZGF0YShkZXZpY2UpKSB7DQorCQlwcl9lcnIoIlZNR0VOSUQgbm90aWZ5
IHdpdGggTlVMTCBwcml2YXRlIGRhdGEiKTsNCisJCXJldHVybjsNCisJfQ0KKwlwcml2ID0gYWNw
aV9kcml2ZXJfZGF0YShkZXZpY2UpOw0KKw0KKwkvKiB1cGRhdGUgVk0gR2VuZXJhdGlvbiBVVUlE
ICovDQorCW9sZF91dWlkID0gcHJpdi0+dXVpZDsNCisJbWVtY3B5X2Zyb21pbygmcHJpdi0+dXVp
ZCwgcHJpdi0+dXVpZF9pb21hcCwgc2l6ZW9mKHV1aWRfdCkpOw0KKw0KKwlpZiAoIXZtZ2VuaWRf
dXVpZF9tYXRjaGVzKHByaXYsICZvbGRfdXVpZCkpIHsNCisJCS8qIEhXIHV1aWQgdXBkYXRlZCAq
Lw0KKwkJbWVtY3B5KCh2b2lkICopIHByaXYtPm1hcF9idWYsICZwcml2LT51dWlkLCBzaXplb2Yo
dXVpZF90KSk7DQorCQlhdG9taWNfc2V0KCZwcml2LT5vdXRkYXRlZF93YXRjaGVycywNCisJCQkg
YXRvbWljX3JlYWQoJnByaXYtPndhdGNoZXJzKSk7DQorCQl3YWtlX3VwX2ludGVycnVwdGlibGUo
JnByaXYtPnJlYWRfd2FpdCk7DQorCX0NCit9DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBhY3Bp
X2RldmljZV9pZCB2bWdlbmlkX2lkc1tdID0gew0KKwl7IlFFTVVWR0lEIiwgMH0sDQorCXsiIiwg
MH0sDQorfTsNCisNCitzdGF0aWMgc3RydWN0IGFjcGlfZHJpdmVyIGFjcGlfdm1nZW5pZF9kcml2
ZXIgPSB7DQorCS5uYW1lID0gInZtX2dlbmVyYXRpb25faWQiLA0KKwkuaWRzID0gdm1nZW5pZF9p
ZHMsDQorCS5vd25lciA9IFRISVNfTU9EVUxFLA0KKwkub3BzID0gew0KKwkJLmFkZCA9IHZtZ2Vu
aWRfYWNwaV9hZGQsDQorCQkucmVtb3ZlID0gdm1nZW5pZF9hY3BpX3JlbW92ZSwNCisJCS5ub3Rp
ZnkgPSB2bWdlbmlkX2FjcGlfbm90aWZ5LA0KKwl9DQorfTsNCisNCitzdGF0aWMgaW50IF9faW5p
dCB2bWdlbmlkX2luaXQodm9pZCkNCit7DQorCXJldHVybiBhY3BpX2J1c19yZWdpc3Rlcl9kcml2
ZXIoJmFjcGlfdm1nZW5pZF9kcml2ZXIpOw0KK30NCisNCitzdGF0aWMgdm9pZCBfX2V4aXQgdm1n
ZW5pZF9leGl0KHZvaWQpDQorew0KKwlhY3BpX2J1c191bnJlZ2lzdGVyX2RyaXZlcigmYWNwaV92
bWdlbmlkX2RyaXZlcik7DQorfQ0KKw0KK21vZHVsZV9pbml0KHZtZ2VuaWRfaW5pdCk7DQorbW9k
dWxlX2V4aXQodm1nZW5pZF9leGl0KTsNCisNCitNT0RVTEVfQVVUSE9SKCJBZHJpYW4gQ2F0YW5n
aXUiKTsNCitNT0RVTEVfREVTQ1JJUFRJT04oIlZpcnR1YWwgTWFjaGluZSBHZW5lcmF0aW9uIElE
Iik7DQorTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KK01PRFVMRV9WRVJTSU9OKCIwLjEiKTsNCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdm1nZW5pZC5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L3ZtZ2VuaWQuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLmY3ZmNh
N2INCi0tLSAvZGV2L251bGwNCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92bWdlbmlkLmgNCkBA
IC0wLDAgKzEsMjIgQEANCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsgV0lU
SCBMaW51eC1zeXNjYWxsLW5vdGUgKi8NCisvKg0KKyAqIENvcHlyaWdodCAoYykgMjAyMCwgQW1h
em9uLmNvbSBJbmMuDQorICoNCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yDQorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCisgKiBhcyBwdWJsaXNoZWQgYnkg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24NCisgKiAyIG9mIHRo
ZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KKyAqLw0K
Kw0KKyNpZm5kZWYgX1VBUElfTElOVVhfVk1HRU5JRF9IDQorI2RlZmluZSBfVUFQSV9MSU5VWF9W
TUdFTklEX0gNCisNCisjaW5jbHVkZSA8bGludXgvaW9jdGwuaD4NCisjaW5jbHVkZSA8bGludXgv
dGltZS5oPg0KKw0KKyNkZWZpbmUgVk1HRU5JRF9JT0NUTCAweDJkDQorI2RlZmluZSBWTUdFTklE
X0dFVF9PVVREQVRFRF9XQVRDSEVSUyBfSU8oVk1HRU5JRF9JT0NUTCwgMSkNCisjZGVmaW5lIFZN
R0VOSURfV0FJVF9XQVRDSEVSUyAgICAgICAgIF9JT1coVk1HRU5JRF9JT0NUTCwgMiwgc3RydWN0
IHRpbWVzcGVjKQ0KKw0KKyNlbmRpZiAvKiBfVUFQSV9MSU5VWF9WTUdFTklEX0ggKi8NCisNCi0t
IA0KMi43LjQNCg0KDQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIChSb21hbmlhKSBTLlIu
TC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3RyZWV0LCBVQkM1LCBmbG9vciAy
LCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBSZWdpc3RlcmVkIGluIFJvbWFu
aWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4K


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107A930ADB6
	for <lists+linux-doc@lfdr.de>; Mon,  1 Feb 2021 18:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhBAR0T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Feb 2021 12:26:19 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:44464 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhBAR0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 12:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1612200376; x=1643736376;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4oHGTJN/orKtC2bgJVlWjuCAjE01eDUVrhYY9F6POR0=;
  b=f5w8PYXEKyXBFQ/SU0IEYRLqu7B8Cz7Rtay2q58ct6EyAcCWIN/PPBG5
   yrqFk5zOWxl03SULyAoz1j1Xn7PSmxDhhJCygCFE3hKe4j7P8M4JvGgA+
   XF8ruoM/ngAVDIVGG35hA2ob/lQwmtwuXZLdG1wOHf8JpX+JajT0sfrmR
   w=;
X-IronPort-AV: E=Sophos;i="5.79,393,1602547200"; 
   d="scan'208";a="78853071"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 01 Feb 2021 17:25:27 +0000
Received: from EX13D08EUB004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS id 85CDDA24D8;
        Mon,  1 Feb 2021 17:25:23 +0000 (UTC)
Received: from uf6ed9c851f4556.ant.amazon.com (10.43.161.253) by
 EX13D08EUB004.ant.amazon.com (10.43.166.158) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 1 Feb 2021 17:25:08 +0000
From:   Adrian Catangiu <acatan@amazon.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <linux-s390@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <graf@amazon.com>,
        <rdunlap@infradead.org>, <arnd@arndb.de>, <ebiederm@xmission.com>,
        <rppt@kernel.org>, <0x7f454c46@gmail.com>,
        <borntraeger@de.ibm.com>, <Jason@zx2c4.com>, <jannh@google.com>,
        <w@1wt.eu>, <colmmacc@amazon.com>, <luto@kernel.org>,
        <tytso@mit.edu>, <ebiggers@kernel.org>, <dwmw@amazon.co.uk>,
        <bonzini@gnu.org>, <sblbir@amazon.com>, <raduweis@amazon.com>,
        <corbet@lwn.net>, <mst@redhat.com>, <mhocko@kernel.org>,
        <rafael@kernel.org>, <pavel@ucw.cz>, <mpe@ellerman.id.au>,
        <areber@redhat.com>, <ovzxemul@gmail.com>, <avagin@gmail.com>,
        <ptikhomirov@virtuozzo.com>, <gil@azul.com>, <asmehra@redhat.com>,
        <dgunigun@redhat.com>, <vijaysun@ca.ibm.com>, <oridgar@gmail.com>,
        <ghammer@redhat.com>, Adrian Catangiu <acatan@amazon.com>
Subject: [PATCH v5 0/2] System Generation ID driver and VMGENID backend
Date:   Mon, 1 Feb 2021 19:24:52 +0200
Message-ID: <1612200294-17561-1-git-send-email-acatan@amazon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D24UWB002.ant.amazon.com (10.43.161.159) To
 EX13D08EUB004.ant.amazon.com (10.43.166.158)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGhpcyBmZWF0dXJlIGlzIGFpbWVkIGF0IHZpcnR1YWxpemVkIG9yIGNvbnRhaW5lcml6ZWQgZW52
aXJvbm1lbnRzCndoZXJlIFZNIG9yIGNvbnRhaW5lciBzbmFwc2hvdHRpbmcgZHVwbGljYXRlcyBt
ZW1vcnkgc3RhdGUsIHdoaWNoIGlzIGEKY2hhbGxlbmdlIGZvciBhcHBsaWNhdGlvbnMgdGhhdCB3
YW50IHRvIGdlbmVyYXRlIHVuaXF1ZSBkYXRhIHN1Y2ggYXMKcmVxdWVzdCBJRHMsIFVVSURzLCBh
bmQgY3J5cHRvZ3JhcGhpYyBub25jZXMuCgpUaGUgcGF0Y2ggc2V0IGludHJvZHVjZXMgYSBtZWNo
YW5pc20gdGhhdCBwcm92aWRlcyBhIHVzZXJzcGFjZQppbnRlcmZhY2UgZm9yIGFwcGxpY2F0aW9u
cyBhbmQgbGlicmFyaWVzIHRvIGJlIG1hZGUgYXdhcmUgb2YgdW5pcXVlbmVzcwpicmVha2luZyBl
dmVudHMgc3VjaCBhcyBWTSBvciBjb250YWluZXIgc25hcHNob3R0aW5nLCBhbmQgYWxsb3cgdGhl
bSB0bwpyZWFjdCBhbmQgYWRhcHQgdG8gc3VjaCBldmVudHMuCgpTb2x2aW5nIHRoZSB1bmlxdWVu
ZXNzIHByb2JsZW0gc3Ryb25nbHkgZW5vdWdoIGZvciBjcnlwdG9ncmFwaGljCnB1cnBvc2VzIHJl
cXVpcmVzIGEgbWVjaGFuaXNtIHdoaWNoIGNhbiBkZXRlcm1pbmlzdGljYWxseSByZXNlZWQKdXNl
cnNwYWNlIFBSTkdzIHdpdGggbmV3IGVudHJvcHkgYXQgcmVzdG9yZSB0aW1lLiBUaGlzIG1lY2hh
bmlzbSBtdXN0CmFsc28gc3VwcG9ydCB0aGUgaGlnaC10aHJvdWdocHV0IGFuZCBsb3ctbGF0ZW5j
eSB1c2UtY2FzZXMgdGhhdCBsZWQKcHJvZ3JhbW1lcnMgdG8gcGljayBhIHVzZXJzcGFjZSBQUk5H
IGluIHRoZSBmaXJzdCBwbGFjZTsgYmUgdXNhYmxlIGJ5CmJvdGggYXBwbGljYXRpb24gY29kZSBh
bmQgbGlicmFyaWVzOyBhbGxvdyB0cmFuc3BhcmVudCByZXRyb2ZpdHRpbmcKYmVoaW5kIGV4aXN0
aW5nIHBvcHVsYXIgUFJORyBpbnRlcmZhY2VzIHdpdGhvdXQgY2hhbmdpbmcgYXBwbGljYXRpb24K
Y29kZTsgaXQgbXVzdCBiZSBlZmZpY2llbnQsIGVzcGVjaWFsbHkgb24gc25hcHNob3QgcmVzdG9y
ZTsgYW5kIGJlCnNpbXBsZSBlbm91Z2ggZm9yIHdpZGUgYWRvcHRpb24uCgpUaGUgZmlyc3QgcGF0
Y2ggaW4gdGhlIHNldCBpbXBsZW1lbnRzIGEgZGV2aWNlIGRyaXZlciB3aGljaCBleHBvc2VzIGEK
cmVhZC1vbmx5IGRldmljZSAvZGV2L3N5c2dlbmlkIHRvIHVzZXJzcGFjZSwgd2hpY2ggY29udGFp
bnMgYQptb25vdG9uaWNhbGx5IGluY3JlYXNpbmcgdTMyIGdlbmVyYXRpb24gY291bnRlci4gTGli
cmFyaWVzIGFuZAphcHBsaWNhdGlvbnMgYXJlIGV4cGVjdGVkIHRvIG9wZW4oKSB0aGUgZGV2aWNl
LCBhbmQgdGhlbiBjYWxsIHJlYWQoKQp3aGljaCBibG9ja3MgdW50aWwgdGhlIFN5c0dlbklkIGNo
YW5nZXMuIEZvbGxvd2luZyBhbiB1cGRhdGUsIHJlYWQoKQpjYWxscyBubyBsb25nZXIgYmxvY2sg
dW50aWwgdGhlIGFwcGxpY2F0aW9uIGFja25vd2xlZGdlcyB0aGUgbmV3ClN5c0dlbklkIGJ5IHdy
aXRlKClpbmcgaXQgYmFjayB0byB0aGUgZGV2aWNlLiBOb24tYmxvY2tpbmcgcmVhZCgpIGNhbGxz
CnJldHVybiBFQUdBSU4gd2hlbiB0aGVyZSBpcyBubyBuZXcgU3lzR2VuSWQgYXZhaWxhYmxlLiBB
bHRlcm5hdGl2ZWx5LApsaWJyYXJpZXMgY2FuIG1tYXAoKSB0aGUgZGV2aWNlIHRvIGdldCBhIHNp
bmdsZSBzaGFyZWQgcGFnZSB3aGljaApjb250YWlucyB0aGUgbGF0ZXN0IFN5c0dlbklkIGF0IG9m
ZnNldCAwLgoKU3lzR2VuSWQgYWxzbyBzdXBwb3J0cyBhIHdhaXRpbmcgbWVjaGFuaXNtIGV4cG9z
ZWQgdGhyb3VnaCBhIElPQ1RMIG9uCnRoZSBkZXZpY2UuIFRoZSBTWVNHRU5JRF9XQUlUX1dBVENI
RVJTIElPQ1RMIGJsb2NrcyB1bnRpbCB0aGVyZSBhcmUgbm8Kb3BlbiBmaWxlIGhhbmRsZXMgb24g
dGhlIGRldmljZSB3aGljaCBoYXZlbuKAmXQgYWNrbm93bGVkZ2VkIHRoZSBuZXcgaWQuClRoaXMg
d2FpdGluZyBtZWNoYW5pc20gaXMgaW50ZW5kZWQgZm9yIHNlcnZlcmxlc3MgYW5kIGNvbnRhaW5l
ciBjb250cm9sCnBsYW5lcywgd2hpY2ggd2FudCB0byBjb25maXJtIHRoYXQgYWxsIGFwcGxpY2F0
aW9uIGNvZGUgaGFzIGRldGVjdGVkCmFuZCByZWFjdGVkIHRvIHRoZSBuZXcgU3lzR2VuSWQgYmVm
b3JlIHNlbmRpbmcgYW4gaW52b2tlIHRvIHRoZQpuZXdseS1yZXN0b3JlZCBzYW5kYm94LgoKVGhl
IHNlY29uZCBwYXRjaCBpbiB0aGUgc2V0IGFkZHMgYSBWbUdlbklkIGRyaXZlciB3aGljaCBtYWtl
cyB1c2Ugb2YKdGhlIEFDUEkgdm1nZW5pZCBkZXZpY2UgdG8gZHJpdmUgU3lzR2VuSWQgYW5kIHRv
IHJlc2VlZCBrZXJuZWwgZW50cm9weQpvbiBWTSBzbmFwc2hvdHMuCgotLS0KCnY0IC0+IHY1OgoK
ICAtIHN5c2dlbmlkOiBnZW5lcmF0aW9uIGNoYW5nZXMgYXJlIGFsc28gZXhwb3J0ZWQgdGhyb3Vn
aCB1ZXZlbnRzCiAgLSByZW1vdmUgU1lTR0VOSURfR0VUX09VVERBVEVEX1dBVENIRVJTIGlvY3Rs
CiAgLSBkb2N1bWVudCBzeXNnZW5pZCBpb2N0bCBtYWpvci9taW5vciBudW1iZXJzCiAgLSByZWJh
c2Ugb24gbGludXMgbGF0ZXN0ICsgdmFyaW91cyBuaXRzCgp2MyAtPiB2NDoKCiAgLSBzcGxpdCBm
dW5jdGlvbmFsaXR5IGluIHR3byBzZXBhcmF0ZSBrZXJuZWwgbW9kdWxlczogCiAgICAxLiBkcml2
ZXJzL21pc2Mvc3lzZ2VuaWQuYyB3aGljaCBwcm92aWRlcyB0aGUgZ2VuZXJpYyB1c2Vyc3BhY2UK
ICAgICAgIGludGVyZmFjZSBhbmQgbWVjaGFuaXNtcwogICAgMi4gZHJpdmVycy92aXJ0L3ZtZ2Vu
aWQuYyBhcyBWTUdFTklEIGFjcGkgZGV2aWNlIGRyaXZlciB0aGF0IHNlZWRzCiAgICAgICBrZXJu
ZWwgZW50cm9weSBhbmQgYWN0cyBhcyBhIGRyaXZpbmcgYmFja2VuZCBmb3IgdGhlIGdlbmVyaWMK
ICAgICAgIHN5c2dlbmlkCiAgLSByZW5hbWVkIC9kZXYvdm1nZW5pZCAtPiAvZGV2L3N5c2dlbmlk
CiAgLSByZW5hbWVkIHVhcGkgaGVhZGVyIGZpbGUgdm1nZW5pZC5oIC0+IHN5c2dlbmlkLmgKICAt
IHJlbmFtZWQgaW9jdGxzIFZNR0VOSURfKiAtPiBTWVNHRU5JRF8qCiAgLSBhZGRlZCDigJhtaW5f
Z2Vu4oCZIHBhcmFtZXRlciB0byBTWVNHRU5JRF9GT1JDRV9HRU5fVVBEQVRFIGlvY3RsCiAgLSBm
aXhlZCByYWNlcyBpbiBkb2N1bWVudGF0aW9uIGV4YW1wbGVzCiAgLSB2YXJpb3VzIHN0eWxlIG5p
dHMKICAtIHJlYmFzZWQgb24gdG9wIG9mIGxpbnVzIGxhdGVzdAoKdjIgLT4gdjM6CgogIC0gc2Vw
YXJhdGUgdGhlIGNvcmUgZHJpdmVyIGxvZ2ljIGFuZCBpbnRlcmZhY2UsIGZyb20gdGhlIEFDUEkg
ZGV2aWNlLgogICAgVGhlIEFDUEkgdm1nZW5pZCBkZXZpY2UgaXMgbm93IG9uZSBwb3NzaWJsZSBi
YWNrZW5kLgogIC0gZml4IGlzc3VlIHdoZW4gdGltZW91dD0wIGluIFZNR0VOSURfV0FJVF9XQVRD
SEVSUwogIC0gYWRkIGxvY2tpbmcgdG8gYXZvaWQgcmFjZXMgYmV0d2VlbiBmcyBvcHMgaGFuZGxl
cnMgYW5kIGh3IGlycQogICAgZHJpdmVuIGdlbmVyYXRpb24gdXBkYXRlcwogIC0gY2hhbmdlIFZN
R0VOSURfV0FJVF9XQVRDSEVSUyBpb2N0bCBzbyBpZiB0aGUgY3VycmVudCBjYWxsZXIgaXMKICAg
IG91dGRhdGVkIG9yIGEgZ2VuZXJhdGlvbiBjaGFuZ2UgaGFwcGVucyB3aGlsZSB3YWl0aW5nICh0
aHVzIG1ha2luZwogICAgY3VycmVudCBjYWxsZXIgb3V0ZGF0ZWQpLCB0aGUgaW9jdGwgcmV0dXJu
cyAtRUlOVFIgdG8gc2lnbmFsIHRoZQogICAgdXNlciB0byBoYW5kbGUgZXZlbnQgYW5kIHJldHJ5
LiBGaXhlcyBibG9ja2luZyBvbiBvbmVzZWxmLgogIC0gYWRkIFZNR0VOSURfRk9SQ0VfR0VOX1VQ
REFURSBpb2N0bCBjb25kaXRpb25lZCBieQogICAgQ0FQX0NIRUNLUE9JTlRfUkVTVE9SRSBjYXBh
YmlsaXR5LCB0aHJvdWdoIHdoaWNoIHNvZnR3YXJlIGNhbiBmb3JjZQogICAgZ2VuZXJhdGlvbiBi
dW1wLgoKdjEgLT4gdjI6CgogIC0gZXhwb3NlIHRvIHVzZXJzcGFjZSBhIG1vbm90b25pY2FsbHkg
aW5jcmVhc2luZyB1MzIgVm0gR2VuIENvdW50ZXIKICAgIGluc3RlYWQgb2YgdGhlIGh3IFZtR2Vu
IFVVSUQKICAtIHNpbmNlIHRoZSBody9oeXBlcnZpc29yLXByb3ZpZGVkIDEyOC1iaXQgVVVJRCBp
cyBub3QgcHVibGljCiAgICBhbnltb3JlLCBhZGQgaXQgdG8gdGhlIGtlcm5lbCBSTkcgYXMgZGV2
aWNlIHJhbmRvbW5lc3MKICAtIGluc2VydCBkcml2ZXIgcGFnZSBjb250YWluaW5nIFZtIEdlbiBD
b3VudGVyIGluIHRoZSB1c2VyIHZtYSBpbgogICAgdGhlIGRyaXZlcidzIG1tYXAgaGFuZGxlciBp
bnN0ZWFkIG9mIHVzaW5nIGEgZmF1bHQgaGFuZGxlcgogIC0gdHVybiBkcml2ZXIgaW50byBhIG1p
c2MgZGV2aWNlIGRyaXZlciB0byBhdXRvLWNyZWF0ZSAvZGV2L3ZtZ2VuaWQKICAtIGNoYW5nZSBp
b2N0bCBhcmcgdG8gYXZvaWQgbGVha2luZyBrZXJuZWwgc3RydWN0cyB0byB1c2Vyc3BhY2UKICAt
IHVwZGF0ZSBkb2N1bWVudGF0aW9uCiAgLSB2YXJpb3VzIG5pdHMKICAtIHJlYmFzZSBvbiB0b3Ag
b2YgbGludXMgbGF0ZXN0CgpBZHJpYW4gQ2F0YW5naXUgKDIpOgogIGRyaXZlcnMvbWlzYzogc3lz
Z2VuaWQ6IGFkZCBzeXN0ZW0gZ2VuZXJhdGlvbiBpZCBkcml2ZXIKICBkcml2ZXJzL3ZpcnQ6IHZt
Z2VuaWQ6IGFkZCB2bSBnZW5lcmF0aW9uIGlkIGRyaXZlcgoKIERvY3VtZW50YXRpb24vbWlzYy1k
ZXZpY2VzL3N5c2dlbmlkLnJzdCAgICAgICAgICAgIHwgMjM2ICsrKysrKysrKysrKysrKysKIERv
Y3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0IHwgICAxICsK
IERvY3VtZW50YXRpb24vdmlydC92bWdlbmlkLnJzdCAgICAgICAgICAgICAgICAgICAgIHwgIDM0
ICsrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTUgKwogZHJpdmVycy9taXNjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTYgKysKIGRyaXZlcnMvbWlzYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvbWlzYy9zeXNnZW5pZC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMzA3ICsrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy92aXJ0L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKwogZHJpdmVycy92aXJ0L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy92aXJ0
L3ZtZ2VuaWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNTMgKysrKysrKysrKwog
aW5jbHVkZS91YXBpL2xpbnV4L3N5c2dlbmlkLmggICAgICAgICAgICAgICAgICAgICAgfCAgMTcg
KysKIDExIGZpbGVzIGNoYW5nZWQsIDc5NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9taXNjLWRldmljZXMvc3lzZ2VuaWQucnN0CiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi92aXJ0L3ZtZ2VuaWQucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9taXNjL3N5c2dlbmlkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQv
dm1nZW5pZC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L3N5c2dlbmlk
LmgKCi0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciAoUm9tYW5pYSkgUy5S
LkwuIHJlZ2lzdGVyZWQgb2ZmaWNlOiAyN0EgU2YuIExhemFyIFN0cmVldCwgVUJDNSwgZmxvb3Ig
MiwgSWFzaSwgSWFzaSBDb3VudHksIDcwMDA0NSwgUm9tYW5pYS4gUmVnaXN0ZXJlZCBpbiBSb21h
bmlhLiBSZWdpc3RyYXRpb24gbnVtYmVyIEoyMi8yNjIxLzIwMDUuCg==


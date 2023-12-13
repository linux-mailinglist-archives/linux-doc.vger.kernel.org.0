Return-Path: <linux-doc+bounces-4899-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82A81069F
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 01:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E7ADB20CE5
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 00:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1331119C;
	Wed, 13 Dec 2023 00:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="VSau86g+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE5292;
	Tue, 12 Dec 2023 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1702427732; x=1733963732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VBKvTcQi72PcvnK4SFQYGqORB7BIbXX6crvus+RXOaY=;
  b=VSau86g+hgAvpNEhvQq2TITJrNMB4SWMV+6VgA2VazzPBXqgrr6EU3Cm
   0aPvptWHP4IjfQRszkgutWdFF1WjSZWPx9kgpgjryfL165H7qR75+zeLt
   f4m1HmypvWZP6kkdRJA4A9BIxOK4xl8eqm3xBlx7cYlpYNTKAKH2rS5Mr
   k=;
X-IronPort-AV: E=Sophos;i="6.04,271,1695686400"; 
   d="scan'208";a="259294536"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 00:35:31 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
	by email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com (Postfix) with ESMTPS id 634AC80DCC;
	Wed, 13 Dec 2023 00:35:25 +0000 (UTC)
Received: from EX19MTAUWC002.ant.amazon.com [10.0.38.20:10819]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.95:2525] with esmtp (Farcaster)
 id 911b45ff-f732-45cd-b0a4-dcec0b0539c8; Wed, 13 Dec 2023 00:35:24 +0000 (UTC)
X-Farcaster-Flow-ID: 911b45ff-f732-45cd-b0a4-dcec0b0539c8
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 00:35:24 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 00:35:19 +0000
Message-ID: <eb567d99-e03b-4718-9cc9-e27c5e408ea2@amazon.com>
Date: Wed, 13 Dec 2023 01:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] tracing: Introduce names for ring buffers
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
CC: <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <x86@kernel.org>, Eric Biederman
	<ebiederm@xmission.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski
	<luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring
	<robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland
	<mark.rutland@arm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra
	<ashish.kalra@amd.com>, James Gowans <jgowans@amazon.com>, "Stanislav
 Kinsburskii" <skinsburskii@linux.microsoft.com>, <arnd@arndb.de>,
	<pbonzini@redhat.com>, <madvenka@linux.microsoft.com>, Anthony Yznaga
	<anthony.yznaga@oracle.com>, Usama Arif <usama.arif@bytedance.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>
References: <20231213000452.88295-1-graf@amazon.com>
 <20231213000452.88295-9-graf@amazon.com>
 <20231212191546.603c0703@gandalf.local.home>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20231212191546.603c0703@gandalf.local.home>
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGkgU3RldmUsCgpPbiAxMy4xMi4yMyAwMToxNSwgU3RldmVuIFJvc3RlZHQgd3JvdGU6Cj4KPiBP
biBXZWQsIDEzIERlYyAyMDIzIDAwOjA0OjQ1ICswMDAwCj4gQWxleGFuZGVyIEdyYWYgPGdyYWZA
YW1hem9uLmNvbT4gd3JvdGU6Cj4KPj4gV2l0aCBLSE8gKEtleGVjIEhhbmRPdmVyKSwgd2Ugd2Fu
dCB0byBwcmVzZXJ2ZSB0cmFjZSBidWZmZXJzIGFjcm9zcwo+PiBrZXhlYy4gVG8gY2Fycnkgb3Zl
ciB0aGVpciBzdGF0ZSBiZXR3ZWVuIGtlcm5lbHMsIHRoZSBrZXJuZWwgbmVlZHMgYQo+PiBjb21t
b24gaGFuZGxlIGZvciB0aGVtIHRoYXQgZXhpc3RzIG9uIGJvdGggc2lkZXMuIEFzIGhhbmRsZSB3
ZSBpbnRyb2R1Y2UKPj4gbmFtZXMgZm9yIHJpbmcgYnVmZmVycy4gSW4gYSBmb2xsb3ctdXAgcGF0
Y2gsIHRoZSBrZXJuZWwgY2FuIHRoZW4gdXNlCj4+IHRoZXNlIG5hbWVzIHRvIHJlY292ZXIgYnVm
ZmVyIGNvbnRlbnRzIGZvciBzcGVjaWZpYyByaW5nIGJ1ZmZlcnMuCj4+Cj4gSXMgdGhlcmUgYSB3
YXkgdG8gdXNlIHRoZSB0cmFjZV9hcnJheSBuYW1lIGluc3RlYWQ/Cj4KPiBUaGUgdHJhY2VfYXJy
YXkgaXMgdGhlIHN0cnVjdHVyZSB0aGF0IHJlcHJlc2VudHMgZWFjaCB0cmFjaW5nIGluc3RhbmNl
LiBBbmQKPiBpdCBhbHJlYWR5IGhhcyBhIG5hbWUgZmllbGQuIEFuZCBpZiB5b3UgY2FuIGdldCB0
aGUgYXNzb2NpYXRlZCByaW5nIGJ1ZmZlcgo+IGZyb20gdGhhdCB0b28uCj4KPiBzdHJ1Y3QgdHJh
Y2VfYXJyYXkgKnRyOwo+Cj4gICAgICAgICAgdHItPmFycmF5X2J1ZmZlci5idWZmZXIKPgo+ICAg
ICAgICAgIHRyLT5uYW1lCj4KPiBXaGVuIHlvdSBkbzogbWtkaXIgL3N5cy9rZXJuZWwvdHJhY2lu
Zy9pbnN0YW5jZS9mb28KPgo+IFlvdSBjcmVhdGUgYSBuZXcgdHJhY2VfYXJyYXkgaW5zdGFuY2Ug
d2hlcmUgdHItPm5hbWUgPSAiZm9vIiBhbmQgYWxsb2NhdGVzCj4gdGhlIGJ1ZmZlciBmb3IgaXQg
YXMgd2VsbC4KClRoZSBuYW1lIGluIHRoZSByaW5nIGJ1ZmZlciBpcyBwcmV0dHkgbXVjaCBqdXN0
IGEgY29weSBvZiB0aGUgdHJhY2UgCmFycmF5IG5hbWUuIEkgdXNlIGl0IHRvIHJlY29uc3RydWN0
IHdoaWNoIGJ1ZmZlciB3ZSdyZSBhY3R1YWxseSAKcmVmZXJyaW5nIHRvIGluc2lkZSBfX3Jpbmdf
YnVmZmVyX2FsbG9jKCkuCgpJJ20gYWxsIGVhcnMgZm9yIGFsdGVybmF0aXZlIHN1Z2dlc3Rpb25z
LiBJIHN1cHBvc2Ugd2UgY291bGQgcGFzcyB0ciBhcyAKYXJndW1lbnQgdG8gcmluZ19idWZmZXJf
YWxsb2MoKSBpbnN0ZWFkIG9mIHRoZSBuYW1lPwoKCkFsZXgKCgoKCkFtYXpvbiBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFl
ZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==



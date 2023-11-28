Return-Path: <linux-doc+bounces-3263-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 496EC7FB3ED
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 09:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3D46B20B35
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B245319463;
	Tue, 28 Nov 2023 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwTinZcu"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C1010FB
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 00:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701159604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+q+/G42gWXxCRJcPZ7edOpYkVzsF9dXtY3iis52aRw=;
	b=IwTinZcuoJJ79ppY7e1XgUTM2ASpGh3mJwJkZn97R0JuMXdL3PofZWG0ZJACSa+7+eQpsK
	JoNC2YfWZ6K9+SS7GiD2syiVm3Relt70YVn4HvTPEXC8FnRQagQ535dU6wJeNYCLHpmkCh
	UnPucrfvURqnsILIOZMiHbJyTE50XEc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-pB-GWKSxOLej-WzSQyZABw-1; Tue, 28 Nov 2023 03:20:03 -0500
X-MC-Unique: pB-GWKSxOLej-WzSQyZABw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-332f56ab391so2289237f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 00:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701159602; x=1701764402;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+q+/G42gWXxCRJcPZ7edOpYkVzsF9dXtY3iis52aRw=;
        b=nJTVPegr49HTd+lnui494rdV9tfvAASeus+FEqXVQyeI3iXcT36d/tv26J76P600j3
         IBvnpUk8QPHBeY6fBJO40B2O6iOWIHbPlhpMEq+s2S36yp8x72YA/cqYchgJxiNDci64
         uL7pkWWsDLm9yGQ0uwaq9rrN4Rp4N5mLOFfiS/q8sFY8qVh/GhMPgeRniuDGDBaqqDZ2
         5Br/9VQG+zbxQbi6oW32KgjnflGj3yCI4RNsOq88uk16gb+LeXZbQlJOs2zQsYhNA+Yc
         hqes1wrsnMchX7uoXBMqShoauvUBxTQm8ISeWJz6Ge4rOXvMsYeNe9h+uEl3hEstzQCe
         PITA==
X-Gm-Message-State: AOJu0YzGIJH29h2FPrOhrImCTutomIOp99VCmfI2IblBcQSV18fRD7EK
	IQHV2pF8clgecQ05dLf7DtAoR5nSWSHHvzKRPvbV49y/IbiXQVRsXyEMf20x6A+iaHBemNdRIQE
	9AwIbvP+7QJuY1zj6v6YZ
X-Received: by 2002:adf:fa85:0:b0:333:e8d:99d8 with SMTP id h5-20020adffa85000000b003330e8d99d8mr653391wrr.36.1701159601838;
        Tue, 28 Nov 2023 00:20:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO7Y64vaJq2bAayYJYrvnD3PqZi/gtV5lOyeDuGjtB9wZrHsm/mgPiHIV2N+3AZjGsZHWf1g==
X-Received: by 2002:adf:fa85:0:b0:333:e8d:99d8 with SMTP id h5-20020adffa85000000b003330e8d99d8mr653377wrr.36.1701159601454;
        Tue, 28 Nov 2023 00:20:01 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id f8-20020adff988000000b00332e75eae4asm12271223wrr.85.2023.11.28.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:20:01 -0800 (PST)
Message-ID: <b5dcd218828f056d68ac8510c768f7792467ef6f.camel@redhat.com>
Subject: Re: [RFC 33/33] Documentation: KVM: Introduce "Emulating Hyper-V
 VSM with KVM"
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 10:19:59 +0200
In-Reply-To: <20231108111806.92604-34-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-34-nsaenz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIzLTExLTA4IGF0IDExOjE4ICswMDAwLCBOaWNvbGFzIFNhZW56IEp1bGllbm5l
IHdyb3RlOgo+IEludHJvZHVjZSAiRW11bGF0aW5nIEh5cGVyLVYgVlNNIHdpdGggS1ZNIiwgd2hp
Y2ggZGVzY3JpYmVzIHRoZSBLVk0gQVBJcwo+IG1hZGUgYXZhaWxhYmxlIHRvIGEgVk1NIHRoYXQg
d2FudHMgdG8gZW11bGF0ZSBIeXBlci1WJ3MgVlNNLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pY29s
YXMgU2FlbnogSnVsaWVubmUgPG5zYWVuekBhbWF6b24uY29tPgo+IC0tLQo+ICAuLi4vdmlydC9r
dm0veDg2L2VtdWxhdGluZy1oeXBlcnYtdnNtLnJzdCAgICAgfCAxMzYgKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS94ODYvZW11bGF0aW5nLWh5cGVydi12c20ucnN0
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0veDg2L2VtdWxhdGluZy1o
eXBlcnYtdnNtLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0veDg2L2VtdWxhdGluZy1oeXBl
cnYtdnNtLnJzdAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44
Zjc2YmYwOWM1MzAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2
bS94ODYvZW11bGF0aW5nLWh5cGVydi12c20ucnN0Cj4gQEAgLTAsMCArMSwxMzYgQEAKPiArLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+ICtFbXVsYXRpbmcgSHlwZXItViBWU00gd2l0aCBLVk0KPiArPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtIeXBlci1WJ3MgVmlydHVhbCBTZWN1cmUg
TW9kZSAoVlNNKSBpcyBhIHZpcnR1YWxpc2F0aW9uIHNlY3VyaXR5IGZlYXR1cmUKPiArdGhhdCBs
ZXZlcmFnZXMgdGhlIGh5cGVydmlzb3IgdG8gY3JlYXRlIHNlY3VyZSBleGVjdXRpb24gZW52aXJv
bm1lbnRzCj4gK3dpdGhpbiBhIGd1ZXN0LiBWU00gaXMgZG9jdW1lbnRlZCBhcyBwYXJ0IG9mIE1p
Y3Jvc29mdCdzIEh5cGVydmlzb3IgVG9wCj4gK0xldmVsIEZ1bmN0aW9uYWwgU3BlY2lmaWNhdGlv
blsxXS4KPiArCj4gK0VtdWxhdGluZyBIeXBlci1WJ3MgVmlydHVhbCBTZWN1cmUgTW9kZSB3aXRo
IEtWTSByZXF1aXJlcyBjb29yZGluYXRpb24KPiArYmV0d2VlbiBLVk0gYW5kIHRoZSBWTU0uIE1v
c3Qgb2YgdGhlIFZTTSBzdGF0ZSBhbmQgY29uZmlndXJhdGlvbiBpcyBsZWZ0Cj4gK3RvIGJlIGhh
bmRsZWQgYnkgdXNlci1zcGFjZSwgYnV0IHNvbWUgaGFzIG1hZGUgaXRzIHdheSBpbnRvIEtWTS4g
VGhpcwo+ICtkb2N1bWVudCBkZXNjcmliZXMgdGhlIG1lY2hhbmlzbXMgdGhyb3VnaCB3aGljaCBh
IFZNTSBjYW4gaW1wbGVtZW50IFZTTQo+ICtzdXBwb3J0Lgo+ICsKPiArVmlydHVhbCBUcnVzdCBM
ZXZlbHMKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1RoZSBtYWluIGNvbmNlcHQgVlNN
IGludHJvZHVjZXMgYXJlIFZpcnR1YWwgVHJ1c3QgTGV2ZWxzIG9yIFZUTHMuIEVhY2gKPiArVlRM
IGlzIGEgQ1BVIG1vZGUsIHdpdGggaXRzIG93biBwcml2YXRlIENQVSBhcmNoaXRlY3R1cmFsIHN0
YXRlLAo+ICtpbnRlcnJ1cHQgc3Vic3lzdGVtIChsaW1pdGVkIHRvIGEgbG9jYWwgQVBJQyksIGFu
ZCBtZW1vcnkgYWNjZXNzCj4gK3Blcm1pc3Npb25zLiBWVExzIGFyZSBoaWVyYXJjaGljYWwsIHdo
ZXJlIFZUTDAgY29ycmVzcG9uZHMgdG8gbm9ybWFsCj4gK2d1ZXN0IGV4ZWN1dGlvbiBhbmQgVlRM
ID4gMCB0byBwcml2aWxlZ2VkIGV4ZWN1dGlvbiBjb250ZXh0cy4gSW4KPiArcHJhY3RpY2UsIHdo
ZW4gdmlydHVhbGlzaW5nIFdpbmRvd3Mgb24gdG9wIG9mIEtWTSwgd2Ugb25seSBzZWUgVlRMMCBh
bmQKPiArVlRMMS4gQWx0aG91Z2ggdGhlIHNwZWMgYWxsb3dzIGdvaW5nIGFsbCB0aGUgd2F5IHRv
IFZUTDE1LiBWVExzIGFyZQo+ICtvcnRob2dvbmFsIHRvIHJpbmcgbGV2ZWxzLCBzbyBlYWNoIFZU
TCBpcyBjYXBhYmxlIG9mIHJ1bm5pZyBpdHMgb3duCj4gK29wZXJhdGluZyBzeXN0ZW0gYW5kIHVz
ZXItc3BhY2VbMl0uCj4gKwo+ICsgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gO+/ve+/vT8g4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA77+977+9Pwo+ICsg
IOKUgiBOb3JtYWwgTW9kZSAoVlRMMCkgICAgICAgICAgIOKUgiDilIIgU2VjdXJlIE1vZGUgKFZU
TDEpICAgICAgICAgICDilIIKPiArICDilIIg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA77+977+9
PyDilIIg4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgO+/ve+/vT8g4pSCCj4gKyAg4pSCIOKU
giAgIFVzZXItbW9kZSBQcm9jZXNzZXMgICAg4pSCIOKUgiDilIIg4pSCU2VjdXJlIFVzZXItbW9k
ZSBQcm9jZXNzZXPilIIg4pSCCj4gKyAg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCDi
lIIg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCDilIIKPiArICDilIIg4pSM4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA77+977+9PyDilIIg4pSCIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgO+/
ve+/vT8g4pSCCj4gKyAg4pSCIOKUgiAgICAgICAgIEtlcm5lbCAgICAgICAgICAg4pSCIOKUgiDi
lIIg4pSCICAgICAgU2VjdXJlIEtlcm5lbCAgICAgICDilIIg4pSCCj4gKyAg4pSCIOKUlOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUmCDilIIg4pSCIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCDi
lIIKPiArICDilJTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgg4pSU4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCj4gKyAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
77+977+9Pwo+ICsgIOKUgiAgICAgICAgICAgICAgICAgICAgICAgICBIeXBlcnZpc29yL0tWTSAg
ICAgICAgICAgICAgICAgICAgICAgIOKUggo+ICsgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmAo+
ICsgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgO+/ve+/vT8KPiArICDilIIgICAgICAgICAgICAgICAg
ICAgICAgICAgICBIYXJkd2FyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICDilIIKPiArICDi
lJTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilJgKPiArCj4gK1ZUTHMgYnJlYWsgdGhlIGNvcmUgYXNzdW1w
dGlvbiB0aGF0IGEgdkNQVSBoYXMgYSBzaW5nbGUgYXJjaGl0ZWN0dXJhbAo+ICtzdGF0ZSwgbEFQ
SUMgc3RhdGUsIFN5bklDIHN0YXRlLCBldGMuIEFzIHN1Y2gsIGVhY2ggVlRMIGlzIG1vZGVsZWQg
YXMgYQo+ICtkaXN0aW5jdCBLVk0gdkNQVSwgd2l0aCB0aGUgcmVzdHJpY3Rpb24gdGhhdCBvbmx5
IG9uZSBpcyBhbGxvd2VkIHRvIHJ1bgo+ICthdCBhbnkgbW9tZW50IGluIHRpbWUuIEhhdmluZyBt
dWx0aXBsZSBLVk0gdkNQVXMgdHJhY2tpbmcgYSBzaW5nbGUgZ3Vlc3QKPiArQ1BVIGNvbXBsaWNh
dGVzIHZDUFUgbnVtYmVyaW5nLiBWTXMgdGhhdCBlbmFibGUgVlNNIGFyZSBleHBlY3RlZCB0byB1
c2UKPiArQ0FQX0FQSUNfSURfR1JPVVBTIHRvIHNlZ3JlZ2F0ZSB2Q1BVcyAoYW5kIHRoZWlyIGxB
UElDcykgaW50byBkaWZmZXJlbnQKPiArZ3JvdXBzLiBGb3IgZXhhbXBsZSwgYSA0IENQVSBWU00g
Vk0gd2lsbCBzZXR1cCB0aGUgQVBJQyBJRCBncm91cHMgZmVhdHVyZQo+ICtzbyBvbmx5IHRoZSBm
aXJzdCB0d28gYml0cyBvZiB0aGUgQVBJQyBJRCBhcmUgZXhwb3NlZCB0byB0aGUgZ3Vlc3QuIFRo
ZQo+ICtyZW1haW5pbmcgYml0cyByZXByZXNlbnQgdGhlIHZDUFUncyBWVEwuIFRoZSAnc2libGlu
ZycgdkNQVSB0byBWVEwwJ3MKPiArdkNQVTIgYXQgVlRMMyB3aWxsIGhhdmUgYW4gQVBJQyBJRCBv
ZiAweEUuIFVzaW5nIHRoaXMgYXBwcm9hY2ggYSBWTU0gYW5kCj4gK0tWTSBhcmUgY2FwYWJsZSBv
ZiBxdWVyeWluZyBhIHZDUFUncyBWVEwsIG9yIGZpbmRpbmcgdGhlIHZDUFUgYXNzb2NpYXRlZAo+
ICt0byBhIHNwZWNpZmljIFZUTC4KPiArCj4gK0tWTSdzIGxBUElDIGltcGxlbWVudGF0aW9uIGlz
IGF3YXJlIG9mIGdyb3VwcywgYW5kIHRha2VzIG5vdGUgb2YgdGhlCj4gK3NvdXJjZSB2Q1BVJ3Mg
Z3JvdXAgd2hlbiBkZWxpdmVyaW5nIElQSXMuIEFzIHN1Y2gsIGl0IHNob3VsZG4ndCBiZQo+ICtw
b3NzaWJsZSB0byB0YXJnZXQgYSBkaWZmZXJlbnQgVlRMIHRocm91Z2ggdGhlIEFQSUMuIEludGVy
cnVwdHMgYXJlCj4gK2RlbGl2ZXJlZCB0byB0aGUgdkNQVSdzIGxBUElDIHN1YnN5c3RlbSByZWdh
cmRsZXNzIG9mIHRoZSBWVEwncyBydW5zdGF0ZSwKPiArdGhpcyBhbHNvIGluY2x1ZGVzIHRpbWVy
cy4gVWx0aW1hdGVseSwgYW55IGludGVycnVwdCBpbmNvbWluZyBmcm9tIGFuCj4gK291dHNpZGUg
c291cmNlIChJT0FQSUMvTVNJcykgaXMgcm91dGVkIHRvIFZUTDAuCj4gKwo+ICtNb3ZpbmcgQmV0
d2VlbiBWVExzCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK0FsbCBWU00gY29uZmlndXJh
dGlvbiBhbmQgVlRMIGhhbmRsaW5nIGh5cGVyY2FsbHMgYXJlIHBhc3NlZCB0aHJvdWdoIHRvCj4g
K3VzZXItc3BhY2UuIE5vdGFibHkgdGhlIHR3byBwcmltaXRpdmVzIHRoYXQgYWxsb3cgc3dpdGNo
aW5nIGJldHdlZW4gVlRMcy4KPiArQWxsIHNoYXJlZCBzdGF0ZSBzeW5jaHJvbml6YXRpb24gYW5k
IEtWTSB2Q1BVIHNjaGVkdWxpbmcgaXMgbGVmdCB0byB0aGUKPiArVk1NIHRvIG1hbmFnZS4gRm9y
IGV4YW1wbGUsIHVwb24gcmVjZWl2aW5nIGEgVlRMIGNhbGwsIHRoZSBWTU0gc3RvcHMgdGhlCj4g
K3ZDUFUgdGhhdCBpc3N1ZWQgdGhlIGh5cGVyY2FsbCwgYW5kIHNjaGVkdWxlcyB0aGUgdkNQVSBj
b3JyZXNwb25kaW5nIHRvCj4gK3RoZSBuZXh0IHByaXZpbGVnZWQgVlRMLiBXaGVuIHRoYXQgcHJp
dmlsZWdlZCB2Q1BVIGlzIGRvbmUgZXhlY3V0aW5nLCBpdAo+ICtpc3N1ZXMgYSBWVEwgcmV0dXJu
IGh5cGVyY2FsbCwgc28gdGhlIG9wcG9zaXRlIG9wZXJhdGlvbiBoYXBwZW5zLiBBbGwKPiArdGhp
cyBpcyB0cmFuc3BhcmVudCB0byBLVk0sIHdoaWNoIGxpbWl0cyBpdHNlbGYgdG8gcnVubmluZyB2
Q1BVcy4KPiArCj4gK0FuIGludGVycnVwdCBkaXJlY3RlZCBhdCBhIHByaXZpbGVnZWQgVlRMIGFs
d2F5cyBoYXMgcHJlY2VkZW5jZSBvdmVyIHRoZQo+ICtleGVjdXRpb24gb2YgbG93ZXIgVlRMcy4g
VG8gaG9ub3IgdGhpcywgdGhlIFZNTSBjYW4gbW9uaXRvciBldmVudHMKPiArdGFyZ2V0ZWQgYXQg
cHJpdmlsZWdlZCB2Q1BVcyB3aXRoIHBvbGwoKSwgYW5kIHNob3VsZCB0cmlnZ2VyIGFuCj4gK2Fz
eW5jaHJvbm91cyBWVEwgc3dpdGNoIHdoZW5ldmVyIGV2ZW50cyBiZWNvbWUgYXZhaWxhYmxlLiBB
ZGRpdGlvbmFsbHksCj4gK3RoZSB0YXJnZXQgVlRMJ3MgdkNQVSBWUCBhc3Npc3Qgb3ZlcmxheSBw
YWdlIGlzIHVzZWQgdG8gbm90aWZ5IHRoZSB0YXJnZXQKPiArVlRMIHdpdGggdGhlIHJlYXNvbiBm
b3IgdGhlIHN3aXRjaC4gVGhlIFZNTSBjYW4ga2VlcCB0cmFjayBvZiB0aGUgVlAKPiArYXNzaXN0
IHBhZ2UgYnkgaW5zdGFsbGluZyBhbiBNU1IgZmlsdGVyIGZvciBIVl9YNjRfTVNSX1ZQX0FTU0lT
VF9QQUdFLgo+ICsKPiArSHlwZXItViBWUCByZWdpc3RlcnMKPiArLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiArCj4gK1ZQIHJlZ2lzdGVyIGh5cGVyY2FsbHMgYXJlIHBhc3NlZCB0aHJvdWdoIHRvIHVz
ZXItc3BhY2UuIEFsbCByZXF1ZXN0cyBjYW4KPiArYmUgZnVsZmlsbGVkIGVpdGhlciBieSB1c2lu
ZyBhbHJlYWR5IGV4aXN0aW5nIEtWTSBzdGF0ZSBpb2N0bHMsIG9yIGFyZQo+ICtyZWxhdGVkIHRv
IFZTTSdzIGNvbmZpZ3VyYXRpb24sIHdoaWNoIGlzIGFscmVhZHkgaGFuZGxlZCBieSB0aGUgVk1N
LiBOb3RlCj4gK3RoYXQgSFZfUkVHSVNURVJfVlNNX0NPREVfUEFHRV9PRkZTRVRTIGlzIHRoZSBv
bmx5IFZTTSBzcGVjaWZpYyBWUAo+ICtyZWdpc3RlciB0aGUga2VybmVsIGNvbnRyb2xzLCBhcyBz
dWNoIGl0IGlzIG1hZGUgYXZhaWxhYmxlIHRocm91Z2ggdGhlCj4gK0tWTV9IVl9HRVRfVlNNX1NU
QVRFIGlvY3RsLgo+ICsKPiArUGVyLVZUTCBNZW1vcnkgUHJvdGVjdGlvbnMKPiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK0EgcHJpdmlsZWdlZCBWVEwgY2FuIGNoYW5nZSB0aGUg
bWVtb3J5IGFjY2VzcyByZXN0cmljdGlvbnMgb2YgbG93ZXIgVlRMcy4KPiArSXQgZG9lcyBzbyB0
byBoaWRlIHNlY3JldHMgZnJvbSB0aGVtLCBvciB0byBjb250cm9sIHdoYXQgdGhleSBhcmUgYWxs
b3dlZAo+ICt0byBleGVjdXRlLiBUaGUgbGlzdCBvZiBtZW1vcnkgcHJvdGVjdGlvbnMgYWxsb3dl
ZCBpc1szXToKPiArIC0gTm8gYWNjZXNzCj4gKyAtIFJlYWQtb25seSwgbm8gZXhlY3V0ZQo+ICsg
LSBSZWFkLW9ubHksIGV4ZWN1dGUKPiArIC0gUmVhZC93cml0ZSwgbm8gZXhlY3V0ZQo+ICsgLSBS
ZWFkL3dyaXRlLCBleGVjdXRlCj4gKwo+ICtWVEwgbWVtb3J5IHByb3RlY3Rpb24gaHlwZXJjYWxs
cyBhcmUgcGFzc2VkIHRocm91Z2ggdG8gdXNlci1zcGFjZSwgYnV0Cj4gK0tWTSBwcm92aWRlcyBh
biBpbnRlcmZhY2UgdGhhdCBhbGxvd3MgY2hhbmdpbmcgbWVtb3J5IHByb3RlY3Rpb25zIG9uIGEK
PiArcGVyLVZUTCBiYXNpcy4gVGhpcyBpcyBtYWRlIHBvc3NpYmxlIGJ5IHRoZSBLVk0gVlRMIGRl
dmljZS4gVk1NcyBjYW4KPiArY3JlYXRlIG9uZSBwZXIgVlRMIGFuZCBpdCBleHBvc2VzIGEgaW9j
dGwsIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMsCj4gK3RoYXQgY29udHJvbHMgdGhlIG1lbW9y
eSBwcm90ZWN0aW9ucyBhcHBsaWVkIHRvIHRoYXQgVlRMLiBUaGUgS1ZNIFREUCBNTVUKPiAraXMg
VlRMIGF3YXJlIGFuZCBwYWdlIGZhdWx0cyBhcmUgcmVzb2x2ZWQgdGFraW5nIGludG8gYWNjb3Vu
dCB0aGUKPiArY29ycmVzcG9uZGluZyBWVEwgZGV2aWNlJ3MgbWVtb3J5IGF0dHJpYnV0ZXMuCj4g
Kwo+ICtXaGVuIGEgbWVtb3J5IGFjY2VzcyB2aW9sYXRlcyBWVEwgbWVtb3J5IHByb3RlY3Rpb25z
LCBLVk0gaXNzdWVzIGEgc2VjdXJlCj4gK21lbW9yeSBpbnRlcmNlcHQsIHdoaWNoIGlzIHBhc3Nl
ZCBhcyBhIFN5bklDIG1lc3NhZ2UgaW50byB0aGUgbmV4dAo+ICtwcml2aWxlZ2VkIFZUTC4gVGhp
cyBoYXBwZW5zIHRyYW5zcGFyZW50bHkgZm9yIHRoZSBWTU0uIEFkZGl0aW9uYWxseSwgS1ZNCj4g
K2V4aXRzIHdpdGggYSB1c2VyLXNwYWNlIG1lbW9yeSBmYXVsdC4gVGhpcyBhbGxvd3MgdGhlIFZN
TSB0byBzdG9wIHRoZQo+ICt2Q1BVIHdoaWxlIHRoZSBzZWN1cmUgaW50ZXJjZXB0IGlzIGhhbmRs
ZWQgYnkgdGhlIHByaXZpbGVnZWQgVlRMLiBJbiB0aGUKPiArZ29vZCBjYXNlLCB0aGUgaW5zdHJ1
Y3Rpb24gdGhhdCB0cmlnZ2VyZWQgdGhlIGZhdWx0IGlzIGVtdWxhdGVkIGFuZAo+ICtjb250cm9s
IGlzIHJldHVybmVkIHRvIHRoZSBsb3dlciBWVEwsIGluIHRoZSBiYWQgY2FzZSwgV2luZG93cyBj
cmFzaGVzCj4gK2dyYWNlZnVsbHkuCj4gKwo+ICtIeXBlci1WJ3MgVExGUyBhbHNvIHN0YXRlcyB0
aGF0IERNQSBzaG91bGQgZm9sbG93IFZUTDAncyBtZW1vcnkgYWNjZXNzCj4gK3Jlc3RyaWN0aW9u
cy4gVGhpcyBpcyBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMgZG9jdW1lbnQsIGFzIElPTU1VIG1hcHBp
bmdzCj4gK2FyZSBub3QgaGFuZGxlZCBieSBLVk0uCj4gKwo+ICtbMV0gaHR0cHM6Ly9yYXcuZ2l0
aHVidXNlcmNvbnRlbnQuY29tL01pY3Jvc29mdC9WaXJ0dWFsaXphdGlvbi1Eb2N1bWVudGF0aW9u
L21hc3Rlci90bGZzL0h5cGVydmlzb3IlMjBUb3AlMjBMZXZlbCUyMEZ1bmN0aW9uYWwlMjBTcGVj
aWZpY2F0aW9uJTIwdjYuMGIucGRmCj4gKwo+ICtbMl0gQ29uY2VwdHVhbGx5IHRoaXMgZGVzaWdu
IGlzIHNpbWlsYXIgdG8gYXJtJ3MgVHJ1c3Rab25lOiBUaGUKPiAraHlwZXJ2aXNvciBwbGF5cyB0
aGUgcm9sZSBvZiBFTDMuIFdpbmRvd3MgKFZUTDApIHJ1bnMgaW4gTm9uLVNlY3VyZQo+ICsoRUww
L0VMMSkgYW5kIHRoZSBzZWN1cmUga2VybmVsIChWVEwxKSBpbiBTZWN1cmUgV29ybGQgKEVMMXMv
RUwwcykuCj4gKwo+ICtbM10gVExGUyAxNS45LjMKCkFzIFNlYW4gc2FpZCwgd2Ugc2hvdWxkIGFs
c28gZG9jdW1lbnQgb24gaG93IFZUTCBzdXBwb3J0IGlzIGltcGxlbWVudGVkIGluIHRoZSBLVk0g
KGUuZyB0aGluZ3MgdGhhdCBtYXR0ZXIgdG8gS1ZNIGRldmVsb3BlcnMpLApidXQgdGhlIGFib3Zl
IGluZm9ybWF0aW9uIGlzIGFsc28gdmVyeSB1c2VmdWwgYW5kIHNob3VsZCBiZSBrZXB0LgoKCkJl
c3QgcmVnYXJkcywKCU1heGltIExldml0c2t5CgoNCg==




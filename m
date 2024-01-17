Return-Path: <linux-doc+bounces-6946-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B782B830225
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 10:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7ADC1C20D4C
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 09:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C29134BD;
	Wed, 17 Jan 2024 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IV2F9qqV"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201B12B87
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705483277; cv=none; b=q4Js95geZn0p5ZNT9d+wExtYfZrLzemmTs0HLd5p0RJD+24NqGmx1Mb1SDo7BNvqjM8CDKJOYgy3ZMPed6zUpFhtIqyu86OIeKfFy7933E9PC6FRwb91D8NT9KM2Xs4H+OzbXTPXoWQ8eLB9LBT46avkg6pjTyIXiTCtTY1R1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705483277; c=relaxed/simple;
	bh=9FwsAOigXQKkO0on4m0hnoijvRaFGHxPBHev5+c2dIE=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version; b=IYi9iXVJlJzrS1kjIws2TcE5j+m8bcdmaUXENLCNhpGMDgoL8lDL7OlnAcxkhy0Vs/IAU8oWYhfNNqPmNO7JtRO2nCORCWyht0opnfCEc/+MTECZF8U9aZq0J7yDD8b5Nc3bPlYXrjnhsMrkX8M6zNb377SdcG/DC8p0z+nPKoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IV2F9qqV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705483274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9FwsAOigXQKkO0on4m0hnoijvRaFGHxPBHev5+c2dIE=;
	b=IV2F9qqVNcQiKqoi36OIEfFBNbgxzo7acb/wQ56HAfD8goZc3uVHs6i8yXg2WFqjNgf1sE
	UfGFYgL4R2oLReJUtB4qFP6owZA0WTAHJ2AoRqTZTgEZhpcDX5e6Q/g1x+GTJMX/U4pG6z
	VDapSYCQXSfR2HEMlk+MaErbfcRBaB8=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-y-74s2frO-mdqSyu3Kcmtg-1; Wed, 17 Jan 2024 04:21:13 -0500
X-MC-Unique: y-74s2frO-mdqSyu3Kcmtg-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-467bde7e850so993867137.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 01:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483273; x=1706088073;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FwsAOigXQKkO0on4m0hnoijvRaFGHxPBHev5+c2dIE=;
        b=FFSkUSwOAv7W+shnIuOxmvtZyX0S5UQJcWsQnaDFKFKIRdx48S/FhJjfqGzUnXmbd3
         QfvO11ZwgK0K3OQW+3aAqW2DhuMecjajx6xUcOWGoShIOarNEUgui1Y7mxXfm+8uXOt6
         0BRhov0H3rqxIOVv9i6z6Ms1LDLFAcUI2jILcMlQteRNFB8pdgSxA6NyWe+tx0/1uXLL
         4qb5GwRATTEDwIKjmu0ctEnsUjV9WHwRTdkwrdhlIJ94+M4H7JdVKSKGY8RCWcBkq6yC
         IPreEexvxLItW7uMKlNny4maBIMPhE66wXlDdz6kkaIvGp5bEJUrUFrugDFU2PuTE0C3
         2Z3A==
X-Gm-Message-State: AOJu0YxwksGNEtMZx1/I4BL9cDvIPBiIbcRKkP70SZ20DFkuwbHhkrT9
	jvNFUwvxkUWgiZsxME85k4kXXTtkvxGKWRJ+d1FXxO4OC2fmZhUCL9RaL1VrM2VAWWAo8SG9jQ0
	8csdl0MQmy1Q1gqpoAnaW2FH2CF9F
X-Received: by 2002:a05:6102:f8f:b0:469:5ae1:6e4f with SMTP id e15-20020a0561020f8f00b004695ae16e4fmr6470698vsv.2.1705483272686;
        Wed, 17 Jan 2024 01:21:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIP0JwmdFSuaEzMYuP3FArRoBHfERAP9vdcxCLtx43pNhboWFkD00nPKmEBkHnM12QFMg3FA==
X-Received: by 2002:a05:6102:f8f:b0:469:5ae1:6e4f with SMTP id e15-20020a0561020f8f00b004695ae16e4fmr6470676vsv.2.1705483272359;
        Wed, 17 Jan 2024 01:21:12 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id cp8-20020a05622a420800b00429aba4a360sm5605725qtb.81.2024.01.17.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 01:21:12 -0800 (PST)
Message-ID: <3b430d0fd8a9c8bb3cc60a15a2bf40b3abbebe1b.camel@redhat.com>
Subject: Re: [PATCH 01/10] pci: add new set of devres functions
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-pci@vger.kernel.org
Date: Wed, 17 Jan 2024 10:21:08 +0100
In-Reply-To: <Zabx-u-R-VsYIeIz@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
	 <20240115144655.32046-3-pstanner@redhat.com>
	 <Zabx-u-R-VsYIeIz@surfacebook.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTAxLTE2IGF0IDIzOjE1ICswMjAwLCBhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tIHdyb3RlOgo+IE1vbiwgSmFuIDE1LCAyMDI0IGF0IDAzOjQ2OjEyUE0gKzAxMDAsIFBoaWxp
cHAgU3Rhbm5lciBraXJqb2l0dGk6Cj4gPiBQQ0kncyBkZXZyZXMgQVBJIGlzIG5vdCBleHRlbnNp
YmxlIHRvIHJhbmdlZCBtYXBwaW5ncyBhbmQgaGFzCj4gPiBidWctcHJvdm9raW5nIGZlYXR1cmVz
LiBJbXByb3ZlIHRoYXQgYnkgcHJvdmlkaW5nIGJldHRlcgo+ID4gYWx0ZXJuYXRpdmVzLgo+ID4g
Cj4gPiBXaGVuIHRoZSBvcmlnaW5hbCBkZXZyZXMgQVBJIGZvciBQQ0kgd2FzIGltcGxlbWVudGVk
LCBwcmlvcml0eSB3YXMKPiA+IGdpdmVuCj4gPiB0byB0aGUgY3JlYXRpb24gb2YgYSBzZXQgb2Yg
InB1cmFsIGZ1bmN0aW9ucyIgc3VjaCBhcwo+ID4gcGNpbV9yZXF1ZXN0X3JlZ2lvbnMoKS4gVGhl
c2UgZnVuY3Rpb25zIGhhdmUgYml0IG1hc2tzIGFzCj4gPiBwYXJhbWV0ZXJzIHRvCj4gPiBzcGVj
aWZ5IHdoaWNoIEJBUnMgc2hhbGwgZ2V0IG1hcHBlZC4gTW9zdCB1c2VycywgaG93ZXZlciwgb25s
eSB1c2UKPiA+IHRob3NlCj4gPiB0byBtYXBwIDEtMyBCQVJzLgo+ID4gQSBjb21wbGV0ZSBzZXQg
b2YgInNpbmd1bGFyIGZ1bmN0aW9ucyIgZG9lcyBub3QgZXhpc3QuCj4gPiAKPiA+IEFzIGZ1bmN0
aW9ucyBtYXBwaW5nIC8gcmVxdWVzdGluZyBtdWx0aXBsZSBCQVJzIGF0IG9uY2UgaGF2ZQo+ID4g
KGFsbW9zdCkgbm8KPiA+IG1lY2hhbmlzbSBpbiBDIHRvIHJldHVybiB0aGUgcmVzb3VyY2VzIHRv
IHRoZSBjYWxsZXIgb2YgdGhlIHBsdXJhbAo+ID4gZnVuY3Rpb24sIHRoZSBkZXZyZXMgQVBJIHV0
aWxpemVzIHRoZSBpb21hcC10YWJsZSBhZG1pbmlzdHJhdGVkIGJ5Cj4gPiB0aGUKPiA+IGZ1bmN0
aW9uIHBjaW1faW9tYXBfdGFibGUoKS4KPiA+IAo+ID4gVGhlIGVudGlyZSBQQ0kgZGV2cmVzIGlt
cGxlbWVudGF0aW9uIHdhcyBzdHJvbmdseSB0aWVkIHRvIHRoYXQKPiA+IHRhYmxlCj4gPiB3aGlj
aCBvbmx5IGFsbG93cyBmb3IgbWFwcGluZyB3aG9sZSwgY29tcGxldGUgQkFScywgYXMgdGhlIEJB
UidzCj4gPiBpbmRleAo+ID4gaXMgdXNlZCBhcyB0YWJsZSBpbmRleC4gQ29uc2VxdWVudGx5LCBp
dCdzIG5vdCBwb3NzaWJsZSB0bywgZS5nLiwKPiA+IGhhdmUgYQo+ID4gcGNpbV9pb21hcF9yYW5n
ZSgpIGZ1bmN0aW9uIHdpdGggdGhhdCBtZWNoYW5pc20uCj4gPiAKPiA+IEFuIGFkZGl0aW9uYWwg
cHJvYmxlbSBpcyB0aGF0IHBjaS1kZXZyZXMgaGFzIGJlZW4gaXBtbGVtZW50ZWQgaW4gYQo+ID4g
c29ydAo+ID4gb2YgImh5YnJpZC1tb2RlIjogU29tZSB1bm1hbmFnZWQgZnVuY3Rpb25zIGhhdmUg
bWFuYWdlZAo+ID4gY291bnRlcnBhcnRzCj4gPiAoZS5nLjogcGNpX2lvbWFwKCkgPC0+IHBjaW1f
aW9tYXAoKSksIG1ha2luZyB0aGVpciBtYW5hZ2VkIG5hdHVyZQo+ID4gb2J2aW91cyB0byB0aGUg
cHJvZ3JhbW1lci4gSG93ZXZlciwgdGhlIHJlZ2lvbi1yZXF1ZXN0IGZ1bmN0aW9ucyBpbgo+ID4g
cGNpLmMsIHByZWZpeGVkIHdpdGggcGNpXywgYmVoYXZlIGVpdGhlciBtYW5hZ2VkIG9yIHVubWFu
YWdlZCwKPiA+IGRlcGVuZGluZwo+ID4gb24gd2hldGhlciBwY2lfZW5hYmxlX2RldmljZSgpIG9y
IHBjaW1fZW5hYmxlX2RldmljZSgpIGhhcyBiZWVuCj4gPiBjYWxsZWQKPiA+IGluIGFkdmFuY2Uu
Cj4gPiAKPiA+IFRoaXMgaHlicmlkIEFQSSBpcyBjb25mdXNpbmcgYW5kIHNob3VsZCBiZSBtb3Jl
IGNsZWFubHkgc2VwYXJhdGVkCj4gPiBieQo+ID4gcHJvdmlkaW5nIGFsd2F5cy1tYW5hZ2VkIGZ1
bmN0aW9ucyBwcmVmaXhlZCB3aXRoIHBjaW1fLgo+ID4gCj4gPiBUaHVzLCB0aGUgZXhpc3Rpbmcg
ZGV2cmVzIEFQSSBpcyBub3QgZGVzaXJhYmxlIGJlY2F1c2U6Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
YSkgVGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhlIHVzZXJzIG9mIHRoZSBwbHVyYWwgZnVuY3Rpb25z
Cj4gPiBvbmx5Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBldmVyIHNldHMgYSBzaW5nbGUgYml0
IGluIHRoZSBiaXQgbWFzaywgY29uc2VxdWVudGx5Cj4gPiBtYWtpbmcKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRoZW0gc2luZ3VsYXIgZnVuY3Rpb25zIGFueXdheXMuCj4gPiDCoMKgwqDCoMKg
wqDCoMKgYikgVGhlcmUgaXMgbm8gbWVjaGFuaXNtIHRvIHJlcXVlc3QgLyBpb21hcCBvbmx5IHBh
cnQgb2YgYQo+ID4gQkFSLgo+ID4gwqDCoMKgwqDCoMKgwqDCoGMpIFRoZSBpb21hcC10YWJsZSBt
ZWNoYW5pc20gaXMgb3Zlci1lbmdpbmVlcmVkLAo+ID4gY29tcGxpY2F0ZWQgYW5kCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYW4gYnkgZGVmaW5pdGlvbiBub3QgcGVyZm9ybSBib3VuZHMgY2hl
Y2tzLCB0aHVzLAo+ID4gcHJvdm9raW5nCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1vcnkg
ZmF1bHRzOiBwY2ltX2lvbWFwX3RhYmxlKHBkZXYpWzQyXQo+ID4gwqDCoMKgwqDCoMKgwqDCoGQp
IHJlZ2lvbi1yZXF1ZXN0IGZ1bmN0aW9ucyBiZWluZyBzb21ldGltZXMgbWFuYWdlZCBhbmQKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNvbWV0aW1lcyBub3QgaXMgYnVnLXByb3Zva2luZy4KPiA+
IAo+ID4gSW1wbGVtZW50IGEgc2V0IG9mIHNpbmd1bGFyIHBjaW1fIGZ1bmN0aW9ucyB0aGF0IHVz
ZSBkZXZyZXMKPiA+IGRpcmVjdGx5Cj4gPiBhbmQgYnlwYXNzIHRoZSBsZWdhY3kgaW9tYXAgdGFi
bGUgbWVjaGFuaXNtLgo+ID4gQWRkIGRldnJlcy5jIHRvIGRyaXZlci1hcGkgZG9jdW1lbnRhdGlv
bi4KPiAKPiAuLi4KPiAKPiA+ICtzdHJ1Y3QgcGNpbV9hZGRyX2RldnJlcyB7Cj4gPiArwqDCoMKg
wqDCoMKgwqBlbnVtIHBjaW1fYWRkcl9kZXZyZXNfdHlwZSB0eXBlOwo+ID4gK8KgwqDCoMKgwqDC
oMKgdm9pZCBfX2lvbWVtICpiYXNlYWRkcjsKPiA+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxv
bmcgb2Zmc2V0Owo+ID4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBsZW47Cj4gPiArwqDC
oMKgwqDCoMKgwqBzaG9ydCBiYXI7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZv
aWQgcGNpbV9hZGRyX2RldnJlc19jbGVhcihzdHJ1Y3QgcGNpbV9hZGRyX2RldnJlcwo+ID4gKnJl
cykKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXMtPnR5cGUgPSBQQ0lNX0FERFJfREVWUkVT
X1RZUEVfSU5WQUxJRDsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlcy0+YmFyID0gLTE7Cj4gPiArwqDC
oMKgwqDCoMKgwqByZXMtPmJhc2VhZGRyID0gTlVMTDsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlcy0+
b2Zmc2V0ID0gMDsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlcy0+bGVuID0gMDsKPiAKPiBNb3JlIHJv
YnVzdCAoaW4gY2FzZSB0aGUgZGF0YSB0eXBlIGdldHMgZXh0ZW5kZWQpIGlzIG1lbXNldCgpICsK
PiBpbmRpdmlkdWFsCj4gKG5vbi0wKSBzZXRzLgoKQUNLCgo+IAo+ID4gK30KPiAKPiAuLi4KPiAK
PiA+ICtzdGF0aWMgaW50IF9fcGNpbV9yZXF1ZXN0X3JlZ2lvbl9yYW5nZShzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgaW50Cj4gPiBiYXIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgbWF4bGVuLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IGNoYXIgKm5hbWUsIGludCBleGNsdXNpdmUpCj4g
PiArewo+ID4gK8KgwqDCoMKgwqDCoMKgcmVzb3VyY2Vfc2l6ZV90IHN0YXJ0ID0gcGNpX3Jlc291
cmNlX3N0YXJ0KHBkZXYsIGJhcik7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXNvdXJjZV9zaXplX3Qg
bGVuID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCBiYXIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgdW5z
aWduZWQgbG9uZyBmbGFncyA9IHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCBiYXIpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHN0YXJ0ID09IDAgfHwgbGVuID09IDApIC8qIHRoYXQncyBh
biB1bnVzZWQgQkFSLiAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAwOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGxlbiA8PSBvZmZzZXQpCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuwqAgLUVJTlZBTDsKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoHN0YXJ0ICs9IG9mZnNldDsKPiA+ICvCoMKgwqDCoMKgwqDCoGxlbiAtPSBvZmZzZXQ7
Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAobGVuID4gbWF4bGVuICYmIG1heGxlbiAhPSAwKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbiA9IG1heGxlbjsKPiAKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKG1heGxlbiAmJiAuLi4pCj4gCj4gPwoKSSB2ZXJ5IG11Y2ggZGlzbGlr
ZSB0aGlzIHN0eWxlLCBhbHRob3VnaCBJJ20gYXdhcmUgaXQncyB1c2VkIGluIG1hbnkKKGJ1dCBu
b3QgYWxsKSByZWdpb25zIG9mIHRoZSBrZXJuZWwuCgpJdCBtYWtlcyB5b3VyIHN0eWxlIGluY29u
c2lzdGVudCwgYmVjYXVzZSBzb21ldGltZXMgeW91IGRvIGluZGVlZCBjaGVjawpmb3Igc29tZXRo
aW5nIGxhcmdlciBvciBzbWFsbGVyIHRoYW4gMC4KClBsdXMsIGJ5IGNoZWNraW5nIGZvciBhIG51
bWJlciwgZXZlcnlvbmUgaW1tZWRpYXRlbHkgc2VlcyB0aGF0IHRoaXMgaXMKYW4gaW50ZWdlciwg
bm90IGEgcG9pbnRlciwgd2hpY2ggaW1wcm92ZXMgcmVhZGFiaWxpdHkgYXQgMCBjb3N0LgoKPiAK
PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIElPUkVTT1VSQ0VfSU8pIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJlcXVlc3RfcmVnaW9uKHN0YXJ0LCBsZW4s
IG5hbWUpKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gLUVCVVNZOwo+ID4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmIChmbGFncyAmIElP
UkVTT1VSQ0VfTUVNKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFf
X3JlcXVlc3RfbWVtX3JlZ2lvbihzdGFydCwgbGVuLCBuYW1lLAo+ID4gZXhjbHVzaXZlKSkKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1F
QlVTWTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyogVGhhdCdzIG5vdCBhIGRldmljZSB3ZSBjYW4gcmVxdWVzdCBhbnl0aGlu
ZyBvbi4KPiA+ICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1F
Tk9ERVY7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gCj4gSG1tLi4uIE5vdCBzdXJlLCBidXQgdGhl
IHN3aXRjaC1jYXNlIGFnYWluc3QgdHlwZSBtaWdodCBiZQo+IGNvbnNpZGVyZWQ6Cj4gCj4gwqDC
oMKgwqDCoMKgwqDCoHN3aXRjaCAocmVzb3VyY2VfdHlwZSguLi4pKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAuLi4KPiDCoMKgwqDCoMKgwqDCoMKgfQoKWW91IG1lYW4gcmVz
b3VyY2VfdHlwZSgpIGZyb20gaW9wb3J0Lmg/IEhvdyB3b3VsZCB0aGF0IGJlIHVzZWZ1bCBoZXJl
PwpXb3VsZCB5b3Ugd2FudCB0byB3cml0ZSBhIHNpbWlsYXIgZnVuY3Rpb24/CkknZCBzYXkgdGhh
dCAgc3dpdGNoIChyZXMtPnR5cGUpICAncyBtZWFuaW5nIGlzIHZlcnkgb2J2aW91cwoKPiAKPiA+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gK30KPiAKPiA+ICtzdGF0aWMgdm9pZCBfX3Bj
aW1fcmVsZWFzZV9yZWdpb25fcmFuZ2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludAo+ID4gYmFy
LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgb2Zmc2V0
LCB1bnNpZ25lZCBsb25nIG1heGxlbikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXNvdXJj
ZV9zaXplX3Qgc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgYmFyKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoHJlc291cmNlX3NpemVfdCBsZW4gPSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGJh
cik7Cj4gPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGZsYWdzID0gcGNpX3Jlc291cmNl
X2ZsYWdzKHBkZXYsIGJhcik7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAobGVuIDw9IG9m
ZnNldCB8fCBzdGFydCA9PSAwKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChsZW4gPT0gMCB8fCBtYXhsZW4gPT0g
MCkgLyogVGhpcyBhbiB1bnVzZWQgQkFSLiBEbwo+ID4gbm90aGluZy4gKi8KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBz
dGFydCArPSBvZmZzZXQ7Cj4gPiArwqDCoMKgwqDCoMKgwqBsZW4gLT0gb2Zmc2V0Owo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGxlbiA+IG1heGxlbikKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBsZW4gPSBtYXhsZW47Cj4gCj4gVGhpcyBwYXJ0IGlzIHF1aXRlIGEgZHVw
bGljYXRpb24gb2YgdGhlIGFib3ZlIGZ1bmN0aW9uLCBubz8KClllcy4KSSBvbmNlIGhhZCBhIHdy
YXBwZXIgZm9yIHRoYXQgaW4gbWluZCwgYnV0IHN1Y2ggYSB3cmFwcGVyIGFsc28gZ2V0cwpxdWl0
ZSBjb21wbGljYXRlZCBxdWlja2x5LiBSZWFzb24gYmVpbmcgdGhhdCB5b3UgZG9uJ3QganVzdCBj
aGVjaywgeW91CmFsc28gbW9kaWZ5IHRoZSBwYXJhbWV0ZXJzLgoKWW91J2QgaGF2ZSBzdGggbGlr
ZSAKCmludCBfX3BjaW1fY2hlY2tfYWRqdXN0X3JlZ2lvbl9yYW5nZV9wYXJhbXModW5zaWduZWQg
bG9uZyAqc3RhcnQsIHVuc2lnbmVkIGxvbmcgKmxlbik7CgphbmQgdGhlbiB5b3UnZCBoYXZlIHRv
IHJldHVybiBlaXRoZXIgLUVJTlZBTCBvciAwIGFuZCAqY2hlY2sqIGZvciB0aG9zZQphZ2FpbiBp
biB0aGUgY2FsbGluZyBmdW5jdGlvbi4KVGhhdCdzIHdoeSBJIHJlbW92ZWQgdGhlIHdyYXBwZXIg
YWdhaW4gYW5kIGp1c3QgY29waWVkIHRoZSBjb2RlLApiZWNhdXNlIEkgdGhvdWdodCB0aGF0J3Mg
Y2hlYXBlciwgdWx0aW1hdGVseS4KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBJ
T1JFU09VUkNFX0lPKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlbGVhc2Vf
cmVnaW9uKHN0YXJ0LCBsZW4pOwo+ID4gK8KgwqDCoMKgwqDCoMKgZWxzZSBpZiAoZmxhZ3MgJiBJ
T1JFU09VUkNFX01FTSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWxlYXNl
X21lbV9yZWdpb24oc3RhcnQsIGxlbik7Cj4gPiArfQo+IAo+IC4uLgo+IAo+ID4gK3N0YXRpYyBp
bnQgX19wY2ltX3JlcXVlc3RfcmVnaW9uKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBpbnQgYmFyLAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IGNoYXIgKm5hbWUsIGludCBl
eGNsdXNpdmUpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3QgdW5zaWduZWQgbG9uZyBv
ZmZzZXQgPSAwOwo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3QgdW5zaWduZWQgbG9uZyBsZW4gPSBw
Y2lfcmVzb3VyY2VfbGVuKHBkZXYsIGJhcik7Cj4gCj4gSG93IGNvbnN0IGFueWhvdyB1c2VmdWwg
aGVyZT8KPiBEaXR0byBmb3Igb3RoZXIgcGxhY2VzIGxpa2UgdGhpcy4KClllYWgsIHdlIGNhbiBv
bWl0IHRob3NlCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIF9fcGNpbV9yZXF1ZXN0X3Jl
Z2lvbl9yYW5nZShwZGV2LCBiYXIsIG9mZnNldCwgbGVuLAo+ID4gbmFtZSwgZXhjbHVzaXZlKTsK
PiA+ICt9Cj4gCj4gLi4uCj4gCj4gPiArc3RhdGljIGludCBwY2ltX2FkZHJfcmVzb3VyY2VzX21h
dGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZAo+ID4gKmFfcmF3LCB2b2lkICpiX3JhdykKPiA+
ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGNpbV9hZGRyX2RldnJlcyAqYSwgKmI7Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgwqBhID0gYV9yYXc7Cj4gPiArwqDCoMKgwqDCoMKgwqBiID0g
Yl9yYXc7Cj4gCj4gPiArwqDCoMKgwqDCoMKgwqAodm9pZClkZXY7IC8qIHVudXNlZC4gKi8KPiAK
PiBXaHkgZG8gd2UgbmVlZCB0aGlzPwoKT2xkIGluc3RpbmN0IGZyb20gYW5vdGhlciBwcm9qZWN0
IHdoZXJlIHRoZSBjb21waWxlciBwdW5jaGVkIHlvdSBmb3IKdW51c2VkIHZhcmlhYmxlcyBhbmQg
ZnVuY3Rpb24gcGFyYW1ldGVycy4KQ2FuIHJlbW92ZSBpdC4KCj4gCj4gPiArwqDCoMKgwqDCoMKg
wqBpZiAoYS0+dHlwZSAhPSBiLT50eXBlKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAwOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgc3dpdGNoIChhLT50eXBlKSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIFBDSU1fQUREUl9ERVZSRVNfVFlQRV9SRUdJT046Cj4g
PiArwqDCoMKgwqDCoMKgwqBjYXNlIFBDSU1fQUREUl9ERVZSRVNfVFlQRV9SRUdJT05fTUFQUElO
RzoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gYS0+YmFyID09IGIt
PmJhcjsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgUENJTV9BRERSX0RFVlJFU19UWVBFX01BUFBJ
Tkc6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGEtPmJhc2VhZGRy
ID09IGItPmJhc2VhZGRyOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBQQ0lNX0FERFJfREVWUkVT
X1RZUEVfUkVHSU9OX1JBTkdFX01BUFBJTkc6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIGEtPmJhciA9PSBiLT5iYXIgJiYKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYS0+b2Zmc2V0ID09IGItPm9mZnNldCAmJiBhLT5s
ZW4gPT0gYi0+bGVuOwo+IAo+IEluZGVudGF0aW9uIG9yIG1hZGUgaXQgYSBzaW5nbGUgbGluZS4K
CkhvdyBkbyB5b3Ugd2FudCBzdWNoIGFuIGluZGVudGF0aW9uIHRvIGJlIHBlcmZvcm1lZC4gVGFi
cyBtaXhlZCB3aXRoCnNwYWNlcz8KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKg
fQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gCj4gcmV0dXJuIGRpcmVjdGx5
IGZyb20gZGVmYXVsdCBjYXNlLgo+IAo+ID4gK30KPiAKPiAuLi4KPiAKPiA+ICsvKioKPiA+ICsg
KiBwY2ltX2lvbWFwX3JlZ2lvbiAtIFJlcXVlc3QgYW5kIGlvbWFwIGEgUENJIEJBUgo+ID4gKyAq
IEBwZGV2OiBQQ0kgZGV2aWNlIHRvIG1hcCBJTyByZXNvdXJjZXMgZm9yCj4gPiArICogQGJhcjog
SW5kZXggb2YgYSBCQVIgdG8gbWFwCj4gPiArICogQG5hbWU6IE5hbWUgYXNzb2NpYXRlZCB3aXRo
IHRoZSByZXF1ZXN0Cj4gPiArICoKPiA+ICsgKiBSZXR1cm5zIF9faW9tZW0gcG9pbnRlciBvbiBz
dWNjZXNzLCBhbiBJT01FTV9FUlJfUFRSIG9uCj4gPiBmYWlsdXJlLgo+IAo+IFBsZWFzZSwgbWFr
ZSBzdXJlIHRoZSBrZXJuZWwtZG9jIHdvbid0IGNvbXBsYWluCj4gCj4gwqDCoMKgwqDCoMKgwqDC
oHNjcmlwdHMva2VybmVsLWRvYyAtdiAtbm9uZSAtV2FsbCAuLi4KCkknbGwgaGF2ZSBhIGxvb2sK
Cj4gCj4gPiArICogTWFwcGluZyBhbmQgcmVnaW9uIHdpbGwgZ2V0IGF1dG9tYXRpY2FsbHkgcmVs
ZWFzZWQgb24gZHJpdmVyCj4gPiBkZXRhY2guIElmCj4gPiArICogZGVzaXJlZCwgcmVsZWFzZSBt
YW51YWxseSBvbmx5IHdpdGggcGNpbV9pb3VubWFwX3JlZ2lvbigpLgo+ID4gKyAqLwo+ID4gK3Zv
aWQgX19pb21lbSAqcGNpbV9pb21hcF9yZWdpb24oc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBi
YXIsCj4gPiBjb25zdCBjaGFyICpuYW1lKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoGludCBy
ZXQgPSAwOwo+IAo+IFJlZHVuZGFudCBhc3NpZ25tZW50LgoKSSBndWVzcyB3ZSBjYW4gcmVtb3Zl
IGl0LCBidXQgZG8geW91IHRoaW5rIGl0J3Mgbm90IGp1c3QgdXNlbGVzcywgYnV0CmFjdHVhbGx5
IGJhZD8KQWZ0ZXIgYWxsLCBwZW9wbGUgbGlrZSB0aGUgUnVzdCBmb2xrcyBmcmVxdWVudGx5IGNv
bXBsYWluIGFib3V0IHRoZQoncHJvYmxlbScgaW4gQyBvZiB2YXJpYWJsZXMgbm90IGJlaW5nIGlu
aXRpYWxpemVkLgoKSSdtIG5ldXRyYWwgYWJvdXQgdGhpcywgd2UgY2FuIGtlZXAgb3IgcmVtb3Zl
IGl0LgoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBwY2ltX2FkZHJfZGV2cmVzICpyZXM7
Cj4gCj4gUGVyaGFwcyByZXZlcnNlZCB4bWFzIHRyZWUgb3JkZXI/CgpXaGF0IGRvIHlvdSBtZWFu
PyBUaGUgc3RydWN0J3MgbmFtZT8gVGhlIGZ1bmN0aW9uJ3Mgc3RydWN0dXJlPwoKPiAKPiA+ICvC
oMKgwqDCoMKgwqDCoHJlcyA9IHBjaW1fYWRkcl9kZXZyZXNfYWxsb2MocGRldik7Cj4gPiArwqDC
oMKgwqDCoMKgwqBpZiAoIXJlcykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gSU9NRU1fRVJSX1BUUigtRU5PTUVNKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJl
cy0+dHlwZSA9IFBDSU1fQUREUl9ERVZSRVNfVFlQRV9SRUdJT05fTUFQUElORzsKPiA+ICvCoMKg
wqDCoMKgwqDCoHJlcy0+YmFyID0gYmFyOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0g
X19wY2ltX3JlcXVlc3RfcmVnaW9uKHBkZXYsIGJhciwgbmFtZSwgMCk7Cj4gPiArwqDCoMKgwqDC
oMKgwqBpZiAocmV0ICE9IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBlcnJfcmVnaW9uOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVzLT5iYXNlYWRkciA9IHBj
aV9pb21hcChwZGV2LCBiYXIsIDApOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFyZXMtPmJhc2Vh
ZGRyKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gLUVJTlZBTDsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9pb21hcDsKPiA+ICvC
oMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGRldnJlc19hZGQoJnBkZXYt
PmRldiwgcmVzKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByZXMtPmJhc2VhZGRyOwo+ID4g
Kwo+ID4gK2Vycl9pb21hcDoKPiA+ICvCoMKgwqDCoMKgwqDCoF9fcGNpbV9yZWxlYXNlX3JlZ2lv
bihwZGV2LCBiYXIpOwo+ID4gK2Vycl9yZWdpb246Cj4gPiArwqDCoMKgwqDCoMKgwqBwY2ltX2Fk
ZHJfZGV2cmVzX2ZyZWUocmVzKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBJT01F
TV9FUlJfUFRSKHJldCk7Cj4gPiArfQo+IAo+IC4uLgo+IAo+ID4gK3N0YXRpYyBpbnQgX3BjaW1f
cmVxdWVzdF9yZWdpb24oc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBiYXIsCj4gPiBjb25zdCBj
aGFyICpuYW1lLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCByZXF1ZXN0
X2ZsYWdzKQo+IAo+IEluZGVudGF0aW9uPwo+IAo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoGlu
dCByZXQgPSAwOwo+IAo+IFVubmVkZWQgYXNzaWdubWVudC4gQWxzbyBmaXggdGhpcyBpbiBvdGhl
ciBwbGFjZXMuCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGNpbV9hZGRyX2RldnJlcyAq
cmVzOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVzID0gcGNpbV9hZGRyX2RldnJlc19hbGxv
YyhwZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcmVzKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVzLT50
eXBlID0gUENJTV9BRERSX0RFVlJFU19UWVBFX1JFR0lPTjsKPiA+ICvCoMKgwqDCoMKgwqDCoHJl
cy0+YmFyID0gYmFyOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gX19wY2ltX3JlcXVl
c3RfcmVnaW9uKHBkZXYsIGJhciwgbmFtZSwKPiA+IHJlcXVlc3RfZmxhZ3MpOwo+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKHJldCAhPSAwKSB7Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4g
Cj4gQWxzbyBmaXggdGhpcyBpbiBvdGhlciBwbGFjZXMuCgpTZWUgYWJvdmUuCgoKClRoeCBmb3Ig
dGhlIHJldmlldywKUC4KCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBj
aW1fYWRkcl9kZXZyZXNfZnJlZShyZXMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiByZXQ7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqBkZXZyZXNfYWRkKCZwZGV2LT5kZXYsIHJlcyk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gMDsKPiA+ICt9Cj4gCgo=



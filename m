Return-Path: <linux-doc+bounces-5776-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B325981C6F3
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 09:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E9C1C22123
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D598D2F4;
	Fri, 22 Dec 2023 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVlPSMPD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D779D295;
	Fri, 22 Dec 2023 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3367601a301so1459922f8f.2;
        Fri, 22 Dec 2023 00:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703235399; x=1703840199; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jbYOgM1f1L9TmjtWsSWHqEcgaER/0XgtduSSqa79BFU=;
        b=nVlPSMPDZgKJBMlLrpzCsjr2vr56QTz5QtMVMUikif1YGgzi2t077bQKUZ6vX5RbRD
         4NqHUHvcS1IqilpvWYwr0CCoH7Qf6CkXi4YT2gCjqBJC5B+fkRvhcKvVl5eMAECnhdCe
         yZyqAmLAP5wTF3UmfsQRR3NFo9wABn+vw9wOSbjVggEAlNDUGGnLJFUXH4I7H+oUmkLt
         GshDeLpNs/QPM1jasYn6SUZVyHG2HyK7vh0o5vSX6XV2dLOOc9lzDpTCNvgSEmpYFcpP
         FtTEj1RFxesco8d9hzi5eiDkbTydh/v0wx/1dbCWdeAhSBzLd74y72N03T95OMbmpGxZ
         Hwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703235399; x=1703840199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbYOgM1f1L9TmjtWsSWHqEcgaER/0XgtduSSqa79BFU=;
        b=i5NPPfD9Tqy0Q534KllEPPk9eckiHcVfRrthZUBfWgVvyAAC+zbf5QWrQOhh1PsWu2
         mr2+rX0A8XpXDP5vgmv0fytCFJKkgwZQr3lIH3agzgLHsFPoOz39BuZiFD1K+KotsUHk
         3/LZ3IhLTebL/bMVZWOacZS6QVh9c5xal6OlpYZ7bdIcIHDNO0c6Jk2ZSXoF+fITMRkC
         VziYCGyppzEdoYP082FrZKBhTosWUuoJyOupkQHGYENMr2L+TJbwwSkOFtMIRokQofNz
         /BUe8w7zW7JvlT7o3fIKC+YSknYMBCZ/OUxOHvqaAW9cDGYpARivSBKnqvDftJSDZW/L
         rTtQ==
X-Gm-Message-State: AOJu0YzHCvrGKh9yBm+zhtzF+PTSzV7c39TUpuXcICQH1tZGYtX1eVgp
	/IApvxAO2W7mE+35jLv44zg=
X-Google-Smtp-Source: AGHT+IFTT6vRHmrcGYay1ff3uSCMJxh9QHDE+bbDZ8V73xADabxKKrNAYmNI9TrGdShdLXV1xA4+Cg==
X-Received: by 2002:adf:f7c9:0:b0:336:5d19:e73c with SMTP id a9-20020adff7c9000000b003365d19e73cmr403047wrq.200.1703235398984;
        Fri, 22 Dec 2023 00:56:38 -0800 (PST)
Received: from ?IPv6:2001:818:ea8e:7f00:5877:261e:1d6d:8696? ([2001:818:ea8e:7f00:5877:261e:1d6d:8696])
        by smtp.gmail.com with ESMTPSA id o10-20020adfeaca000000b0033677a4e0d6sm3798608wrn.13.2023.12.22.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 00:56:38 -0800 (PST)
Message-ID: <219abc43b4fdd4a13b307ed2efaa0e6869e68e3f.camel@gmail.com>
Subject: Re: [PATCH v5 6/8] iio: buffer-dma: Enable support for DMABUFs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Vinod Koul <vkoul@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Michael Hennerich
 <Michael.Hennerich@analog.com>
Date: Fri, 22 Dec 2023 09:56:39 +0100
In-Reply-To: <20231221160445.0e3e5a8c@jic23-huawei>
References: <20231219175009.65482-1-paul@crapouillou.net>
	 <20231219175009.65482-7-paul@crapouillou.net>
	 <20231221160445.0e3e5a8c@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTEyLTIxIGF0IDE2OjA0ICswMDAwLCBKb25hdGhhbiBDYW1lcm9uIHdyb3Rl
Ogo+IE9uIFR1ZSwgMTkgRGVjIDIwMjMgMTg6NTA6MDcgKzAxMDAKPiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4gCj4gPiBJbXBsZW1lbnQgaWlvX2RtYV9idWZm
ZXJfYXR0YWNoX2RtYWJ1ZigpLCBpaW9fZG1hX2J1ZmZlcl9kZXRhY2hfZG1hYnVmKCkKPiA+IGFu
ZCBpaW9fZG1hX2J1ZmZlcl90cmFuc2Zlcl9kbWFidWYoKSwgd2hpY2ggY2FuIHRoZW4gYmUgdXNl
ZCBieSB0aGUgSUlPCj4gPiBETUEgYnVmZmVyIGltcGxlbWVudGF0aW9ucy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiAKPiBI
aSBQYXVsLAo+IAo+IEEgZmV3IGNvbW1lbnRzIGluIGhlcmUuIE1vc3RseSBwbGFjZXMgd2hlcmUg
dGhlIGNsZWFudXAuaCBndWFyZCgpIHN0dWZmCj4gY2FuIHNpbXBsaWZ5IGVycm9yIHBhdGhzLgo+
IAo+IE92ZXJhbGwgdGhpcyBsb29rcyByZWFzb25hYmxlIHRvIG1lLgo+IAo+IEpvbmF0aGFuCj4g
Cj4gPiAtLS0KPiA+IHYzOiBVcGRhdGUgY29kZSB0byBwcm92aWRlIHRoZSBmdW5jdGlvbnMgdGhh
dCB3aWxsIGJlIHVzZWQgYXMgY2FsbGJhY2tzCj4gPiDCoMKgwqAgZm9yIHRoZSBuZXcgSU9DVExz
Lgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvaWlvL2J1ZmZlci9pbmR1c3RyaWFsaW8tYnVmZmVyLWRt
YS5jIHwgMTU3ICsrKysrKysrKysrKysrKysrLS0KPiA+IMKgaW5jbHVkZS9saW51eC9paW8vYnVm
ZmVyLWRtYS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjYgKysrCj4gPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYnVmZmVyL2luZHVzdHJpYWxpby1idWZmZXItZG1h
LmMKPiA+IGIvZHJpdmVycy9paW8vYnVmZmVyL2luZHVzdHJpYWxpby1idWZmZXItZG1hLmMKPiA+
IGluZGV4IDU2MTBiYTY3OTI1ZS4uYWRiNjRmOTc1MDY0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9paW8vYnVmZmVyL2luZHVzdHJpYWxpby1idWZmZXItZG1hLmMKPiA+ICsrKyBiL2RyaXZlcnMv
aWlvL2J1ZmZlci9pbmR1c3RyaWFsaW8tYnVmZmVyLWRtYS5jCj4gPiBAQCAtMTQsNiArMTQsNyBA
QAo+ID4gwqAjaW5jbHVkZSA8bGludXgvcG9sbC5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgvaWlv
L2J1ZmZlcl9pbXBsLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9paW8vYnVmZmVyLWRtYS5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9kbWEt
bWFwcGluZy5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KPiA+IMKgCj4gPiBAQCAt
OTQsMTQgKzk1LDI0IEBAIHN0YXRpYyB2b2lkIGlpb19idWZmZXJfYmxvY2tfcmVsZWFzZShzdHJ1
Y3Qga3JlZiAqa3JlZikKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpaW9fZG1h
X2J1ZmZlcl9ibG9jayAqYmxvY2sgPSBjb250YWluZXJfb2Yoa3JlZiwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19kbWFfYnVmZmVyX2Jsb2NrLCBrcmVmKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9xdWV1ZSAqcXVldWUgPSBi
bG9jay0+cXVldWU7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgV0FSTl9PTihibG9jay0+c3Rh
dGUgIT0gSUlPX0JMT0NLX1NUQVRFX0RFQUQpOwo+ID4gK8KgwqDCoMKgwqDCoMKgV0FSTl9PTihi
bG9jay0+ZmlsZWlvICYmIGJsb2NrLT5zdGF0ZSAhPSBJSU9fQkxPQ0tfU1RBVEVfREVBRCk7Cj4g
PiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgZG1hX2ZyZWVfY29oZXJlbnQoYmxvY2stPnF1ZXVlLT5k
ZXYsIFBBR0VfQUxJR04oYmxvY2stPnNpemUpLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJs
b2NrLT52YWRkciwgYmxvY2stPnBoeXNfYWRkcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBtdXRleF9s
b2NrKCZxdWV1ZS0+bG9jayk7Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWlvX2J1ZmZlcl9w
dXQoJmJsb2NrLT5xdWV1ZS0+YnVmZmVyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChibG9jay0+
ZmlsZWlvKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZyZWVfY29o
ZXJlbnQocXVldWUtPmRldiwgUEFHRV9BTElHTihibG9jay0+c2l6ZSksCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
bG9jay0+dmFkZHIsIGJsb2NrLT5waHlzX2FkZHIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHF1ZXVlLT5udW1fZmlsZWlvX2Jsb2Nrcy0tOwo+ID4gK8KgwqDCoMKgwqDCoMKg
fQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcXVldWUtPm51bV9ibG9ja3MtLTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqBrZnJlZShibG9jayk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBtdXRleF91
bmxvY2soJnF1ZXVlLT5sb2NrKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlpb19idWZmZXJf
cHV0KCZxdWV1ZS0+YnVmZmVyKTsKPiA+IMKgfQo+ID4gwqAKPiA+IMKgc3RhdGljIHZvaWQgaWlv
X2J1ZmZlcl9ibG9ja19nZXQoc3RydWN0IGlpb19kbWFfYnVmZmVyX2Jsb2NrICpibG9jaykKPiA+
IEBAIC0xNjMsNyArMTc0LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9xdWV1ZQo+
ID4gKmlpb19idWZmZXJfdG9fcXVldWUoc3RydWN0IGlpb19idWZmZXIgKmJ1ZikKPiA+IMKgfQo+
ID4gwqAKPiA+IMKgc3RhdGljIHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9ibG9jayAqaWlvX2RtYV9i
dWZmZXJfYWxsb2NfYmxvY2soCj4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaWlvX2RtYV9idWZm
ZXJfcXVldWUgKnF1ZXVlLCBzaXplX3Qgc2l6ZSkKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBp
aW9fZG1hX2J1ZmZlcl9xdWV1ZSAqcXVldWUsIHNpemVfdCBzaXplLCBib29sIGZpbGVpbykKPiA+
IMKgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9ibG9jayAqYmxv
Y2s7Cj4gPiDCoAo+ID4gQEAgLTE3MSwxMyArMTgyLDE2IEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2Rt
YV9idWZmZXJfYmxvY2sKPiA+ICppaW9fZG1hX2J1ZmZlcl9hbGxvY19ibG9jaygKPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWJsb2NrKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gTlVMTDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBibG9jay0+dmFkZHIgPSBk
bWFfYWxsb2NfY29oZXJlbnQocXVldWUtPmRldiwgUEFHRV9BTElHTihzaXplKSwKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmYmxvY2stPnBoeXNfYWRkciwgR0ZQX0tFUk5FTCk7
Cj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIWJsb2NrLT52YWRkcikgewo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGJsb2NrKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gTlVMTDsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChmaWxlaW8pIHsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBibG9jay0+dmFkZHIgPSBkbWFfYWxs
b2NfY29oZXJlbnQocXVldWUtPmRldiwgUEFHRV9BTElHTihzaXplKSwKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmJsb2NrLT5waHlzX2FkZHIsIEdGUF9LRVJO
RUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghYmxvY2stPnZhZGRy
KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtm
cmVlKGJsb2NrKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIE5VTEw7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+
ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqBibG9jay0+Zmls
ZWlvID0gZmlsZWlvOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGJsb2NrLT5zaXplID0gc2l6ZTsKPiA+
IMKgwqDCoMKgwqDCoMKgwqBibG9jay0+c3RhdGUgPSBJSU9fQkxPQ0tfU1RBVEVfRE9ORTsKPiA+
IMKgwqDCoMKgwqDCoMKgwqBibG9jay0+cXVldWUgPSBxdWV1ZTsKPiA+IEBAIC0xODYsNiArMjAw
LDkgQEAgc3RhdGljIHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9ibG9jawo+ID4gKmlpb19kbWFfYnVm
ZmVyX2FsbG9jX2Jsb2NrKAo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpaW9fYnVmZmVyX2dl
dCgmcXVldWUtPmJ1ZmZlcik7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgcXVldWUtPm51bV9i
bG9ja3MrKzsKPiA+ICvCoMKgwqDCoMKgwqDCoHF1ZXVlLT5udW1fZmlsZWlvX2Jsb2NrcyArPSBm
aWxlaW87Cj4gQWRkaW5nIGEgYm9vbGVhbiBpcyBub24gaW50dWl0aXZlLgo+IAo+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoZmlsZWlvKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXVl
dWUtPm51bV9maWxlaW9fYmxvY2tzKys7Cj4gCj4gcHJvYmFibHkgZWFzaWVyIHRvIHJlYWQgYW5k
IGNvbXBpbGVyIHNob3VsZCBiZSBhYmxlIHRvIGZpZ3VyZSBvdXQgaG93IHRvCj4gb3B0aW1pc2Ug
dGhlIGNvbmRpdGlvbiBhd2F5Lgo+IAo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBi
bG9jazsKPiA+IMKgfQo+ID4gwqAKPiA+IEBAIC0yMTEsNiArMjI4LDkgQEAgdm9pZCBpaW9fZG1h
X2J1ZmZlcl9ibG9ja19kb25lKHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9ibG9jawo+ID4gKmJsb2Nr
KQo+ID4gwqDCoMKgwqDCoMKgwqDCoF9paW9fZG1hX2J1ZmZlcl9ibG9ja19kb25lKGJsb2NrKTsK
PiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZxdWV1ZS0+bGlzdF9s
b2NrLCBmbGFncyk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFibG9jay0+ZmlsZWlv
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlpb19idWZmZXJfc2lnbmFsX2Rt
YWJ1Zl9kb25lKGJsb2NrLT5hdHRhY2gsIDApOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlp
b19idWZmZXJfYmxvY2tfcHV0X2F0b21pYyhibG9jayk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgd2Fr
ZV91cF9pbnRlcnJ1cHRpYmxlX3BvbGwoJnF1ZXVlLT5idWZmZXIucG9sbHEsIEVQT0xMSU4gfCBF
UE9MTFJETk9STSk7Cj4gPiDCoH0KPiA+IEBAIC0yMzcsMTAgKzI1NywxNCBAQCB2b2lkIGlpb19k
bWFfYnVmZmVyX2Jsb2NrX2xpc3RfYWJvcnQoc3RydWN0Cj4gPiBpaW9fZG1hX2J1ZmZlcl9xdWV1
ZSAqcXVldWUsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxpc3RfZGVsKCZi
bG9jay0+aGVhZCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJsb2NrLT5i
eXRlc191c2VkID0gMDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX2lpb19k
bWFfYnVmZmVyX2Jsb2NrX2RvbmUoYmxvY2spOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICghYmxvY2stPmZpbGVpbykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWlvX2J1ZmZlcl9zaWduYWxfZG1hYnVmX2RvbmUo
YmxvY2stPmF0dGFjaCwgLUVJTlRSKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWlvX2J1ZmZlcl9ibG9ja19wdXRfYXRvbWljKGJsb2NrKTsKPiA+IMKgwqDCoMKgwqDCoMKg
wqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcXVldWUtPmxp
c3RfbG9jaywgZmxhZ3MpOwo+ID4gwqAKPiA+ICvCoMKgwqDCoMKgwqDCoHF1ZXVlLT5maWxlaW8u
ZW5hYmxlZCA9IGZhbHNlOwo+IAo+IFdoaWxlIHRoaXMgb2J2aW91c2x5IGRvZXNuJ3QgbmVlZCB0
byBiZSBjb25kaXRpb25hbCBpZiBpdCBjYW4gYWxyZWFkeSBiZSBmYWxzZQo+IGl0IG1pZ2h0IGJl
IGVhc2llciB0byBmb2xsb3cgdGhlIGNvZGUgZmxvdyBpdCBpZiBkaWRuJ3QgY2hlY2sgaWYgd2Ug
d2VyZSBkb2luZwo+IGZpbGVpbyBvciBub3QgYmVmb3JlIGRpc2FibGluZyBpdC4KPiAKPiA+IMKg
wqDCoMKgwqDCoMKgwqB3YWtlX3VwX2ludGVycnVwdGlibGVfcG9sbCgmcXVldWUtPmJ1ZmZlci5w
b2xscSwgRVBPTExJTiB8IEVQT0xMUkROT1JNKTsKPiA+IMKgfQo+ID4gwqBFWFBPUlRfU1lNQk9M
X0dQTChpaW9fZG1hX2J1ZmZlcl9ibG9ja19saXN0X2Fib3J0KTsKPiA+IEBAIC0yNjEsNiArMjg1
LDEyIEBAIHN0YXRpYyBib29sIGlpb19kbWFfYmxvY2tfcmV1c2FibGUoc3RydWN0Cj4gPiBpaW9f
ZG1hX2J1ZmZlcl9ibG9jayAqYmxvY2spCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqB9Cj4g
PiDCoAo+ID4gK3N0YXRpYyBib29sIGlpb19kbWFfYnVmZmVyX2ZpbGVpb19tb2RlKHN0cnVjdCBp
aW9fZG1hX2J1ZmZlcl9xdWV1ZSAqcXVldWUpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIHF1ZXVlLT5maWxlaW8uZW5hYmxlZCB8fAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHF1ZXVlLT5udW1fYmxvY2tzID09IHF1ZXVlLT5udW1fZmlsZWlvX2Jsb2NrczsKPiBU
aGlzIGlzIGEgbGl0dGxlIG9kZC4gU28gd291bGQgYmUgZ29vZCBoYXZlIGEgY29tbWVudCBvbiB3
aHkgdGhpcyBjb25kaXRpb24uCj4gT3IgcmVuYW1lIHRoZSBmdW5jdGlvbiB0byBpbXBseSBpdCdz
IGNoZWNraW5nIGlmIGVuYWJsZWQsIG9yIGNhbiBiZSBlbmFibGVkLgo+IAo+IEF0IGZpcnN0IGds
YW5jZWQgSSBleHBlY3RlZCBhIGZ1bmN0aW9uIHdpdGggdGhpcyBuYW1lIHRvIGp1c3QgYmUgYW4g
YWNjZXNzb3IKPiBmdW5jdGlvbi4gZS5nLgo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcXVldWUt
PmZpbGVpby5lbmFibGVkOwo+IAo+ID4gK30KPiA+ICsKPiA+IMKgLyoqCj4gPiDCoCAqIGlpb19k
bWFfYnVmZmVyX3JlcXVlc3RfdXBkYXRlKCkgLSBETUEgYnVmZmVyIHJlcXVlc3RfdXBkYXRlIGNh
bGxiYWNrCj4gPiDCoCAqIEBidWZmZXI6IFRoZSBidWZmZXIgd2hpY2ggdG8gcmVxdWVzdCBhbiB1
cGRhdGUKPiA+IEBAIC0yODcsNiArMzE3LDEyIEBAIGludCBpaW9fZG1hX2J1ZmZlcl9yZXF1ZXN0
X3VwZGF0ZShzdHJ1Y3QgaWlvX2J1ZmZlciAqYnVmZmVyKQo+ID4gwqAKPiA+IMKgwqDCoMKgwqDC
oMKgwqBtdXRleF9sb2NrKCZxdWV1ZS0+bG9jayk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKg
cXVldWUtPmZpbGVpby5lbmFibGVkID0gaWlvX2RtYV9idWZmZXJfZmlsZWlvX21vZGUocXVldWUp
Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgLyogSWYgRE1BQlVGcyB3ZXJlIGNyZWF0ZWQsIGRp
c2FibGUgZmlsZWlvIGludGVyZmFjZSAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFxdWV1ZS0+
ZmlsZWlvLmVuYWJsZWQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBv
dXRfdW5sb2NrOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIEFsbG9jYXRpb25zIGFyZSBw
YWdlIGFsaWduZWQgKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoUEFHRV9BTElHTihxdWV1ZS0+
ZmlsZWlvLmJsb2NrX3NpemUpID09IFBBR0VfQUxJR04oc2l6ZSkpCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHRyeV9yZXVzZSA9IHRydWU7Cj4gPiBAQCAtMzE3LDcgKzM1Myw3
IEBAIGludCBpaW9fZG1hX2J1ZmZlcl9yZXF1ZXN0X3VwZGF0ZShzdHJ1Y3QgaWlvX2J1ZmZlciAq
YnVmZmVyKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYmxvY2sgPSBxdWV1ZS0+ZmlsZWlvLmJsb2Nrc1tpXTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChibG9jay0+c3RhdGUgPT0gSUlPX0JM
T0NLX1NUQVRFX0RFQUQpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBDb3VsZCBub3QgcmV1c2UgaXQgKi8KPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlpb19idWZmZXJfYmxvY2tfcHV0KGJsb2NrKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlpb19idWZmZXJf
YmxvY2tfcHV0X2F0b21pYyhibG9jayk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmxvY2sgPSBOVUxMOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBibG9jay0+c2l6ZSA9IHNpemU7Cj4gPiBAQCAtMzI3LDcgKzM2Myw3IEBAIGludCBp
aW9fZG1hX2J1ZmZlcl9yZXF1ZXN0X3VwZGF0ZShzdHJ1Y3QgaWlvX2J1ZmZlciAqYnVmZmVyKQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoAo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWJsb2NrKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJsb2NrID0gaWlvX2RtYV9idWZmZXJfYWxs
b2NfYmxvY2socXVldWUsIHNpemUpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBibG9jayA9IGlpb19kbWFfYnVmZmVyX2FsbG9jX2Jsb2NrKHF1ZXVl
LCBzaXplLCB0cnVlKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICghYmxvY2spIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRU5PTUVNOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gb3V0X3VubG9jazsKPiA+IEBAIC0zNjMsNyArMzk5LDcgQEAgc3RhdGljIHZvaWQg
aWlvX2RtYV9idWZmZXJfZmlsZWlvX2ZyZWUoc3RydWN0Cj4gPiBpaW9fZG1hX2J1ZmZlcl9xdWV1
ZSAqcXVldWUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
cXVldWUtPmZpbGVpby5ibG9ja3MpOyBpKyspIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKCFxdWV1ZS0+ZmlsZWlvLmJsb2Nrc1tpXSkKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnRpbnVlOwo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlpb19idWZmZXJfYmxvY2tfcHV0KHF1ZXVlLT5maWxlaW8u
YmxvY2tzW2ldKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpaW9fYnVmZmVy
X2Jsb2NrX3B1dF9hdG9taWMocXVldWUtPmZpbGVpby5ibG9ja3NbaV0pOwo+IAo+IEZvciB0aGVz
ZSBjYXNlcyB0aGF0IGFyZSBhdG9taWMgb3Igbm90LCBpdCBtaWdodCBiZSB3b3J0aCBjYWxsaW5n
IG91dCB3aHkgdGhleSBuZWVkCj4gdG8gYmUKPiBhdG9taWMuCj4gCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHF1ZXVlLT5maWxlaW8uYmxvY2tzW2ldID0gTlVMTDsKPiA+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgcXVldWUtPmZpbGVpby5hY3RpdmVf
YmxvY2sgPSBOVUxMOwo+ID4gQEAgLTM4NCw4ICs0MjAsMTIgQEAgc3RhdGljIHZvaWQgaWlvX2Rt
YV9idWZmZXJfc3VibWl0X2Jsb2NrKHN0cnVjdAo+ID4gaWlvX2RtYV9idWZmZXJfcXVldWUgKnF1
ZXVlLAo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBibG9jay0+c3RhdGUgPSBJSU9fQkxPQ0tf
U1RBVEVfQUNUSVZFOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlpb19idWZmZXJfYmxvY2tfZ2V0KGJs
b2NrKTsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBxdWV1ZS0+b3BzLT5zdWJtaXQo
cXVldWUsIGJsb2NrKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFibG9jay0+ZmlsZWlvKQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpaW9fYnVmZmVyX3NpZ25hbF9k
bWFidWZfZG9uZShibG9jay0+YXR0YWNoLCByZXQpOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBUaGlzIGlzIGEgYml0IG9mIGEgcHJvYmxlbSBhbmQgdGhlcmUgaXMgbm90IG11Y2ggd2UgY2Fu
IGRvCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG90aGVyIHRoZW4gd2Fp
dCBmb3IgdGhlIGJ1ZmZlciB0byBiZSBkaXNhYmxlZCBhbmQgcmUtZW5hYmxlZAo+ID4gQEAgLTU4
OCw2ICs2MjgsOTcgQEAgc2l6ZV90IGlpb19kbWFfYnVmZmVyX2RhdGFfYXZhaWxhYmxlKHN0cnVj
dCBpaW9fYnVmZmVyICpidWYpCj4gPiDCoH0KPiA+IMKgRVhQT1JUX1NZTUJPTF9HUEwoaWlvX2Rt
YV9idWZmZXJfZGF0YV9hdmFpbGFibGUpOwo+ID4gwqAKPiA+ICtzdHJ1Y3QgaWlvX2RtYV9idWZm
ZXJfYmxvY2sgKgo+ID4gK2lpb19kbWFfYnVmZmVyX2F0dGFjaF9kbWFidWYoc3RydWN0IGlpb19i
dWZmZXIgKmJ1ZmZlciwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+ID4g
K3sKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpaW9fZG1hX2J1ZmZlcl9xdWV1ZSAqcXVldWUg
PSBpaW9fYnVmZmVyX3RvX3F1ZXVlKGJ1ZmZlcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
aWlvX2RtYV9idWZmZXJfYmxvY2sgKmJsb2NrOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsK
PiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJnF1ZXVlLT5sb2NrKTsKPiAKPiDC
oMKgwqDCoMKgwqDCoMKgZ3VhcmQobXV0ZXgpKCZxdWV1ZS0+bG9jayk7CgpJJ20gYWxzbyBhIGJp
ZyBmYW4gb2YgdGhpcyBuZXcgc3R1ZmYgYnV0IHNob3VsZG4ndCB3ZSBoYXZlIGEgcHJlcCBwYXRj
aCBtYWtpbmcgdGhlCnRyYW5zaXRpb24gdG8gdGhhdD8gT3RoZXJ3aXNlIHdlJ2xsIGVuZCB1cCB3
aXRoIGEgbWl4IG9mIHN0eWxlcy4gSSdtIGhhcHB5IHRvIGNsZWFuCnVwIHN0dWZmIHdpdGggZm9s
bG93IHVwIHBhdGNoZXMgKGV2ZW4gc29tZSBjb2Rpbmcgc3R5bGUgY291bGQgYmUgaW1wcm92ZWQg
SUlSQykgYnV0CnR5cGljYWxseSB0aGF0J3Mgbm90IGhvdyB3ZSBoYW5kbGUgdGhpbmdzIGxpa2Ug
dGhpcyBJIGJlbGlldmUuLi4KCi0gTnVubyBTw6EKPiAKCg==



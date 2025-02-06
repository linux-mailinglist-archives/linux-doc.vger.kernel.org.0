Return-Path: <linux-doc+bounces-37125-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E97A2A316
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 09:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3295E7A164A
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 08:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5000224B1B;
	Thu,  6 Feb 2025 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BEGGEPr6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707F224898
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830095; cv=none; b=rUdksZmZouOzWtxmcIdc/9EBxDbjVQIPDG721eLA8ch7ckT1BhUjedEb44HmMJ9gjfSmvnOPdi1/qlFjcdEzQKeCvisqmeFt650PUpcm0UYOF34sTc3fS5mKFjUmoCvPKlktLxIGM3B+/083x8M+8xd1NPahrjCX6gwINHgljMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830095; c=relaxed/simple;
	bh=nKPXA4sTlHAUKa7+BSr7ZMr+xQCOK9oJkkKeuzR9v3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNyrkzvkk66a6dxsxaLWyCQ+K9bAIE5t0WTyyTeHkPQH8U30vYjZ4KVE0+vVC9cnNVrtghWo0J6UcTPMFzuzU96nKQb48VLEt2omFKFeD4vgojC+vz/c10TQ7+3OLZc7smyFllYPxE5wrNPzglgJhOrnTJONQ8Ct/Q62OulgqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BEGGEPr6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso119342866b.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 00:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738830091; x=1739434891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKPXA4sTlHAUKa7+BSr7ZMr+xQCOK9oJkkKeuzR9v3g=;
        b=BEGGEPr6FcAkXmlxvFKJEf3U6cghMJdJ4gYxApcCIoTKXg0Ex8CbJ3A7iP1JFbdakX
         n61qhfJipDAccQqFiOUgpxiqg0ArZLwA4ZiaKqkzKGo978O6FDUioEe5RypLvxuHgG6C
         dHP6Bey+fPr3d/BUeXqSKpzDoi8uqZSlyFIH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830091; x=1739434891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKPXA4sTlHAUKa7+BSr7ZMr+xQCOK9oJkkKeuzR9v3g=;
        b=AtEC0I3S+CuFzX9q2qHyssSKbmf9v455XtsIw2DwXoOpobK2F/+ZY5tWhbATFlOhbd
         Hfnpf5qON/auHdjRa3NMSxRzi40oRE/LTa3x+NaKkJeUMLUMqNiNHEYEjzOByLQHJKR8
         cCgqJ6sWIOo53P2HDuM+uUQtiTV8vjaj+Z7uYjIcb0pG2R44l6bY8glprJ2jeqvHa9af
         WkbyNfLNzRhqIFn5lpWcXq0vBWV+OcltdfPq2hbKmKCt9JYw35jxZAPbprUlZgmFGb56
         4bTECJo9PwKulnnZjM9FtX0Fpq9iuVBDV+0K6fTcbmO3ydC2aA8aPMFcxoxhBQY+eSPo
         AVhg==
X-Forwarded-Encrypted: i=1; AJvYcCXd+5iPQth+nn++bVI8Yxs9yflx8bMrUARfSW0obAespe7nW641iez2hjKRFT1Pr3vH8CFjX8yHqcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+w5g15TpMJ1U1bxRFurOq5CwUpyIYlnHnh4+ZI+dMA4A0H8r
	gLuz5w9m1THjtSYEQbvx6D2dxYsJiEuZ9TZazWHHyI+YCz0t7g8VGX5QxVVpzZzwb7dWVi9y/sA
	6I0JrJctyMRXY8YuGgDwFD/53iKfcNXcfOkVXJQ==
X-Gm-Gg: ASbGncssdFMQYdc25sSoXaNiWTpndOQiMhqhz80P4flZcLo9GtR/inGChsPFX6xaXjc
	leiisk8fRVJBdg4az55TNb1xZewfsfx8h/+CeZKVE0QIhnuqAuTqTYGUfK3LRtqFBKlOQ1Ac/4Z
	dEFp7M7rt1Vzf8jXD8YUb0fdKO
X-Google-Smtp-Source: AGHT+IF+5RAVoVAk7afiIcM3zP4hpekSMI2fv7KIxc4ioHDBIR+/57WdlTVNbRxujg9Q8ZOwHwlVBK9eCqZ0y09FjTA=
X-Received: by 2002:a17:907:6e92:b0:ab6:eecb:41f0 with SMTP id
 a640c23a62f3a-ab75e2f62a7mr731541166b.35.1738830091555; Thu, 06 Feb 2025
 00:21:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128102805.112691-1-akiyks@gmail.com> <CAO+cJp3JUJfumofwy3i5oE9Bp3DvsL6ULt5_EEvQmaSBt3Fekw@mail.gmail.com>
 <de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com> <CAO+cJp1+ZtQgy4JoV4jvyPBf8HDUPtnHE6OGkS0Wc7j=rV4smg@mail.gmail.com>
 <b07a56c1-8b4a-4f35-b94b-095305c1f458@gmail.com>
In-Reply-To: <b07a56c1-8b4a-4f35-b94b-095305c1f458@gmail.com>
From: Tsugikazu Shibata <shibata@linuxfoundation.org>
Date: Thu, 6 Feb 2025 17:21:20 +0900
X-Gm-Features: AWEUYZnkV460KT8iBcHw-pImiABbieND44I_UdwnSJDyLLRmWdm1JPujLwmVntg
Message-ID: <CAO+cJp3M-+UDtxLBpn9R1yRwS=iKVW=3r9HymR9No9PmoDUcYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBGZWIgMiwgMjAyNSBhdCA4OjI34oCvUE0gQWtpcmEgWW9rb3Nhd2EgPGFraXlrc0Bn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBUc3VnaWthenUgU2hpYmF0YSB3cm90ZToNCj4gPj4gRG8g
eW91IHJlYWQgdGhlIGxpc3QgdGhhdCB3YXk/DQo+ID4+DQo+ID4+IEkgZG9uJ3QgdGhpbmsgc28u
ICBJdCdzIGEgbWl4dHVyZSBvZiBzdWdnZXN0aW9ucyBtYWRlIGluIHZhcmlvdXMgZ3JhbW1hdGlj
YWwNCj4gPj4gc3RydWN0dXJlcy4NCj4gPj4NCj4gPj4gRm9yIGV4YW1wbGUsIGhlcmUgaXMgYW4g
aXRlbSBpbiBvcmlnaW5hbCBzdWJtaXQtY2hlY2tsaXN0LnJzdDoNCj4gPj4NCj4gPj4gICAzKSBB
bGwgbWVtb3J5IGJhcnJpZXJzIHtlLmcuLCBgYGJhcnJpZXIoKWBgLCBgYHJtYigpYGAsIGBgd21i
KClgYH0gbmVlZCBhDQo+ID4+ICAgICAgY29tbWVudCBpbiB0aGUgc291cmNlIGNvZGUgdGhhdCBl
eHBsYWlucyB0aGUgbG9naWMgb2Ygd2hhdCB0aGV5IGFyZSBkb2luZw0KPiA+PiAgICAgIGFuZCB3
aHkuDQo+ID4+DQo+ID4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBpbiB0aGUgZm9ybSBvZiBUT0RP
LiAgUmF0aGVyLCBpdCBpbXBsaWVzIHdoYXQgeW91DQo+ID4+IHNob3VsZCBkbywgaW4gYSBzZW50
ZW5jZSB3aG9zZSBzdWJqZWN0IGlzICJBbGwgbWVtb3J5IGJhcnJpZXJzIi4NCj4gPj4gU28gSSBk
b24ndCB0aGluayBpdCBpcyB3b3J0aCBwcmVzZXJ2aW5nIHdvcmRpbmcgaW4gdGhlIG9yaWdpbmFs
Lg0KPiA+PiBMaXN0IG9mICJXaGF0IHlvdSBhcmUgc3VwcG9zZWQgdG8gaGF2ZSBkb25lIGJlZm9y
ZSBzdWJtaXNzaW9uIg0KPiA+PiBpcyBtdWNoIHN0cmFpZ2h0IGZvcndhcmQsIGlzbid0IGl0Pw0K
PiA+DQo+ID4gSW4geW91ciB0cmFuc2xhdGlvbiwgbW9zdCBvZiB0aGUgc2VudGVuY2UgaXMgc2F5
aW5nICJ3aGV0aGVyIHlvdSBoYXZlIGRvbmUiDQo+ID4gb3IgICJIYXZlIHlvdSBkb25lIHNvbWV0
aGluZyIgaW4gSmFwYW5lc2UuIFRob3NlIGFyZSBhc2tpbmcgZWFjaCBpdGVtDQo+ID4gdG8gdGhl
IHJlYWRlcnMgYXMgYSByZXN1bHQuDQo+ID4gSG93ZXZlciwgdGhlIG9yaWdpbmFsIHRleHQgaXMg
bm90IGFza2luZyB0aGUgcmVhZGVycy4gVGhhdCBpcyB3aGF0IEkNCj4gPiBwb2ludGVkIG91dC4N
Cj4gPiBJIGZlZWwgd2UsIG9wZW4gc291cmNlIGRldmVsb3BlcnMsIGFyZSBoaXN0b3JpY2FsbHkg
d29ya2luZyBmb3IgdGhlaXINCj4gPiBvd24gbW90aXZhdGlvbnMuDQo+ID4gU28sIHRoaXMgY2hl
Y2tsaXN0IHdvdWxkIGJlIHdyaXR0ZW4gZm9yIHRoZSBkZXZlbG9wZXJzIGZvciB0aGVpciBzZWxm
DQo+ID4gY2hlY2tpbmcgcHVycG9zZS4NCj4gPiBUaGF0IGlzIHRoZSByZWFzb24sIHRoZSBsaXN0
IGlzIGp1c3Qgc2F5aW5nICJEbyBzb21ldGhpbmciIGFuZCBpdA0KPiA+IGJlY2FtZSB0aGUgVE9E
TyBsaXN0Li4NCj4gPiBJdCBpcyBub3QgIkhhdmUgeW91IGRvbmUgc29tZXRoaW5nIiBiZWNhdXNl
IHRoYXQgc291bmRzIGxpa2UgIkFub3RoZXINCj4gPiBwZXJzb24gaXMgYXNraW5nIHlvdSINCj4g
PiBhbmQgdGhhdCdzIG5vdCBwcmVmZXJhYmxlIGZvciB0aGUgZGV2ZWxvcGVycyBpbiBteSBvcGlu
aW9uLg0KPiA+IEkgcmVhbGx5IGhvcGUgdGhhdCBraW5kIG9mIG5vbi13cml0dGVuIHVuZGVyc3Rh
bmRpbmcgd291bGQgYmUgaW5jbHVkZWQNCj4gPiBldmVuIGluIHRyYW5zbGF0ZWQgZG9jdW1lbnRz
Lg0KPg0KPiBUaGFuayB5b3UgZm9yIGVsYWJvcmF0aW5nLg0KPg0KPiBTbywgeW91IHJlYWQgYXV0
aG9yaXRhdGl2ZSB0b25lL251YW5jZSBpbiBteSB0cmFuc2xhdGlvbi4NCj4NCj4gTGV0IG1lIHNl
ZSAuLi4NCj4NCj4gWW91IHN1Z2dlc3RlZCBhIGNoYW5nZSBmcm9tOg0KPg0KPiArMSkg5Yip55So
44GX44Gm44GE44KL5qmf6IO944Gr44Gk44GE44Gm44CB44Gd44Gu5qmf6IO944GM5a6a576p44O7
5a6j6KiA44GV44KM44Gm44GE44KL44OV44Kh44Kk44Or44KSDQo+ICsgICBgYCNpbmNsdWRlYGAg
44GX44Gf44GL44CCDQo+DQo+IHRvDQo+DQo+ICsxKSDliKnnlKjjgZfjgabjgYTjgovmqZ/og73j
gavjgaTjgYTjgabjgIHjgZ3jga7mqZ/og73jgYzlrprnvqnjg7vlrqPoqIDjgZXjgozjgabjgYTj
govjg5XjgqHjgqTjg6vjgpINCj4gKyAgIGBgI2luY2x1ZGVgYCDjgZnjgovjgZPjgajjgIINCj4N
Cj4gQWN0dWFsbHksIEkgZG9uJ3Qgc2VlIG11Y2ggZGlmZmVyZW5jZSBpbiB0aGUgbnVhbmNlL3Rv
bmUgYmV0d2VlbiB0aGVtLg0KDQpGaXJzdCBvbmUgaXMgYSBzdHJvbmdlciBxdWVzdGlvbiB0aGFu
IHRoZSBzZWNvbmQgb25lLCBJIGZlZWwuDQpTbywgdGhlIGxvbmcgbGlzdCBvZiBzdHJvbmdlciBx
dWVzdGlvbnMgaXMgYmVjb21pbmcgYSBwcmVzc3VyZSB0byB0aGUNCmRldmVsb3BlcnMuDQoNCj4g
44CM44Cc44GZ44KL44GT44Go44CNIGlzIHNvbWV0aW1lcyB1c2VkIHRvIGluZGljYXRlIGF1dGhv
cml0YXRpdmUgb3JkZXJpbmcuDQo+DQo+IEZvciBleGFtcGxlLCAiWW91IHNob3VsZCB0ZXN0IGJv
dGggb2YgY2FzZXMgQSBhbmQgQi4iIGNhbiBiZSB0cmFuc2xhdGVkIGludG8NCj4NCj4gICAgIEEg
44GoIEIg44Gu5Lih5pa544KS44OG44K544OI44GZ44KL44GT44Go44CCDQo+DQo+ICwgYW5kIHRo
aXMgY2FuIGJlIHRyYW5zbGF0ZWQgYmFjayBpbnRvOg0KPg0KPiAgICAgSSBhc2sgeW91IHRvIHRl
c3QgYm90aCBvZiBjYXNlcyBBIGFuZCBCLg0KPg0KPiAsIGRlcGVuZGluZyBvbiBjb250ZXh0cy4N
Cj4NCj4gSW5zdGVhZCwgaWYgeW91IGp1c3Qgc2F5IHdpdGhvdXQg44CM44GT44Go44CNOg0KPg0K
PiAgICAgQSDjgaggQiDjga7kuKHmlrnjgpLjg4bjgrnjg4jjgZnjgovjgIINCj4NCj4gaW4gYSBs
aXN0IG9mIHdoYXQgdG8gZG8sIGNoYW5jZXMgb2Ygc3VjaCBhbiBpbnRlcnByZXRhdGlvbiBjYW4g
YmUNCj4gcmVkdWNlZC4NCj4NCj4gRG8geW91IHByZWZlciB0aGlzIGFwcHJvYWNoPw0KDQpZZWFo
LCBUaGlzIGxvb2tzIGJldHRlciB0aGFuIG15IG9waW5pb24uDQoNCj4gRm9sbG93aW5nIGRpZmYg
KG9uIHRvcCBvZiBwYXRjaCAxLzIpIGlzIG15IGF0dGVtcHQgdG8gYWRkcmVzcyB5b3VyDQo+IGNv
bmNlcm4gZm9yIHRoZSBmaXJzdCB0aHJlZSBpdGVtcyBpbiB0aGUgY2hlY2tsaXN0Og0KPg0KPiBI
ZXJlLCBJIGNoYW5nZWQgZWFjaCBzZW50ZW5jZSB0byBoYXZlICJwYXRjaCBvciBjaGFuZ2UgaW4g
dGhlIHBhdGNoIiBhcw0KPiBpdHMgaW1wbGljaXQgc3ViamVjdCBvciAi5Li76KqeIiwgYW5kIGRl
c2NyaWJlIGl0cyBwcmVmZXJyZWQgc3RhdGUuDQo+DQo+ICDjgrPjg7zjg4njga7jg6zjg5Pjg6Xj
g7wNCj4gID09PT09PT09PT09PT09PT0NCj4NCj4gLTEpIOWIqeeUqOOBl+OBpuOBhOOCi+apn+iD
veOBq+OBpOOBhOOBpuOAgeOBneOBruapn+iDveOBjOWumue+qeODu+Wuo+iogOOBleOCjOOBpuOB
hOOCi+ODleOCoeOCpOODq+OCkg0KPiAtICAgYGAjaW5jbHVkZWBgIOOBl+OBn+OBi+OAgg0KPiAt
ICAg5LuW44Gu44OY44OD44OA44O844OV44Kh44Kk44Or57WM55Sx44Gn44Gu5Y+W44KK6L6844G/
44Gr5L6d5a2Y44GX44Gq44GE44GT44Go44CCDQo+ICsxKSDliKnnlKjjgZnjgovmqZ/og73jgavj
gaTjgYTjgabjgIHjgZ3jga7mqZ/og73jgpLlrprnvqnjg7vlrqPoqIDjgZfjgabjgYTjgovjg5Xj
gqHjgqTjg6vjgpINCj4gKyAgIGBgI2luY2x1ZGVgYCDjgZfjgabjgYTjgovjgIINCj4gKyAgIOS7
luOBruODmOODg+ODgOODvOODleOCoeOCpOODq+e1jOeUseOBp+OBruWPluOCiui+vOOBv+OBq+S+
neWtmOOBl+OBquOBhOOAgg0KPg0KPiAgMikgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1z
dHlsZS5yc3Qg44Gr6Kmz6L+w44GV44KM44Gm44GE44KL5LiA6Iis55qE44Gq44K544K/44Kk44Or
DQo+IC0gICDjgavjgaTjgYTjgabjg4Hjgqfjg4Pjgq/jgZfjgZ/jgYvjgIINCj4gKyAgIOOBq+OB
pOOBhOOBpuODgeOCp+ODg+OCr+a4iOOBv+OAgg0KPg0KPiAtMykg44GZ44G544Gm44Gu44Oh44Oi
44Oq44OQ44Oq44Ki44O8ICjkvossIGBgYmFycmllcigpYGAsIGBgcm1iKClgYCwgYGB3bWIoKWBg
KSDjgavjgIENCj4gLSAgIOOBneOBruS9nOeUqOOBqOebrueahOOAgeWPiuOBs+W/heimgeeQhueU
seOBq+OBpOOBhOOBpuOCveODvOOCueOCs+ODvOODieWGheOBq+OCs+ODoeODs+ODiOOBl+OBn+OB
i+OAgg0KPiArMykg44Oh44Oi44Oq44OQ44Oq44Ki44O8ICjkvossIGBgYmFycmllcigpYGAsIGBg
cm1iKClgYCwgYGB3bWIoKWBgKSDjgavjgaTjgYTjgabjgIENCj4gKyAgIOOBneOBruS9nOeUqOOB
qOebrueahOOAgeWPiuOBs+W/heimgeeQhueUseOBq+OBpOOBhOOBpuiqrOaYjuOBmeOCi+OCs+OD
oeODs+ODiOOBjOOAgeOCveODvOOCueOCs+ODvOODieWGhQ0KPiArICAg44Gr44GZ44G544Gm5LuY
44GE44Gm44GE44KL44CCDQo+DQo+IERvIHRoZXkgc291bmQgYmV0dGVyL2FjY2VwdGFibGUgdG8g
eW91Pw0KDQpUaGlzIGxvb2tzIGdvb2QgdG8gbWUhDQoNCj4gWy4uLl0NCj4gPiBGYXVsdCBpbmpl
Y3Rpb24gb24gTGludXggd2FzIGRldmVsb3BlZCBhbmQgY29udHJpYnV0ZWQgYnkgQWtpbm9idQ0K
PiA+IE1pdGEsIGEgSmFwYW5lc2UgZ3V5Lg0KPiA+IEhlIHNwb2tlIGFib3V0IGl0IGF0IHRoZSBK
YXBhbiBMaW51eCBTeW1wb3NpdW0gaW4gMjAwNy4NCj4gPiBJbiB0aGF0IHRpbWUsIHdlIGhhdmUg
ZGlzY3Vzc2VkIGhvdyAiZmF1bHQgaW5qZWN0aW9uIiBjYW4gYmUNCj4gPiBjYWxsZWQvdHJhbnNs
YXRlZCBpbnRvIEphcGFuZXNlIGxhbmd1YWdlLg0KPiA+IEFzIGEgcmVzdWx0LCBoZSBjaG9zZSBq
dXN0ICJGYXVsdCBJbmplY3Rpb24iIGluIEVuZ2xpc2gsIG5vdCB1c2luZw0KPiA+IEphcGFuZXNl
IEthbmppIG9yIEthdGFrYW5hLg0KPiA+IFlvdSBjYW4gc2VlIGhpcyBwcmVzZW50YXRpb24gYXQN
Cj4gPiBodHRwczovL3d3dy5zdGF0aWMubGludXhmb3VuZC5vcmcvanBfdXBsb2Fkcy9zZW1pbmFy
MjAwNzA3MTAvTGludXhGYXVsdEluamVjdGlvbi0yLnBkZg0KPg0KPiBHb29kIHRvIGtub3cgSSdt
IG5vdCBhbG9uZSBpbiBkaXNsaWtpbmcgdHJhbnNsaXRlcmF0aW9uIG9mIHRoZSB0ZXJtIQ0KPg0K
PiA+IFdpdGggcmVzcGVjdCB0byBoaW0sIEkgd291bGQgcmVjb21tZW5kIHVzaW5nIEVuZ2xpc2gg
IkZhdWx0IEluamVjdGlvbiINCj4gPiBpbnN0ZWFkIG9mIEphcGFuZXNlIHdvcmRzLiBJIGhvcGUg
dGhpcyBtYXkgYmUgYSBnb29kIHNvbHV0aW9uLg0KPiA+IChJIGZvdW5kIHRoZSBuYW1lIG9mIEpv
bmF0aGFuIENvcmJldCBhdCB0aGUgc3ltcG9zaXVtIGFuZCBzYXcgUmFuZHkgYXQNCj4gPiB0aGUg
cHJldmlvdXMgZXZlbnQgOi0pDQo+ID4NCj4NCj4gU28gaG93IGFib3V0IHRoZSBmb2xsb3dpbmc/
DQo+DQo+ICAgNCkg5pyA5L2O6ZmQ44CBc2xhYiDjgagg44Oa44O844K444O744Ki44Ot44Kx44O8
44K344On44Oz44Gu5aSx5pWX44Gr6Zai44GZ44KL6Kqk44KK5rOo5YWlDQo+ICAgICAgKOios+io
uzogZmF1bHQgaW5qZWN0aW9uKSDjgavjgojjgovjg4Hjgqfjg4Pjgq/muIjjgb/jgIINCj4NCj4g
VGhpcyBzdGlsbCBkaXZlcmdlcyBzbGlnaHRseSBmcm9tIGl0cyBFbmdsaXNoIGNvdW50ZXJwYXJ0
IG9mOg0KPg0KPiAgIDQpIEhhcyBiZWVuIGNoZWNrZWQgd2l0aCBpbmplY3Rpb24gb2YgYXQgbGVh
c3Qgc2xhYiBhbmQgcGFnZS1hbGxvY2F0aW9uDQo+ICAgICAgZmFpbHVyZXMuDQoNCkFnYWluLCBM
b29rcyBnb29kIG5vdy4NCg0KPiAsIHRob3VnaCAuLi4NCj4NCj4gVHJhbnNsYXRpb24gaXMgaGFy
ZCEhDQoNClRoYW5rcywNClRzdWdpa2F6dSBTaGliYXRhDQo=


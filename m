Return-Path: <linux-doc+bounces-25394-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E797B736
	for <lists+linux-doc@lfdr.de>; Wed, 18 Sep 2024 06:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6241F22F5D
	for <lists+linux-doc@lfdr.de>; Wed, 18 Sep 2024 04:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C77136326;
	Wed, 18 Sep 2024 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsPsyx32"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45046FC5;
	Wed, 18 Sep 2024 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726633220; cv=none; b=F6iLlSlqUO/fCJk650uHTkEkDHAN3ybwgEV4FuDDwY2waiglvPl2PzeepanuMb2KVz0p808DtHCfADS2MvoidxVVR114iY3TIJzHjkfwunS9szeiXJ8XRXl1Yosmi8WtEN/IKYbm5anFSUnITZ5W+zS+dtOR3C36OGDjwdNaRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726633220; c=relaxed/simple;
	bh=EdOWvkN3wTq04++10gyJ0cVfBOvIMoYIcCvgwQCQH1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNIY1Xx0wjAmubSosCPAswY1x/NqSzWPnjVovmzDou6dSRc49OI0wEQz1692mUJLWhSqD0CKqKBgmj8N4rTp4JYEGWD2kTtxs8NCKtACuJVvorobFP61O4whikSB7uuOm67VZmUZykodYapr9SzQSL5z10/RZfyEPl3CLmvieCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsPsyx32; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2689e7a941fso3242664fac.3;
        Tue, 17 Sep 2024 21:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726633218; x=1727238018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdOWvkN3wTq04++10gyJ0cVfBOvIMoYIcCvgwQCQH1s=;
        b=UsPsyx32L4mrhIywwE1AO+AKCclnwm4m7LHOqW8BguSXdyqXUqJeYZraQaqBzRMmfm
         0DDVL2tNCcwpwRYCkagL8hwiKgxTfBumVsJjOthxef4H6bPlORbj8DcRo1YoFK7kXpsU
         1jniR9wG5CrE7IJQ1UGhzG5MNk1Cle4DkN2iUjXibfhMOPMKic4gYlZ2I5XzJhxKJ+mS
         Sp+GeFrubTHToJQBGzPrz44Ukk1DDHkdFInaDvg4b/2paUl6XdatCLhaddVmpzr8YIFa
         Ap8qdzYPygX9FkpViwn7ljSscGRmufNZLwudfWb23ZdSFvEiNza62Qr9ceWmOICfFvPi
         DtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726633218; x=1727238018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdOWvkN3wTq04++10gyJ0cVfBOvIMoYIcCvgwQCQH1s=;
        b=newDr/LcSehEzrnAqZPD91GNmfEtxdn7V8x+OxM2IgsB978ELZYDjq49l2eNU8SN+i
         9jNlXi5ndrIWZVvr7+mUzv/JjmkIk21n2j916V07/CFdN4ePWmmRl0Ad1zhpBw/TsLOu
         XlmbqCNalfTRN/4s5vQXOp0d5gAhMitQPM0ktZ3DOH/H2rpelaYJotmGig5Zfhc5/g6l
         iVmBlY531kE864fc4O7GVzrgpFZQE8OnR29eWG6+oJTGlu++jm00kcAyS5C3iwHLMCVb
         5rUmYkr+9iK6sX7y/6IQHYIjqRiu/xHZFbvDNvZAL0euE1jDlyeLsIdiKiYlXMnXyl2n
         2KqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjn1sWXn5cckLR6wpLpTJh+VRNDu4wbn92X/TSvNHZfEi5eHEMymUKLqeD12oBa9PP/UQIJp/+BT1nQhux@vger.kernel.org, AJvYcCWd2dfvbT0efXob7M5CRzowN7YPZUoeFueQhf3DbAcnaDJ1r3DN/xfQ+jqmha/fykEjE0j4sSGqcdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmW8DnceWZ5fVFnzkDHeEp7fVz5atvuMbJfR8uUgU/RxpQymIw
	UstIxzwT1w2Q0yDeCKuN7t3f5r/15ER/Wngl81Uqzfyxl9KmrNEsuUIsV+6Ma8EIKsQYAMqBc9A
	bXSnFUUAVh8HJiGyaLzKaPe0CHVk=
X-Google-Smtp-Source: AGHT+IFRwHF+S00cGu4nFREaFSc5ISOZdUzjIE/gLkMy+EdYULzgfkgp/sBb9vW1foOS1Hb64PvY4G2tUZElUzTkOgc=
X-Received: by 2002:a05:6870:20c:b0:270:2c3:f362 with SMTP id
 586e51a60fabf-27c3f66f419mr12107644fac.32.1726633217565; Tue, 17 Sep 2024
 21:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918100712484feE1sZoJLFvOnK2pB5LqQ@zte.com.cn> <41b27a38-37b8-4411-adf9-2870cccf8878@gmail.com>
In-Reply-To: <41b27a38-37b8-4411-adf9-2870cccf8878@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 18 Sep 2024 12:19:50 +0800
Message-ID: <CAD-N9QWJL8xmyLXi+D1gm5fXX-9DcjuzGv=pW=oQyJyXc=GfqA@mail.gmail.com>
Subject: Re: [PATCH v3] Docs/zh_CN: Translate physical_memory.rst to
 Simplified Chinese
To: Alex Shi <seakeel@gmail.com>
Cc: jiang.kun2@zte.com.cn, alexs@kernel.org, siyanteng@loongson.cn, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, xu.xin16@zte.com.cn, 
	he.peilin@zte.com.cn, tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, 
	zhang.yunkai@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgMTgsIDIwMjQgYXQgMTE6NDHigK9BTSBBbGV4IFNoaSA8c2Vha2VlbEBnbWFp
bC5jb20+IHdyb3RlOg0KPg0KPg0KPiBPbiA5LzE4LzI0IDEwOjA3IEFNLCBqaWFuZy5rdW4yQHp0
ZS5jb20uY24gd3JvdGU6DQo+ID4gRnJvbTogWWF4aW4gV2FuZyA8d2FuZy55YXhpbkB6dGUuY29t
LmNuPg0KPiA+IFRoaXMgcGF0Y2ggdHJhbnNsYXRlcyB0aGUgInBoeXNpY2FsX21lbW9yeS5yc3Qi
IGRvY3VtZW50IGludG8NCj4gPiBTaW1wbGlmaWVkIENoaW5lc2UgdG8gaW1wcm92ZSBhY2Nlc3Np
YmlsaXR5IGZvciBDaGluZXNlLXNwZWFraW5nDQo+ID4gZGV2ZWxvcGVycyBhbmQgdXNlcnMuDQo+
ID4NCj4gPiBUaGUgdHJhbnNsYXRpb24gd2FzIGRvbmUgd2l0aCBhdHRlbnRpb24gdG8gdGVjaG5p
Y2FsIGFjY3VyYWN5DQo+ID4gYW5kIHJlYWRhYmlsaXR5LCBlbnN1cmluZyB0aGF0IHRoZSBkb2N1
bWVudCByZW1haW5zIGluZm9ybWF0aXZlDQo+ID4gYW5kIHVzZWZ1bCBpbiBpdHMgdHJhbnNsYXRl
ZCBmb3JtLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWF4aW4gV2FuZyA8d2FuZy55YXhpbkB6
dGUuY29tLmNuPg0KPg0KPiBJIGZhaWxlZCB0byBhcHBseSB0aGlzIHBhdGNoIG9uIGxpbnVzL21h
c3RlciBvciBuZXh0L21hc3RlciBicmFuY2gsDQo+IElzIGl0IG9rIG9uIHlvdXIgc2lkZT8NCg0K
SSBjYW5ub3QgYXBwbHkgdGhpcyBwYXRjaCB0byBsd24gcmVwb3NpdG9yeSBuZWl0aGVyLiBZYXhp
biwgcGxlYXNlDQpkb3VibGUgY2hlY2sgeW91ciBjb2RlIGJhc2UgdXNlZCB0byBnZW5lcmF0ZSBw
YXRjaGVzLg0KDQpEb25nbGlhbmcgTXUNCg0KPg0KPiBBbmQgY291bGQgeW91IHBsZWFzZSBhZGp1
c3QgeW91ciBjb250ZXh0IGFsaWdubWVudCwgbWFrZSBpdCBtb3JlIG5lYXQ/DQo+DQo+IFRoYW5r
cw0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiBTb21lIGZpeGVzIGFjY29yZGluZyB0bzoNCj4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNmFkODdkNWYtYTFjNi00ZDQxLTljYTQtNDFi
ZDg0OTA3NDYzQGxpbnV4LmRldi8NCj4gPiAxLiBhZGRlZCB0aGUgaW5kZXggZm9yIHBoeXNpY2Fs
X21lbW9yeS5yc3QgaW4gdGhlIGluZGV4LnJzdC4NCj4gPiAyLiBjaGFuZ2VkIHRoZSBzdWJqZWN0
IHByZWZpeCBpbnRvICZhcG9zO0RvY3MvemhfQ046IFRyYW5zbGF0ZSBwaHlzaWNhbF9tZW1vcnku
cnN0DQo+ID4gdG8gU2ltcGxpZmllZCZhcG9zOyBpbnN0ZWFkIG9mICZhcG9zO0RvY3VtZW50YXRp
b24vbW06IFRyYW5zbGF0ZSBwaHlzaWNhbF9tZW1vcnkucnN0IHRvIFNpbXBsaWZpZWQmYXBvczsN
Cj4gPiAzLiB0aGlzIHBhZ2UgZGlzcGxheSBjb3JyZWN0bHkgaW4gYSB3ZWIgYnJvd3NlciBhZnRl
ciBydW5uaW5nIHRoZSAmYXBvczttYWtlIGh0bWxkb2NzJmFwb3M7Lg0KPiA+DQo+ID4gRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbW0vaW5kZXgucnN0IHwgICAxICsNCj4gPiAuLi90
cmFuc2xhdGlvbnMvemhfQ04vbW0vcGh5c2ljYWxfbWVtb3J5LnJzdCB8IDMzMCArKysrKysrKysr
KysrKysrKysNCj4gPiAyIGZpbGVzIGNoYW5nZWQsIDMzMSBpbnNlcnRpb25zKCspDQo+ID4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21tL3BoeXNp
Y2FsX21lbW9yeS5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9tbS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9tbS9pbmRleC5yc3QNCj4gPiBpbmRleCBiOTUwZGQxMThiZTcuLmVhYzIwYTdlYzlhNiAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tbS9pbmRl
eC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tbS9pbmRl
eC5yc3QNCj4gPiBAQCAtNTMsNiArNTMsNyBAQCBMaW51eOWGheWtmOeuoeeQhuaWh+ahow0KPiA+
IHBhZ2VfbWlncmF0aW9uDQo+ID4gcGFnZV9vd25lcg0KPiA+IHBhZ2VfdGFibGVfY2hlY2sNCj4g
PiArICAgcGh5c2ljYWxfbWVtb3J5DQo+ID4gcmVtYXBfZmlsZV9wYWdlcw0KPiA+IHNwbGl0X3Bh
Z2VfdGFibGVfbG9jaw0KPiA+IHZtYWxsb2NlZC1rZXJuZWwtc3RhY2tzDQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21tL3BoeXNpY2FsX21lbW9yeS5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tbS9waHlzaWNhbF9tZW1vcnku
cnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdk
OWY0YzEyMTQ2YQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9tbS9waHlzaWNhbF9tZW1vcnkucnN0DQo+ID4gQEAgLTAsMCArMSwz
MzAgQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+
ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9y
aWdpbmFsOiBEb2N1bWVudGF0aW9uL21tL3BoeXNpY2FsX21lbW9yeS5yc3QNCj4gPiArDQo+ID4g
Kzrnv7vor5E6DQo+ID4gKw0KPiA+ICsgICDnjovkuprpkasgWWF4aW4gV2FuZyA8d2FuZy55YXhp
bkB6dGUuY29tLmNuPg0KPiA+ICsNCj4gPiArPT09PT09PT0NCj4gPiAr54mp55CG5YaF5a2YDQo+
ID4gKz09PT09PT09DQo+ID4gKw0KPiA+ICtMaW51eOWPr+eUqOS6juWkmuenjeaetuaehO+8jOWb
oOatpOmcgOimgeS4gOS4quS4juaetuaehOaXoOWFs+eahOaKveixoeadpeihqOekuueJqeeQhuWG
heWtmOOAguacrOeroOaPj+i/sOS6hueuoeeQhui/kOihjOezu+e7nw0KPiA+ICvkuK3niannkIbl
hoXlrZjnmoTnu5PmnoTjgIINCj4gPiArDQo+ID4gK+esrOS4gOS4quS4juWGheWtmOeuoeeQhueb
uOWFs+eahOS4u+imgeamguW/teaYr2DpnZ7kuIDoh7TmgKflhoXlrZjorr/pl64oTlVNQSkNCj4g
PiArPGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL05vbi11bmlmb3JtX21lbW9yeV9hY2Nl
c3M+YA0KPiA+ICsNCj4gPiAr5Zyo5aSa5qC45ZKM5aSa5o+S5qe95py65Zmo5Lit77yM5YaF5a2Y
5Y+v6IO96KKr57uE57uH5oiQ5LiN5ZCM55qE5a2Y5YKo5Yy677yM6L+Z5Lqb5a2Y5YKo5Yy65qC5
5o2u5LiO5aSE55CG5Zmo55qEDQo+ID4gK+KAnOS4jeWQjOKAneiAjOacieS4jeWQjOeahOiuv+mX
ruW8gOmUgOOAguS+i+Wmgu+8jOWPr+iDveS4uuavj+S4qkNQVeWIhumFjeWGheWtmOWtmOWCqOWM
uu+8jOaIluiAheS4uuWkluWbtOiuvuWkhw0KPiA+ICvlnKjpmYTov5HliIbphY3kuIDkuKrpnZ7l
uLjpgILlkIhETUHnmoTlhoXlrZjlrZjlgqjljLrjgIINCj4gPiArDQo+ID4gK+avj+S4quWtmOWC
qOWMuuiiq+ensOS4uuS4gOS4quiKgueCue+8jOiKgueCueWcqExpbnV45Lit6KGo56S65Li6IGBg
c3RydWN0IHBnbGlzdF9kYXRhYGDvvIzljbPkvb/mmK/lnKhVTUHmnrbmnoTkuK0NCj4gPiAr5Lmf
5piv6L+Z5qC36KGo56S644CC6K+l57uT5p6E5oC75piv6YCa6L+HIGBgcGdfZGF0YV90YGAg5p2l
5byV55So44CC54m55a6a6IqC54K555qEIGBgcGdfZGF0YV90YGAg57uT5p6E5L2T5Y+v5Lul6YCa
6L+HDQo+ID4gK05PREVfREFUQShuaWQp5byV55So77yM5YW25Litbmlk6KKr56ew5Li66K+l6IqC
54K555qESUTjgIINCj4gPiArDQo+ID4gK+WvueS6jumdnuS4gOiHtOaAp+WGheWtmOiuv+mXru+8
iE5VTUHvvInmnrbmnoTvvIzoioLngrnmlbDmja7nu5PmnoTlnKjlvJXlr7zml7bnlLHnibnlrprk
uo7mnrbmnoTnmoTku6PnoIHml6nmnJ/liIbphY3jgILpgJrluLjvvIzov5nkupsNCj4gPiAr57uT
5p6E5Zyo5LuW5Lus5omA5Zyo55qE5YaF5a2Y5Yy65LiK5pys5Zyw5YiG6YWN44CC5a+55LqO5LiA
6Ie05oCn5YaF5a2Y6K6/6Zeu77yIVU1B77yJ5p625p6E77yM5Y+q5L2/55So5LiA5Liq6Z2Z5oCB
55qEIGBgcGdfZGF0YV90YGANCj4gPiAr57uT5p6E5L2T77yM56ew5Li6IGBgY29udGlnX3BhZ2Vf
ZGF0YWBg44CC6IqC54K55bCG5Lya5ZyoIDpyZWY6YOiKgueCuSA8bm9kZXM+YCDnq6DoioLkuK3o
v5vkuIDmraXorqjorrrjgIINCj4gPiArDQo+ID4gK+aVtOS4queJqeeQhuWGheWtmOiiq+WIkuWI
huS4uuS4gOS4quaIluWkmuS4quiiq+ensOS4uuWMuuWfn+eahOWdl++8jOi/meS6m+WMuuWfn+ih
qOekuuWGheWtmOeahOiMg+WbtOOAgui/meS6m+iMg+WbtOmAmuW4uOeUseiuv+mXruWGheWtmA0K
PiA+ICvnmoTmnrbmnoTpmZDliLbmnaXlhrPlrprjgILlnKjoioLngrnlhoXvvIzkuI7nibnlrprl
jLrln5/lr7nlupTnmoTlhoXlrZjojIPlm7TnlLEgYGBzdHJ1Y3Qgem9uZWBgIOe7k+aehOS9k+aP
j+i/sO+8jOivpee7k+aehOiiq+WumuS5ieS4ug0KPiA+ICtgYHpvbmVfdGBg77yM5q+P56eN5Yy6
5Z+f6YO95bGe5LqO5Lul5LiL5o+P6L+w57G75Z6L55qE5LiA56eN44CCDQo+ID4gKw0KPiA+ICsq
IGBgWk9ORV9ETUFgYCDlkowgYGBaT05FX0RNQTMyYGAg5Zyo5Y6G5Y+y5LiK5Luj6KGo6YCC55So
5LqORE1B55qE5YaF5a2Y77yM6L+Z5Lqb5YaF5a2Y55Sx6YKj5Lqb5LiN6IO96K6/6Zeu5omADQo+
ID4gKyAg5pyJ5Y+v5a+75Z2A5YaF5a2Y55qE5aSW6K6+6K6/6Zeu44CC5aSa5bm05p2l77yM5bey
57uP5pyJ5LqG5pu05aW944CB5pu056iz5Zu655qE5o6l5Y+j5p2l6I635Y+W5ruh6Laz54m55a6a
RE1B6ZyA5rGC55qE5YaF5a2Y77yI6L+Z5LqbDQo+ID4gKyAg5o6l5Y+j55SxIERvY3VtZW50YXRp
b24vY29yZS1hcGkvZG1hLWFwaS5yc3Qg5paH5qGj5o+P6L+w77yJ77yM5L2G5pivIGBgWk9ORV9E
TUFgYCDlkowgYGBaT05FX0RNQTMyYGANCj4gPiArICDku43nhLbooajnpLrorr/pl67lj5fpmZDn
moTlhoXlrZjojIPlm7TjgIINCj4gPiArDQo+ID4gK+WPluWGs+S6juaetuaehOeahOS4jeWQjO+8
jOi/meS4pOenjeWMuuWfn+WPr+S7peWcqOaehOW7uuaXtumAmui/h+WFs+mXrSBgYENPTkZJR19a
T05FX0RNQWBgIOWSjCBgYENPTkZJR19aT05FX0RNQTMyYGAg6YWN572u6YCJ6aG5DQo+ID4gK+ad
peemgeeUqOOAguS4gOS6mzY05L2N55qE5bmz5Y+w5Y+v6IO96ZyA6KaB6L+Z5Lik56eN5Yy65Z+f
77yM5Zug5Li65LuW5Lus5pSv5oyB5YW35pyJ5LiN5ZCMRE1B5a+75Z2A6ZmQ5Yi255qE5aSW6K6+
44CCDQo+ID4gKw0KPiA+ICsqIGBgWk9ORV9OT1JNQUxgYCDmmK/mma7pgJrlhoXlrZjnmoTljLrl
n5/vvIzov5nnp43lhoXlrZjlj6/ku6XooqvlhoXmoLjpmo/ml7borr/pl67jgILlpoLmnpxETUHo
rr7lpIfmlK/mjIHlsIYNCj4gPiArICDmlbDmja7kvKDovpPliLDmiYDmnInlj6/lr7vlnYDnmoTl
hoXlrZjljLrln5/vvIzpgqPkuYjlj6/ku6XlnKjor6XljLrln5/nmoTpobXpnaLkuIrmiafooYxE
TUHmk43kvZzjgIIgYGBaT05FX05PUk1BTGBgIOaAu+aYr+W8gOWQr+eahOOAgg0KPiA+ICsNCj4g
PiArKiBgYFpPTkVfSElHSE1FTWBgIOaYr+aMh+mCo+S6m+ayoeacieWcqOWGheaguOmhteihqOS4
reawuOS5heaYoOWwhOeahOeJqeeQhuWGheWtmOmDqOWIhuOAguivpeWMuuWfn+eahOWGheWtmOWP
quiDvQ0KPiA+ICsgIOmAmui/h+S4tOaXtuaYoOWwhOiiq+WGheaguOiuv+mXruOAguivpeWMuuWf
n+WPquWcqOafkOS6mzMy5L2N5p625p6E5LiK5Y+v55So77yM5bm25LiU5piv6YCa6L+HIGBgQ09O
RklHX0hJR0hNRU1gYCDpgInpobnlvIDlkK/jgIINCj4gPiArDQo+ID4gKyogYGBaT05FX01PVkFC
TEVgYCDmmK/nlKjkuo7lj6/orr/pl67nmoTmma7pgJrlhoXlrZjljLrln5/vvIzlsLHlg48gYGBa
T05FX05PUk1BTGBgIOS4gOagt+OAguS4jeWQjOS5i+WkhOWcqOS6jg0KPiA+ICsgIGBgWk9ORV9N
T1ZBQkxFYGAg5Lit55qE5aSn5aSa5pWw6aG16Z2i5YaF5a655piv5Y+v56e75Yqo55qE44CC6L+Z
5oSP5ZGz552A6L+Z5Lqb6aG16Z2i55qE6Jma5ouf5Zyw5Z2A5LiN5Lya5pS55Y+Y77yMDQo+ID4g
KyAg5L2G5a6D5Lus55qE5YaF5a655Y+v6IO95Lya5Zyo5LiN5ZCM55qE54mp55CGIOmhtemdouS5
i+mXtOenu+WKqOOAgumAmuW4uO+8jOWcqOWGheWtmOeDreaPkuaLlOacn+mXtOWhq+WFhSBgYFpP
TkVfTU9WQUJMRWBg77yMDQo+ID4gKyAg5Zyo5ZCv5Yqo5pe25Lmf5Y+v5Lul5L2/55SoIGBga2Vy
bmVsY29yZWBgIOOAgSBgYG1vdmFibGVjb3JlYGAg5ZKMIGBgbW92YWJsZV9ub2RlYGANCj4gPiAr
ICDov5nkupvlhoXmoLjlkb3ku6TooYzlj4LmlbDmnaXloavlhYXjgILmnInlhbPmm7TlpJror6bn
u4bkv6Hmga/vvIzor7flj4LpmIXlhoXmoLjmlofmoaMNCj4gPiArICBEb2N1bWVudGF0aW9uL21t
L3BhZ2VfbWlncmF0aW9uLnJzdCDlkowNCj4gPiArICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L21tL21lbW9yeS1ob3RwbHVnLnJzdOOAgg0KPiA+ICsNCj4gPiArKiBgYFpPTkVfREVWSUNFYGAg
6KGo56S65L2N5LqO6K+45aaC5oyB5LmF5oCn5YaF5a2Y77yIUE1FTe+8ieWSjOWbvuW9ouWkhOeQ
huWNleWFg++8iEdQVe+8ieetieiuvuWkh+S4iueahA0KPiA+ICsgIOWGheWtmOOAguWug+S4jlJB
TeWMuuWfn+exu+Wei+acieS4jeWQjOeahOeJueaAp++8jOW5tuS4lOWug+eahOWtmOWcqOaYr+S4
uuS6huaPkOS+myA6cmVmOmBzdHJ1Y3QgcGFnZTxQYWdlcz5gDQo+ID4gKyAg57uT5p6E5ZKM5YaF
5a2Y5pig5bCE5pyN5Yqh77yM5Lul5L6/6K6+5aSH6amx5Yqo56iL5bqP6IO96K+G5Yir54mp55CG
5Zyw5Z2A6IyD5Zu044CCIGBgWk9ORV9ERVZJQ0VgYCDpgJrov4fphY3nva7pgInpobkNCj4gPiAr
ICBgYENPTkZJR19aT05FX0RFVklDRWBgIOW8gOWQr+OAgg0KPiA+ICsNCj4gPiAr6ZyA6KaB5rOo
5oSP55qE5piv77yM6K645aSa5YaF5qC45pON5L2c5Y+q6IO95L2/55SoIGBgWk9ORV9OT1JNQUxg
YCDmnaXmiafooYzvvIzlm6DmraTlroPmmK/mgKfog73mnIDlhbPplK7ljLrln5/jgIINCj4gPiAr
5Yy65Z+f5ZyoIDpyZWY6YOWMuuWfnyA8em9uZXM+YCDoioLkuK3mnInmm7Tor6bnu4bnmoTorqjo
rrrjgIINCj4gPiArDQo+ID4gK+iKgueCueWSjOWMuuWfn+iMg+WbtOS5i+mXtOeahOWFs+ezu+eU
seWbuuS7tuaKpeWRiueahOeJqeeQhuWGheWtmOaYoOWwhOWGs+Wumu+8jOWPpuWkluS5n+eUseWG
heWtmOWvu+WdgOeahOaetuaehOe6puadnw0KPiA+ICvku6Xlj4rlhoXmoLjlkb3ku6TooYzkuK3n
moTmn5Dkupvlj4LmlbDlhrPlrprjgIINCj4gPiArDQo+ID4gK+S+i+Wmgu+8jOWcqOWFt+aciTJH
QiBSQU3nmoR4ODbnu5/kuIDlhoXlrZjmnrbmnoTvvIhVTUHvvInmnLrlmajkuIrov5DooYwzMuS9
jeWGheaguOaXtu+8jOaVtOS4quWGheWtmOWwhg0KPiA+ICvkvY3kuo7oioLngrkw77yM5bm25LiU
5bCG5pyJ5LiJ5Liq5Yy65Z+f77yaIGBgWk9ORV9ETUFgYOOAgSBgYFpPTkVfTk9STUFMYGAg5ZKM
IGBgWk9ORV9ISUdITUVNYGA6Og0KPiA+ICsNCj4gPiArICAwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMkcNCj4gPiArICArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsN
Cj4gPiArICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5vZGUgMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwNCj4gPiArICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiArDQo+ID4gKyAgMCAgICAgICAgIDE2
TSAgICAgICAgICAgICAgICAgICAgODk2TSAgICAgICAgICAgICAgICAgICAgICAgIDJHDQo+ID4g
KyAgKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rDQo+ID4gKyAgfCBaT05FX0RNQSB8ICAgICAgWk9ORV9OT1JNQUwgICAgICB8ICAg
ICAgIFpPTkVfSElHSE1FTSAgICAgICB8DQo+ID4gKyAgKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKw0KPiA+ICsNCj4g
PiAr5Zyo5YaF5qC45p6E5bu65pe25YWz6ZetIGBgWk9ORV9ETUFgYCDlvIDlkK8gYGBaT05FX0RN
QTMyYGDvvIzlubbkuJTlnKjlhbfmnIkxNkdCIFJBTeW5s+Wdh+WIhumFjeWcqOS4pOS4quiKgueC
uQ0KPiA+ICvkuIrnmoRhcm02NOacuuWZqOS4iu+8jOS9v+eUqCBgYG1vdmFibGVjb3JlPTgwJWBg
IOWPguaVsOWQr+WKqOaXtu+8jCBgYFpPTkVfRE1BMzJgYCDjgIENCj4gPiArYGBaT05FX05PUk1B
TGBgIOWSjCBgYFpPTkVfTU9WQUJMRWBgIOS9jeS6juiKgueCuTDvvIzogIwgYGBaT05FX05PUk1B
TGBgIOWSjA0KPiA+ICtgYFpPTkVfTU9WQUJMRWBgIOS9jeS6juiKgueCuTE6Og0KPiA+ICsNCj4g
PiArDQo+ID4gKyAxRyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOUcgICAgICAgICAg
ICAgICAgICAgICAgICAgMTdHDQo+ID4gKyAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKyAgfCAgICAgICAgICAgICAg
bm9kZSAwICAgICAgICAgICAgfCB8ICAgICAgICAgIG5vZGUgMSAgICAgICAgICB8DQo+ID4gKyAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rDQo+ID4gKw0KPiA+ICsgIDFHICAgICAgIDRHICAgICAgICA0MjAwTSAgICAgICAgICA5
RyAgICAgICAgICA5MzIwTSAgICAgICAgICAxN0cNCj4gPiArICArLS0tLS0tLS0tKy0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0rICstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSsNCj4gPiArICB8ICBE
TUEzMiAgfCAgTk9STUFMICB8ICBNT1ZBQkxFICB8IHwgICBOT1JNQUwgICB8ICAgTU9WQUJMRSAg
IHwNCj4gPiArICArLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0rICstLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLSsNCj4gPiArDQo+ID4gKw0KPiA+ICvlhoXlrZjlrZjlgqjljLrlj6/o
g73kvY3kuo7kuqTplJnnmoToioLngrnjgILlnKjkuIvpnaLnmoTkvovlrZDkuK3vvIzkuIDlj7B4
ODbmnLrlmajmnIkxNkdC55qEUkFN5YiG5biD5ZyoNOS4quWGheWtmOWtmOWCqOWMuuS4iu+8jOWB
tuaVsOe8luWPt+eahOWGheWtmOWtmOWCqOWMug0KPiA+ICvlsZ7kuo7oioLngrkw77yM5aWH5pWw
57yW5Y+355qE5YaF5a2Y5p2h5bGe5LqO6IqC54K5MTo6DQo+ID4gKw0KPiA+ICsgIDAgICAgICAg
ICAgICAgIDRHICAgICAgICAgICAgICA4RyAgICAgICAgICAgICAxMkcgICAgICAgICAgICAxNkcN
Cj4gPiArICArLS0tLS0tLS0tLS0tLSsgKy0tLS0tLS0tLS0tLS0rICstLS0tLS0tLS0tLS0tKyAr
LS0tLS0tLS0tLS0tLSsNCj4gPiArICB8ICAgIG5vZGUgMCAgIHwgfCAgICBub2RlIDEgICB8IHwg
ICAgbm9kZSAwICAgfCB8ICAgIG5vZGUgMSAgIHwNCj4gPiArICArLS0tLS0tLS0tLS0tLSsgKy0t
LS0tLS0tLS0tLS0rICstLS0tLS0tLS0tLS0tKyArLS0tLS0tLS0tLS0tLSsNCj4gPiArDQo+ID4g
KyAgMCAgIDE2TSAgICAgIDRHDQo+ID4gKyAgKy0tLS0tKy0tLS0tLS0rICstLS0tLS0tLS0tLS0t
KyArLS0tLS0tLS0tLS0tLSsgKy0tLS0tLS0tLS0tLS0rDQo+ID4gKyAgfCBETUEgfCBETUEzMiB8
IHwgICAgTk9STUFMICAgfCB8ICAgIE5PUk1BTCAgIHwgfCAgICBOT1JNQUwgICB8DQo+ID4gKyAg
Ky0tLS0tKy0tLS0tLS0rICstLS0tLS0tLS0tLS0tKyArLS0tLS0tLS0tLS0tLSsgKy0tLS0tLS0t
LS0tLS0rDQo+ID4gKw0KPiA+ICvlnKjov5nnp43mg4XlhrXkuIvvvIzoioLngrkw5bCG6KaG55uW
5LuOMOWIsDEyR0LnmoTlhoXlrZjojIPlm7TvvIzogIzoioLngrkx5bCG6KaG55uW5LuONEdC5Yiw
MTZHQueahOWGheWtmOiMg+WbtOOAgg0KPiA+ICsNCj4gPiArLi4gX25vZGVzOg0KPiA+ICsNCj4g
PiAr6IqC54K5DQo+ID4gKz09PT0NCj4gPiArDQo+ID4gK+ato+WmguaIkeS7rOaJgOaPkOWIsOea
hO+8jOWGheWtmOS4reeahOavj+S4quiKgueCuemDveeUsSBgYHBnX2RhdGFfdGBgIOaPj+i/sO+8
jOWug+aYr+eUsSBgYHN0cnVjdCBwZ2xpc3RfZGF0YWBgIOe7k+aehOS9k+eahOexu+Wei+WumuS5
ieOAgg0KPiA+ICvlnKjliIbphY3pobXpnaLml7bvvIzpu5jorqTmg4XlhrXkuIvvvIxMaW51eOS9
v+eUqOiKgueCueacrOWcsOWIhumFjeetlueVpe+8jOS7juemu+W9k+WJjei/kOihjENQVeeahOac
gOi/keiKgueCueWIhumFjeWGheWtmOOAgueUseS6jui/m+eoi+WAvuWQkeS6juWcqOWQjOS4gOS4
qg0KPiA+ICtDUFXkuIrov5DooYzvvIzlvojlj6/og73kvJrkvb/nlKjlvZPliY3oioLngrnnmoTl
hoXlrZjjgILliIbphY3nrZbnlaXlj6/ku6XnlLHnlKjmiLfmjqfliLbvvIzlpoLlhoXmoLjmlofm
oaMNCj4gPiArRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9tbS9udW1hX21lbW9yeV9wb2xpY3ku
cnN0IOS4reaJgOi/sOOAgg0KPiA+ICsNCj4gPiAr5aSn5aSa5pWwTlVNQe+8iOmdnue7n+S4gOWG
heWtmOiuv+mXru+8ieaetuaehOe7tOaKpOS6huS4gOS4quaMh+WQkeiKgueCuee7k+aehOeahOaM
h+mSiOaVsOe7hOOAgui/meS6m+WunumZheeahOe7k+aehOWcqOWQr+WKqOi/h+eoi+S4reeahOaX
qeacn+iiq+WIhumFje+8jA0KPiA+ICvov5nml7bnibnlrprkuo7mnrbmnoTnmoTku6PnoIHop6Pm
npDkuoblm7rku7bmiqXlkYrnmoTniannkIblhoXlrZjmmKDlsITjgILoioLngrnliJ3lp4vljJbn
moTlpKfpg6jliIblt6XkvZzmmK/lnKjnlLEgZnJlZV9hcmVhX2luaXQoKeWunueOsOeahOWQrw0K
PiA+ICvliqjov4fnqIvkuYvlkI7lrozmiJDvvIzor6Xlh73mlbDlnKjlkI7pnaLnmoTlsI/oioIg
OnJlZjpg5Yid5aeL5YyWIDxpbml0aWFsaXphdGlvbj5gIOS4reacieivpue7huaPj+i/sOOAgg0K
PiA+ICsNCj4gPiAr6Zmk5LqG6IqC54K557uT5p6E77yM5YaF5qC46L+Y57u05oqk5LqG5LiA5Liq
5ZCN5Li6IGBgbm9kZV9zdGF0ZXNgYCDnmoQgYGBub2RlbWFza190YGAg5L2N5o6p56CB5pWw57uE
44CC6L+Z5Liq5pWw57uE5Lit55qE5q+P5Liq5L2N5o6p56CBDQo+ID4gK+S7o+ihqOS4gOe7hOeJ
ueWumuWxnuaAp+eahOiKgueCue+8jOi/meS6m+WxnuaAp+eUsSBgYGVudW0gbm9kZV9zdGF0ZXNg
YCDlrprkuYnvvIzlrprkuYnlpoLkuIvvvJoNCj4gPiArDQo+ID4gK2BgTl9QT1NTSUJMRWBgDQo+
ID4gK+iKgueCueWPr+iDveWcqOafkOS4quaXtuWIu+S4iue6v+OAgg0KPiA+ICsNCj4gPiArYGBO
X09OTElORWBgDQo+ID4gK+iKgueCueW3sue7j+S4iue6v+OAgg0KPiA+ICsNCj4gPiArYGBOX05P
Uk1BTF9NRU1PUllgYA0KPiA+ICvoioLngrnmi6XmnInmma7pgJrlhoXlrZjjgIINCj4gPiArDQo+
ID4gK2BgTl9ISUdIX01FTU9SWWBgDQo+ID4gK+iKgueCueaLpeacieaZrumAmuaIlumrmOerr+WG
heWtmOOAguW9k+WFs+mXrSBgYENPTkZJR19ISUdITUVNYGAg6YWN572u5pe277yM5Lmf5Y+v5Lul
56ew5Li6IGBgTl9OT1JNQUxfTUVNT1JZYGAg44CCDQo+ID4gKw0KPiA+ICtgYE5fTUVNT1JZYGAN
Cj4gPiAr6IqC54K55oul5pyJ77yI5pmu6YCa44CB6auY56uv44CB5Y+v56e75Yqo77yJ5YaF5a2Y
44CCDQo+ID4gKw0KPiA+ICtgYE5fQ1BVYGANCj4gPiAr6IqC54K55oul5pyJ5LiA5Liq5oiW5aSa
5LiqQ1BV44CCDQo+ID4gKw0KPiA+ICvlr7nkuo7lhbfmnInkuIrov7DlsZ7mgKfnmoTmr4/kuKro
ioLngrnvvIwgYGBub2RlX3N0YXRlc1s8cHJvcGVydHk+XWBgIOaOqeeggeS4reWvueW6lOS6juiK
gueCuUlE55qE5L2N5Lya6KKr572u5L2N44CCDQo+ID4gKw0KPiA+ICvkvovlpoLvvIzlr7nkuo7l
hbfmnInluLjop4TlhoXlrZjlkoxDUFXnmoToioLngrky77yM56ys5LqM5LiqYml05bCG6KKr6K6+
572uOjoNCj4gPiArDQo+ID4gKyAgbm9kZV9zdGF0ZXNbTl9QT1NTSUJMRV0NCj4gPiArICBub2Rl
X3N0YXRlc1tOX09OTElORV0NCj4gPiArICBub2RlX3N0YXRlc1tOX05PUk1BTF9NRU1PUlldDQo+
ID4gKyAgbm9kZV9zdGF0ZXNbTl9ISUdIX01FTU9SWV0NCj4gPiArICBub2RlX3N0YXRlc1tOX01F
TU9SWV0NCj4gPiArICBub2RlX3N0YXRlc1tOX0NQVV0NCj4gPiArDQo+ID4gK+acieWFs+S9v+eU
qOiKgueCueaOqeegge+8iG5vZGVtYXNrc++8ieWPr+iDvei/m+ihjOeahOWQhOenjeaTjeS9nO+8
jOivt+WPguiAgyBgYGluY2x1ZGUvbGludXgvbm9kZW1hc2suaGBg44CCDQo+ID4gKw0KPiA+ICvp
maTmraTkuYvlpJbvvIzoioLngrnmjqnnoIHvvIhub2RlbWFza3PvvInmj5DkvpvnlKjkuo7pgY3l
joboioLngrnnmoTlro/vvIzljbMgYGBmb3JfZWFjaF9ub2RlKClgYCDlkowNCj4gPiArIGBgZm9y
X2VhY2hfb25saW5lX25vZGUoKWBg44CCDQo+ID4gKw0KPiA+ICvkvovlpoLvvIzopoHkuLrmr4/k
uKrlnKjnur/oioLngrnosIPnlKjlh73mlbAgZm9vKCnvvIzlj6/ku6Xov5nmoLfmk43kvZw6Og0K
PiA+ICsNCj4gPiArICBmb3JfZWFjaF9vbmxpbmVfbm9kZShuaWQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgcGdfZGF0YV90ICpwZ2RhdCA9IE5PREVfREFUQShuaWQpOw0KPiA+ICsNCj4gPiArICAg
ICAgICAgICAgICAgZm9vKHBnZGF0KTsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICvoioLngrnm
lbDmja7nu5PmnoQNCj4gPiArLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvoioLngrnnu5PmnoQg
YGBzdHJ1Y3QgcGdsaXN0X2RhdGFgYCDlnKggYGBpbmNsdWRlL2xpbnV4L21tem9uZS5oYGAg5Lit
5aOw5piO44CC6L+Z6YeM5oiR5Lus5bCG566A6KaB5o+P6L+wDQo+ID4gK+i/meS4que7k+aehOS9
k+eahOWtl+aute+8mg0KPiA+ICsNCj4gPiAr6YCa55So5a2X5q61DQo+ID4gK35+fn5+fn5+DQo+
ID4gKw0KPiA+ICtgYG5vZGVfem9uZXNgYA0KPiA+ICvooajnpLror6XoioLngrnnmoTljLrln5/l
iJfooajjgILlubbpnZ7miYDmnInljLrln5/pg73lj6/og73ooqvloavlhYXvvIzkvYbov5nmmK/l
rozmlbTnmoTliJfooajjgILlroPooqvor6XoioLngrnnmoRub2RlX3pvbmVsaXN0c+S7peWPiuWF
tuWugw0KPiA+ICvoioLngrnnmoRub2RlX3pvbmVsaXN0c+W8leeUqOOAgg0KPiA+ICsNCj4gPiAr
YGBub2RlX3pvbmVsaXN0c2BgDQo+ID4gK+aJgOacieiKgueCueS4reaJgOacieWMuuWfn+eahOWI
l+ihqOOAguatpOWIl+ihqOWumuS5ieS6huWIhumFjeWGheWtmOaXtummlumAieeahOWMuuWfn+mh
uuW6j+OAgiBgYG5vZGVfem9uZWxpc3RzYGAg5Zyo5qC45b+D5YaF5a2Y566h55CGDQo+ID4gK+e7
k+aehOWIneWni+WMluacn+mXtO+8jOeUsSBgYG1tL3BhZ2VfYWxsb2MuY2BgIOS4reeahCBgYGJ1
aWxkX3pvbmVsaXN0cygpYGAg5Ye95pWw6K6+572u44CCDQo+ID4gKw0KPiA+ICtgYG5yX3pvbmVz
YGANCj4gPiAr6KGo56S65q2k6IqC54K55Lit5bey5aGr5YWF5Yy65Z+f55qE5pWw6YeP44CCDQo+
ID4gKw0KPiA+ICtgYG5vZGVfbWVtX21hcGBgDQo+ID4gK+WvueS6juS9v+eUqEZMQVRNRU3lhoXl
rZjmqKHlnovnmoRVTUHns7vnu5/vvIww5Y+36IqC54K555qEIGBgbm9kZV9tZW1fbWFwYGAg6KGo
56S65q+P5Liq54mp55CG5bin55qEc3RydWN0IHBhZ2Vz5pWw57uE44CCDQo+ID4gKw0KPiA+ICtg
YG5vZGVfcGFnZV9leHRgYA0KPiA+ICvlr7nkuo7kvb/nlKhGTEFUTUVN5YaF5a2Y5qih5Z6L55qE
VU1B57O757uf77yMMOWPt+iKgueCueeahCBgYG5vZGVfcGFnZV9leHRgYCDmmK9zdHJ1Y3QgcGFn
ZXPnmoTmianlsZXmlbDnu4TjgIINCj4gPiAr5Y+q5pyJ5Zyo5p6E5bu65pe25byA5ZCv5LqGIGBg
Q09ORklHX1BBR0VfRVhURU5TSU9OYGAg6YCJ6aG555qE5YaF5qC45Lit5omN5Y+v55So44CCDQo+
ID4gKw0KPiA+ICtgYG5vZGVfc3RhcnRfcGZuYGANCj4gPiAr6KGo56S65q2k6IqC54K55Lit6LW3
5aeL6aG16Z2i5bin55qE6aG16Z2i5bin5Y+344CCDQo+ID4gKw0KPiA+ICtgYG5vZGVfcHJlc2Vu
dF9wYWdlc2BgDQo+ID4gK+ihqOekuuatpOiKgueCueS4reWtmOWcqOeahOeJqeeQhumhtemdouea
hOaAu+aVsOOAgg0KPiA+ICsNCj4gPiArYGBub2RlX3NwYW5uZWRfcGFnZXNgYA0KPiA+ICvooajn
pLrljIXmi6znqbrmtJ7lnKjlhoXnmoTniannkIbpobXpnaLojIPlm7TnmoTmgLvlpKflsI/jgIIN
Cj4gPiArDQo+ID4gK2Bgbm9kZV9zaXplX2xvY2tgYA0KPiA+ICvkuIDkuKrkv53miqTlrprkuYno
ioLngrnojIPlm7TlrZfmrrXnmoTplIHjgILku4XlnKjlvIDlkK/kuoYgYGBDT05GSUdfTUVNT1JZ
X0hPVFBMVUdgYCDmiJYNCj4gPiArYGBDT05GSUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVGBg
IOmFjee9rumAiemhueS4reeahOafkOS4gOS4quaXtuaJjeWumuS5ieOAguaPkOS+m+S6hg0KPiA+
ICtgYHBnZGF0X3Jlc2l6ZV9sb2NrKClgYCDlkowgYGBwZ2RhdF9yZXNpemVfdW5sb2NrKClgYCDn
lKjmnaXmk43kvZwgYGBub2RlX3NpemVfbG9ja2Bg77yMDQo+ID4gK+iAjOaXoOmcgOajgOafpSBg
YENPTkZJR19NRU1PUllfSE9UUExVR2BgIOaIliBgYENPTkZJR19ERUZFUlJFRF9TVFJVQ1RfUEFH
RV9JTklUYGAg6YCJ6aG544CCDQo+ID4gKw0KPiA+ICtgYG5vZGVfaWRgYA0KPiA+ICvoioLngrnn
moToioLngrlJRO+8iE5JRO+8ie+8jOS7jjDlvIDlp4vjgIINCj4gPiArDQo+ID4gK2BgdG90YWxy
ZXNlcnZlX3BhZ2VzYGANCj4gPiAr6L+Z5piv5q+P5Liq6IqC54K55L+d55WZ55qE6aG16Z2i77yM
6L+Z5Lqb6aG16Z2i5LiN5Y+v55So5LqO55So5oi356m66Ze05YiG6YWN44CCDQo+ID4gKw0KPiA+
ICtgYGZpcnN0X2RlZmVycmVkX3BmbmBgDQo+ID4gK+WmguaenOWkp+Wei+acuuWZqOS4iueahOWG
heWtmOWIneWni+WMluiiq+aOqOi/n++8jOmCo+S5iOesrOS4gOS4qlBGTu+8iOmhteW4p+WPt++8
ieaYr+mcgOimgeWIneWni+WMlueahOOAguWcqOW8gOWQr+S6hg0KPiA+ICtgYENPTkZJR19ERUZF
UlJFRF9TVFJVQ1RfUEFHRV9JTklUYGAg6YCJ6aG55pe25a6a5LmJ44CCDQo+ID4gKw0KPiA+ICtg
YGRlZmVycmVkX3NwbGl0X3F1ZXVlYGANCj4gPiAr5q+P5Liq6IqC54K555qE5aSn6aG16Zif5YiX
77yM6L+Z5Lqb5aSn6aG155qE5ouG5YiG6KKr5o6o6L+f5LqG44CC5LuF5Zyo5byA5ZCv5LqGIGBg
Q09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFYGANCj4gPiAr6YWN572u6YCJ6aG55pe25a6a5LmJ
44CCDQo+ID4gKw0KPiA+ICtgYF9fbHJ1dmVjYGANCj4gPiAr5q+P5Liq6IqC54K555qEbHJ1dmVj
5oyB5pyJTFJV77yI5pyA6L+R5pyA5bCR5L2/55So77yJ5YiX6KGo5ZKM55u45YWz5Y+C5pWw44CC
5LuF5Zyo56aB55So5LqG5YaF5a2Y5o6n5Yi257uE77yIY2dyb3Vwc++8iQ0KPiA+ICvml7bkvb/n
lKjjgILlroPkuI3lupTor6Xnm7TmjqXorr/pl67vvIzogIzlupTor6Xkvb/nlKggYGBtZW1fY2dy
b3VwX2xydXZlYygpYGAg5p2l5p+l5om+IGxydXZlY3PjgIINCj4gPiArDQo+ID4gK+WbnuaUtuaO
p+WItg0KPiA+ICt+fn5+fn5+fg0KPiA+ICsNCj4gPiAr5Y+m6KeB5YaF5qC45paH5qGjIERvY3Vt
ZW50YXRpb24vbW0vcGFnZV9yZWNsYWltLnJzdCDmlofku7bjgIINCj4gPiArDQo+ID4gK2Bga3N3
YXBkYGANCj4gPiAr5q+P5Liq6IqC54K555qEa3N3YXBk5YaF5qC457q/56iL5a6e5L6L44CCDQo+
ID4gKw0KPiA+ICtgYGtzd2FwZF93YWl0YGAsIGBgcGZtZW1hbGxvY193YWl0YGAsIGBgcmVjbGFp
bV93YWl0YGANCj4gPiAr5ZCM5q2l5YaF5a2Y5Zue5pS25Lu75Yqh55qE5bel5L2c6Zif5YiX44CC
DQo+ID4gKw0KPiA+ICtgYG5yX3dyaXRlYmFja190aHJvdHRsZWRgYA0KPiA+ICvnrYnlvoXlhpnl
m57ohI/pobXml7bvvIzooqvpmZDliLbnmoTku7vliqHmlbDph4/jgIINCj4gPiArDQo+ID4gK2Bg
a3N3YXBkX29yZGVyYGANCj4gPiAr5o6n5Yi2a3N3YXBk5bCd6K+V5Zue5pS255qEb3JkZXLjgIIN
Cj4gPiArDQo+ID4gK2Bga3N3YXBkX2hpZ2hlc3Rfem9uZWlkeGBgDQo+ID4gK2tzd2FwZOe6v+eo
i+WPr+S7peWbnuaUtueahOacgOmrmOWMuuWfn+e0ouW8leOAgg0KPiA+ICsNCj4gPiArYGBrc3dh
cGRfZmFpbHVyZXNgYA0KPiA+ICtrc3dhcGTml6Dms5Xlm57mlLbku7vkvZXpobXpnaLnmoTov5Do
oYzmrKHmlbDjgIINCj4gPiArDQo+ID4gK2BgbWluX3VubWFwcGVkX3BhZ2VzYGANCj4gPiAr5peg
5rOV5Zue5pS255qE5pyq5pig5bCE5paH5Lu25pSv5oyB55qE5pyA5bCP6aG16Z2i5pWw6YeP44CC
55SxIGBgdm0ubWluX3VubWFwcGVkX3JhdGlvYGAg57O757uf5o6n5Yi25Y+w77yIc3lzY3Rs77yJ
DQo+ID4gK+WPguaVsOWGs+WumuOAguWcqOW8gOWQryBgYENPTkZJR19OVU1BYGAg6YWN572u5pe2
5a6a5LmJ44CCDQo+ID4gKw0KPiA+ICtgYG1pbl9zbGFiX3BhZ2VzYGANCj4gPiAr5peg5rOV5Zue
5pS255qEU0xBQumhtemdoueahOacgOWwkeaVsOmHj+OAgueUsSBgYHZtLm1pbl9zbGFiX3JhdGlv
YGAg57O757uf5o6n5Yi25Y+w77yIc3lzY3Rs77yJ5Y+C5pWw5Yaz5a6a44CC5ZyoDQo+ID4gK+W8
gOWQryBgYENPTkZJR19OVU1BYGAg5pe25a6a5LmJ44CCDQo+ID4gKw0KPiA+ICtgYGZsYWdzYGAN
Cj4gPiAr5o6n5Yi25Zue5pS26KGM5Li655qE5qCH5b+X5L2N44CCDQo+ID4gKw0KPiA+ICvlhoXl
rZjljovnvKnmjqfliLYNCj4gPiArfn5+fn5+fn5+fn5+DQo+ID4gKw0KPiA+ICtgYGtjb21wYWN0
ZF9tYXhfb3JkZXJgYA0KPiA+ICtrY29tcGFjdGTlupTlsJ3or5Xlrp7njrDnmoTpobXpnaJvcmRl
cuOAgg0KPiA+ICsNCj4gPiArYGBrY29tcGFjdGRfaGlnaGVzdF96b25laWR4YGANCj4gPiAra2Nv
bXBhY3Rk5Y+v5Lul5Y6L57yp55qE5pyA6auY5Yy65Z+f57Si5byV44CCDQo+ID4gKw0KPiA+ICtg
YGtjb21wYWN0ZF93YWl0YGANCj4gPiAr5ZCM5q2l5YaF5a2Y5Y6L57yp5Lu75Yqh55qE5bel5L2c
6Zif5YiX44CCDQo+ID4gKw0KPiA+ICtgYGtjb21wYWN0ZGBgDQo+ID4gK+avj+S4quiKgueCueea
hGtjb21wYWN0ZOWGheaguOe6v+eoi+WunuS+i+OAgg0KPiA+ICsNCj4gPiArYGBwcm9hY3RpdmVf
Y29tcGFjdF90cmlnZ2VyYGANCj4gPiAr5Yaz5a6a5piv5ZCm5L2/55So5Li75Yqo5Y6L57yp44CC
55SxIGBgdm0uY29tcGFjdGlvbl9wcm9hY3RpdmVuZXNzYGAg57O757uf5o6n5Yi25Y+w77yIc3lz
Y3Rs77yJ5Y+C5pWw5o6n5Yi244CCDQo+ID4gKw0KPiA+ICvnu5/orqHkv6Hmga8NCj4gPiArfn5+
fn5+fn4NCj4gPiArDQo+ID4gK2BgcGVyX2NwdV9ub2Rlc3RhdHNgYA0KPiA+ICvooajnpLroioLn
grnnmoRQZXItQ1BV6Jma5ouf5YaF5a2Y57uf6K6h5L+h5oGv44CCDQo+ID4gKw0KPiA+ICtgYHZt
X3N0YXRgYA0KPiA+ICvooajnpLroioLngrnnmoTomZrmi5/lhoXlrZjnu5/orqHmlbDmja7jgIIN
Cj4gPiArDQo+ID4gKy4uIF96b25lczoNCj4gPiArDQo+ID4gK+WMuuWfnw0KPiA+ICs9PT09DQo+
ID4gKw0KPiA+ICsuLiBhZG1vbml0aW9uOjogU3R1Yg0KPiA+ICsNCj4gPiArICDmnKzoioLlhoXl
rrnkuI3lrozmlbTjgILor7fliJflh7rlubbmj4/ov7Dnm7jlupTnmoTlrZfmrrXjgIINCj4gPiAr
DQo+ID4gKy4uIF9wYWdlczoNCj4gPiArDQo+ID4gK+mhtQ0KPiA+ICs9PT09DQo+ID4gKw0KPiA+
ICsuLiBhZG1vbml0aW9uOjogU3R1Yg0KPiA+ICsNCj4gPiArICDmnKzoioLlhoXlrrnkuI3lrozm
lbTjgILor7fliJflh7rlubbmj4/ov7Dnm7jlupTnmoTlrZfmrrXjgIINCj4gPiArDQo+ID4gK+mh
teeggQ0KPiA+ICs9PT09DQo+ID4gKw0KPiA+ICsuLiBhZG1vbml0aW9uOjogU3R1Yg0KPiA+ICsN
Cj4gPiArICDmnKzoioLlhoXlrrnkuI3lrozmlbTjgILor7fliJflh7rlubbmj4/ov7Dnm7jlupTn
moTlrZfmrrXjgIINCj4gPiArDQo+ID4gKy4uIF9pbml0aWFsaXphdGlvbjoNCj4gPiArDQo+ID4g
K+WIneWni+WMlg0KPiA+ICs9PT09PT0NCj4gPiArDQo+ID4gKy4uIGFkbW9uaXRpb246OiBTdHVi
DQo+ID4gKw0KPiA+ICsgIOacrOiKguWGheWuueS4jeWujOaVtOOAguivt+WIl+WHuuW5tuaPj+i/
sOebuOW6lOeahOWtl+auteOAgg0KPiA+ICsNCj4gPiArDQo+ID4gLS0NCj4gPiAyLjI3LjANCj4N
Cg==


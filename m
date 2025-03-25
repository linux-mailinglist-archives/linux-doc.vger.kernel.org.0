Return-Path: <linux-doc+bounces-41682-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15DA6ED4A
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 11:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C953AAE34
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D367919DF41;
	Tue, 25 Mar 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awFS+54j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814EB19B5B4
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742897096; cv=none; b=ou6ug7M6SlrpO7kl/O/BOhDmBZ3UN1AfRCw91+1ms0eROEuLntwkzvEeHLa0TYebaEKoNAcCmH2ymYQJK/vdOxzAhzmxMLF5nJrR6WS7w9DiBQqXvFSuR0PhpK06slKB07wYC+z6Z7dxP3JhtIJpqOfDTDnF+wMx2xFwThkARr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742897096; c=relaxed/simple;
	bh=dne84Vs+RtRoOZPoGRJAQz5FcbImfKBz64ASEfArPMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qL070JOw7q+3xHumdoVx0mDg5gxv/WEawAri/w/CGVOpKCI9cDVuwZeFQ7oYHbBfyTtkCZevK06qwNU5LZIT1nn+evrtjKAQ2WGtpdauZoKvQhU8bHshpcZzU0TZbumpiXmwvayUKV3PmKZkGa9y1bjsFErdJK+EZzSOrQanlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awFS+54j; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac297cbe017so1145150266b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742897093; x=1743501893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dne84Vs+RtRoOZPoGRJAQz5FcbImfKBz64ASEfArPMg=;
        b=awFS+54j7ml9ZVaX7vKtgU9BSJAiPKAprrHwiOX7PbVmjM3h8IS2FbuS81S/AYfMFT
         E9GHfrjo1L8bWObMvNk5pisnzkmgdwxIzN5iGiHyEV2Doh2FL+hJO/uiTGIwDNE79tuh
         gW8lA5EKa72wsnUGJZdLlSSAWr95qUYMc3Oim0MFEem4JMFvCzBgsnJPDsDeFXCMj0iv
         PDckG67w0Vz3oaQyqEdTl2fESPYTdh2bvc5lS/OdaoZJHP1lWmHBQck/d0VbKV8zi6md
         fMYVRXSZ8ITwCqwFXkVtzYcnUDK53kvZHeo/8/dGpPUvqNQh3p0Ul0jRchYqT/zgg1q6
         9wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897093; x=1743501893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dne84Vs+RtRoOZPoGRJAQz5FcbImfKBz64ASEfArPMg=;
        b=iPsII+wZ4VtriT+Al9biTKktrV3hpLwSjUkCrgwKhPetjif5CO240/wR2zve/rqzmD
         CtkiavUK/AtF334KGqOmtZ4zRqDRCW1agfHPV6VorIkWgdzVswWqdrGcYNR8zR/lbaV9
         Wv5OUMV6B+VLDyFw4nxGUMETrKrgikOikn8dovnK+Aax1G+lEJTieJxPUSHpfqQbmQXm
         fnR8nxPQsb+z75fpAOlTHXoanMsz+e4NtmzxUjy7d20v5H+njZ6ddTWNpChOqDqiK2qY
         4nM6Tk//WTgNuqq8vj9NCEVFxnmlWFwEGkVeVVtF9aD3HN7cEdRXvaII7jn2/QvslXdt
         aRfg==
X-Forwarded-Encrypted: i=1; AJvYcCUKG47EQAYuQ80OW6MwjJzbLgwe2z4cmbtye/0LdYuNwxtAnitQnyHN5B5SldHtu4RRhIImMZccjBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6aCyBopm9Fuaz4oqB5sK6iG+zsd2PPhi5rTjRRDXCxKcIXNN
	73DkIrobfh/87tc662Am4JCaafeHHVqBBS/QsAaUWm6p5rvcGLuXeARtiaim8a0UAg6gxHE3t+q
	Uipj/OMcwoIK8XzH2sFmr2hfcr8E=
X-Gm-Gg: ASbGncsORWmsl3TD5bZQePDbVb+3Eag17cE7v257rA5dqyg3OFxo66/edP0yV/K9Ul9
	V6qMPilX4sSaUsEgkf4Dcl1ff9kfa6XGMNpNGJvguTRLuRK3OckLIJmT6MOYLXaXvW39ktGOXds
	73jI0skbboyAPcujzottcaHy/RAX2kOX5ghJPL
X-Google-Smtp-Source: AGHT+IF0sLrTM+qdbbeowXc0SySG2jKyungn7tA1CE0JEoZdR1pV5VjDaQHauS3ApuGgfAR/zGJ81grfa8sCaPl1LOY=
X-Received: by 2002:a17:907:e84c:b0:ac3:2747:9fe with SMTP id
 a640c23a62f3a-ac3cdbe1224mr1918380366b.13.1742897092203; Tue, 25 Mar 2025
 03:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1742889962.git.si.yanteng@linux.dev> <28d37c70b09e3a3c9d004e23e2afdbdbde910999.1742889962.git.si.yanteng@linux.dev>
In-Reply-To: <28d37c70b09e3a3c9d004e23e2afdbdbde910999.1742889962.git.si.yanteng@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 25 Mar 2025 18:04:15 +0800
X-Gm-Features: AQ5f1JrirVj97kDSTmwLgs8XSU1IiYmlZ-vkbF2FXK7xFERjwbNeXUBQarFmgbs
Message-ID: <CAJy-Amnw8a+BAqWUymxs_gveUdXhaqMAkf=7xbPJXPWQo9xj1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add how-to of Chinese translation
To: Yanteng Si <si.yanteng@linux.dev>
Cc: alexs@kernel.org, corbet@lwn.net, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

WWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+IOS6jjIwMjXlubQz5pyIMjXml6Xlkajk
uowgMTY6MTnlhpnpgZPvvJoNCj4NCj4gTWFueSBuZXcgZmFjZXMga2VlcCBhcHBlYXJpbmcgb24g
dGhlIG1haWxpbmcgbGlzdCBmcm9tIHRpbWUgdG8NCj4gdGltZSwgYW5kIHRoZXJlIG1heSBiZSBt
YW55IHBvdGVudGlhbCBkZXZlbG9wZXJzIHdobyB3YW50IHRvDQo+IHBhcnRpY2lwYXRlIGluIHRo
ZSBDaGluZXNlIHRyYW5zbGF0aW9uIGJ1dCBkb24ndCBrbm93IGhvdyB0bw0KPiBnZXQgc3RhcnRl
ZC4gQXMgbW9yZSBhbmQgbW9yZSBkb2N1bWVudHMgYXJlIHRyYW5zbGF0ZWQsIGl0IGlzDQo+IGJl
Y29taW5nIGluY3JlYXNpbmdseSBpbXBvcnRhbnQgdG8gaW1wcm92ZSB0aGUgbWFpbnRhaW5hYmls
aXR5DQo+IG9mIENoaW5lc2UgZG9jdW1lbnRzLiBXZSBoYXZlIGEgbG90IG9mIGNvbnZlbnRpb25z
LCBidXQgY3VycmVudGx5DQo+IHRoZXNlIGNvbnZlbnRpb25zIGFyZSBzdGlsbCBiZWluZyBwYXNz
ZWQgb24gb3JhbGx5LiBBdCB0aGUgc2FtZQ0KPiB0aW1lLCBkdXJpbmcgdGhlIHJldmlldyBwcm9j
ZXNzLCBlc3BlY2lhbGx5IGZvciB0aGUgZmlyc3QgZmV3DQo+IHBhdGNoZXMgc3VibWl0dGVkIGJ5
IG5ld2JpZXMsIHdlIGhhdmUgbWFkZSB0b28gbWFueSByZXBldGl0aXZlDQo+IGNvbW1lbnRzLiBJ
biBvcmRlciB0byBhZGRyZXNzIHRoZSBhYm92ZSBpc3N1ZXMsIEkgaGF2ZSBkcmFmdGVkDQo+IHRo
aXMgZ3VpZGUsIGFuZCB0aGVyZSBpcyBzdGlsbCBhIGxvdCB0aGF0IG5lZWRzIHRvIGJlIGltcHJv
dmVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaS55YW50ZW5nQGxpbnV4LmRl
dj4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0
IHwgNDQ1ICsrKysrKysrKysrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9pbmRleC5yc3QgIHwgIDI0ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1NyBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0IGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vaG93LXRvLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjA4MjY4YWMyNzNiYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5yc3QNCj4gQEAgLTAs
MCArMSw0NDUgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsN
Cj4gKz09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK0xpbnV45YaF5qC45Lit5paH5paH5qGj
57+76K+R6KeE6IyDDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK+S/ruiu
ouiusOW9le+8mg0KPiArIC0gdjEuMCAyMDI15bm0M+aciDE05pel77yM5Y+45bu26IW+5Y+C6ICD
56S+5Yy655qE5oyH5a+85oSP6KeB5L+u6K6i5LqG6YOo5YiG5YaF5a6544CCDQo+ICsNCj4gK+WI
tuWumuinhOiMg+eahOiDjOaZrw0KPiArPT09PT09PT09PT09PT0NCj4gKw0KPiAr6L+H5Y675Yeg
5bm077yM5Zyo5bm/5aSn56S+5Yy654ix5aW96ICF55qE5Y+L5aW95ZCI5L2c5LiL77yMTGludXgg
5YaF5qC45Lit5paH5paH5qGj6L+O5p2l5LqG6JOs5YuD55qE5Y+RDQo+ICvlsZXjgILlnKjnv7vo
r5HnmoTml6nmnJ/vvIzkuIDliIfpg73mmK/mt7fkubHnmoTvvIznpL7ljLrlr7nor5HnqL/lj6rm
nInkuIDkuKrlh4bnoa7nv7vor5HnmoTopoHmsYLvvIzku6XpvJMNCj4gK+WKseabtOWkmueahOW8
gOWPkeiAheWPguS4jui/m+adpe+8jOi/meaYr+S7jjDliLAx55qE5b+F54S26L+H56iL77yM5omA
5Lul5pep5pyf55qE5Lit5paH5paH5qGj55uu5b2V5pu05YqgDQo+ICvlhbfmnInlpJrmoLfmgKfv
vIzkuI3ov4flpb3lnKjmlofmoaPkuI3lpJrvvIznu7TmiqTkuIrlubbmsqHmnInov4flpKfnmoTl
jovlipvjgIINCj4gKw0KPiAr54S26ICM77yM5LiW5LqL5Y+Y5bm777yM5LiN6KeJ5pyJ5bm077yM
546w5Zyo5YaF5qC45Lit5paH5paH5qGj5Zyo5YmN6L+b55qE6YGT6Lev5LiK6LaK6LWw6LaK6L+c
77yM5b6I5aSa5r2cDQo+ICvlnKjnmoTpl67popjpgJDmuJDmta7lh7rmsLTpnaLvvIzogIzkuJTp
mo/nnYDkuK3mlofmlofmoaPmlbDph4/nmoTlop7liqDvvIznv7vor5Hmm7TlpJrnmoTmlofmoaPk
uI7mj5Dpq5jkuK0NCj4gK+aWh+aWh+aho+WPr+e7tOaKpOaAp+S5i+mXtOeahOefm+ebvuaEiOWP
keWwlumUkOOAgueUseS6juaWh+aho+e/u+ivkeeahOeJueauiuaAp++8jOW+iOWkmuW8gOWPkeiA
heW5tuS4jeS8mg0KPiAr5LiA55u05pu05paw5paH5qGj77yM5aaC5p6c5Lit5paH5paH5qGj6JC9
5ZCO6Iux5paH5paH5qGj5aSq5aSa77yM5paH5qGj5pu05paw55qE5bel5L2c6YeP5Lya6L+c5aSn
5LqO6YeN5pawDQo+ICvnv7vor5HjgILogIzkuJTpgq7ku7bliJfooajkuK3pmYbnu63mnInmlrDn
moTpnaLlrZTlh7rnjrDvvIzku5bku6zpgqPogqHng63mg4XvvIzlsLHlg4/nh4Png6fnmoTngavn
hLDvvIzog70NCj4gK+eerOmXtOeCueeHg+aVtOS4quepuumXtO+8jOWPr+aYr+S7luS7rOeahOih
peS4geW+gOW+gOWFt+acieS4quaAp++8jOi/meS8mue7meWuoemYheW4puadpeS6huW+iOWkp+ea
hOWbsOmavu+8jA0KPiArcmV2aWV3ZXIg5Lus5Y+q6IO96ICQ5b+D5Zyw5oyH5a+85LuW5Lus5aaC
5L2V5LiO56S+5Yy65pu05aW95Zyw5ZCI5L2c77yM5L2G5piv6L+Z6aG55bel5L2c5YW35pyJ6YeN
5aSNDQo+ICvmgKfvvIzplb/mraTku6XlvoDvvIzkvJrmuJDmuJDmtYfnga0gcmV2aWV3ZXIg5a6h
6ZiF55qE54Ot5oOF44CCDQo+ICsNCj4gK+iZveeEtuWGheaguOaWh+aho+S4reW3sue7j+acieS6
huexu+S8vOeahOi0oeeMruaMh+WNl++8jOS9huaYr+e8uuS5j+S4k+mXqOmSiOWvueS6juS4reaW
h+e/u+ivkeeahO+8jOWwpOWFtg0KPiAr5piv5a+55LqO5paw5omL5p2l6K+077yM5rWP6KeI5aSn
6YeP55qE5paH5qGj5Y+N6ICM5pu05Yqg6L+35oOR77yM6K+l5paH5qGj5bCx5piv5Li65LqG57yT
6Kej6L+Z5LiA6Zeu6aKY6ICMDQo+ICvnvJblhpnvvIznm67nmoTmmK/kuLrmj5Dkvpvnu5nmlrDm
iYvkuIDkuKrlv6vpgJ/nv7vor5HmjIfljZfjgIINCj4gKw0KPiAr6K+m57uG55qE6LSh54yu5oyH
5Y2X77yaRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9pbmRleC5yc3Tj
gIINCj4gKw0KPiAr546v5aKD5pCt5bu6DQo+ICs9PT09PT09PQ0KPiArDQo+ICvlt6XmrLLlloTl
hbbkuovlv4XlhYjliKnlhbblmajvvIzlpoLmnpzmgqjnm67liY3lr7nlhoXmoLjmlofmoaPnv7vo
r5Hmu6HmgIDng63mg4XvvIzlubbkuJTkvJrni6znq4vlnLDlronoo4UNCj4gK2xpbnV4IOWPkeih
jOeJiOWSjOeugOWNleWcsOS9v+eUqCBsaW51eCDlkb3ku6TooYzvvIzpgqPkuYjlj6/ku6Xov4Xp
gJ/lvIDlp4vkuobjgILoi6XmgqjlsJrkuI3lhbflpIfor6UNCj4gK+iDveWKm++8jOW+iOWkmue9
keermeS4iuS8muacieivpue7hueahOaJi+aKiuaJi+aVmeeoi++8jOacgOWkmuS4gOS4quS4iuWN
iO+8jOaCqOW6lOivpeWwseiDveaOjOaPoeWvueW6lOaKgA0KPiAr6IO944CC5oKo6ZyA6KaB5rOo
5oSP55qE5LiA54K55piv77yM6K+35LiN6KaB5L2/55SoIHJvb3Qg55So5oi36L+b6KGM5ZCO57ut
5q2l6aqk5ZKM5paH5qGj57+76K+R44CCDQo+ICsNCj4gK+aLieWPluW8gOWPkeagkQ0KPiArLS0t
LS0tLS0tLQ0KPiArDQo+ICvkuK3mlofmlofmoaPnv7vor5Hlt6XkvZznm67liY3ni6znq4vkuo4g
bGludXgtZG9jIOW8gOWPkeagkeW8gOWxle+8jOaJgOS7peaCqOmcgOimgeaLieWPluivpeW8gOWP
keagke+8jA0KPiAr5omT5byA57uI56uv5ZG95Luk6KGM5omn6KGMOjoNCj4gKw0KPiArICAgICAg
IGdpdCBjbG9uZSBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
YWxleHMvbGludXguZ2l0DQo+ICsNCj4gK+WmguaenOaCqOmBh+WIsOe9kee7nOi/nuaOpemXrumi
mO+8jOS5n+WPr+S7peaJp+ihjOS7peS4i+WRveS7pDo6DQo+ICsNCj4gKyAgICAgICBnaXQgY2xv
bmUgaHR0cHM6Ly9taXJyb3JzLmh1c3QuZWR1LmNuL2dpdC9rZXJuZWwtZG9jLXpoLmdpdCBsaW51
eA0KPiArDQo+ICvov5nmmK8gQWxleCDlvIDlj5HmoJHnmoTplZzlg4/lupPvvIzmr4/kuKTkuKrl
sI/ml7blkIzmraXkuIDmrKHkuIrmuLjjgILlpoLmnpzmgqjkuobop6PliLDmm7Tlv6vnmoQgbWly
cm9y77yMDQo+ICvor7fpmo/ml7YgKirmt7vliqAqKiDjgIINCj4gKw0KPiAr5ZG95Luk5omn6KGM
5a6M5q+V5ZCO77yM5oKo5Lya5Zyo5b2T5YmN55uu5b2V5LiL5b6X5Yiw5LiA5LiqIGxpbnV4IOeb
ruW9le+8jOivpeebruW9leWwseaYr+aCqOS5i+WQjueahOW3peS9nA0KPiAr5LuT5bqT77yM6K+3
5oqK5a6D5pS+5Zyo5LiA5Liq56iz5aal55qE5L2N572u44CCDQo+ICsNCj4gK+WuieijheaWh+ah
o+aehOW7uueOr+Wigw0KPiArLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICvlhoXmoLjku5PlupPp
h4zpnaLmj5DkvpvkuobkuIDkuKrljYroh6rliqjljJbohJrmnKzvvIzmiafooYzor6XohJrmnKzv
vIzkvJrmo4DmtYvmgqjnmoTlj5HooYzniYjkuK3pnIDopoHlrokNCj4gK+ijheWTquS6m+i9r+S7
tuWMhe+8jOivt+aMieeFp+WRveS7pOihjOaPkOekuui/m+ihjOWuieijhe+8jOmAmuW4uOaCqOWP
qumcgOimgeWkjeWItuWRveS7pOW5tuaJp+ihjOWwseihjOOAgg0KPiArOjoNCj4gKw0KPiArICAg
ICAgIGNkIGxpbnV4DQo+ICsgICAgICAgLi9zY3JpcHRzL3NwaGlueC1wcmUtaW5zdGFsbA0KPiAr
DQo+ICvku6VGZWRvcmHkuLrkvovvvIzlroPnmoTovpPlh7rmmK/ov5nmoLfnmoQ6Og0KPiArDQo+
ICsgICAgICAgWW91IHNob3VsZCBydW46DQo+ICsNCj4gKyAgICAgICAgICAgICAgIHN1ZG8gZG5m
IGluc3RhbGwgLXkgZGVqYXZ1LXNhbnMtZm9udHMgZGVqYXZ1LXNhbnMtbW9uby1mb250cyBkZWph
dnUtc2VyaWYtZm9udHMgZ29vZ2xlLW5vdG8tc2Fucy1jamstZm9udHMgZ3JhcGh2aXotZ2QgbGF0
ZXhtayBsaWJyc3ZnMi10b29scyB0ZXhsaXZlLWFueWZvbnRzaXplIHRleGxpdmUtY2FwdC1vZiB0
ZXhsaXZlLWNvbGxlY3Rpb24tZm9udHNyZWNvbW1lbmRlZCB0ZXhsaXZlLWN0ZXggdGV4bGl2ZS1l
cXBhcmJveCB0ZXhsaXZlLWZuY3ljaGFwIHRleGxpdmUtZnJhbWVkIHRleGxpdmUtbHVhdGV4ODUg
dGV4bGl2ZS1tdWx0aXJvdyB0ZXhsaXZlLW5lZWRzcGFjZSB0ZXhsaXZlLXRhYnVsYXJ5IHRleGxp
dmUtdGhyZWVwYXJ0dGFibGUgdGV4bGl2ZS11cHF1b3RlIHRleGxpdmUtd3JhcGZpZyB0ZXhsaXZl
LXhlY2prDQo+ICsNCj4gKyAgICAgICBTcGhpbnggbmVlZHMgdG8gYmUgaW5zdGFsbGVkIGVpdGhl
cjoNCj4gKyAgICAgICAxKSB2aWEgcGlwL3B5cGkgd2l0aDoNCj4gKw0KPiArICAgICAgICAgICAg
ICAgL3Vzci9iaW4vcHl0aG9uMyAtbSB2ZW52IHNwaGlueF9sYXRlc3QNCj4gKyAgICAgICAgICAg
ICAgIC4gc3BoaW54X2xhdGVzdC9iaW4vYWN0aXZhdGUNCj4gKyAgICAgICAgICAgICAgIHBpcCBp
bnN0YWxsIC1yIC4vRG9jdW1lbnRhdGlvbi9zcGhpbngvcmVxdWlyZW1lbnRzLnR4dA0KPiArDQo+
ICsgICAgICAgICAgIElmIHlvdSB3YW50IHRvIGV4aXQgdGhlIHZpcnR1YWxlbnYsIHlvdSBjYW4g
dXNlOg0KPiArICAgICAgICAgICAgICAgZGVhY3RpdmF0ZQ0KPiArDQo+ICsgICAgICAgMikgQXMg
YSBwYWNrYWdlIHdpdGg6DQo+ICsNCj4gKyAgICAgICAgICAgICAgIHN1ZG8gZG5mIGluc3RhbGwg
LXkgcHl0aG9uMy1zcGhpbngNCj4gKw0KPiArICAgICAgICAgICBQbGVhc2Ugbm90ZSB0aGF0IFNw
aGlueCA+PSAzLjAgd2lsbCBjdXJyZW50bHkgcHJvZHVjZSBmYWxzZS1wb3NpdGl2ZQ0KPiArICAg
ICAgICAgIHdhcm5pbmcgd2hlbiB0aGUgc2FtZSBuYW1lIGlzIHVzZWQgZm9yIG1vcmUgdGhhbiBv
bmUgdHlwZSAoZnVuY3Rpb25zLA0KPiArICAgICAgICAgIHN0cnVjdHMsIGVudW1zLC4uLikuIFRo
aXMgaXMga25vd24gU3BoaW54IGJ1Zy4gRm9yIG1vcmUgZGV0YWlscywgc2VlOg0KPiArICAgICAg
ICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3NwaGlueC1kb2Mvc3BoaW54L3B1bGwvODMxMw0K
PiArDQo+ICvor7fmgqjmjInnhafmj5DnpLrlpI3liLbmiZPljbDnmoTlkb3ku6TliLDlkb3ku6To
oYzmiafooYzvvIzmgqjlv4XpobvlhbflpIcgcm9vdCDmnYPpmZDmiY3og73miafooYwgc3Vkbw0K
PiAr5byA5aS055qE5ZG95Luk44CCDQo+ICsNCj4gK+WmguaenOaCqOWkhOS6juS4gOS4quWkmueU
qOaIt+eOr+Wig+S4re+8jOS4uuS6humBv+WFjeWvueWFtuS7luS6uumAoOaIkOW9seWTje+8jOW7
uuiuruaCqOmFjee9ruWNleeUqOaItw0KPiArc3BoaW54IOiZmuaLn+eOr+Wig++8jOWNs+WPqumc
gOimgeaJp+ihjDo6DQo+ICsNCj4gKyAgICAgICAvdXNyL2Jpbi9weXRob24zIC1tIHZlbnYgc3Bo
aW54X2xhdGVzdA0KPiArICAgICAgIC4gc3BoaW54X2xhdGVzdC9iaW4vYWN0aXZhdGUNCj4gKyAg
ICAgICBwaXAgaW5zdGFsbCAtciAuL0RvY3VtZW50YXRpb24vc3BoaW54L3JlcXVpcmVtZW50cy50
eHQNCj4gKw0KPiAr5pyA5ZCO5omn6KGM5Lul5LiL5ZG95Luk6YCA5Ye66Jma5ouf546v5aKDOjoN
Cj4gKw0KPiArICAgICAgIGRlYWN0aXZhdGUNCj4gKw0KPiAr5oKo5Y+v5Lul5Zyo5Lu75L2V6ZyA
6KaB55qE5pe25YCZ5YaN5qyh5omn6KGM5Lul5LiL5ZG95Luk6L+b5YWl6Jma5ouf546v5aKDOjoN
Cj4gKw0KPiArICAgICAgIC4gc3BoaW54X2xhdGVzdC9iaW4vYWN0aXZhdGUNCj4gKw0KPiAr6L+b
6KGM56ys5LiA5qyh5paH5qGj57yW6K+RDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr
6L+b5YWl5byA5Y+R5qCR55uu5b2VOjoNCj4gKw0KPiArICAgICAgIGNkIGxpbnV4DQo+ICsNCj4g
K+i/meaYr+S4gOS4quagh+WHhueahOe8luivkeWSjOiwg+ivlea1geeoi++8jOivt+avj+asoeae
hOW7uuaXtumDveS4peagvOaJp+ihjDo6DQo+ICsNCj4gKyAgICAgICAuIHNwaGlueF9sYXRlc3Qv
YmluL2FjdGl2YXRlDQo+ICsgICAgICAgbWFrZSBjbGVhbmRvY3MNCj4gKyAgICAgICBtYWtlIGh0
bWxkb2NzDQo+ICsgICAgICAgZGVhY3RpdmF0ZQ0KPiArDQo+ICvmo4Dmn6XnvJbor5Hnu5PmnpwN
Cj4gKy0tLS0tLS0tLS0tLQ0KPiArDQo+ICvnvJbor5HovpPlh7rlnKhEb2N1bWVudGF0aW9uL291
dHB1dC/nm67lvZXkuIvvvIzor7fnlKjmtY/op4jlmajmiZPlvIDor6Xnm67lvZXkuIvlr7nlupQN
Cj4gK+eahOaWh+S7tui/m+ihjOajgOafpeOAgg0KPiArDQo+ICtnaXTlkozpgq7nrrHphY3nva4N
Cj4gKy0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5omT5byA5ZG95Luk6KGM5omn6KGMOjoNCj4gKw0K
PiArICAgICAgIHN1ZG8gZG5mIGluc3RhbGwgZ2l0LWVtYWlsDQo+ICsgICAgICAgdmltIH4vLmdp
dGNvbmZpZw0KPiArDQo+ICvov5nph4zmmK/miJHnmoTkuIDkuKrphY3nva7mlofku7bnpLrojIPv
vIzor7fmoLnmja7mgqjnmoTpgq7nrrHln5/lkI3mnI3liqHllYbmj5DkvpvnmoTmiYvlhozmm7/m
jaLliLDlr7kNCj4gK+W6lOeahOWtl+auteOAgg0KPiArOjoNCj4gKw0KPiArICAgICAgIFt1c2Vy
XQ0KPiArICAgICAgICAgICAgICBuYW1lID0gWWFudGVuZyBTaSAgICAgICAgICAgICAgICAjIOi/
meS8muWHuueOsOWcqOaCqOeahOihpeS4geWktOmDqOetvuWQjeagjw0KPiArICAgICAgICAgICAg
ICBlbWFpbCA9IHNpLnlhbnRlbmdAbGludXguZGV2ICAgICAjIOi/meS8muWHuueOsOWcqOaCqOea
hOihpeS4geWktOmDqOetvuWQjeagjw0KPiArDQo+ICsgICAgICAgW3NlbmRlbWFpbF0NCj4gKyAg
ICAgICAgICAgICAgZnJvbSA9IFlhbnRlbmcgU2kgPHNpLnlhbnRlbmdAbGludXguZGV2PiAjIOi/
meS8muWHuueOsOWcqOaCqOeahOihpeS4geWktOmDqA0KPiArICAgICAgICAgICAgICBzbXRwZW5j
cnlwdGlvbiA9IHNzbA0KPiArICAgICAgICAgICAgICBzbXRwc2VydmVyID0gc210cC5taWdhZHUu
Y29tDQo+ICsgICAgICAgICAgICAgIHNtdHB1c2VyID0gc2kueWFudGVuZ0BsaW51eC5kZXYNCj4g
KyAgICAgICAgICAgICAgc210cHBhc3MgPSA8cGFzc3dkPiAgICAgICMg5bu66K6u5L2/55So56ys
5LiJ5pa55a6i5oi356uv5LiT55So5a+G56CBDQo+ICsgICAgICAgICAgICAgIGNoYWlucmVwbHl0
byA9IGZhbHNlDQo+ICsgICAgICAgICAgICAgIHNtdHBzZXJ2ZXJwb3J0ID0gNDY1DQo+ICsNCj4g
K+WFs+S6jumCruS7tuWuouaIt+err+eahOmFjee9ru+8jOivt+afpemYhURvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvZW1haWwtY2xpZW50cy5yc3TjgIINCj4gKw0KPiAr
5byA5aeL57+76K+R5paH5qGjDQo+ICs9PT09PT09PT09PT0NCj4gKw0KPiAr5paH5qGj57Si5byV
57uT5p6EDQo+ICstLS0tLS0tLS0tLS0NCj4gKw0KPiAr55uu5YmN5Lit5paH5paH5qGj5piv5Zyo
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v55uu5b2V5LiL6L+b6KGM77yM6K+lDQo+
ICvnm67lvZXnu5PmnoTmnIDnu4jkvJrkuI5Eb2N1bWVudGF0aW9uL+e7k+aehOS4gOiHtO+8jOaJ
gOS7peaCqOWPqumcgOimgeWwhuaCqOaEn+WFtOi2o+eahOiLseaWhw0KPiAr5paH5qGj5paH5Lu2
5ZKM5a+55bqU55qEIGluZGV4LnJzdCDlpI3liLbliLAgemhfQ04g55uu5b2V5LiL5a+55bqU55qE
5L2N572u77yM54S25ZCO5L+u5pS55pu0DQo+ICvkuIrkuIDnuqfnmoQgaW5kZXgg5Y2z5Y+v5byA
5aeL5oKo55qE57+76K+R44CCDQo+ICsNCj4gK+S4uuS6huS/neivgee/u+ivkeeahOaWh+aho+ih
peS4geiiq+mhuuWIqeWQiOW5tu+8jOS4jeW7uuiuruWkmuS6uuWQjOaXtue/u+ivkeS4gOS4queb
ruW9le+8jOWboOS4uui/meS8mg0KPiAr6YCg5oiQ6KGl5LiB5LmL6Ze05LqS55u45L6d6LWW77yM
5b6A5b6A5Lya5a+86Ie05LiA6YOo5YiG6KGl5LiB6KKr5ZCI5bm277yM5Y+m5LiA6YOo5YiG5Lqn
55Sf5Yay56qB44CCDQo+ICsNCj4gK+WmguaenOWunuWcqOaXoOazlemBv+WFjeS4pOS4quS6uuWQ
jOaXtuWvueS4gOS4quebruW9lei/m+ihjOe/u+ivkeeahOaDheWGte+8jOivt+WwhuihpeS4geWI
tuS9nOi/m+S4gOS4quihpQ0KPiAr5LiB6ZuG44CC5L2G5piv5LiN5o6o6I2Q5Yia5byA5aeL5bCx
6L+Z5LmI5YGa77yM5Zug5Li657uP6L+H5a6e6Le177yM5Zyo5rKh5pyJ5oyH5a+855qE5oOF5Ya1
5LiL77yM5paw5omL5b6IDQo+ICvpmr7kuIDmrKHlpITnkIblpb3ov5nkuKrooaXkuIHpm4bjgIIN
Cj4gKw0KPiAr6K+35omn6KGM5Lul5LiL5ZG95Luk77yM5paw5bu65byA5Y+R5YiG5pSvOjoNCj4g
Kw0KPiArICAgICAgIGdpdCBjaGVja291dCBkb2NzLW5leHQNCj4gKyAgICAgICBnaXQgYnJhbmNo
IG15LXRyYW5zDQo+ICsgICAgICAgZ2l0IGNoZWNrb3V0IG15LXRyYW5zDQo+ICsNCj4gK+ivkeaW
h+agvOW8j+imgeaxgg0KPiArLS0tLS0tLS0tLS0tDQo+ICsNCj4gKyAgICAgICAtIOavj+ihjOmV
v+W6puacgOWkmuS4jei2hei/hzQw5Liq5a2X56ymDQo+ICsgICAgICAgLSDmr4/ooYzplb/luqbo
r7fkv53mjIHkuIDoh7QNCj4gKyAgICAgICAtIOagh+mimOeahOS4i+WIkue6v+mVv+W6puivt+aM
ieeFp+S4gOS4quiLseaWh+S4gOS4quWtl+espuOAgeS4gOS4quS4reaWh+S4pOS4quWtl+espuS4
juagh+mimOWvuem9kA0KPiArICAgICAgIC0g5YW25a6D55qE5L+u6aWw56ym6K+35LiO6Iux5paH
5paH5qGj5L+d5oyB5LiA6Ie0DQo+ICsNCj4gK+atpOWkluWcqOivkeaWh+eahOWktOmDqO+8jOaC
qOmcgOimgeaPkuWFpeS7peS4i+WGheWuuTo6DQo+ICsNCj4gKyAgICAgICAuLiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArICAgICAgIC4uIGluY2x1ZGU6OiAuLi9kaXNjbGFp
bWVyLXpoX0NOLnJzdCAgI+aCqOmcgOimgeS6huino+ivpeaWh+S7tueahOi3r+W+hO+8jOaguQ0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDmja7mgqjl
rp7pmYXnv7vor5HnmoTmlofmoaPngbXmtLvosIPmlbQNCj4gKw0KPiArICAgICAgIDpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi94eHgveHh4LnJzdCAgI+abv+aNouS4uuaCqOe/u+ivkeeahOiLseaW
h+aWh+aho+i3r+W+hA0KPiArDQo+ICsgICAgICAgOue/u+ivkToNCj4gKw0KPiArICAgICAgICDl
j7jlu7bohb4gWWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+ICPmm7/mjaLkuLrmgqjo
h6rlt7HnmoTogZTns7vmlrnlvI8NCj4gKw0KPiAr57+76K+R5oqA5benDQo+ICstLS0tLS0tLQ0K
PiArDQo+ICvkuK3mlofmlofmoaPmnInmr4/ooYw0MOWtl+espumZkOWItu+8jOWboOS4uuS4gOS4
quS4reaWh+Wtl+espuetieS6jjLkuKroi7HmloflrZfnrKbjgILkvYbmmK/npL7ljLrlubbmsqHm
nIkNCj4gK+mCo+S5iOS4peagvO+8jOS4gOS4quivgOeqjeaYr+WwhuaCqOeahOe/u+ivkeeahOWG
heWuueS4juiLseaWh+WOn+aWh+eahOavj+ihjOmVv+W6puWvuem9kOWNs+WPr++8jOi/meagt++8
jA0KPiAr5oKo5Lmf5LiN5b+F5oC75piv5qOA5p+l5pyJ5rKh5pyJ6LaF6ZmQ44CCDQo+ICsNCj4g
K+WmguaenOaCqOeahOiLseaWh+mYheivu+iDveWKm+aciemZkO+8jOWPr+S7peiAg+iZkeS9v+eU
qOi+heWKqee/u+ivkeW3peWFt++8jOS+i+WmgiBkZWVwc2VlayDjgILkvYbmmK/mgqgNCj4gK+W/
hemhu+S7lOe7huWcsOaJk+ejqO+8jOS9v+ivkeaWh+i+vuWIsOKAnOS/oei+vumbheKAneeahOag
h+WHhuOAgg0KPiArDQo+ICsqKuivt+azqOaEjyoqIOekvuWMuuS4jeaOpeWPl+e6r+acuuWZqOe/
u+ivkeeahOaWh+aho++8jOekvuWMuuW3peS9nOW7uueri+WcqOS/oeS7u+eahOWfuuehgOS4iu+8
jOivt+iupOecn+WvueW+heOAgg0KPiArDQo+ICvnvJbor5Hlkozmo4Dmn6UNCj4gKy0tLS0tLS0t
LS0NCj4gKw0KPiAr6K+35omn6KGMOjoNCj4gKw0KPiArICAgICAgIC4gc3BoaW54X2xhdGVzdC9i
aW4vYWN0aXZhdGUNCj4gKyAgICAgICBtYWtlIGNsZWFuZG9jcw0KPiArICAgICAgIG1ha2UgaHRt
bGRvY3MNCj4gKw0KPiAr6Kej5Yaz5LiO5oKo57+76K+R55qE5paH5qGj55u45YWz55qEIHdhcm5p
bmcg5ZKMIGVycm9y77yM54S25ZCO5omn6KGMOjoNCj4gKw0KPiArICAgICAgIG1ha2UgY2xlYW5k
b2NzICAj6K+l5q2l6aqk5LiN6IO955yB55Wl77yM5ZCm5YiZ5Y+v6IO95LiN5Lya5YaN5qyh6L6T
5Ye655yf5a6e5a2Y5Zyo55qE6K2m5ZGKDQo+ICsgICAgICAgbWFrZSBodG1sZG9jcw0KPiArICAg
ICAgIGRlYWN0aXZhdGUNCj4gKw0KPiAr6L+b5YWlIG91dHB1dCDnm67lvZXnlKjmtY/op4jlmajm
iZPlvIDmgqjnv7vor5HnmoTmlofmoaPvvIzmo4Dmn6XmuLLmn5PnmoTpobXpnaLmmK/lkKbmraPl
uLjvvIzlpoLmnpzmraPluLjvvIwNCj4gK+e7p+e7rei/m+ihjOWQjue7reatpemqpO+8jOWQpuWI
meivt+Wwneivleino+WGs+OAgg0KPiArDQo+ICvliLbkvZzooaXkuIENCj4gKz09PT09PT09DQo+
ICsNCj4gK+aPkOS6pOaUueWKqA0KPiArLS0tLS0tLS0NCj4gKw0KPiAr5omn6KGM5Lul5LiL5ZG9
5Luk77yM5Zyo5by55Ye655qE5Lqk5LqS5byP6aG16Z2i5Lit5aGr5YaZ5b+F6KaB55qE5L+h5oGv
44CCDQo+ICs6Og0KPiArDQo+ICsgICAgICAgZ2l0IGFkZCAuDQo+ICsgICAgICAgZ2l0IGNvbW1p
dCAtcyAtdg0KPiArDQo+ICvor7flj4LogIPku6XkuIvkv6Hmga/ov5vooYzovpPlhaU6Og0KPiAr
DQo+ICsgICAgICAgZG9jcy96aF9DTjogQWRkIHNlbGYtcHJvdGVjdGlvbiBpbmRleCBDaGluZXNl
IHRyYW5zbGF0aW9uDQo+ICsNCj4gKyAgICAgICBUcmFuc2xhdGUgLi4uL3NlY3VyaXR5L3NlbGYt
cHJvdGVjdGlvbi5yc3QgaW50byBDaGluZXNlLg0KPiArDQo+ICsgICAgICAgVXBkYXRlIHRoZSB0
cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCBiMDgwZTUyMTEwZWEgICAgICAj6K+35omn6KGMZ2l0
IGxvZyA85oKo57+76K+R55qE6Iux5paH5paH5qGj6Lev5b6EPiDlpI3liLbmnIDpobbpg6jnrKzk
uIDkuKrooaXkuIHnmoRzaGHlgLznmoTliY0xMuS9je+8jOabv+aNouaOiTEy5L2Nc2hh5YC844CC
DQo+ICsgICAgICAgKCJkb2NzOiB1cGRhdGUgc2VsZi1wcm90ZWN0aW9uIF9fcm9fYWZ0ZXJfaW5p
dCBzdGF0dXMiKQ0KPiArDQo+ICsgICAgICAgU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2ku
eWFudGVuZ0BsaW51eC5kZXY+ICAgICAgICAj5aaC5p6c5oKo5YmN6Z2i55qE5q2l6aqk5q2j56Gu
5omn6KGM77yM6K+l6KGM5Lya6Ieq5Yqo5pi+56S677yM5ZCm5YiZ6K+35qOA5p+lZ2l0Y29uZmln
5paH5Lu244CCDQo+ICsNCj4gK+S/neWtmOW5tumAgOWHuuOAgg0KPiArDQo+ICsqKuivt+azqOaE
jyoqIOS7peS4iuWbm+ihjO+8jOe8uuWwkeS7u+S9leS4gOihjO+8jOaCqOmDveWwhuS8muWcqOes
rOS4gOi9ruWuoemYheWQjui/lOW3pe+8jOWmguaenOaCqOmcgOimgeS4gOS4quabtOWKoOaYjueh
rueahOekuuS+i++8jOivt+WvuSB6aF9DTiDnm67lvZXmiafooYwgZ2l0IGxvZ+OAgg0KPiArDQo+
ICvlr7zlh7rooaXkuIHlkozliLbkvZzlsIHpnaINCj4gKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAr
DQo+ICvov5nkuKrml7blgJnvvIzlj6/ku6Xlr7zlh7rooaXkuIHvvIzlgZrlj5HpgIHpgq7ku7bl
iJfooajmnIDlkI7nmoTlh4blpIfkuobjgILlkb3ku6TooYzmiafooYw6Og0KPiArDQo+ICsgICAg
ICAgZ2l0IGZvcm1hdC1wYXRjaCAtTg0KPiArDQo+ICvnhLblkI7lkb3ku6TooYzkvJrovpPlh7rn
sbvkvLzkuIvpnaLnmoTlhoXlrrk6Og0KPiArDQo+ICsgICAgICAgMDAwMS1kb2NzLXpoX0NOLWFk
ZC14eHh4eHh4eC5wYXRjaA0KPiArICAgICAgIDAwMDItZG9jcy16aF9DTi1hZGQteHh4eHh4eHgu
cGF0Y2gNCj4gKyAgICAgICDigKbigKYNCj4gKw0KPiAr5rWL6K+V6KGl5LiBDQo+ICstLS0tLS0t
LQ0KPiArDQo+ICvlhoXmoLjmj5DkvpvkuobkuIDkuKrooaXkuIHmo4DmtYvohJrmnKzvvIzor7fm
iafooYw6Og0KPiArDQo+ICsgICAgICAgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgKi5wYXRjaA0K
PiArDQo+ICvlj4LogIPohJrmnKzovpPlh7rvvIzop6PlhrPmjonmiYDmnInnmoQgZXJyb3Ig5ZKM
IHdhcm5pbmfvvIzpgJrluLjmg4XlhrXkuIvvvIzlj6rmnInkuIvpnaLov5nkuKoNCj4gK3dhcm5p
bmcg5LiN6ZyA6KaB6Kej5YazOjoNCj4gKw0KPiArICAgICAgIFdBUk5JTkc6IGFkZGVkLCBtb3Zl
ZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8NCj4g
Kw0KPiAr5LiA5Liq566A5Y2V55qE6Kej5Yaz5pa55rOV5piv5LiA5qyh5Y+q5qOA5p+l5LiA5Liq
6KGl5LiB77yM54S25ZCO5omT5LiK6K+l6KGl5LiB77yM55u05o6l5a+56K+R5paH6L+b6KGM5L+u
5pS577yMDQo+ICvnhLblkI7miafooYzku6XkuIvlkb3ku6TkuLrooaXkuIHov73liqDmm7TmlLk6
Og0KPiArDQo+ICsgICAgICAgZ2l0IGNoZWNrb3V0IGRvY3MtbmV4dA0KPiArICAgICAgIGdpdCBi
cmFuY2ggdGVzdC10cmFucw0KPiArICAgICAgIGdpdCBhbSAwMDAxLXh4eHh4LnBhdGNoDQo+ICsg
ICAgICAgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgMDAwMS14eHh4eC5wYXRjaA0KPiArICAgICAg
IOebtOaOpeS/ruaUueaCqOeahOe/u+ivkQ0KPiArICAgICAgIGdpdCBhZGQgLg0KPiArICAgICAg
IGdpdCBhbSAtLWFtZW5kDQo+ICsgICAgICAg5L+d5a2Y6YCA5Ye6DQo+ICsgICAgICAgZ2l0IGFt
IDAwMDIteHh4eHgucGF0Y2gNCj4gKyAgICAgICDigKbigKYNCj4gKw0KPiAr6YeN5paw5a+85Ye6
5YaN5qyh5qOA5rWL77yM6YeN5aSN6L+Z5Liq6L+H56iL77yM55u05Yiw5aSE55CG5a6M5omA5pyJ
55qE6KGl5LiB44CCDQo+ICsNCj4gK+acgOWQju+8jOWmguaenOajgOa1i+aXtuayoeaciSB3YXJu
aW5nIOWSjCBlcnJvciDpnIDopoHooqvlpITnkIbmiJbogIXmgqjlj6rmnInkuIDkuKrooaXkuIHv
vIzor7fot7MNCj4gK+i/h+S4i+mdoui/meS4quatpemqpO+8jOWQpuWImeivt+mHjeaWsOWvvOWH
uuihpeS4geWItuS9nOWwgemdojo6DQo+ICsNCj4gKyAgICAgICBnaXQgZm9ybWF0LXBhdGNoIC1O
IC0tY292ZXItbGV0dGVyIC0tdGhyZWFkPXNoYWxsb3cgICNO5Li65oKo55qE6KGl5LiB5pWw6YeP
LE7kuIDoiKzopoHlpKfkuo4x44CCDQo+ICsNCj4gK+eEtuWQjuWRveS7pOihjOS8mui+k+WHuuex
u+S8vOS4i+mdoueahOWGheWuuTo6DQo+ICsNCj4gKyAgICAgICAwMDAwLWNvdmVyLWxldHRlci5w
YXRjaA0KPiArICAgICAgIDAwMDEtZG9jcy16aF9DTi1hZGQteHh4eHh4eHgucGF0Y2gNCj4gKyAg
ICAgICAwMDAyLWRvY3MtemhfQ04tYWRkLXh4eHh4eHh4LnBhdGNoDQo+ICsNCj4gK+aCqOmcgOim
geeUqOe8lui+keWZqOaJk+W8gDDlj7fooaXkuIHvvIzkv67mlLnkuKTlpITlhoXlrrk6Og0KPiAr
DQo+ICsgICAgICAgdmltIDAwMDAtY292ZXItbGV0dGVyLnBhdGNoDQo+ICsNCj4gKyAgICAgICAu
Li4NCj4gKyAgICAgICBTdWJqZWN0OiBbUEFUQ0ggMC8xXSAqKiogU1VCSkVDVCBIRVJFICoqKiAg
ICAgICAj5L+u5pS56K+l5a2X5q6177yM5qaC5ous5oKo55qE6KGl5LiB6ZuG6YO95YGa5LqG5ZOq
5Lqb5LqL5oOFDQo+ICsNCj4gKyAgICAgICAqKiogQkxVUkIgSEVSRSAqKiogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAj5L+u5pS56K+l5a2X5q6177yM6K+m57uG5o+P6L+w5oKo55qE6KGl
5LiB6ZuG5YGa5LqG5ZOq5Lqb5LqL5oOFDQo+ICsNCj4gKyAgICAgICBZYW50ZW5nIFNpICgxKToN
Cj4gKyAgICAgICAgIGRvY3MvemhfQ046IGFkZCB4eHh4eA0KPiArICAgICAgIC4uLg0KPiArDQo+
ICvlpoLmnpzmgqjlj6rmnInkuIDkuKrooaXkuIHvvIzliJnlj6/ku6XkuI3liLbkvZzlsIHpnaLv
vIzljbMw5Y+36KGl5LiB77yM5Y+q6ZyA6KaB5omn6KGMOjoNCj4gKw0KPiArICAgICAgIGdpdCBm
b3JtYXQtcGF0Y2ggLTENCj4gKw0KPiAr5oqK6KGl5LiB5o+Q5Lqk5Yiw6YKu5Lu25YiX6KGoDQo+
ICs9PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICvmga3llpzmgqjvvIzmgqjnmoTmlofmoaPn
v7vor5HnjrDlnKjlj6/ku6Xmj5DkuqTliLDpgq7ku7bliJfooajkuobjgIINCj4gKw0KPiAr6I63
5Y+W57u05oqk6ICF5ZKM5a6h6ZiF6ICF6YKu566x5Lul5Y+K6YKu5Lu25YiX6KGo5Zyw5Z2ADQo+
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICvlhoXmoLjm
j5DkvpvkuobkuIDkuKroh6rliqjljJbohJrmnKzlt6XlhbfvvIzor7fmiafooYw6Og0KPiArDQo+
ICsgICAgICAgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICoucGF0Y2gNCj4gKw0KPiAr5bCG
6L6T5Ye655qE6YKu566x5Zyw5Z2A5L+d5a2Y5LiL5p2l44CCDQo+ICsNCj4gK+WwhuihpeS4geaP
kOS6pOWIsOmCruS7tuWIl+ihqA0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5omT
5byA5LiK6Z2i5oKo5L+d5a2Y55qE6YKu5Lu25Zyw5Z2A77yM5omn6KGMOjoNCj4gKw0KPiArICAg
ICAgIGdpdCBzZW5kLWVtYWlsICoucGF0Y2ggLS10byA8bWFpbnRhaW5lciBlbWFpbCBhZGRyPiAt
LWNjIDxvdGhlcnMgYWRkcj4gICPkuIDkuKp0b+WvueW6lOS4gOS4quWcsOWdgO+8jOS4gOS4qmNj
5a+55bqU5LiA5Liq5Zyw5Z2A77yM5pyJ5Yeg5Liq5bCx5YaZ5Yeg5Liq44CCDQo+ICsNCj4gK+aJ
p+ihjOivpeWRveS7pOaXtu+8jOivt+ehruS/nee9kee7nOmAmuW4uO+8jOmCruS7tuWPkemAgeaI
kOWKn+S4gOiIrOS8mui/lOWbnjI1MOOAgg0KDQphZGQgYSBzZWxmIGFwcGx5IHJlbWluZGVyIGhl
cmUsIGxpa2U6DQrmgqjlj6/ku6XlhYjlj5HpgIHnu5noh6rlt7HvvIzlsJ3or5Xlj5Hlh7rnmoQg
cGF0Y2gg5piv5ZCm5Y+v5Lul55SoICdnaXQgYW0nIOW3peWFt+ato+W4uOaJk+S4iuOAgg0K5aaC
5p6c5qOA5p+l5q2j5bi477yMIOaCqOWwseWPr+S7peaUvuW/g+eahOWPkemAgeWIsOekvuWMuuiv
hOWuoeS6huOAgg0KDQpPdGhlcnMgbG9va3MgZ29vZCB0byBtZS4NCg0KVGhhbmtzDQpBbGV4DQo=


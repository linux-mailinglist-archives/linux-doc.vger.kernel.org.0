Return-Path: <linux-doc+bounces-35873-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75CA189C7
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 03:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640131885F01
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jan 2025 02:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5E218E1F;
	Wed, 22 Jan 2025 02:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGjMrVDg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235514F9CC
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511643; cv=none; b=KjmbKbawlbAFmPBW4obR2h89hGkzYSVjnsYrmm31U9cy1ZFauO2+1V++Q31MdCXL5rImkChJOsPngH/cy68iBxHlaULOl8zTHsvzrWpXstkQDDz/bN4vv4d+KrOM63xl8ez05pVuUASNQ4iDJUPTAkk1fLDGyHztjBhkEy8aVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511643; c=relaxed/simple;
	bh=vkRSUKtmUCMMMrKDWE3/hr+RrXVAFuq/9iUIOiqLow0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZV+y3dTt18Hq82n1JAu9mhb+ZA/ymf5ak/dxfhCxm9xzNWFcCSDMxbIONbfe9Npl53h2+cQ+uG6ZPdDaN2TwmTmQhPEAsBgyAq+zk5V8jyyCD6az7df94PUVy37BwtUVwqLtajYFrWF/kdXiJYFBCKcT+D3he3VM/OSJb7fNrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGjMrVDg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab651f1dd36so92244266b.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 18:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737511640; x=1738116440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkRSUKtmUCMMMrKDWE3/hr+RrXVAFuq/9iUIOiqLow0=;
        b=cGjMrVDgU/aMz/VN02Xxyzfor6Ol7fVpb9P3XtvzmJ5ZoE0pE0UzlAyPdiWkMd93y0
         6tltWz5dFAkjZLyHAy42sgsCCYrGRgvxbpSJjQCyshmTIsQWnaH3T9KZ1gZTWDaXGj3D
         2dA7sc7e8NbaDaQ53fwyhI0hBz7Pq0VkpRy5dPnkIVOvFnhgqKoDw0aFDoX88vwNJaao
         vZ//bJ/sP0Q/Ock0Gb/5S7A4vjntYm9NZiMnMX7rU097xUuhZh44oyH9+J1xeqKEmgid
         5qO6uHLUEfR3rqX0chMLMeOKYb4Pt0pw40HeIfy8WxoPTC8JjyzAovCgOs9DS5MEV3QK
         LTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737511640; x=1738116440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkRSUKtmUCMMMrKDWE3/hr+RrXVAFuq/9iUIOiqLow0=;
        b=sl5vFZ53Y/wjsXo1AA5L6BecS/a/NqQiU7Y1MXFnbNXJdsGZiuEvl2xKW/7ciz6Ox3
         2V2S319P+HerhKAPB2z1CGeCmje5rJ46/zG2Kjyzh1SE0uAOIVULmIROgMDIXc8IM6h1
         90/FIrXkusFgEXsAyW9XZW6WOhwu7nWW4bR2t5H6OilFxVhR+7Zb2Z2I24aHok9sGUh9
         SNyZHvIgM2t9SjDIHWsEHUplfvHmtBoLYDA6jJWmKDmyGej+SKCyTvtr/DAlQHhPLgl6
         sMXCpf9eUATfB8Ep31aVX7909gcpTvyxz5I+xKquiF4tf8f0GO0ydB1J3KWsFtnUnM3s
         tcBg==
X-Forwarded-Encrypted: i=1; AJvYcCVB07dTq927suos/ZEGJo1WyKxlxcJoNYqAbHGf+bzRBHbifeQRtPx5Iy/WKuJmnokzKdTvDZHHC5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bxt4TqDMsr7Itd5uu6qtqcMCDvGScrTkYyK8n83A0XnwyTSs
	WoTLmsFAY2505JocyP217mvR5qIdMGjrY4Clf0LMhz/CH3NstmVvP/+AETCmfXgBB5Nm5aLSkh7
	saJsyGeBYIb/Awj5xrzOO99ycysc=
X-Gm-Gg: ASbGncuP3fzirsws6opLDgupAiDE74M2649ufZdd5NHLQ650jG8OdDBcKOccgIoqdEI
	IbThZX7vIhzXpVXnGGRZHuBEDzg3WKS5jpe5Yp8Oo1w3AIFxirg0=
X-Google-Smtp-Source: AGHT+IEWY3h1ODyVzLRnob4TZXz6DyBgIP8Os1trq5MZkwMmW2In5o9vwgpihq+HMCfC8w5WpUwHodA1OWNfYkVg1AM=
X-Received: by 2002:a17:907:3e1f:b0:aaf:117c:e929 with SMTP id
 a640c23a62f3a-ab38b51c914mr1999359366b.57.1737511639479; Tue, 21 Jan 2025
 18:07:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn> <e98c3702e7eaba7296bed5a8ab40cdff3183f607.1737354981.git.zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <e98c3702e7eaba7296bed5a8ab40cdff3183f607.1737354981.git.zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 22 Jan 2025 10:06:41 +0800
X-Gm-Features: AbW1kvblt4VbuRwFyBJ62dvawBuJ26ZSbJ4Ore4R5-WM7_MJ9zY4fbZSuEXST3A
Message-ID: <CAJy-Am=JKWyysq=6KEKaqBSQexQwXi5jvS6YViqkhZMueVWf9g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] docs/zh_CN: Add tpm xen-tpmfront Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

U2h1byBaaGFvIDx6aGFvc2h1b0BjcXNvZnR3YXJlLmNvbS5jbj4g5LqOMjAyNeW5tDHmnIgyMOaX
peWRqOS4gCAxNToyNuWGmemBk++8mg0KPg0KPiBUcmFuc2xhdGUgLi4uL3NlY3VyaXR5L3RwbS94
ZW4tdHBtZnJvbnQucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gVXBkYXRlIHRoZSB0cmFuc2xhdGlv
biB0aHJvdWdoIGNvbW1pdCA5ZTI1NWUyYjlhZmUNCj4gKCJEb2N1bWVudGF0aW9uOiBkcm9wIG9w
dGlvbmFsIEJPTXMiKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVvIFpoYW8gPHpoYW9zaHVvQGNx
c29mdHdhcmUuY29tLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJp
dHkvdHBtL2luZGV4LnJzdCB8ICAgMiArLQ0KPiAgLi4uL3poX0NOL3NlY3VyaXR5L3RwbS94ZW4t
dHBtZnJvbnQucnN0ICAgICAgIHwgMTE0ICsrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NlY3VyaXR5L3RwbS94ZW4t
dHBtZnJvbnQucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdA0KPiBpbmRleCBkZDgwODE2ZjhhZjguLmJm
OTUyMDBjYTU4NiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0DQo+IEBAIC0xNiw3ICsxNiw3IEBADQo+
ICAgICB0cG0tc2VjdXJpdHkNCj4gICAgIHRwbV90aXMNCj4gICAgIHRwbV92dHBtX3Byb3h5DQo+
ICsgICB4ZW4tdHBtZnJvbnQNCj4NCj4gIFRPRE9MSVNUOg0KPiAtKiAgIHhlbi10cG1mcm9udA0K
PiAgKiAgIHRwbV9mdHBtX3RlZQ0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL3hlbi10cG1mcm9udC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS90cG0veGVuLXRwbWZyb250LnJzdA0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQzNGU3ZTk1N2Y2Yg0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Nl
Y3VyaXR5L3RwbS94ZW4tdHBtZnJvbnQucnN0DQo+IEBAIC0wLDAgKzEsMTE0IEBADQo+ICsuLiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6IC4uLy4uL2Rp
c2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9zZWN1
cml0eS90cG0veGVuLXRwbWZyb250LnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArIOi1teehlSBT
aHVvIFpoYW8gPHpoYW9zaHVvQGNxc29mdHdhcmUuY29tLmNuPg0KPiArDQo+ICs9PT09PT09PT09
PT09PT09DQo+ICtYZW7nmoTomZrmi59UUE3mjqXlj6MNCj4gKz09PT09PT09PT09PT09PT0NCj4g
Kw0KPiAr5L2c6ICF77yaTWF0dGhldyBGaW9yYXZhbnRlIChKSFVBUEwpLCBEYW5pZWwgRGUgR3Jh
YWYgKE5TQSkNCj4gKw0KPiAr5pys5paH5qGj5o+P6L+w5LqG55So5LqOWGVu55qE6Jma5ouf5Y+v
5L+h5bmz5Y+w5qih5Z2X77yIdlRQTe+8ieWtkOezu+e7n+OAguWBh+Wumuivu+iAheeGn+aCiQ0K
PiArWGVu5ZKMTGludXjnmoTmnoTlu7rlkozlronoo4XvvIzlubblr7lUUE3lkox2VFBN5qaC5b+1
5pyJ5Z+65pys55qE55CG6Kej44CCDQo+ICsNCj4gK+S7i+e7jQ0KPiArLS0tLQ0KPiArDQo+ICvo
v5npobnlt6XkvZznmoTnm67moIfmmK/kuLromZrmi5/lrqLmiLfmk43kvZzns7vnu5/vvIjlnKhY
ZW7kuK3np7DkuLpEb21V77yJ5o+Q5L6bVFBN5Yqf6IO944CC6L+Z5L2/5b6XDQo+ICvnqIvluo/o
g73lpJ/lg4/kuI7niannkIbns7vnu5/kuIrnmoRUUE3kuqTkupLkuIDmoLfvvIzkuI7omZrmi5/n
s7vnu5/kuK3nmoRUUE3ov5vooYzkuqTkupLjgILmr4/kuKrlrqLmiLcNCj4gK+aTjeS9nOezu+e7
n+mDveS8muiOt+W+l+S4gOS4quWUr+S4gOeahOOAgeaooeaLn+eahOi9r+S7tlRQTeOAgueEtuiA
jO+8jHZUUE3nmoTmiYDmnInnp5jlr4bvvIjlpoLlr4bpkqXjgIENCj4gK05WUkFNIOetie+8ieeU
sXZUUE3nrqHnkIbln5/ov5vooYznrqHnkIbvvIzor6Xln5/lsIbov5nkupvnp5jlr4blsIHlrZjl
iLDniannkIZUUE3kuK3jgILlpoLmnpzliJvlu7rov5kNCj4gK+S6m+Wfn++8iOeuoeeQhuWfn+OA
gXZUUE3ln5/lkozlrqLmiLfln5/vvInnmoTov4fnqIvmmK/lj6/kv6HnmoTvvIx2VFBN5a2Q57O7
57uf5bCx6IO95bCG5qC55qSN5LqO56Gs5Lu2DQo+ICtUUE3nmoTkv6Hku7vpk77mianlsZXliLBY
ZW7kuK3nmoTomZrmi5/mnLrjgIJ2VFBN55qE5q+P5Liq5Li76KaB57uE5Lu26YO95L2c5Li65LiA
5Liq54us56uL55qE5Z+f5a6e546w77yMDQo+ICvku47ogIzpgJrov4fomZrmi5/mnLrnm5Hmjqfn
qIvluo/vvIhoeXBlcnZpc29y77yJ5o+Q5L6b5a6J5YWo6ZqU56a744CCDQo+ICsNCj4gK+i/meS4
qm1pbmktb3MgdlRQTSDlrZDns7vnu5/mmK/lu7rnq4vlnKhJQk3lkoxJbnRlbOWFrOWPuOS5i+WJ
jeeahHZUUE3lt6XkvZzln7rnoYDkuIrnmoTjgIINCj4gKw0KPiArDQo+ICvorr7orqHmpoLov7AN
Cj4gKy0tLS0tLS0tDQo+ICsNCj4gK3ZUUE3nmoTmnrbmnoTmj4/ov7DlpoLkuIs6Og0KPiArDQo+
ICsgICstLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgIHwgICAgTGludXggRG9tVSAgICB8IC4uLg0K
PiArICB8ICAgICAgIHwgIF4gICAgICAgfA0KPiArICB8ICAgICAgIHYgIHwgICAgICAgfA0KPiAr
ICB8ICAgeGVuLXRwbWZyb250ICAgfA0KPiArICArLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArICAg
ICAgICAgIHwgIF4NCj4gKyAgICAgICAgICB2ICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLS0r
DQo+ICsgIHwgbWluaS1vcy90cG1iYWNrICB8DQo+ICsgIHwgICAgICAgfCAgXiAgICAgICB8DQo+
ICsgIHwgICAgICAgdiAgfCAgICAgICB8DQo+ICsgIHwgIHZ0cG0tc3R1YmRvbSAgICB8IC4uLg0K
PiArICB8ICAgICAgIHwgIF4gICAgICAgfA0KPiArICB8ICAgICAgIHYgIHwgICAgICAgfA0KPiAr
ICB8IG1pbmktb3MvdHBtZnJvbnQgfA0KPiArICArLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArICAg
ICAgICAgIHwgIF4NCj4gKyAgICAgICAgICB2ICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLS0r
DQo+ICsgIHwgbWluaS1vcy90cG1iYWNrICB8DQo+ICsgIHwgICAgICAgfCAgXiAgICAgICB8DQo+
ICsgIHwgICAgICAgdiAgfCAgICAgICB8DQo+ICsgIHwgdnRwbW1nci1zdHViZG9tICB8DQo+ICsg
IHwgICAgICAgfCAgXiAgICAgICB8DQo+ICsgIHwgICAgICAgdiAgfCAgICAgICB8DQo+ICsgIHwg
bWluaS1vcy90cG1fdGlzICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgICAgICAg
ICAgfCAgXg0KPiArICAgICAgICAgIHYgIHwNCj4gKyAgKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4g
KyAgfCAgIEhhcmR3YXJlIFRQTSAgIHwNCj4gKyAgKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gKw0K
PiArKiBMaW51eCBEb21VOg0KPiArICAgICAgICAgICAgICAg5biM5pyb5L2/55SodlRQTeeahOWf
uuS6jkxpbnV455qE5a6i5oi35py644CC5Y+v6IO95pyJ5aSa5Liq6L+Z5qC355qE5a6e5L6L44CC
DQo+ICsNCj4gKyogeGVuLXRwbWZyb250LmtvOg0KPiArICAgICAgICAgICAgICAgICAgICBMaW51
eOWGheaguOiZmuaLn1RQTeWJjeerr+mpseWKqOeoi+W6j+OAguivpempseWKqOeoi+W6j+S4uuWf
uuS6jkxpbnV455qERG9tVeaPkOS+mw0KPiArICAgICAgICAgICAgICAgICAgICB2VFBN6K6/6Zeu
44CCDQoNCkFsaWdubWVudCBpc3N1ZS4NCg0KPiArDQo+ICsqIG1pbmktb3MvdHBtYmFjazoNCj4g
KyAgICAgICAgICAgICAgICAgICAgTWluaS1vcyBUUE3lkI7nq6/pqbHliqjnqIvluo/jgIJMaW51
eOWJjeerr+mpseWKqOeoi+W6j+mAmui/h+ivpeWQjuerr+mpseWKqOeoi+W6j+i/ng0KPiArICAg
ICAgICAgICAgICAgICAgICDmjqXvvIzku6Xkvr/lnKhMaW51eCBEb21V5ZKM5YW2dlRQTeS5i+mX
tOi/m+ihjOmAmuS/oeOAguivpempseWKqOeoi+W6j+i/mOiiqw0KPiArICAgICAgICAgICAgICAg
ICAgICB2dHBtbWdyLXN0dWJkb23nlKjkuo7kuI52dHBtLXN0dWJkb23pgJrkv6HjgIINCj4gKw0K
PiArKiB2dHBtLXN0dWJkb206DQo+ICsgICAgICAgICAgICAgICAgIOS4gOS4quWunueOsHZUUE3n
moRtaW5pLW9z5a2Y5qC55Z+f44CC5q+P5Liq5q2j5Zyo6L+Q6KGM55qEdnRwbS1zdHViZG9t5a6e
5L6L5LiO57O757ufDQo+ICsgICAgICAgICAgICAgICAgIOS4iueahOmAu+i+kXZUUE3kuYvpl7Tm
nInkuIDkuIDlr7nlupTnmoTlhbPns7vjgIJ2VFBN5bmz5Y+w6YWN572u5a+E5a2Y5Zmo77yIUENS
c++8iemAmuW4uOmDvQ0KPiArICAgICAgICAgICAgICAgICDliJ3lp4vljJbkuLrpm7bjgIINCj4g
Kw0KPiArKiBtaW5pLW9zL3RwbWZyb250Og0KPiArICAgICAgICAgICAgICAgICAgICAgTWluaS1v
cyBUUE3liY3nq6/pqbHliqjnqIvluo/jgIJ2VFBNIG1pbmktb3Pln592dHBtLXN0dWJkb23kvb/n
lKjor6XpqbHliqjnqIvluo8NCj4gKyAgICAgICAgICAgICAgICAgICAgIOS4jnZ0cG1tZ3Itc3R1
YmRvbemAmuS/oeOAguatpOmpseWKqOeoi+W6j+i/mOeUqOS6juS4jnZUUE3ln5/pgJrkv6HnmoRt
aW5pLW9z5Z+f77yM5L6LDQo+ICsgICAgICAgICAgICAgICAgICAgICDlpoIgcHYtZ3J1YuOAgg0K
PiArDQo+ICsqIHZ0cG1tZ3Itc3R1YmRvbToNCj4gKyAgICAgICAgICAgICAgICAgICAg5LiA5Liq
5a6e546wdlRQTeeuoeeQhuWZqOeahG1pbmktb3Pln5/jgILns7vnu5/kuK3lj6rmnInkuIDkuKp2
VFBN566h55CG5Zmo77yM5bm25LiU5Zyo5pW05LiqDQo+ICsgICAgICAgICAgICAgICAgICAgIOac
uuWZqOeUn+WRveWRqOacn+WGheW6lOS4gOebtOi/kOihjOOAguatpOWfn+iwg+iKguWvueezu+e7
n+S4reeJqeeQhlRQTeeahOiuv+mXru+8jOW5tuehruS/neavj+S4qg0KPiArICAgICAgICAgICAg
ICAgICAgICB2VFBN55qE5oyB5LmF54q25oCB44CCDQo+ICsNCj4gKyogbWluaS1vcy90cG1fdGlz
Og0KPiArICAgICAgICAgICAgICAgICAgICBNaW5pLW9zVFBNMS4y54mI5pysVFBNIOaOpeWPo+in
hOiMg++8iFRJU++8iempseWKqOeoi+W6j+OAguivpempseWKqOeoi+W6j+eUsXZ0cG1tZ3Itc3R1
YmRvbQ0KPiArICAgICAgICAgICAgICAgICAgICDnlKjkuo7nm7TmjqXkuI7noazku7ZUUE3pgJrk
v6HjgILpgJrkv6HpgJrov4flsIbnoazku7blhoXlrZjpobXmmKDlsITliLB2dHBtbWdyLXN0dWJk
b23mnaXlrp7njrDjgIINCj4gKw0KPiArKiDnoazku7ZUUE06DQo+ICsgICAgICAgICAgICDlm7rl
rprlnKjkuLvmnb/kuIrnmoTniannkIYgVFBN44CCDQo+ICsNCj4gK+S4jlhlbueahOmbhuaIkA0K
PiArLS0tLS0tLS0tLS0NCj4gKw0KPiArdlRQTempseWKqOeoi+W6j+eahOaUr+aMgeW3suWcqFhl
bjQuM+S4remAmui/h2xpYnhs5bel5YW35aCG5qCI5re75Yqg44CC5pyJ5YWz6K6+572udlRQTeWS
jHZUUE0NCj4gK+euoeeQhuWZqOWtmOagueWfn+eahOivpue7huS/oeaBr++8jOivt+WPguingVhl
buaWh+aho++8iGRvY3MvbWlzYy92dHBtLnR4dO+8ieOAguS4gOaXpuWtmOagueWfnw0KPiAr6L+Q
6KGM77yM5LiO56OB55uY5oiW572R57uc6K6+5aSH55u45ZCM77yMdlRQTeiuvuWkh+WwhuWcqOWf
n+eahOmFjee9ruaWh+S7tuS4rei/m+ihjOiuvue9rg0KPiArDQo+ICvkuLrkuobkvb/nlKjor7jl
poJJTUHvvIjlhoXmoLjluqbph4/mnrbmnoTvvInnrYnpnIDopoHlnKhpbml0cmTkuYvliY3liqDo
vb1UUE3nmoTlip/og73vvIzlv4XpobvlsIYNCg0KSU1BLCBJbnRlZ3JpdHkgTWVhc3VyZW1lbnQg
QXJjaGl0ZWN0dXJlLg0KDQpGb3Igb3RoZXJzLA0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4
c0BrZXJuZWwub3JnPg0KDQo+ICt4ZW4tdHBtZnJvbnTpqbHliqjnqIvluo/nvJbor5HliLDlhoXm
oLjkuK3jgILlpoLmnpzkuI3kvb/nlKjov5nkupvlip/og73vvIzpqbHliqjnqIvluo/lj6/ku6Xk
vZzkuLoNCj4gK+aooeWdl+e8luivke+8jOW5tuWDj+W+gOW4uOS4gOagt+WKoOi9veOAgg0KPiAt
LQ0KPiAyLjQ3LjENCj4NCg==


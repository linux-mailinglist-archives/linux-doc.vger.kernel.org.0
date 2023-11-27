Return-Path: <linux-doc+bounces-3146-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E47F97BC
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 03:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B59E280DFE
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 02:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C1C1C29;
	Mon, 27 Nov 2023 02:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2kYWlSA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35757111
	for <linux-doc@vger.kernel.org>; Sun, 26 Nov 2023 18:57:14 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a049d19b63bso506832266b.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Nov 2023 18:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701053832; x=1701658632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYVKnC0HtykEFyaxX4FgS+XCA7S3ZvPglDZZKrkn8l4=;
        b=Q2kYWlSAKuJw/WpP6Crua6VInSwa7tSsDEbO1+G7Ug+GaMBVsoleOXETY4hT1/87SJ
         S6dN4B//tfqAE8QyyJOWAiLMQY6K/IeOThijdJyWZ00rs/TrG1p9q6YbCGzqHi1FyyUg
         7lm8dicThENVfto0YFARl+ZtCoQp4qBzjKxsAaNYhDEFsr/gRWe/q1rSL69AWh15XJj6
         LLF75Jnu/ZfBnqNG/Vh8M0Zz1JGACaWM7YiHDN7N4pUM7ju6LX0fRNGNf5gBC0ELHbDR
         5aOZcZJKsEvbnZZ12B7JHxG9t/ChXJ1IK5KgDNldomXLvhw6wv+oiHwebSoL71U0MUMT
         8heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053832; x=1701658632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYVKnC0HtykEFyaxX4FgS+XCA7S3ZvPglDZZKrkn8l4=;
        b=bJOO/JYZgiBDO4xl6nL1hQZhcmnKLQbYCBLdLVI1qiNEIAzOiLH2xVklJX5ahfNkUC
         wkUP8cga44aIpSr29D0v/kI0Zixx6t4+syqHUSL7HWRMwLB2SOhok1iqHQ2L1JroJE/q
         fGVu3sKHKU8LwikcLBGZScvqbdEiM0oUhSJmggpiFmNUyzAVNyqj984U0pcGQ1HRd0Wy
         2FMcg+AIMCFEeFWSH6kt8aBDANWSIF7WK0vvroaI+TXyjpN7vc2cLjYz76eu71V60Ihf
         WUnxOCLrvj682yZo7vFwf0eDp6dsMbfmpZxODQ+hmjAjnShDkc5JnXSxz343Faj6AoZ+
         0CBA==
X-Gm-Message-State: AOJu0YxZ9frU+KX79Y25Cr373g33LRjrM+7EEMH421LUrVGbljQgstXv
	qJPesWVvNj9Xskl8xuUBBetBk2hjnm3b/Ufnl+ftd4OVgHnwbw==
X-Google-Smtp-Source: AGHT+IGpXZyH3JmcMy1Yw/3XTc2GhT/Czj5d+zH62neqBj0RRh+GFSuLGdMSOy7qlkOjwRXZH1o39TRH5pPHtq+Pli4=
X-Received: by 2002:a17:907:9009:b0:9fe:81a:c24c with SMTP id
 ay9-20020a170907900900b009fe081ac24cmr6657094ejc.67.1701053832497; Sun, 26
 Nov 2023 18:57:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1700474235.git.siyanteng@loongson.cn> <b3c1b55a442280c583518c45495e5540d6797548.1700474235.git.siyanteng@loongson.cn>
In-Reply-To: <b3c1b55a442280c583518c45495e5540d6797548.1700474235.git.siyanteng@loongson.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 27 Nov 2023 10:56:36 +0800
Message-ID: <CAJy-AmkQMKL9uGK_AaKE5LgaVLqX64k7rYCPFZxZnM9K90Cq5g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] docs/zh_CN: Adjust the number of characters per
 line in magic-number.rst to less than 40
To: Yanteng Si <siyanteng@loongson.cn>
Cc: corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn, wu.xiangcheng@linux.dev, 
	yizhou.tang@shopee.com, linux-doc@vger.kernel.org, chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TEdUTQ0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBNb24s
IE5vdiAyMCwgMjAyMyBhdCA2OjAy4oCvUE0gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29u
LmNuPiB3cm90ZToNCj4NCj4gVGhlIGN1cnJlbnQgbGluZXMgYXJlIHRvbyBsb25nIGFuZCB1bmZy
aWVuZGx5IHRvIGRldmVsb3BlcnMgd2hvIHVzZQ0KPiB2aW0gdG8gcmVhZCBkb2N1bWVudHMsIGVz
cGVjaWFsbHkgb24gc21hbGwgbW9uaXRvcnMsIHNvIGxldCdzIGFkanVzdA0KPiB0byBsZXNzIHRo
YW4gNDAgY2hhcmFjdGVycy4NCj4NCj4gSW4gYWRkaXRpb24sIHNvbWUgdHJhbnNsYXRpb25zIHdl
cmUgbW9kaWZpZWQgaW5jaWRlbnRhbGx5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNp
IDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3poX0NOL3Byb2Nlc3MvbWFn
aWMtbnVtYmVyLnJzdCAgICAgICAgICAgIHwgNjkgKysrKysrKysrKystLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9tYWdpYy1u
dW1iZXIucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9tYWdp
Yy1udW1iZXIucnN0DQo+IGluZGV4IDRhOTJlYmI2MTllZS4uNGU0YWVhY2E3OTZjIDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL21hZ2ljLW51
bWJlci5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vz
cy9tYWdpYy1udW1iZXIucnN0DQo+IEBAIC0xLDU4ICsxLDY3IEBADQo+IC0uLiBfY25fbWFnaWNu
dW1iZXJzOg0KPiAtDQo+ICAuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4N
Cj4gLTpPcmlnaW5hbDogOnJlZjpgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21hZ2ljLW51bWJlci5y
c3QgPG1hZ2ljbnVtYmVycz5gDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vcHJvY2Vzcy9t
YWdpYy1udW1iZXIucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+DQo+IC3lpoLmnpzmg7Por4Torrrm
iJbmm7TmlrDmnKzmlofnmoTlhoXlrrnvvIzor7fnm7TmjqXlj5Hkv6HliLBMS01M44CC5aaC5p6c
5L2g5L2/55So6Iux5paH5Lqk5rWB5pyJ5Zuw6Zq+55qE6K+d77yM5Lmf5Y+vDQo+IC3ku6XlkJHk
uK3mlofniYjnu7TmiqTogIXmsYLliqnjgILlpoLmnpzmnKznv7vor5Hmm7TmlrDkuI3lj4rml7bm
iJbogIXnv7vor5HlrZjlnKjpl67popjvvIzor7fogZTns7vkuK3mlofniYjnu7TmiqTogIU6Og0K
PiArIOi0vuWogeWogSBKaWEgV2VpIFdlaSA8aGFycnl4aXlvdUBnbWFpbC5jb20+DQo+DQo+IC0g
ICAgICAgIOS4reaWh+eJiOe7tOaKpOiAhe+8miDotL7lqIHlqIEgSmlhIFdlaSBXZWkgPGhhcnJ5
eGl5b3VAZ21haWwuY29tPg0KPiAtICAgICAgICDkuK3mlofniYjnv7vor5HogIXvvJog6LS+5aiB
5aiBIEppYSBXZWkgV2VpIDxoYXJyeXhpeW91QGdtYWlsLmNvbT4NCj4gLSAgICAgICAg5Lit5paH
54mI5qCh6K+R6ICF77yaIOi0vuWogeWogSBKaWEgV2VpIFdlaSA8aGFycnl4aXlvdUBnbWFpbC5j
b20+DQo+ICs65qCh6K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVu
Z0Bsb29uZ3Nvbi5jbj4NCj4NCj4gIExpbnV4IOmtlOacr+aVsA0KPiAgPT09PT09PT09PT09DQo+
DQo+IC3ov5nkuKrmlofku7bmmK/mnInlhbPlvZPliY3kvb/nlKjnmoTprZTmnK/lgLzms6jlhozo
oajjgILlvZPkvaDnu5nkuIDkuKrnu5PmnoTmt7vliqDkuobkuIDkuKrprZTmnK/lgLzvvIzkvaDk
uZ/lupTor6Xmiorov5nkuKrprZTmnK/lgLzmt7vliqDliLDov5nkuKrmlofku7bvvIzlm6DkuLrm
iJHku6zmnIDlpb3miornlKjkuo7lkITnp43nu5PmnoTnmoTprZTmnK/lgLznu5/kuIDotbfmnaXj
gIINCj4gK+i/meS4quaWh+S7tuaYr+acieWFs+W9k+WJjeS9v+eUqOeahOmtlOacr+WAvOazqOWG
jOihqOOAguW9k+S9oOe7meS4gOS4que7k+aehOS9k+a3u+WKoOS6huS4gOS4qumtlOacr+WAvO+8
jOS9oOS5nw0KPiAr5bqU6K+l5oqK6L+Z5Liq6a2U5pyv5YC85re75Yqg5Yiw6L+Z5Liq5paH5Lu2
77yM5Zug5Li65oiR5Lus5pyA5aW95oqK55So5LqO5ZCE56eN57uT5p6E5L2T55qE6a2U5pyv5YC8
57uf5LiA6LW35p2l44CCDQo+DQo+IC3kvb/nlKjprZTmnK/lgLzmnaXkv53miqTlhoXmoLjmlbDm
ja7nu5PmnoTmmK/kuIDkuKrpnZ7luLjlpb3nmoTkuLvmhI/jgILov5nlsLHlhYHorrjkvaDlnKjo
v5DooYzmnJ/mo4Dmn6UoYSnkuIDkuKrnu5PmnoTmmK/lkKblt7Lnu4/ooqvmlLvlh7vvvIzmiJbo
gIUoYinkvaDlt7Lnu4/nu5nkuIDkuKrkvovooYznqIvluo/pgJrov4fkuobkuIDkuKrplJnor6/n
moTnu5PmnoTjgILlkI7kuIDnp43mg4XlhrXnibnliKvlnLDmnInnlKgtLS3nibnliKvmmK/lvZPk
vaDpgJrov4fkuIDkuKrnqbrmjIfpkojmjIflkJHnu5PmnoTkvZPnmoTml7blgJnjgIJ0dHnmupDn
oIHvvIzkvovlpoLvvIznu4/luLjpgJrov4fnibnlrprpqbHliqjkvb/nlKjov5nnp43mlrnms5Xl
ubbkuJTlj43lpI3lnLDmjpLliJfnibnlrprmlrnpnaLnmoTnu5PmnoTjgIINCj4gK+S9v+eUqOmt
lOacr+WAvOadpeS/neaKpOWGheaguOaVsOaNrue7k+aehOaYr+S4gOS4qiAqKumdnuW4uOWlveea
hOS4u+aEjyoqIOOAgui/meWwseWFgeiuuOS9oOWcqOi/kOihjOaXtuajgA0KPiAr5p+l5LiA5Liq
57uT5p6E5L2TKGEp5piv5ZCm5bey57uP6KKr5pS75Ye777yM5oiW6ICFKGIp5L2g5bey57uP57uZ
5LiA5Liq5L6L56iL5Lyg6YCS5LqG5LiA5Liq6ZSZ6K+v55qE57uT5p6EDQo+ICvkvZPjgILmnIDl
kI7kuIDnp43mg4XlhrXnibnliKvlnLDmnInnlKgtLS3nibnliKvmmK/lvZPkvaDpgJrov4fkuIDk
uKrnqbrmjIfpkojmjIflkJHnu5PmnoTkvZPnmoTml7blgJnjgILkvovlpoLvvIwNCj4gK3R0eea6
kOeggee7j+W4uOmAmui/h+eJueWumumpseWKqOS9v+eUqOi/meenjeaWueazleeUqOadpeWPjeWk
jeWcsOaOkuWIl+eJueWumuaWuemdoueahOe7k+aehOS9k+OAgg0KPg0KPiAt5L2/55So6a2U5pyv
5YC855qE5pa55rOV5piv5Zyo57uT5p6E55qE5byA5aeL5aSE5aOw5piO55qE77yM5aaC5LiLOjoN
Cj4gK+S9v+eUqOmtlOacr+WAvOeahOaWueazleaYr+WcqOe7k+aehOS9k+eahOW8gOWktOWjsOaY
juWug+S7rO+8jOWmguS4izo6DQo+DQo+ICAgICAgICAgIHN0cnVjdCB0dHlfbGRpc2Mgew0KPiAg
ICAgICAgICAgICAgICAgaW50ICAgICBtYWdpYzsNCj4gICAgICAgICAgICAgICAgIC4uLg0KPiAg
ICAgICAgICB9Ow0KPg0KPiAt5b2T5L2g5Lul5ZCO57uZ5YaF5qC45re75Yqg5aKe5by65Yqf6IO9
55qE5pe25YCZ77yM6K+36YG15a6I6L+Z5p2h6KeE5YiZ77yB6L+Z5qC35bCx5Lya6IqC55yB5pWw
5LiN5riF55qE6LCD6K+V5pe26Ze077yM54m55Yir5piv5LiA5Lqb5Y+k5oCq55qE5oOF5Ya177yM
5L6L5aaC77yM5pWw57uE6LaF5Ye66IyD5Zu05bm25LiU6YeN5paw5YaZ5LqG6LaF5Ye66YOo5YiG
44CC6YG15a6I6L+Z5Liq6KeE5YiZ77yM6L+Z5Lqb5oOF5Ya15Y+v5Lul6KKr5b+r6YCf5Zyw77yM
5a6J5YWo5Zyw6YG/5YWN44CCDQo+ICvlvZPkvaDku6XlkI7nu5nlhoXmoLjmt7vliqDlop7lvLrl
ip/og73nmoTml7blgJnvvIzor7fpgbXlrojov5nmnaHop4TliJnvvIHov5nmoLflsLHkvJroioLn
nIHmlbDkuI3muIXnmoTosIPor5UNCj4gK+aXtumXtO+8jOeJueWIq+aYr+S4gOS6m+WPpOaAquea
hOaDheWGte+8jOS+i+Wmgu+8jOaVsOe7hOi2heWHuuiMg+WbtOW5tuS4lOimhuebluWGmeS6hui2
heWHuumDqOWIhuOAguWIqeeUqOi/mQ0KPiAr5Liq6KeE5YiZ77yM6L+Z5Lqb5oOF5Ya15Y+v5Lul
6KKr5b+r6YCf5Zyw77yM5a6J5YWo5Zyw5qOA5rWL5Yiw6L+Z5Lqb5qGI5L6L44CCDQo+ICsNCj4g
K+WPmOabtOaXpeW/lzo6DQo+DQo+IC0gICAgICAgICAgICAgICBUaGVvZG9yZSBUcydvDQo+IC0g
ICAgICAgICAgICAgICAgIDMxIE1hciA5NA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVGhlb2RvcmUgVHMnbw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMzEgTWFyIDk0DQo+DQo+IC3nu5nlvZPliY3nmoRMaW51eCAyLjEuNTXmt7vl
iqDprZTmnK/ooajjgIINCj4gKyAg57uZ5b2T5YmN55qETGludXggMi4xLjU15re75Yqg6a2U5pyv
6KGo44CCDQo+DQo+IC0gICAgICAgICAgICAgICBNaWNoYWVsIENoYXN0YWluDQo+IC0gICAgICAg
ICAgICAgICA8bWFpbHRvOm1lY0BzaG91dC5uZXQ+DQo+IC0gICAgICAgICAgICAgICAyMiBTZXAg
MTk5Nw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWljaGFlbCBD
aGFzdGFpbg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPG1haWx0
bzptZWNAc2hvdXQubmV0Pg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMjIgU2VwIDE5OTcNCj4NCj4gLeeOsOWcqOW6lOivpeacgOaWsOeahExpbnV4IDIuMS4xMTIu
5Zug5Li65Zyo54m55oCn5Ya757uT5pyf6Ze077yM5LiN6IO95ZyoMi4yLnjliY3mlLnlj5jku7vk
vZXkuJzopb/jgILov5nkupvmnaHnm67ooqvmlbDln5/miYDmjpLluo/jgIINCj4gKyAg546w5Zyo
5bqU6K+l5pyA5paw55qETGludXggMi4xLjExMi7lm6DkuLrlnKjnibnmgKflhrvnu5PmnJ/pl7Tv
vIzkuI3og73lnKgyLjIueOWJjeaUueWPmOS7uw0KPiArICDkvZXkuJzopb/jgILov5nkupvmnaHn
m67ooqvmlbDln5/miYDmjpLluo/jgIINCj4NCj4gLSAgICAgICAgICAgICAgIEtyenlzenRvZiBH
LkJhcmFub3dza2kNCj4gLSAgICAgICAgICAgICAgIDxtYWlsdG86IGtnYkBrbm0ub3JnLnBsPg0K
PiAtICAgICAgICAgICAgICAgMjkgSnVsIDE5OTgNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEtyenlzenRvZiBHLkJhcmFub3dza2kNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxtYWlsdG86IGtnYkBrbm0ub3JnLnBsPg0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjkgSnVsIDE5OTgNCj4NCj4gLeab
tOaWsOmtlOacr+ihqOWIsExpbnV4IDIuNS40NeOAguWImuWlvei2iui/h+eJueaAp+WGu+e7k++8
jOS9huaYr+acieWPr+iDvei/mOS8muacieS4gOS6m+aWsOeahOmtlOacr+WAvOWcqDIuNi545LmL
5YmN6J6N5YWl5Yiw5YaF5qC45Lit44CCDQo+ICsgIOabtOaWsOmtlOacr+ihqOWIsExpbnV4IDIu
NS40NeOAguWImuWlvei2iui/h+eJueaAp+WGu+e7k++8jOS9huaYr+acieWPr+iDvei/mOS8muac
ieS4gOS6m+aWsOeahOmtlA0KPiArICDmnK/lgLzlnKgyLjYueOS5i+WJjeiejeWFpeWIsOWGheag
uOS4reOAgg0KPg0KPiAtICAgICAgICAgICAgICAgUGV0ciBCYXVkaXMNCj4gLSAgICAgICAgICAg
ICAgIDxwYXNreUB1Y3cuY3o+DQo+IC0gICAgICAgICAgICAgICAwMyBOb3YgMjAwMg0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUGV0ciBCYXVkaXMNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwYXNreUB1Y3cuY3o+DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMyBOb3YgMjAwMg0KPg0KPiAt5pu0
5paw6a2U5pyv6KGo5YiwTGludXggMi41Ljc044CCDQo+ICsgIOabtOaWsOmtlOacr+ihqOWIsExp
bnV4IDIuNS43NOOAgg0KPg0KPiAtICAgICAgICAgICAgICAgRmFiaWFuIEZyZWRlcmljaw0KPiAt
ICAgICAgICAgICAgICAgIDxmZnJlZGVyaWNrQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gLSAg
ICAgICAgICAgICAgIDA5IEp1bCAyMDAzDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBGYWJpYW4gRnJlZGVyaWNrDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8ZmZyZWRlcmlja0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOSBKdWwgMjAwMw0KPg0KPiAgPT09
PT09PT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09
PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAg6a2U5pyv
5pWw5ZCNICAgICAgICAgICAgICDmlbDlrZcgICAgICAgICAgICAg57uT5p6EICAgICAgICAgICAg
ICAgICAgICAg5paH5Lu2DQo+IC0tDQo+IDIuMzEuNA0KPg0K


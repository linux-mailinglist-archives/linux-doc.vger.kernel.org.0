Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B9B35DE23
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 13:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244206AbhDMMAF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 08:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240873AbhDMMAE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 08:00:04 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3C4C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:59:43 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso5200707oto.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MIVWrHs9/sPia8jfhNZUxlhko5V4YCwbYhfgxwJSQTY=;
        b=MSdButp63FFoBqOklOUt2CFa9f2OPdxVdzipohTtyMg96e6znIqRS9O8bBbXMBq2tz
         wl0tl7tpuQB1aC7dKOKa8uyL0fpbBwJjZv06YHRsewW4dJmjqZrxlzt70xLGNVoxdFeG
         wKoNgFE1w10O0h9Zsz5/r5oYkMnFAO/265vQ/C+45CRSD9aSO3HLr2eW3jmma88Rtimv
         7y0uGaJYYeunsPL/fKxPqP9aC+OMibZbylWUT10BK+ZFs60E5S0dCQPbLzseV3z3MlqD
         pSHF87urEsNx0p2M59znLSvT3CqP9wDYQ866v+foANqV7mKy3eTW9wWxF0zRw4WrI77l
         vzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MIVWrHs9/sPia8jfhNZUxlhko5V4YCwbYhfgxwJSQTY=;
        b=aAdpg/ff0X8dqO6BBddmjD70NawmmkN2YM92cT4zA+q+BIs1q++Mfd+SHZSwbQOkEy
         LpDmYmknGhKyHRC5nKhPiYLV487yEYgJq6ZDZnVa9T07zBmu/tw4DVM6Eps+cdGD8uTr
         hKWrT/hy1uJbsNQ34B1DzmGhOLjqD0ECVq6rucnkWDhZpUVGWtZaGN78cxYqad25ckNX
         4btc1RiqF1qWCD9/cqW62Hra2wQs+6kwBD+GWMTQ+YAXig6qbkjVD1g72Y62bf6beruv
         wznrlg4rvxGIJBT6sStu9TmoYdO9w+Ng5MbWIrcDRh32Ivfyn6K5aoV1BU3SyC/PBCHf
         PclQ==
X-Gm-Message-State: AOAM530K88WGH2eEdzfEAaY96gGbbZKFgNhjspMHTXxWHUBm5Tat8F8R
        WAXgF7BzJoyuqxgC0EGPOiMlw4/7eRnomQQBmkE=
X-Google-Smtp-Source: ABdhPJzau+zA9PI7fj+abrnYouYjjiMS4BiJxKBYTT6BEJAfdBQEgR14OgDBDQ16stCJUToFmVlgYSPex6qxhAzyil0=
X-Received: by 2002:a9d:64da:: with SMTP id n26mr15174662otl.340.1618315182724;
 Tue, 13 Apr 2021 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-4-siyanteng@loongson.cn> <20210409101912.GB22786@bobwxc.top>
In-Reply-To: <20210409101912.GB22786@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 13 Apr 2021 19:59:32 +0800
Message-ID: <CAEensMxQjN4kKRz1oCoBuZ4MOFwEH6jMZz6Qbqh2eVPkr-RH3g@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] docs/zh_CN: add core-api/irq/irq-domain.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T0shDQoNClRoYW5rcw0KWWFudGVuZw0KDQpXdSBYLkMuIDxib2J3eGNAZW1haWwuY24+IOS6jjIw
MjHlubQ05pyIOeaXpeWRqOS6lCDkuIvljYg2OjE55YaZ6YGT77yaDQo+DQo+IE9uIEZyaSwgQXBy
IDA5LCAyMDIxIGF0IDA1OjEwOjA1UE0gKzA4MDAsIFlhbnRlbmcgU2kgd3JvdGU6DQo+ID4gVGhp
cyBwYXRjaCB0cmFuc2xhdGVzIERvY3VtZW50YXRpb24vY29yZS1hcGkvaXJxL2lycS1kb21haW4u
cnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNp
eWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAgLi4uL3poX0NOL2NvcmUtYXBpL2ly
cS9pcnEtZG9tYWluLnJzdCAgICAgICAgIHwgMjI3ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMjI3IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2lycS9pcnEtZG9tYWlu
LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NvcmUtYXBpL2lycS9pcnEtZG9tYWluLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2NvcmUtYXBpL2lycS9pcnEtZG9tYWluLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wM2QzYjc5NTNlMDgNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1h
cGkvaXJxL2lycS1kb21haW4ucnN0DQo+ID4gQEAgLTAsMCArMSwyMjcgQEANCj4gPiArLi4gaW5j
bHVkZTo6IC4uLy4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6
IDpkb2M6YC4uLy4uLy4uLy4uL2NvcmUtYXBpL2lycS9pcnEtZG9tYWluYA0KPiA+ICs6VHJhbnNs
YXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArLi4g
X2NuX2lycS1kb21haW4ucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gK2lycV9kb21haW4g5Lit5pat5Y+3
5pig5bCE5bqTDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQo+ID4gKw0KPiA+ICvnm67liY1MaW51eOWGheaguOeahOiuvuiuoeS9v+eUqOS6huS4
gOS4quW3qOWkp+eahOaVsOWtl+epuumXtO+8jOavj+S4queLrOeri+eahElSUea6kOmDveiiq+WI
humFjeS6huS4gOS4quS4jQ0KPiA+ICvlkIznmoTmlbDlrZfjgIINCj4gPiAr5b2T5Y+q5pyJ5LiA
5Liq5Lit5pat5o6n5Yi25Zmo5pe277yM6L+Z5b6I566A5Y2V77yM5L2G5Zyo5pyJ5aSa5Liq5Lit
5pat5o6n5Yi25Zmo55qE57O757uf5Lit77yM5YaF5qC45b+F6aG756Gu5L+d5q+PDQo+ID4gK+S4
quS4reaWreaOp+WItuWZqOmDveiDveW+l+WIsOmdnumHjeWkjeeahExpbnV4IElSUeWPt++8iOaV
sOWtl++8ieWIhumFjeOAgg0KPiA+ICsNCj4gPiAr5rOo5YaM5Li65ZSv5LiA55qEaXJxY2hpcHPn
moTkuK3mlq3mjqfliLblmajnvJblj7flkYjnjrDlh7rkuIrljYfnmoTotovlir/vvJrkvovlpoJH
UElP5o6n5Yi25Zmo562J5LiN5ZCMDQo+ID4gK+enjeexu+eahOWtkOmpseWKqOeoi+W6j+mAmui/
h+WwhuWFtuS4reaWreWkhOeQhueoi+W6j+W7uuaooeS4umlycWNoaXBz77yM5Y2z5a6e6ZmF5LiK
5piv57qn6IGU5Lit5pat5o6n5Yi25Zmo77yMDQo+ID4gK+mBv+WFjeS6humHjeaWsOWunueOsOS4
jklSUeaguOW/g+ezu+e7n+ebuOWQjOeahOWbnuiwg+acuuWItuOAgg0KPiA+ICsNCj4gPiAr5Zyo
6L+Z6YeM77yM5Lit5pat5Y+35LiO56Gs5Lu25Lit5pat5Y+356a75pWj5LqG5omA5pyJ56eN57G7
55qE5a+55bqU5YWz57O777ya6ICM5Zyo6L+H5Y6777yMSVJR5Y+35Y+v5Lul6YCJ5oup77yMDQo+
ID4gK+S9v+Wug+S7rOS4juehrOS7tklSUee6v+i/m+WFpeagueS4reaWreaOp+WItuWZqO+8iOWN
s+WunumZheWQkUNQVeWPkeWwhOS4reaWree6v+eahOe7hOS7tu+8ieebuOWMuemFje+8jOeOsA0K
PiA+ICvlnKjov5nkuKrnvJblj7fku4Xku4XmmK/kuIDkuKrmlbDlrZfjgIINCj4gPiArDQo+ID4g
K+WHuuS6jui/meS4quWOn+WboO+8jOaIkeS7rOmcgOimgeS4gOenjeacuuWItuWwhuaOp+WItuWZ
qOacrOWcsOS4reaWreWPt++8iOWNs+ehrOS7tmlycee8luWPt++8ieS4jkxpbnV4IElSUQ0KPiA+
ICvlj7fliIblvIDjgIINCj4gPiArDQo+ID4gK2lycV9hbGxvY19kZXNjKigpIOWSjCBpcnFfZnJl
ZV9kZXNjKigpIEFQSSDmj5Dkvpvkuoblr7lpcnHlj7fnmoTliIbphY3vvIzkvYblroPku6zkuI0N
Cj4gPiAr5o+Q5L6b5Lu75L2V5a+55o6n5Yi25Zmo5pys5ZywSVJRKGh3aXJxKeWPt+WIsExpbnV4
IElSUeWPt+epuumXtOeahOWPjeWQkeaYoOWwhOeahOaUr+aMgeOAgg0KPiA+ICsNCj4gPiAraXJx
X2RvbWFpbiDlupPlnKggaXJxX2FsbG9jX2Rlc2MqKCkgQVBJIOeahOWfuuehgOS4iuWinuWKoOS6
hiBod2lycSDlkowgSVJRIOWPt+eggQ0KPiA+ICvkuYvpl7TnmoTmmKDlsITjgIIg55u45q+U5LqO
5Lit5pat5o6n5Yi25Zmo6amx5Yqo5byA5pS+57yW56CB6Ieq5bex55qE5Y+N5ZCR5pig5bCE5pa5
5qGI77yM5oiR5Lus5pu05Zac5qyi55SoDQo+ID4gK2lycV9kb21haW7mnaXnrqHnkIbmmKDlsITj
gIINCj4gPiArDQo+ID4gK2lycV9kb21haW7ov5jlrp7njrDkuobku47mir3osaHnmoRpcnFfZndz
cGVj57uT5p6E5L2T5YiwaHdpcnHlj7fnmoTovazmjaLvvIjliLDnm67liY3kuLrmraLmmK8NCj4g
PiArRGV2aWNlIFRyZWXlkoxBQ1BJIEdTSe+8ie+8jOW5tuS4lOWPr+S7peW+iOWuueaYk+WcsOaJ
qeWxleS7peaUr+aMgeWFtuWug0lSUeaLk+aJkeaVsOaNrua6kOOAgg0KPiA+ICsNCj4gPiAraXJx
X2RvbWFpbueahOeUqOazlQ0KPiA+ICs9PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICvkuK3m
lq3mjqfliLblmajpqbHliqjnqIvluo/pgJrov4fku6XkuIvmlrnlvI/liJvlu7rlubbms6jlhozk
uIDkuKppcnFfZG9tYWlu44CC6LCD55SoDQo+ID4gK2lycV9kb21haW5fYWRkXyooKSDmiJYgaXJx
X2RvbWFpbl9jcmVhdGVfKigp5Ye95pWw5LmL5LiA77yI5q+P5Liq5pig5bCE5pa55rOV6YO95pyJ
5LiNDQo+ID4gK+WQjOeahOWIhumFjeWZqOWHveaVsO+8jOWQjumdouS8muivpue7huS7i+e7je+8
ieOAgiDlh73mlbDmiJDlip/lkI7kvJrov5Tlm57kuIDkuKrmjIflkJFpcnFfZG9tYWlu55qE5oyH
6ZKI44CCDQo+ID4gK+iwg+eUqOiAheW/hemhu+WQkeWIhumFjeWZqOWHveaVsOaPkOS+m+S4gOS4
qmlycV9kb21haW5fb3Bz57uT5p6E5L2T44CCDQo+ID4gKw0KPiA+ICvlnKjlpKflpJrmlbDmg4Xl
hrXkuIvvvIxpcnFfZG9tYWlu5Zyo5byA5aeL5pe25piv56m655qE77yM5rKh5pyJ5Lu75L2VaHdp
cnHlkoxJUlHlj7fkuYvpl7TnmoTmmKDlsITjgIINCj4gPiAr6YCa6L+H6LCD55SoaXJxX2NyZWF0
ZV9tYXBwaW5nKCnlsIbmmKDlsITmt7vliqDliLBpcnFfZG9tYWlu5Lit77yM6K+l5Ye95pWw5o6l
5Y+XDQo+ID4gK2lycV9kb21haW7lkozkuIDkuKpod2lyceWPt+S9nOS4uuWPguaVsOOAgiDlpoLm
npxod2lyceeahOaYoOWwhOi/mOS4jeWtmOWcqO+8jOmCo+S5iOWug+WwhuWIhumFjQ0KPiA+ICvk
uIDkuKrmlrDnmoRMaW51eCBpcnFfZGVzY++8jOWwhuWFtuS4jmh3aXJx5YWz6IGU6LW35p2l77yM
5bm26LCD55SoLm1hcCgp5Zue6LCD77yM6L+Z5qC36amx5YqoDQo+ID4gK+eoi+W6j+WwseWPr+S7
peaJp+ihjOS7u+S9leW/heimgeeahOehrOS7tuiuvue9ruOAgg0KPiA+ICsNCj4gPiAr5b2T5o6l
5pS25Yiw5LiA5Liq5Lit5pat5pe277yM5bqU6K+l5L2/55SoaXJxX2ZpbmRfbWFwcGluZygp5Ye9
5pWw5LuOaHdpcnHlj7fkuK3mib7liLANCj4gPiArTGludXggSVJR5Y+344CCDQo+ID4gKw0KPiA+
ICvlnKjosIPnlKhpcnFfZmluZF9tYXBwaW5nKCnkuYvliY3vvIzoh7PlsJHopoHosIPnlKjkuIDm
rKFpcnFfY3JlYXRlX21hcHBpbmcoKeWHveaVsO+8jA0KPiA+ICvku6XlhY3mj4/ov7DnrKbkuI3o
g73ooqvliIbphY3jgIINCj4gPiArDQo+ID4gK+WmguaenOmpseWKqOeoi+W6j+aciUxpbnV455qE
SVJR5Y+35oiWaXJxX2RhdGHmjIfpkojvvIzlubbkuJTpnIDopoHnn6XpgZPnm7jlhbPnmoRod2ly
ceWPt++8iOavlA0KPiA+ICvlpoLlnKhpcnFfY2hpcOWbnuiwg+S4re+8ie+8jOmCo+S5iOWPr+S7
peebtOaOpeS7jmlycV9kYXRhLT5od2lyceS4reiOt+W+l+OAgg0KPiA+ICsNCj4gPiAraXJxX2Rv
bWFpbuaYoOWwhOeahOexu+Weiw0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+
ID4gKw0KPiA+ICvku45od2lyceWIsExpbnV4IGlyceeahOWPjeWQkeaYoOWwhOacieWHoOenjeac
uuWItu+8jOavj+enjeacuuWItuS9v+eUqOS4jeWQjOeahOWIhumFjeWHveaVsOOAguW6lOivpQ0K
PiA+ICvkvb/nlKjlk6rnp43lj43lkJHmmKDlsITnsbvlnovlj5blhrPkuo7nlKjkvovjgIIg5LiL
6Z2i5LuL57uN5q+P5LiA56eN5Y+N5ZCR5pig5bCE57G75Z6L77yaDQo+ID4gKw0KPiA+ICvnur/m
gKfmmKDlsIQNCj4gPiArLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArOjoNCj4gPiArDQo+ID4gKyAg
ICAgaXJxX2RvbWFpbl9hZGRfbGluZWFyKCkNCj4gPiArICAgICBpcnFfZG9tYWluX2NyZWF0ZV9s
aW5lYXIoKQ0KPiA+ICsNCj4gPiAr57q/5oCn5Y+N5ZCR5pig5bCE57u05oqk5LqG5LiA5Liq5Zu6
5a6a5aSn5bCP55qE6KGo77yM6K+l6KGo5LulaHdpcnHlj7fkuLrntKLlvJXjgIIg5b2T5LiA5Liq
aHdpcnHooqvmmKDlsIQNCj4gPiAr5pe277yM5Lya57uZaHdpcnHliIbphY3kuIDkuKppcnFfZGVz
Y++8jOW5tuWwhmlyceWPt+WtmOWCqOWcqOihqOS4reOAgg0KPiA+ICsNCj4gPiAr5b2T5pyA5aSn
55qEaHdpcnHlj7flm7rlrprkuJTmlbDph4/nm7jlr7novoPlsJHml7bvvIznur/mgKflm77mmK/k
uIDkuKrlvojlpb3nmoTpgInmi6nvvIh+PDI1Nu+8ieOAgiDov5nnp40NCj4gPiAr5pig5bCE55qE
5LyY54K55piv5Zu65a6a5pe26Ze05p+l5om+SVJR5Y+377yM6ICM5LiUaXJxX2Rlc2Nz5Y+q5YiG
6YWN57uZ5Zyo55So55qESVJR44CCIOe8uueCueaYr+ivpeihqA0KPiA+ICvlv4XpobvlsL3lj6/o
g73lpKfnmoRod2lyceWPt+OAgg0KPiA+ICsNCj4gPiAraXJxX2RvbWFpbl9hZGRfbGluZWFyKCnl
koxpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoKeWcqOWKn+iDveS4iuaYr+etieS7t+eahO+8jA0K
PiA+ICvpmaTkuobnrKzkuIDkuKrlj4LmlbDkuI3lkIwtLeWJjeiAheaOpeWPl+S4gOS4qk9wZW4g
RmlybXdhcmXnibnlrprnmoQgJ3N0cnVjdCBkZXZpY2Vfbm9kZScg6ICMDQo+ID4gK+WQjuiAheaO
peWPl+S4gOS4quabtOmAmueUqOeahOaKveixoSAnc3RydWN0IGZ3bm9kZV9oYW5kbGUnIOOAgg0K
PiA+ICsNCj4gPiAr5aSn5aSa5pWw6amx5Yqo5bqU6K+l5L2/55So57q/5oCn5pig5bCEDQo+ID4g
Kw0KPiA+ICvmoJHnirbmmKDlsIQNCj4gPiArLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArOjoNCj4g
PiArDQo+ID4gKyAgICAgaXJxX2RvbWFpbl9hZGRfdHJlZSgpDQo+ID4gKyAgICAgaXJxX2RvbWFp
bl9jcmVhdGVfdHJlZSgpDQo+ID4gKw0KPiA+ICtpcnFfZG9tYWlu57u05oqk552A5LuOaHdpcnHl
j7fliLBMaW51eCBJUlHnmoRyYWRpeOeahOagkeeKtuaYoOWwhOOAgiDlvZPkuIDkuKpod2lyceii
q+aYoOWwhOaXtu+8jA0KPiA+ICvkuIDkuKppcnFfZGVzY+iiq+WIhumFje+8jGh3aXJx6KKr55So
5L2ccmFkaXjmoJHnmoTmn6Xmib7plK7jgIINCj4gPiArDQo+ID4gK+WmguaenGh3aXJx5Y+35Y+v
5Lul6Z2e5bi45aSn77yM5qCR54q25pig5bCE5piv5LiA5Liq5b6I5aW955qE6YCJ5oup77yM5Zug
5Li65a6D5LiN6ZyA6KaB5YiG6YWN5LiA5Liq5ZKM5pyA5aSnaHdpcnENCj4gPiAr5Y+35LiA5qC3
5aSn55qE6KGo44CCIOe8uueCueaYr++8jGh3aXJx5YiwSVJR5Y+355qE5p+l5om+5Y+W5Yaz5LqO
6KGo5Lit5pyJ5aSa5bCR5p2h55uu44CCDQo+ID4gKw0KPiA+ICtpcnFfZG9tYWluX2FkZF90cmVl
KCnlkoxpcnFfZG9tYWluX2NyZWF0ZV90cmVlKCnlnKjlip/og73kuIrmmK/nrYnku7fnmoTvvIzp
maTkuobnrKzkuIANCj4gPiAr5Liq5Y+C5pWw5LiN5ZCM4oCU4oCU5YmN6ICF5o6l5Y+X5LiA5Liq
T3BlbiBGaXJtd2FyZeeJueWumueahCAnc3RydWN0IGRldmljZV9ub2RlJyDvvIzogIzlkI7ogIXm
jqXlj5cNCj4gPiAr5LiA5Liq5pu06YCa55So55qE5oq96LGhICdzdHJ1Y3QgZndub2RlX2hhbmRs
ZScg44CCDQo+ID4gKw0KPiA+ICvlvojlsJHmnInpqbHliqjlupTor6XpnIDopoHov5nkuKrmmKDl
sITjgIINCj4gPiArDQo+ID4gK+aXoOaYoOWwhA0KPiA+ICstLS0tLS0tLQ0KPiA+ICsNCj4gPiAr
OjoNCj4gPiArDQo+ID4gKyAgICAgaXJxX2RvbWFpbl9hZGRfbm9tYXAoKQ0KPiA+ICsNCj4gPiAr
5b2T56Gs5Lu25Lit55qEaHdpcnHlj7fmmK/lj6/nvJbnqIvnmoTml7blgJnvvIzlsLHlj6/ku6Xp
h4fnlKjml6DmmKDlsITnsbvlnovjgIIg5Zyo6L+Z56eN5oOF5Ya15LiL77yM5pyA5aW95bCGDQo+
ID4gK0xpbnV4IElSUeWPt+e8luWFpeehrOS7tuacrOi6q++8jOi/meagt+WwseS4jemcgOimgeaY
oOWwhOS6huOAgiDosIPnlKhpcnFfY3JlYXRlX2RpcmVjdF9tYXBwaW5nKCkNCj4gPiAr5Lya5YiG
6YWN5LiA5LiqTGludXggSVJR5Y+377yM5bm26LCD55SoLm1hcCgp5Zue6LCD77yM6L+Z5qC36amx
5Yqo5bCx5Y+v5Lul5bCGTGludXggSVJR5Y+357yW5YWl56Gs5Lu25Lit44CCDQo+ID4gKw0KPiA+
ICvlpKflpJrmlbDpqbHliqjnqIvluo/kuI3og73kvb/nlKjov5nkuKrmmKDlsITjgIINCj4gPiAr
DQo+ID4gK+S8oOe7n+aYoOWwhOexu+Weiw0KPiA+ICstLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4g
PiArOjoNCj4gPiArDQo+ID4gKyAgICAgaXJxX2RvbWFpbl9hZGRfc2ltcGxlKCkNCj4gPiArICAg
ICBpcnFfZG9tYWluX2FkZF9sZWdhY3koKQ0KPiA+ICsgICAgIGlycV9kb21haW5fYWRkX2xlZ2Fj
eV9pc2EoKQ0KPiA+ICsgICAgIGlycV9kb21haW5fY3JlYXRlX3NpbXBsZSgpDQo+ID4gKyAgICAg
aXJxX2RvbWFpbl9jcmVhdGVfbGVnYWN5KCkNCj4gPiArDQo+ID4gK+S8oOe7n+aYoOWwhOaYr+W3
sue7j+S4uiBod2lycXMg5YiG6YWN5LqG5LiA57O75YiXIGlycV9kZXNjcyDnmoTpqbHliqjnqIvl
uo/nmoTnibnmrormg4XlhrXjgIIg5b2T6amx5Yqo56iLDQo+ID4gK+W6j+S4jeiDveeri+WNs+i9
rOaNouS4uuS9v+eUqOe6v+aAp+aYoOWwhOaXtu+8jOWwseS8muS9v+eUqOWug+OAgiDkvovlpoLv
vIzorrjlpJrltYzlhaXlvI/ns7vnu5/mnb/ljaHmlK/mjIHmlofku7bkvb/nlKgNCj4gPiAr5LiA
57uE55So5LqOSVJR5Y+355qE5a6a5LmJ77yII2RlZmluZe+8ie+8jOi/meS6m+WumuS5ieiiq+S8
oOmAkue7mXN0cnVjdOiuvuWkh+azqOWGjOOAgiDlnKjov5nnp43mg4XlhrXkuIvvvIwNCj4gPiAr
5LiN6IO95Yqo5oCB5YiG6YWNTGludXggSVJR5Y+377yM5bqU6K+l5L2/55So5Lyg57uf5pig5bCE
44CCDQo+ID4gKw0KPiA+ICvkvKDnu5/mmKDlsITlgYforr7lt7Lnu4/kuLrmjqfliLblmajliIbp
hY3kuobkuIDkuKrov57nu63nmoRJUlHlj7fojIPlm7TvvIzlubbkuJTlj6/ku6XpgJrov4flkJFo
d2lyceWPt+a3u+WKoOS4gA0KPiA+ICvkuKrlm7rlrprnmoTlgY/np7vmnaXorqHnrpdJUlHlj7fv
vIzlj43kuYvkuqbnhLbjgIIg57y654K55piv6ZyA6KaB5Lit5pat5o6n5Yi25Zmo566h55CGSVJR
5YiG6YWN77yM5bm25LiU6ZyA6KaB5Li65q+PDQo+ID4gK+S4qmh3aXJx5YiG6YWN5LiA5LiqaXJx
X2Rlc2PvvIzljbPkvb/lroPmsqHmnInooqvkvb/nlKjjgIINCj4gPiArDQo+ID4gK+WPquacieWc
qOW/hemhu+aUr+aMgeWbuuWumueahElSUeaYoOWwhOaXtu+8jOaJjeW6lOS9v+eUqOS8oOe7n+aY
oOWwhOOAgiDkvovlpoLvvIxJU0HmjqfliLblmajlsIbkvb/nlKjkvKDnu5/mmKDlsITmnaUNCj4g
PiAr5pig5bCETGludXggSVJRIDAtMTXvvIzov5nmoLfnjrDmnInnmoRJU0HpqbHliqjnqIvluo/l
sLHog73lvpfliLDmraPnoa7nmoRJUlHlj7fjgIINCj4gPiArDQo+ID4gK+Wkp+WkmuaVsOS9v+eU
qOS8oOe7n+aYoOWwhOeahOeUqOaIt+W6lOivpeS9v+eUqGlycV9kb21haW5fYWRkX3NpbXBsZSgp
5oiWDQo+ID4gK2lycV9kb21haW5fY3JlYXRlX3NpbXBsZSgp77yM5Y+q5pyJ5Zyo57O757uf5o+Q
5L6bSVJR6IyD5Zu05pe25omN5Lya5L2/55So5Lyg57uf5Z+f77yM5ZCm5YiZ5bCG5L2/55SoDQo+
ID4gK+e6v+aAp+Wfn+aYoOWwhOOAgui/meS4quiwg+eUqOeahOivreS5ieaYr+i/meagt+eahO+8
muWmguaenOaMh+WumuS6huS4gOS4qklSUeiMg+WbtO+8jOmCo+S5iCDmj4/ov7DnrKblsIbooqvl
jbPml7bliIbphY0NCj4gPiAr57uZ5a6D77yM5aaC5p6c5rKh5pyJ6IyD5Zu06KKr5YiG6YWN77yM
5a6D5bCG5LiN5Lya5omn6KGMIGlycV9kb21haW5fYWRkX2xpbmVhcigpIOaIlg0KPiA+ICtpcnFf
ZG9tYWluX2NyZWF0ZV9saW5lYXIoKe+8jOi/meaEj+WRs+edgCAqbm8qIGlycSDmj4/ov7DnrKbl
sIbooqvliIbphY3jgIINCj4gPiArDQo+ID4gK+S4gOS4queugOWNleWfn+eahOWFuOWei+eUqOS+
i+aYr++8jGlycWNoaXDkvpvlupTllYblkIzml7bmlK/mjIHliqjmgIHlkozpnZnmgIFJUlHliIbp
hY3jgIINCj4gPiArDQo+ID4gK+S4uuS6humBv+WFjeacgOe7iOWHuueOsOS9v+eUqOe6v+aAp+Wf
n+iAjOayoeacieaPj+i/sOespuiiq+WIhumFjeeahOaDheWGte+8jOehruS/neS9v+eUqOeugOWN
leWfn+eahOmpseWKqOeoi+W6j+WcqOS7u+S9lQ0KPiA+ICtpcnFfZmluZF9tYXBwaW5nKCnkuYvl
iY3osIPnlKhpcnFfY3JlYXRlX21hcHBpbmcoKeaYr+mdnuW4uOmHjeimgeeahO+8jOWboOS4uuWQ
juiAheWunumZheS4ig0KPiA+ICvlsIbnlKjkuo7pnZnmgIFJUlHliIbphY3mg4XlhrXjgIINCj4g
PiArDQo+ID4gK2lycV9kb21haW5fYWRkX3NpbXBsZSgp5ZKMaXJxX2RvbWFpbl9jcmVhdGVfc2lt
cGxlKCnku6Xlj4oNCj4gPiAraXJxX2RvbWFpbl9hZGRfbGVnYWN5KCnlkoxpcnFfZG9tYWluX2Ny
ZWF0ZV9sZWdhY3koKeWcqOWKn+iDveS4iuaYr+etieS7t+eahO+8jOWPqg0KPiA+ICvmmK/nrKzk
uIDkuKrlj4LmlbDkuI3lkIwtLeWJjeiAheaOpeWPl09wZW4gRmlybXdhcmXnibnlrprnmoQgJ3N0
cnVjdCBkZXZpY2Vfbm9kZScg77yM6ICM5ZCO6ICFDQo+ID4gK+aOpeWPl+S4gOS4quabtOmAmueU
qOeahOaKveixoSAnc3RydWN0IGZ3bm9kZV9oYW5kbGUnIOOAgg0KPiA+ICsNCj4gPiArSVJR5Z+f
5bGC57qn57uT5p6EDQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlnKjm
n5DkupvmnrbmnoTkuIrvvIzlj6/og73mnInlpJrkuKrkuK3mlq3mjqfliLblmajlj4LkuI7lsIbk
uIDkuKrkuK3mlq3ku47orr7lpIfkvKDpgIHliLDnm67moIdDUFXjgIINCj4gPiAr6K6p5oiR5Lus
5p2l55yL55yLeDg25bmz5Y+w5LiK5YW45Z6L55qE5Lit5pat5Lyg6YCS6Lev5b6E5ZCnDQo+ID4g
Kzo6DQo+ID4gKw0KPiA+ICsgIERldmljZSAtLT4gSU9BUElDIC0+IEludGVycnVwdCByZW1hcHBp
bmcgQ29udHJvbGxlciAtPiBMb2NhbCBBUElDIC0+IENQVQ0KPiA+ICsNCj4gPiAr5raJ5Y+K5Yiw
55qE5Lit5pat5o6n5Yi25Zmo5pyJ5LiJ5LiqOg0KPiA+ICsNCj4gPiArMSkgSU9BUElDIOaOp+WI
tuWZqA0KPiA+ICsyKSDkuK3mlq3ph43mmKDlsITmjqfliLblmagNCj4gPiArMykgTG9jYWwgQVBJ
QyDmjqfliLblmagNCj4gPiArDQo+ID4gK+S4uuS6huaUr+aMgei/meagt+eahOehrOS7tuaLk+aJ
kee7k+aehO+8jOS9v+i9r+S7tuaetuaehOS4juehrOS7tuaetuaehOebuOWMuemFje+8jOS4uuav
j+S4quS4reaWreaOp+WItuWZqOW7uueri+S4gA0KPiA+ICvkuKppcnFfZG9tYWlu5pWw5o2u57uT
5p6E77yM5bm25bCG6L+Z5LqbaXJxX2RvbWFpbue7hOe7h+aIkOWxguasoee7k+aehOOAgg0KPiA+
ICsNCj4gPiAr5Zyo5bu656uLaXJxX2RvbWFpbuWxguasoee7k+aehOaXtu+8jOmdoOi/keiuvuWk
h+eahGlycV9kb21haW7kuLrlrZDln5/vvIzpnaDov5FDUFXnmoQNCj4gPiAraXJxX2RvbWFpbuS4
uueItuWfn+OAguaJgOS7peWcqOS4iumdoueahOS+i+WtkOS4re+8jOWwhuW7uueri+WmguS4i+ea
hOWxguasoee7k+aehOOAgg0KPiA+ICs6Og0KPiA+ICsNCj4gPiArICAgICBDUFUgVmVjdG9yIGly
cV9kb21haW4gKHJvb3QgaXJxX2RvbWFpbiB0byBtYW5hZ2UgQ1BVIHZlY3RvcnMpDQo+ID4gKyAg
ICAgICAgICAgICBeDQo+ID4gKyAgICAgICAgICAgICB8DQo+ID4gKyAgICAgSW50ZXJydXB0IFJl
bWFwcGluZyBpcnFfZG9tYWluIChtYW5hZ2UgaXJxX3JlbWFwcGluZyBlbnRyaWVzKQ0KPiA+ICsg
ICAgICAgICAgICAgXg0KPiA+ICsgICAgICAgICAgICAgfA0KPiA+ICsgICAgIElPQVBJQyBpcnFf
ZG9tYWluIChtYW5hZ2UgSU9BUElDIGRlbGl2ZXJ5IGVudHJpZXMvcGlucykNCj4gPiArDQo+ID4g
K+S9v+eUqGlycV9kb21haW7lsYLmrKHnu5PmnoTnmoTkuLvopoHmjqXlj6PmnInlm5vkuKo6DQo+
ID4gKw0KPiA+ICsxKSBpcnFfZG9tYWluX2FsbG9jX2lycXMoKTog5YiG6YWNSVJR5o+P6L+w56ym
5ZKM5LiO5Lit5pat5o6n5Yi25Zmo55u45YWz55qE6LWE5rqQ5p2l5Lyg6YCS6L+Z5Lqb5Lit5pat
44CCDQo+ID4gKzIpIGlycV9kb21haW5fZnJlZV9pcnFzKCk6IOmHiuaUvklSUeaPj+i/sOespuWS
jOS4jui/meS6m+S4reaWreebuOWFs+eahOS4reaWreaOp+WItuWZqOi1hOa6kOOAgg0KPiA+ICsz
KSBpcnFfZG9tYWluX2FjdGl2YXRlX2lycSgpOiDmv4DmtLvkuK3mlq3mjqfliLblmajnoazku7bk
u6XkvKDpgJLkuK3mlq3jgIINCj4gPiArNCkgaXJxX2RvbWFpbl9kZWFjdGl2YXRlX2lycSgpOiDl
gZznlKjkuK3mlq3mjqfliLblmajnoazku7bvvIzlgZzmraLkvKDpgJLkuK3mlq3jgIINCj4gPiAr
DQo+ID4gK+S4uuS6huaUr+aMgWlycV9kb21haW7lsYLmrKHnu5PmnoTvvIzpnIDopoHlgZrlpoLk
uIvkv67mlLk6DQo+ID4gKw0KPiA+ICsxKSDkuIDkuKrmlrDnmoTlrZfmrrUgJ3BhcmVudCcg6KKr
5re75Yqg5YiwaXJxX2RvbWFpbue7k+aehOS4re+8m+Wug+eUqOS6jue7tOaKpGlycV9kb21haW7n
moTlsYLmrKHkv6Hmga/jgIINCj4gPiArMikg5LiA5Liq5paw55qE5a2X5q61ICdwYXJlbnRfZGF0
YScg6KKr5re75Yqg5YiwaXJxX2RhdGHnu5PmnoTkuK3vvJvlroPnlKjkuo7lu7rnq4vlsYLmrKHn
u5PmnoRpcnFfZGF0YeS7pQ0KPiA+ICsgICDljLnphY1pcnFfZG9tYWlu5bGC5qyh57uT5p6E44CC
aXJxX2RhdGHnlKjkuo7lrZjlgqhpcnFfZG9tYWlu5oyH6ZKI5ZKM56Gs5Lu2aXJx5Y+344CCDQo+
ID4gKzMpIOaWsOeahOWbnuiwg+iiq+a3u+WKoOWIsGlycV9kb21haW5fb3Bz57uT5p6E5Lit77yM
5Lul5pSv5oyB5bGC5qyh57uT5p6E55qEaXJxX2RvbWFpbuaTjeS9nOOAgg0KPiA+ICsNCj4gPiAr
5Zyo5pSv5oyB5YiG5bGCaXJxX2RvbWFpbuWSjOWIhuWxgmlycV9kYXRh5YeG5aSH5bCx57uq5ZCO
77yM5Li65q+P5Liq5Lit5pat5o6n5Yi25Zmo5bu656uL5LiA5LiqaXJxX2RvbWFpbue7kw0KPiA+
ICvmnoTvvIzlubbkuLrmr4/kuKrkuI5JUlHnm7jlhbPogZTnmoRpcnFfZG9tYWlu5YiG6YWN5LiA
5LiqaXJxX2RhdGHnu5PmnoTjgILnjrDlnKjmiJHku6zlj6/ku6Xlho3ov5vkuIDmraXmlK/mjIHl
oIYNCj4gPiAr5qCI5byPKOWxguasoee7k+aehCnnmoRpcnFfY2hpcOOAguS5n+WwseaYr+ivtO+8
jOS4gOS4qmlycV9jaGlw5LiO5bGC5qyh57uT5p6E5Lit55qE5q+P5LiqaXJxX2RhdGHnm7jlhbPo
gZTjgIINCj4gPiAr5LiA5Liq5a2QaXJxX2NoaXDlj6/ku6Xoh6rlt7HmiJbpgJrov4fkuI7lroPn
moTniLZpcnFfY2hpcOWQiOS9nOadpeWunueOsOS4gOS4quaJgOmcgOeahOaTjeS9nOOAgg0KPiA+
ICsNCj4gPiAr6YCa6L+H5aCG5qCI5byP55qEaXJxX2NoaXDvvIzkuK3mlq3mjqfliLblmajpqbHl
iqjlj6rpnIDopoHlpITnkIboh6rlt7HnrqHnkIbnmoTnoazku7bvvIzlnKjpnIDopoHnmoTml7bl
gJnlj6/ku6XlkJHlhbbniLYNCj4gPiAraXJxX2NoaXDor7fmsYLmnI3liqHjgILmiYDku6XmiJHk
u6zlj6/ku6Xlrp7njrDmm7TnroDmtIHnmoTova/ku7bmnrbmnoTjgIINCj4gPiArDQo+ID4gK+S4
uuS6huiuqeS4reaWreaOp+WItuWZqOmpseWKqOeoi+W6j+aUr+aMgWlycV9kb21haW7lsYLmrKHn
u5PmnoTvvIzlroPpnIDopoHlgZrliLDku6XkuIvlh6Dngrk6DQo+ID4gKw0KPiA+ICsxKSDlrp7n
jrAgaXJxX2RvbWFpbl9vcHMuYWxsb2Mg5ZKMIGlycV9kb21haW5fb3BzLmZyZWUNCj4gPiArMikg
5Y+v6YCJ5oup5Zyw5a6e546wIGlycV9kb21haW5fb3BzLmFjdGl2YXRlIOWSjCBpcnFfZG9tYWlu
X29wcy5kZWFjdGl2YXRlLg0KPiA+ICszKSDlj6/pgInmi6nlnLDlrp7njrDkuIDkuKppcnFfY2hp
cOadpeeuoeeQhuS4reaWreaOp+WItuWZqOehrOS7tuOAgg0KPiA+ICs0KSDkuI3pnIDopoHlrp7n
jrBpcnFfZG9tYWluX29wcy5tYXDlkoxpcnFfZG9tYWluX29wcy51bm1hcO+8jOWug+S7rOWcqOWx
guasoee7k+aehA0KPiA+ICsgICBpcnFfZG9tYWlu5Lit5piv5LiN55So55qE44CCDQo+ID4gKw0K
PiA+ICtpcnFfZG9tYWlu5bGC5qyh57uT5p6E57ud5LiN5piveDg254m55pyJ55qE77yM5aSn6YeP
55So5LqO5pSv5oyB5YW25LuW5p625p6E77yM5aaCQVJN44CBQVJNNjTnrYnjgIINCj4gPiArDQo+
ID4gK+iwg+ivleWKn+iDvQ0KPiA+ICs9PT09PT09PT0NCj4gPiArDQo+ID4gK+aJk+W8gENPTkZJ
R19HRU5FUklDX0lSUV9ERUJVR0ZTIG9uLnBpbmfvvIzlj6/orqlJUlHlrZDns7vnu5/nmoTlpKfp
g6jliIblhoXpg6jnu5PmnoTpg73lnKhkZWJ1Z2Zz5Lit5pq06Zyy5Ye65p2l44CCDQo+DQo+IFBs
ZWFzZSBmaXggIm9uLnBpbmciLg0KPg0KPiA+IC0tDQo+ID4gMi4yNy4wDQo+DQo+IFRoYW5rcyEN
Cj4NCj4gV3UgWC5DLg0KPg0K

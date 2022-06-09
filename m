Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F11544116
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 03:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbiFIBdw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jun 2022 21:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiFIBdv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 21:33:51 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B240539C118
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 18:33:49 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3137c877092so26753187b3.13
        for <linux-doc@vger.kernel.org>; Wed, 08 Jun 2022 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=om/RyH2b0109SykEhgEq+hc5wR/zqJEkBFPfrFcg5xE=;
        b=HkmRIYJoxMClidOijQIpIdLZdjuhBNdZGceciMwNryinFqGeK/S+oK8Tc4orFyUOjN
         JnXhFt9bS+tGu5XwoaLbcqdug2TSY/T3Sl6OL08v6tbOBIstjPpDtu1F9i38xYErbOy8
         rIbpyDrrvu2rsFP4Rl+Og9Kd9CIbc7K8PnOb4r+fcmz5PrbMenwah2K00nc/Hgya6fRC
         EHg1YI4E63KAa6tJd6HzEs5yJWRMiKiegNEX9tSTv3WCEGo9jC+idhJJ2U+vGUwdCuX+
         vvHBnVJDiOIbWkR3lLQelI0tFyrf7tVejYgBFmPFipg5O4CAwxmW4DWE2Cqlp3Bl3+um
         lckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=om/RyH2b0109SykEhgEq+hc5wR/zqJEkBFPfrFcg5xE=;
        b=geVeQJrt+MQzfb99xujcnPp7wAahRvDYWVPMQB28aIuwDtBPYIUrZ8hepJNbwKBimY
         KcGbbl5XFURHI7PXxMQYILEES6YBwZkeiZWZRclFWebGfuBIeHf4B2NYDRp4pcYlFVQ6
         O+tNV+sOVl+lzgFHksgmQu9hViEyM0Mrc/kvpRw0ooe3l+/rDymXhLOWJ/l9AtnpEWON
         c4x1I6AsF6fW0NXYm8+WanMiowfpW5izkye55JcQoYT/21P/cwAgtK1aoAMQ3NtZHGQU
         W2eO0oD+U4Mqb1KcLid36+2oRgJj6hN8IzZQy46IZbUCS0ffWt3kl1/RGBwZ8a7CR14n
         Eevw==
X-Gm-Message-State: AOAM530v1+Gej8v1SFwzz/A2Vb8lTueVQ8OhkQ+aixLUvePc0+Y2X+cY
        w0PR9LiWE4EljRJGXG29rMf/VIC2jAiPKoqCa+Y=
X-Google-Smtp-Source: ABdhPJxi2H/KSQUaip34abpEg1DfExvPakVb/LE8Z89JEnmsv7m3e46lj8qaxxRXa2UsQUhHsTW663bzWnl4PDZvqoo=
X-Received: by 2002:a81:a1d3:0:b0:30f:c7f0:7b62 with SMTP id
 y202-20020a81a1d3000000b0030fc7f07b62mr38631447ywg.458.1654738428819; Wed, 08
 Jun 2022 18:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654685338.git.zhoubinbin@loongson.cn> <6fe45d69210300a6c065262470bce963f8dc0ec3.1654685338.git.zhoubinbin@loongson.cn>
 <YqDLzWpBBFZcZGkM@bobwxc.mipc>
In-Reply-To: <YqDLzWpBBFZcZGkM@bobwxc.mipc>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 9 Jun 2022 09:33:36 +0800
Message-ID: <CAMU9jJoxGq4kM7y4nMcnLNVbNOFewKaYuq+U4z8_j0Q=dPLPQA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] docs/zh_CN: riscv: Remove the translation of pmu.rst
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIy5bm0NuaciDnml6Xlkajlm5sgMDA6NDXl
hpnpgZPvvJoNCj4NCj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDc6MDg6MjBQTSArMDgwMCwg
QmluYmluIFpob3Ugd3JvdGU6DQo+ID4gU3luY2hyb25vdXMgdHJhbnNsYXRpb24gZnJvbSB0aGUg
Zm9sbG93aW5nOg0KPiA+DQo+ID4gWzFdOiBjb21taXQgMjNiMWYxODMyNmVjKCJEb2N1bWVudGF0
aW9uOiByaXNjdjoNCj4gPiAgICAgIFJlbW92ZSB0aGUgb2xkIGRvY3VtZW50YXRpb24iKQ0KPiA+
DQo+ID4gWzJdOiBjb21taXQgODkzM2U3ZjJlMzc1ICgiRG9jdW1lbnRhdGlvbjogcmlzY3Y6IHJl
bW92ZQ0KPiA+ICAgICAgbm9uLWV4aXN0ZW50IGRpcmVjdG9yeSBmcm9tIHRhYmxlIG9mIGNvbnRl
bnRzIikNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxv
b25nc29uLmNuPg0KPg0KPiBSZXZpZXdlZC1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWls
LmNuPg0KUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0K
VGhhbmtzLA0KWWFudGVuZw0KPg0KPiA+IC0tLQ0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NO
L3Jpc2N2L2luZGV4LnJzdCAgICAgICAgfCAgIDEgLQ0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3po
X0NOL3Jpc2N2L3BtdS5yc3QgICAgICAgICAgfCAyMzUgLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMjM2IGRlbGV0aW9ucygtKQ0KPiA+ICBkZWxldGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcmlzY3YvcG11LnJzdA0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L2lu
ZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L2luZGV4LnJz
dA0KPiA+IGluZGV4IDYxNGNkZTBjMDk5Ny4uMTMxZTQwNWFhODU3IDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L2luZGV4LnJzdA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L2luZGV4LnJzdA0KPiA+
IEBAIC0xOSw3ICsxOSw2IEBAIFJJU0MtViDkvZPns7vnu5PmnoQNCj4gPg0KPiA+ICAgICAgYm9v
dC1pbWFnZS1oZWFkZXINCj4gPiAgICAgIHZtLWxheW91dA0KPiA+IC0gICAgcG11DQo+ID4gICAg
ICBwYXRjaC1hY2NlcHRhbmNlDQo+ID4NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9yaXNjdi9wbXUucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vcmlzY3YvcG11LnJzdA0KPiA+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDdlYzgwMTAyNmM0ZC4uMDAwMDAwMDAwMDAwDQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcmlzY3YvcG11LnJzdA0KPiA+ICsrKyAvZGV2L251
bGwNCj4gPiBAQCAtMSwyMzUgKzAsMCBAQA0KPiA+IC0uLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1l
ci16aF9DTi5yc3QNCj4gPiAtDQo+ID4gLTpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9yaXNjdi9w
bXUucnN0DQo+ID4gLQ0KPiA+IC0657+76K+ROg0KPiA+IC0NCj4gPiAtIOWPuOW7tuiFviBZYW50
ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLQ0KPiA+IC0uLiBfY25fcmlzY3Zf
cG11Og0KPiA+IC0NCj4gPiAtPT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gLVJJU0MtVuW5
s+WPsOS4iuWvuVBNVXPnmoTmlK/mjIENCj4gPiAtPT09PT09PT09PT09PT09PT09PT09PT09DQo+
ID4gLQ0KPiA+IC1BbGFuIEthbyA8YWxhbmthb0BhbmRlc3RlY2guY29tPiwgTWFyIDIwMTgNCj4g
PiAtDQo+ID4gLeeugOS7iw0KPiA+IC0tLS0tLS0tLS0tLS0NCj4gPiAtDQo+ID4gLeaIquatouac
rOaWh+aSsOWGmeaXtu+8jOWcqFRoZSBSSVNDLVYgSVNBIFByaXZpbGVnZWQgVmVyc2lvbiAxLjEw
5Lit5o+Q5Yiw55qEIHBlcmZfZXZlbnQNCj4gPiAt55u45YWz54m55oCn5aaC5LiLOg0KPiA+IC3v
vIjor6bmg4Xor7fmn6XpmIXmiYvlhozvvIkNCj4gPiAtDQo+ID4gLSogW218c11jb3VudGVyZW4N
Cj4gPiAtKiBtY3ljbGVbaF0sIGN5Y2xlW2hdDQo+ID4gLSogbWluc3RyZXRbaF0sIGluc3RyZXRb
aF0NCj4gPiAtKiBtaHBldmVudHgsIG1ocGNvdW50ZXJ4W2hdDQo+ID4gLQ0KPiA+IC3ku4XmnInk
u6XkuIrov5nkupvlip/og73vvIznp7vmpI1wZXJm6ZyA6KaB5YGa5b6I5aSa5bel5L2c77yM56m2
5YW25Y6f5Zug5piv57y65bCR5Lul5LiL6YCa55So5p625p6E55qE5oCn6IO9DQo+ID4gLeebkea1
i+eJueaApzoNCj4gPiAtDQo+ID4gLSog5ZCv55SoL+WBnOeUqOiuoeaVsOWZqA0KPiA+IC0gIOWc
qOaIkeS7rOi/memHjO+8jOiuoeaVsOWZqOS4gOebtOWcqOiHqueUsei/kOihjOOAgg0KPiA+IC0q
IOiuoeaVsOWZqOa6ouWHuuW8lei1t+eahOS4reaWrQ0KPiA+IC0gIOinhOiMg+S4reayoeaciei/
meenjeWKn+iDveOAgg0KPiA+IC0qIOS4reaWreaMh+ekuuWZqA0KPiA+IC0gIOS4jeWPr+iDveaJ
gOacieeahOiuoeaVsOWZqOmDveacieW+iOWkmueahOS4reaWreerr+WPo++8jOaJgOS7pemcgOim
geS4gOS4quS4reaWreaMh+ekuuWZqOiuqei9r+S7tuadpeWIpOaWrQ0KPiA+IC0gIOWTquS4quiu
oeaVsOWZqOWImuWlvea6ouWHuuOAgg0KPiA+IC0qIOWGmeWFpeiuoeaVsOWZqA0KPiA+IC0gIOeU
seS6juWGheaguOS4jeiDveS/ruaUueiuoeaVsOWZqO+8jOaJgOS7peS8muacieS4gOS4qlNCSead
peaUr+aMgei/meS4quWKn+iDvVsxXeOAgiDlj6blpJbvvIzkuIDkupvljoLllYYNCj4gPiAtICDo
gIPomZHlrp7njrBNLVMtVeWei+WPt+acuuWZqOeahOehrOS7tuaJqeWxleadpeebtOaOpeWGmeWF
peiuoeaVsOWZqOOAgg0KPiA+IC0NCj4gPiAt6L+Z56+H5paH5qGj5peo5Zyo5Li65byA5Y+R6ICF
5o+Q5L6b5LiA5Liq5Zyo5YaF5qC45Lit5pSv5oyBUE1V55qE566A6KaB5oyH5Y2X44CC5LiL6Z2i
55qE56ug6IqC566A6KaB6Kej6YeK5LqGDQo+ID4gLXBlcmYnIOacuuWItuWSjOW+heWKnuS6i+mh
ueOAgg0KPiA+IC0NCj4gPiAt5L2g5Y+v5Lul5Zyo6L+Z6YeM5p+l55yL5Lul5YmN55qE6K6o6K66
WzFdWzJd44CCIOWPpuWklu+8jOafpeeci+mZhOW9leS4reeahOebuOWFs+WGheaguOe7k+aehOS9
k+WPr+iDveS8muaciQ0KPiA+IC3luK7liqnjgIINCj4gPiAtDQo+ID4gLQ0KPiA+IC0xLiDliJ3l
p4vljJYNCj4gPiAtLS0tLS0tLS0tDQo+ID4gLQ0KPiA+IC0qcmlzY3ZfcG11KiDmmK/kuIDkuKrn
sbvlnovkuLogKnN0cnVjdCByaXNjdl9wbXUqIOeahOWFqOWxgOaMh+mSiO+8jOWug+WMheWQq+S6
huagueaNrnBlcmblhoXpg6gNCj4gPiAt57qm5a6a55qE5ZCE56eN5pa55rOV5ZKMUE1VLXNwZWNp
Zmlj5Y+C5pWw44CC5Lq65Lus5bqU6K+l5aOw5piO6L+Z5qC355qE5a6e5L6L5p2l5Luj6KGoUE1V
44CCIOm7mOiupOaDheWGtQ0KPiA+IC3kuIvvvIwgKnJpc2N2X3BtdSog5oyH5ZCR5LiA5Liq5bi4
6YeP57uT5p6E5L2TICpyaXNjdl9iYXNlX3BtdSog77yM5a6D5a+55Z+65YeGUUVNVeaooeWei+ac
iemdnuW4uA0KPiA+IC3ln7rnoYDnmoTmlK/mjIHjgIINCj4gPiAtDQo+ID4gLQ0KPiA+IC3nhLbl
kI7ku5Yv5aW55Y+v5Lul5bCG5a6e5L6L55qE5oyH6ZKI5YiG6YWN57uZICpyaXNjdl9wbXUqIO+8
jOi/meagt+WwseWPr+S7peWIqeeUqOW3sue7j+WunueOsOeahOacgOWwj+mAuw0KPiA+IC3ovpHv
vIzmiJbogIXliJvlu7rku5Yv5aW56Ieq5bex55qEICpyaXNjdl9pbml0X3BsYXRmb3JtX3BtdSog
5a6e546w44CCDQo+ID4gLQ0KPiA+IC3mjaLlj6Xor53or7TvvIznjrDmnInnmoQgKnJpc2N2X2Jh
c2VfcG11KiDmupDlj6rmmK/mj5DkvpvkuobkuIDkuKrlj4LogIPlrp7njrDjgIIg5byA5Y+R6ICF
5Y+v5Lul54G15rS75ZywDQo+ID4gLeWGs+WumuWkmuWwkemDqOWIhuWPr+eUqO+8jOWcqOacgOae
geerr+eahOaDheWGteS4i++8jOS7luS7rOWPr+S7peagueaNruiHquW3seeahOmcgOimgeWumuWI
tuavj+S4gOS4quWHveaVsOOAgg0KPiA+IC0NCj4gPiAtDQo+ID4gLTIuIEV2ZW50IEluaXRpYWxp
emF0aW9uDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLQ0KPiA+IC3lvZPnlKjm
iLflkK/liqhwZXJm5ZG95Luk5p2l55uR5o6n5LiA5Lqb5LqL5Lu25pe277yM6aaW5YWI5Lya6KKr
55So5oi356m66Ze055qEcGVyZuW3peWFt+ino+mHiuS4uuWkmuS4qg0KPiA+IC0qcGVyZl9ldmVu
dF9vcGVuKiDns7vnu5/osIPnlKjvvIznhLblkI7ov5vkuIDmraXosIPnlKjkuIrkuIDmraXliIbp
hY3nmoQgKmV2ZW50X2luaXQqIOaIkOWRmOWHveaVsA0KPiA+IC3nmoTkuLvkvZPjgIIg5ZyoICpy
aXNjdl9iYXNlX3BtdSog55qE5oOF5Ya15LiL77yM5bCx5pivICpyaXNjdl9ldmVudF9pbml0KiDj
gIINCj4gPiAtDQo+ID4gLeivpeWKn+iDveeahOS4u+imgeebrueahOaYr+WwhueUqOaIt+aPkOS+
m+eahOS6i+S7tue/u+ivkeaIkOaYoOWwhOWbvu+8jOS7juiAjOWPr+S7peebtOaOpeWvuUhXLXJl
bGF0ZWTnmoTmjqcNCj4gPiAt5Yi25a+E5a2Y5Zmo5oiW6K6h5pWw5Zmo6L+b6KGM5pON5L2c44CC
6K+l57+76K+R5Z+65LqOICpyaXNjdl9wbXUqIOS4reaPkOS+m+eahOaYoOWwhOWSjOaWueazleOA
gg0KPiA+IC0NCj4gPiAt5rOo5oSP77yM5pyJ5Lqb5Yqf6IO95Lmf5Y+v5Lul5Zyo6L+Z5Liq6Zi2
5q615a6M5oiQOg0KPiA+IC0NCj4gPiAtKDEpIOS4reaWreiuvue9ru+8jOi/meS4quWcqOS4i+S4
gOiKguivtO+8mw0KPiA+IC0oMikg54m56ZmQ57qn6K6+572uKOS7heeUqOaIt+epuumXtOOAgeS7
heWGheaguOepuumXtOOAgeS4pOiAhemDveaciSnvvJsNCj4gPiAtKDMpIOaekOaehOWHveaVsOiu
vue9ruOAgiDpgJrluLjlupTnlKggKnJpc2N2X2Rlc3Ryb3lfZXZlbnQqIOWNs+WPr++8mw0KPiA+
IC0oNCkg5a+56Z2e6YeH5qC35LqL5Lu255qE6LCD5pW077yM6L+Z5bCG6KKr5Ye95pWw5bqU55So
77yM5aaCICpwZXJmX2FkanVzdF9wZXJpb2QqIO+8jOmAmuW4uOWmguS4izo6DQo+ID4gLQ0KPiA+
IC0gICAgICBpZiAoIWlzX3NhbXBsaW5nX2V2ZW50KGV2ZW50KSkgew0KPiA+IC0gICAgICAgICAg
ICAgIGh3Yy0+c2FtcGxlX3BlcmlvZCA9IHg4Nl9wbXUubWF4X3BlcmlvZDsNCj4gPiAtICAgICAg
ICAgICAgICBod2MtPmxhc3RfcGVyaW9kID0gaHdjLT5zYW1wbGVfcGVyaW9kOw0KPiA+IC0gICAg
ICAgICAgICAgIGxvY2FsNjRfc2V0KCZod2MtPnBlcmlvZF9sZWZ0LCBod2MtPnNhbXBsZV9wZXJp
b2QpOw0KPiA+IC0gICAgICB9DQo+ID4gLQ0KPiA+IC0NCj4gPiAt5ZyoICpyaXNjdl9iYXNlX3Bt
dSog55qE5oOF5Ya15LiL77yM55uu5YmN5Y+q5o+Q5L6b5LqG77yIM++8ieOAgg0KPiA+IC0NCj4g
PiAtDQo+ID4gLTMuIOS4reaWrQ0KPiA+IC0tLS0tLS0tDQo+ID4gLQ0KPiA+IC0zLjEuIOS4reaW
reWIneWni+WMlg0KPiA+IC0NCj4gPiAt6L+Z56eN5oOF5Ya157uP5bi45Ye6546w5ZyoICpldmVu
dF9pbml0KiDmlrnmoYjnmoTlvIDlpLTjgILpgJrluLjmg4XlhrXkuIvvvIzov5nlupTor6XmmK/k
uIDkuKrku6PnoIHmrrXvvIzlpoI6Og0KPiA+IC0NCj4gPiAtICBpbnQgeDg2X3Jlc2VydmVfaGFy
ZHdhcmUodm9pZCkNCj4gPiAtICB7DQo+ID4gLSAgICAgICAgaW50IGVyciA9IDA7DQo+ID4gLQ0K
PiA+IC0gICAgICAgIGlmICghYXRvbWljX2luY19ub3RfemVybygmcG1jX3JlZmNvdW50KSkgew0K
PiA+IC0gICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmcG1jX3Jlc2VydmVfbXV0ZXgpOw0KPiA+
IC0gICAgICAgICAgICAgICAgaWYgKGF0b21pY19yZWFkKCZwbWNfcmVmY291bnQpID09IDApIHsN
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFyZXNlcnZlX3BtY19oYXJkd2FyZSgp
KQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FQlVTWTsNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQ0KPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlc2VydmVfZHNfYnVmZmVycygpOw0KPiA+IC0gICAgICAgICAgICAgICAg
fQ0KPiA+IC0gICAgICAgICAgICAgICAgaWYgKCFlcnIpDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgIGF0b21pY19pbmMoJnBtY19yZWZjb3VudCk7DQo+ID4gLSAgICAgICAgICAgICAgICBt
dXRleF91bmxvY2soJnBtY19yZXNlcnZlX211dGV4KTsNCj4gPiAtICAgICAgICB9DQo+ID4gLQ0K
PiA+IC0gICAgICAgIHJldHVybiBlcnI7DQo+ID4gLSAgfQ0KPiA+IC0NCj4gPiAt6ICM56We5aWH
55qE5pivICpyZXNlcnZlX3BtY19oYXJkd2FyZSog77yM5a6D6YCa5bi45YGa5Y6f5a2Q5pON5L2c
77yM5L2/5a6e546w55qESVJR5Y+v5Lul5LuO5p+Q5Liq5YWo5bGA5Ye9DQo+ID4gLeaVsOaMh+mS
iOiuv+mXruOAgiDogIwgKnJlbGVhc2VfcG1jX2hhcmR3YXJlKiDnmoTkvZznlKjmraPlpb3nm7jl
j43vvIzlroPnlKjlnKjkuIrkuIDoioLmj5DliLDnmoTkuovku7bliIbphY0NCj4gPiAt5Zmo5Lit
44CCDQo+ID4gLQ0KPiA+IC0gKOazqO+8muS7juaJgOacieaetuaehOeahOWunueOsOadpeeci++8
jCpyZXNlcnZlL3JlbGVhc2UqIOWvueaAu+aYr0lSUeiuvue9ru+8jOaJgOS7pSAqcG1jX2hhcmR3
YXJlKg0KPiA+IC0g5Ly85LmO5pyJ5Lqb6K+v5a+844CCIOWug+W5tuS4jeWkhOeQhuS6i+S7tuWS
jOeJqeeQhuiuoeaVsOWZqOS5i+mXtOeahOe7keWumu+8jOi/meS4gOeCueWwhuWcqOS4i+S4gOiK
guS7i+e7jeOAgikNCj4gPiAtDQo+ID4gLTMuMi4gSVJR57uT5p6E5L2TDQo+ID4gLQ0KPiA+IC3l
n7rmnKzkuIrvvIzkuIDkuKpJUlHov5DooYzku6XkuIvkvKrku6PnoIE6Og0KPiA+IC0NCj4gPiAt
ICBmb3IgZWFjaCBoYXJkd2FyZSBjb3VudGVyIHRoYXQgdHJpZ2dlcmVkIHRoaXMgb3ZlcmZsb3cN
Cj4gPiAtDQo+ID4gLSAgICAgIGdldCB0aGUgZXZlbnQgb2YgdGhpcyBjb3VudGVyDQo+ID4gLQ0K
PiA+IC0gICAgICAvLyBmb2xsb3dpbmcgdHdvIHN0ZXBzIGFyZSBkZWZpbmVkIGFzICpyZWFkKCkq
LA0KPiA+IC0gICAgICAvLyBjaGVjayB0aGUgc2VjdGlvbiBSZWFkaW5nL1dyaXRpbmcgQ291bnRl
cnMgZm9yIGRldGFpbHMuDQo+ID4gLSAgICAgIGNvdW50IHRoZSBkZWx0YSB2YWx1ZSBzaW5jZSBw
cmV2aW91cyBpbnRlcnJ1cHQNCj4gPiAtICAgICAgdXBkYXRlIHRoZSBldmVudC0+Y291bnQgKCMg
ZXZlbnQgb2NjdXJzKSBieSBhZGRpbmcgZGVsdGEsIGFuZA0KPiA+IC0gICAgICAgICAgICAgICAg
IGV2ZW50LT5ody5wZXJpb2RfbGVmdCBieSBzdWJ0cmFjdGluZyBkZWx0YQ0KPiA+IC0NCj4gPiAt
ICAgICAgaWYgdGhlIGV2ZW50IG92ZXJmbG93cw0KPiA+IC0gICAgICAgICAgc2FtcGxlIGRhdGEN
Cj4gPiAtICAgICAgICAgIHNldCB0aGUgY291bnRlciBhcHByb3ByaWF0ZWx5IGZvciB0aGUgbmV4
dCBvdmVyZmxvdw0KPiA+IC0NCj4gPiAtICAgICAgICAgIGlmIHRoZSBldmVudCBvdmVyZmxvd3Mg
YWdhaW4NCj4gPiAtICAgICAgICAgICAgICB0b28gZnJlcXVlbnRseSwgdGhyb3R0bGUgdGhpcyBl
dmVudA0KPiA+IC0gICAgICAgICAgZmkNCj4gPiAtICAgICAgZmkNCj4gPiAtDQo+ID4gLSAgZW5k
IGZvcg0KPiA+IC0NCj4gPiAtIOeEtuiAjOaIquiHs+ebruWJje+8jOayoeacieS4gOS4qlJJU0Mt
VueahOWunueOsOS4unBlcmborr7orqHkuobkuK3mlq3vvIzmiYDku6XlhbfkvZPnmoTlrp7njrDo
poHlnKjmnKrmnaXlrozmiJDjgIINCj4gPiAtDQo+ID4gLTQuIFJlYWRpbmcvV3JpdGluZyDorqHm
lbANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtDQo+ID4gLeWug+S7rOeci+S8
vOW3ruS4jeWkmu+8jOS9hnBlcmblr7nlvoXlroPku6znmoTmgIHluqbljbTmiKrnhLbkuI3lkIzj
gIIg5a+55LqO6K+777yM5ZyoICpzdHJ1Y3QgcG11KiDkuK3mnInkuIDkuKoNCj4gPiAtKnJlYWQq
IOaOpeWPo++8jOS9huWug+eahOS9nOeUqOS4jeS7heS7heaYr+ivu+OAgiDmoLnmja7kuIrkuIvm
lofvvIwqcmVhZCog5Ye95pWw5LiN5LuF6KaB6K+75Y+W6K6h5pWw5Zmo55qE5YaF5a65DQo+ID4g
Le+8iGV2ZW50LT5jb3VudO+8ie+8jOi/mOimgeabtOaWsOW3puWRqOacn+WIsOS4i+S4gOS4quS4
reaWre+8iGV2ZW50LT5ody5wZXJpb2RfbGVmdO+8ieOAgg0KPiA+IC0NCj4gPiAtIOS9hiBwZXJm
IOeahOaguOW/g+S4jemcgOimgeebtOaOpeWGmeiuoeaVsOWZqOOAgiDlhpnorqHmlbDlmajpmpDo
l4/lnKjku6XkuIvkuKTngrnnmoTmir3osaHljJbkuYvlkI7vvIwNCj4gPiAtIDHvvIkgKnBtdS0+
c3RhcnQqIO+8jOS7juWtl+mdouS4iueci+WwseaYr+W8gOWni+iuoeaVsO+8jOaJgOS7peW/hemh
u+aKiuiuoeaVsOWZqOiuvue9ruaIkOS4gOS4quWQiOmAgueahOWAvO+8jOS7pQ0KPiA+IC0g5L6/
5LiL5LiA5qyh5Lit5pat77ybDQo+ID4gLSAy77yJ5ZyoSVJR6YeM6Z2i77yM5bqU6K+l5oqK6K6h
5pWw5Zmo6K6+572u5oiQ5ZCM5qC355qE5ZCI55CG5YC844CCDQo+ID4gLQ0KPiA+IC3lnKhSSVND
LVbkuK3vvIzor7vmk43kvZzkuI3mmK/pl67popjvvIzkvYblhpnmk43kvZzlsLHpnIDopoHotLnk
upvlipvmsJTkuobvvIzlm6DkuLpT5qih5byP5LiN5YWB6K645YaZ6K6h5pWw5Zmo44CCDQo+ID4g
LQ0KPiA+IC0NCj4gPiAtNS4gYWRkKCkvZGVsKCkvc3RhcnQoKS9zdG9wKCkNCj4gPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtDQo+ID4gLeWfuuacrOaAneaDszogYWRkKCkv
ZGVsKCkg5ZCRUE1V5re75YqgL+WIoOmZpOS6i+S7tu+8jHN0YXJ0KCkvc3RvcCgpIOWQr+WKqC/l
gZzmraJQTVXkuK3mn5DkuKrkuovku7YNCj4gPiAt55qE6K6h5pWw5Zmo44CCIOaJgOaciei/meS6
m+WHveaVsOmDveS9v+eUqOebuOWQjOeahOWPguaVsDogKnN0cnVjdCBwZXJmX2V2ZW50ICpldmVu
dCog5ZKMICppbnQgZmxhZyog44CCDQo+ID4gLQ0KPiA+IC3mioogcGVyZiDnnIvkvZzkuIDkuKrn
irbmgIHmnLrvvIzpgqPkuYjkvaDkvJrlj5HnjrDov5nkupvlh73mlbDkvZzkuLrov5nkupvnirbm
gIHkuYvpl7TnmoTnirbmgIHovazmjaLov4fnqIvjgIINCj4gPiAt5a6a5LmJ5LqG5LiJ56eN54q2
5oCB77yIZXZlbnQtPmh3LnN0YXRl77yJOg0KPiA+IC0NCj4gPiAtKiBQRVJGX0hFU19TVE9QUEVE
OiAg6K6h5pWw5YGc5q2iDQo+ID4gLSogUEVSRl9IRVNfVVBUT0RBVEU6IGV2ZW50LT5jb3VudOaY
r+acgOaWsOeahA0KPiA+IC0qIFBFUkZfSEVTX0FSQ0g6ICAgICDkvp3otZbkuo7kvZPns7vnu5Pm
noTnmoTnlKjms5XvvIzjgILjgILjgILmiJHku6znjrDlnKjlubbkuI3pnIDopoHlroPjgIINCj4g
PiAtDQo+ID4gLei/meS6m+eKtuaAgei9rOaNoueahOato+W4uOa1geeoi+WmguS4izoNCj4gPiAt
DQo+ID4gLSog55So5oi35ZCv5Yqo5LiA5LiqIHBlcmYg5LqL5Lu277yM5a+86Ie06LCD55SoICpl
dmVudF9pbml0KiDjgIINCj4gPiAtKiDlvZPooqvkuIrkuIvmlofliIfmjaLov5vmnaXnmoTml7bl
gJnvvIwqYWRkKiDkvJrooqsgcGVyZiBjb3JlIOiwg+eUqO+8jOW5tuW4puacieS4gOS4quagh+W/
lyBQRVJGX0VGX1NUQVJU77yMDQo+ID4gLSAg5Lmf5bCx5piv6K+05LqL5Lu26KKr5re75Yqg5ZCO
5bqU6K+l6KKr5ZCv5Yqo44CCIOWcqOi/meS4qumYtuaute+8jOWmguaenOacieeahOivne+8jOS4
gOiIrOS6i+S7tuS8muiiq+e7keWumuWIsOS4gOS4queJqQ0KPiA+IC0gIOeQhuiuoeaVsOWZqOS4
iuOAguW9k+eKtuaAgeWPmOS4ulBFUkZfSEVTX1NUT1BQRUTlkoxQRVJGX0hFU19VUFRPREFURe+8
jOWboOS4uueOsOWcqOW3sue7j+WBnOatouS6hiwNCj4gPiAtICDvvIjova/ku7bvvInkuovku7bo
rqHmlbDkuI3pnIDopoHmm7TmlrDjgIINCj4gPiAtDQo+ID4gLSAgLSDnhLblkI7osIPnlKggKnN0
YXJ0KiDvvIzlubblkK/nlKjorqHmlbDlmajjgIINCj4gPiAtICAgIOmAmui/h1BFUkZfRUZfUkVM
T0FE5qCH5b+X77yM5a6D5ZCR6K6h5pWw5Zmo5YaZ5YWl5LiA5Liq6YCC5b2T55qE5YC877yI6K+m
57uG5oOF5Ya16K+35Y+C6ICD5LiK5LiA6IqC77yJ44CCDQo+ID4gLSAgICDlpoLmnpzmoIflv5fk
uI3ljIXlkKtQRVJGX0VGX1JFTE9BRO+8jOWImeS4jeS8muWGmeWFpeS7u+S9leWGheWuueOAgg0K
PiA+IC0gICAg546w5Zyo54q25oCB6KKr6YeN572u5Li6bm9uZe+8jOWboOS4uuWug+aXouayoeac
ieWBnOatouS5n+ayoeacieabtOaWsO+8iOiuoeaVsOW3sue7j+W8gOWni++8ieOAgg0KPiA+IC0N
Cj4gPiAtKuW9k+iiq+S4iuS4i+aWh+WIh+aNouWHuuadpeaXtuiiq+iwg+eUqOOAgiDnhLblkI7v
vIzlroPmo4Dmn6Xlh7pQTVXkuK3nmoTmiYDmnInkuovku7bvvIzlubbosIPnlKggKnN0b3AqIOad
peabtOaWsOWug+S7rA0KPiA+IC0g55qE6K6h5pWw44CCDQo+ID4gLQ0KPiA+IC0gIC0gKnN0b3Aq
IOiiqyAqZGVsKiDlkoxwZXJm5qC45b+D6LCD55So77yM5qCH5b+X5Li6UEVSRl9FRl9VUERBVEXv
vIzlroPnu4/luLjku6Xnm7jlkIznmoTpgLvovpHlkowgKnJlYWQqDQo+ID4gLSAgICDlhbHnlKjl
kIzkuIDkuKrlrZDnqIvluo/jgIINCj4gPiAtICAgIOeKtuaAgeWPiOS4gOasoeWPmOS4ulBFUkZf
SEVTX1NUT1BQRUTlkoxQRVJGX0hFU19VUFRPREFUReOAgg0KPiA+IC0NCj4gPiAtICAtIOi/meS4
pOWvueeoi+W6j+eahOeUn+WRveWRqOacnzogKmFkZCog5ZKMICpkZWwqIOWcqOS7u+WKoeWIh+aN
ouaXtuiiq+WPjeWkjeiwg+eUqO+8mypzdGFydCog5ZKMICpzdG9wKiDlnKgNCj4gPiAtICAgIHBl
cmbmoLjlv4PpnIDopoHlv6vpgJ/lgZzmraLlkozlkK/liqjml7bkuZ/kvJrooqvosIPnlKjvvIzm
r5TlpoLlnKjosIPmlbTkuK3mlq3lkajmnJ/ml7bjgIINCj4gPiAtDQo+ID4gLeebruWJjeeahOWu
nueOsOW3sue7j+i2s+Wkn+S6hu+8jOWwhuadpeWPr+S7peW+iOWuueaYk+WcsOaJqeWxleWIsOWK
n+iDveOAgg0KPiA+IC0NCj4gPiAtQS4g55u45YWz57uT5p6E5L2TDQo+ID4gLS0tLS0tLS0tLS0t
LS0NCj4gPiAtDQo+ID4gLSogc3RydWN0IHBtdTogaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmgN
Cj4gPiAtKiBzdHJ1Y3QgcmlzY3ZfcG11OiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmZfZXZl
bnQuaA0KPiA+IC0NCj4gPiAtICDkuKTkuKrnu5PmnoTkvZPpg73ooqvorr7orqHkuLrlj6ror7vj
gIINCj4gPiAtDQo+ID4gLSAgKnN0cnVjdCBwbXUqIOWumuS5ieS6huS4gOS6m+WHveaVsOaMh+mS
iOaOpeWPo++8jOWug+S7rOWkp+WkmuS7pSAqc3RydWN0IHBlcmZfZXZlbnQqIOS9nOS4uuS4u+WP
guaVsO+8jOagueaNrg0KPiA+IC0gIHBlcmbnmoTlhoXpg6jnirbmgIHmnLrlpITnkIZwZXJm5LqL
5Lu277yI6K+m5oOF6K+35p+l55yLa2VybmVsL2V2ZW50cy9jb3JlLmPvvInjgIINCj4gPiAtDQo+
ID4gLSAgKnN0cnVjdCByaXNjdl9wbXUqIOWumuS5ieS6hlBNVeeahOWFt+S9k+WPguaVsOOAgiDl
kb3lkI3pgbXlvqrmiYDmnInlhbblroPmnrbmnoTnmoTmg6/kvovjgIINCj4gPiAtDQo+ID4gLSog
c3RydWN0IHBlcmZfZXZlbnQ6IGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5oDQo+ID4gLSogc3Ry
dWN0IGh3X3BlcmZfZXZlbnQNCj4gPiAtDQo+ID4gLSAg6KGo56S6IHBlcmYg5LqL5Lu255qE6YCa
55So57uT5p6E5L2T77yM5Lul5Y+K56Gs5Lu255u45YWz55qE57uG6IqC44CCDQo+ID4gLQ0KPiA+
IC0qIHN0cnVjdCByaXNjdl9od19ldmVudHM6IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyZl9l
dmVudC5oDQo+ID4gLQ0KPiA+IC0gIOS/neWtmOS6i+S7tueKtuaAgeeahOe7k+aehOacieS4pOS4
quWbuuWumuaIkOWRmOOAgg0KPiA+IC0gIOS6i+S7tueahOaVsOmHj+WSjOS6i+S7tueahOaVsOe7
hOOAgg0KPiA+IC0NCj4gPiAt5Y+C6ICD5paH54yuDQo+ID4gLS0tLS0tLS0tDQo+ID4gLQ0KPiA+
IC1bMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWxpbnV4L3B1bGwvMTI0DQo+ID4g
LQ0KPiA+IC1bMl0gaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL2dyb3Vwcy5yaXNjdi5vcmcv
Zm9ydW0vIyF0b3BpYy9zdy1kZXYvZjE5VG1DTlA2eUENCj4gPiAtLQ0KPiA+IDIuMjAuMQ0K

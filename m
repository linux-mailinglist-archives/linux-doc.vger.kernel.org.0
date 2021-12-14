Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC313473CEE
	for <lists+linux-doc@lfdr.de>; Tue, 14 Dec 2021 07:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhLNGFn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Dec 2021 01:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhLNGFn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 01:05:43 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDABC061574
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 22:05:43 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id k21so22209325ioh.4
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 22:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BCjr9paZtihYC+Ol+OudT/8VHuIpIX5IM4qLr+IWTSs=;
        b=I4CRDZ1NAfojMyrE1dXDRkrhWVPcsNUy3h/gVPZMkT83X7gyEuPwHcTZLhwWdwDLhV
         xeD4fTypcCFwLCRDRKd4tGye7RLgfi/HVwXuLnPETlVjF7KfRUhyd9Jwx4sOyJBoQUKJ
         caJelrhD7qQSdC1CAeHWUaBPXYQuc+lsMUUhqi4OeLUIBupWI/dlaTSqdQ1BcOQupa2e
         xy6WGkzZtzxA8Kt2TxbnU98nrVhgMThRch0KDfdWFFKJ3R/sC/A0hMrXqgC8gmfMNxmz
         Tlch8K9Te3Qd8btHaP+AIwMKnyUtg2rJ99zirC1d+HKFLV2CYKXbTnHk4iH4BnM+mVc4
         /Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BCjr9paZtihYC+Ol+OudT/8VHuIpIX5IM4qLr+IWTSs=;
        b=ADzj7+T+NalOXfxlsdqTQKTX91XWGZY0sdinEkA8pYidLDOv3hyXF9IK6Bxd4UAt96
         MmCCjFX3itXxmowudM1By3wwAzfnoHda+FrN+ptEn1rlLhABTYxOG6IfEI6NgARJXhOs
         5833n9uh20ffNrhHJBqVaNHlhN1nkN8E7ZRz76+jJZjXgu7wSkjnuHsHzC1StdBVghit
         EpgHOpbi8iJjzZB90GqZ05NsEhAeu0IVdukLnpJ1SCsUfjahGOejupZxzuXTNSdiDDXg
         A/5Ye4iHjc4uywJzvleAXxToQnOKup0FYLwbgpArI930ZNc4t5vrmtJ98wY9ioWXnJ+I
         m7Zw==
X-Gm-Message-State: AOAM531PpebE89nNmOrXHj7TPzkNAD2lFCk+OYh+n7MfBg7Y+4HGO73i
        bZbFuV4pw0UXBF1LOGdWn5Bm5+rRy98XfE21LR8=
X-Google-Smtp-Source: ABdhPJzB8o+vnQ/cNPqbNnYUXV/gp5CKm5n1ntCcWKGLTgKXsuy3bvPHEM9+qARLOevPfPkXfDhxClSISasr8gPAhvY=
X-Received: by 2002:a05:6638:2709:: with SMTP id m9mr1759042jav.236.1639461942180;
 Mon, 13 Dec 2021 22:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20211214023112.9473-1-tangyizhou@huawei.com>
In-Reply-To: <20211214023112.9473-1-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 14 Dec 2021 14:05:06 +0800
Message-ID: <CAJy-AmntN+VKCOmGAHFzGwMq0sckiaDwcm9OB8EfKECO0FR0gA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-design-CFS Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBEZWMgMTQsIDIwMjEgYXQgMTA6MDMgQU0gVGFuZyBZaXpob3UgPHRhbmd5aXpob3VA
aHVhd2VpLmNvbT4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBzY2hlZHVsZXIvc2NoZWQtZGVzaWdu
LUNGUy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYW5nIFlpemhvdSA8
dGFuZ3lpemhvdUBodWF3ZWkuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtl
cm5lbC5vcmc+DQoNCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9p
bmRleC5yc3QgICAgfCAgIDIgKy0NCj4gIC4uLi96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZGVzaWdu
LUNGUy5yc3QgICAgICB8IDIwNCArKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZGVzaWdu
LUNGUy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3NjaGVkdWxlci9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9zY2hlZHVsZXIvaW5kZXgucnN0DQo+IGluZGV4IGU5N2FkNzc4MTA4OC4uNTMyN2M2MWNiMGFi
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVs
ZXIvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Nj
aGVkdWxlci9pbmRleC5yc3QNCj4gQEAgLTIwLDYgKzIwLDcgQEAgTGludXjosIPluqblmagNCj4g
ICAgICBjb21wbGV0aW9uDQo+ICAgICAgc2NoZWQtYXJjaA0KPiAgICAgIHNjaGVkLWJ3Yw0KPiAr
ICAgIHNjaGVkLWRlc2lnbi1DRlMNCj4gICAgICBzY2hlZC1jYXBhY2l0eQ0KPg0KPg0KPiBAQCAt
MjcsNyArMjgsNiBAQCBUT0RPTGlzdDoNCj4NCj4gICAgICBzY2hlZC1id2MNCj4gICAgICBzY2hl
ZC1kZWFkbGluZQ0KPiAtICAgIHNjaGVkLWRlc2lnbi1DRlMNCj4gICAgICBzY2hlZC1kb21haW5z
DQo+ICAgICAgc2NoZWQtZW5lcmd5DQo+ICAgICAgc2NoZWQtbmljZS1kZXNpZ24NCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1k
ZXNpZ24tQ0ZTLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxl
ci9zY2hlZC1kZXNpZ24tQ0ZTLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmI2MDRiZWFhNDdmZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kZXNpZ24tQ0ZTLnJz
dA0KPiBAQCAtMCwwICsxLDIwNCBAQA0KPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6
T3JpZ2luYWw6IERvY3VtZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWRlc2lnbi1DRlMucnN0DQo+
ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyAg5ZSQ6Im66IifIFRhbmcgWWl6aG91IDx0YW5neWVl
Y2hvdUBnbWFpbC5jb20+DQo+ICsNCj4gKz09PT09PT09PT09PT09PQ0KPiAr5a6M5YWo5YWs5bmz
6LCD5bqm5ZmoDQo+ICs9PT09PT09PT09PT09PT0NCj4gKw0KPiArDQo+ICsxLiDmpoLov7ANCj4g
Kz09PT09PT0NCj4gKw0KPiArQ0ZT6KGo56S64oCc5a6M5YWo5YWs5bmz6LCD5bqm5Zmo4oCd77yM
5a6D5piv5Li65qGM6Z2i5paw6K6+6K6h55qE6L+b56iL6LCD5bqm5Zmo77yM55SxSW5nbyBNb2xu
YXLlrp7njrDlubblkIjlhaVMaW51eA0KPiArMi42LjIz44CC5a6D5pu/5Luj5LqG5LmL5YmN5Y6f
5aeL6LCD5bqm5Zmo5LitU0NIRURfT1RIRVLnrZbnlaXnmoTkuqTkupLlvI/ku6PnoIHjgIINCj4g
Kw0KPiArQ0ZTIDgwJeeahOiuvuiuoeWPr+S7peaAu+e7k+S4uuS4gOWPpeivne+8mkNGU+WcqOec
n+WunuehrOS7tuS4iuW7uuaooeS6huS4gOS4quKAnOeQhuaDs+eahO+8jOeyvuehrueahOWkmuS7
u+WKoUNQVeKAneOAgg0KPiArDQo+ICvigJznkIbmg7PnmoTlpJrku7vliqFDUFXigJ3mmK/kuIDn
p43vvIjkuI3lrZjlnKjnmoQgOi0p77yJ5YW35pyJMTAwJeeJqeeQhueul+WKm+eahENQVe+8jOWu
g+iDveiuqeavj+S4quS7u+WKoeeyvuehruWcsOS7pQ0KPiAr55u45ZCM55qE6YCf5bqm5bm26KGM
6L+Q6KGM77yM6YCf5bqm5Z2H5Li6MS9ucl9ydW5uaW5n44CC5Li+5L6L5p2l6K+077yM5aaC5p6c
5pyJ5Lik5Liq5Lu75Yqh5q2j5Zyo6L+Q6KGM77yM6YKj5LmI5q+P5LiqDQo+ICvku7vliqHojrfl
vpc1MCXniannkIbnrpflipvjgIIgLS0tIOS5n+WwseaYr+ivtO+8jOecn+ato+eahOW5tuihjOOA
gg0KPiArDQo+ICvlnKjnnJ/lrp7nmoTnoazku7bkuIrvvIzkuIDmrKHlj6rog73ov5DooYzkuIDk
uKrku7vliqHvvIzmiYDku6XmiJHku6zpnIDopoHku4vnu43igJzomZrmi5/ov5DooYzml7bpl7Ti
gJ3nmoTmpoLlv7XjgILku7vliqHnmoTomZrmi58NCj4gK+i/kOihjOaXtumXtOihqOaYju+8jOWu
g+eahOS4i+S4gOS4quaXtumXtOeJh+WwhuWcqOS4iuaWh+aPj+i/sOeahOeQhuaDs+WkmuS7u+WK
oUNQVeS4iuW8gOWni+aJp+ihjOOAguWcqOWunui3teS4re+8jOS7u+WKoeeahA0KPiAr6Jma5ouf
6L+Q6KGM5pe26Ze055Sx5a6D55qE55yf5a6e6L+Q6KGM5pe26Ze055u46L6D5q2j5Zyo6L+Q6KGM
55qE5Lu75Yqh5oC75pWw5b2S5LiA5YyW6K6h566X5b6X5Yiw44CCDQo+ICsNCj4gKw0KPiArDQo+
ICsyLiDkuIDkupvlrp7njrDnu4boioINCj4gKz09PT09PT09PT09PT09PQ0KPiArDQo+ICvlnKhD
RlPkuK3vvIzomZrmi5/ov5DooYzml7bpl7TnlLHmr4/kuKrku7vliqHnmoRwLT5zZS52cnVudGlt
Ze+8iOWNleS9jeS4uue6s+enku+8ieeahOWAvOihqOi+vuWSjOi3n+i4quOAguWboOatpO+8jA0K
PiAr57K+56Gu5Zyw6K6h5pe25ZKM5rWL6YeP5LiA5Liq5Lu75Yqh5bqU5b6X55qE4oCc6aKE5pyf
55qEQ1BV5pe26Ze04oCd5piv5Y+v6IO955qE44CCDQo+ICsNCj4gKyAg5LiA5Lqb57uG6IqC77ya
5Zyo4oCc55CG5oOz55qE4oCd56Gs5Lu25LiK77yM5omA5pyJ55qE5Lu75Yqh5Zyo5Lu75L2V5pe2
5Yi76YO95bqU6K+l5YW35pyJ5LiA5qC355qEcC0+c2UudnJ1bnRpbWXlgLzvvIwNCj4gKyAgLS0t
IOS5n+WwseaYr+ivtO+8jOS7u+WKoeW6lOW9k+WQjOaXtuaJp+ihjO+8jOayoeacieS7u+WKoeS8
muWcqOKAnOeQhuaDs+eahOKAnUNQVeWIhuaXtuS4reWPmOW+l+KAnOS4jeW5s+ihoeKAneOAgg0K
PiArDQo+ICtDRlPnmoTku7vliqHpgInmi6npgLvovpHln7rkuo5wLT5zZS52cnVudGltZeeahOWA
vO+8jOWboOatpOmdnuW4uOeugOWNle+8muaAu+aYr+ivleWbvumAieaLqXAtPnNlLnZydW50aW1l
5YC8DQo+ICvmnIDlsI/nmoTku7vliqHov5DooYzvvIjkuZ/lsLHmmK/or7TvvIzoh7Pku4rmiafo
oYzml7bpl7TmnIDlsJHnmoTku7vliqHvvInjgIJDRlPmgLvmmK/lsL3lj6/og73lsJ3or5XmjIni
gJznkIbmg7PlpJrku7vliqHnoazku7bigJ0NCj4gK+mCo+agt+WwhkNQVeaXtumXtOWcqOWPr+i/
kOihjOS7u+WKoeS4reWdh+WIhuOAgg0KPiArDQo+ICtDRlPliankuIvnmoTlhbblroPorr7orqHv
vIzkuIDoiKzohLHnprvkuobov5nkuKrnroDljZXnmoTmpoLlv7XvvIzpmYTliqDnmoTorr7orqHl
jIXmi6xuaWNl57qn5Yir77yM5aSa5aSE55CG77yM5Lul5Y+K5ZCE56eNDQo+ICvnlKjmnaXor4bl
iKvlt7LnnaHnnKDku7vliqHnmoTnrpfms5Xlj5jkvZPjgIINCj4gKw0KPiArDQo+ICsNCj4gKzMu
IOe6oum7keagkQ0KPiArPT09PT09PT09DQo+ICsNCj4gK0NGU+eahOiuvuiuoemdnuW4uOa/gOi/
m++8muWug+S4jeS9v+eUqOi/kOihjOmYn+WIl+eahOaXp+aVsOaNrue7k+aehO+8jOiAjOaYr+S9
v+eUqOaMieaXtumXtOaOkuW6j+eahOe6oum7keagke+8jOaehOW7uuWHug0KPiAr5Lu75Yqh5pyq
5p2l5omn6KGM55qE4oCc5pe26Ze057q/4oCd44CC5Zug5q2k5rKh5pyJ5Lu75L2V4oCc5pWw57uE
5YiH5o2i4oCd55qE5pen5YyF6KKx77yI5LmL5YmN55qE5Y6f5aeL6LCD5bqm5Zmo5ZKMUlNETC9T
ROmDvQ0KPiAr6KKr5a6D5b2x5ZON77yJ44CCDQo+ICsNCj4gK0NGU+WQjOagt+e7tOaKpOS6hnJx
LT5jZnMubWluX3ZydW50aW1l5YC877yM5a6D5piv5Y2V6LCD6YCS5aKe55qE77yM6Lef6Liq6L+Q
6KGM6Zif5YiX5Lit55qE5omA5pyJ5Lu75Yqh55qE5pyA5bCPDQo+ICvomZrmi5/ov5DooYzml7bp
l7TlgLzjgILns7vnu5/lgZrnmoTlhajpg6jlt6XkvZzmmK/vvJrkvb/nlKhtaW5fdnJ1bnRpbWXo
t5/ouKrvvIznhLblkI7nlKjlroPnmoTlgLzlsIbmlrDmv4DmtLvnmoTosIPluqYNCj4gK+WunuS9
k+WwveWPr+iDveWcsOaUvuWcqOe6oum7keagkeeahOW3puS+p+OAgg0KPiArDQo+ICvov5DooYzp
mJ/liJfkuK3mraPlnKjov5DooYznmoTku7vliqHnmoTmgLvmlbDnlLFycS0+Y2ZzLmxvYWTorqHm
lbDvvIzlroPmmK/ov5DooYzpmJ/liJfkuK3nmoTku7vliqHnmoTmnYPlgLzkuYvlkozjgIINCj4g
Kw0KPiArQ0ZT57u05oqk5LqG5LiA5Liq5oyJ5pe26Ze05o6S5bqP55qE57qi6buR5qCR77yM5omA
5pyJ5Y+v6L+Q6KGM5Lu75Yqh5LulcC0+c2UudnJ1bnRpbWXkuLrplK7lgLzmjpLluo/jgIJDRlPk
u47ov5npopcNCj4gK+agkeS4iumAieaLqeKAnOacgOW3puS+p+KAneeahOS7u+WKoeW5tui/kOih
jOOAguezu+e7n+e7p+e7rei/kOihjO+8jOiiq+aJp+ihjOi/h+eahOS7u+WKoei2iuadpei2iuii
q+aUvuWIsOagkeeahOWPs+S+pyAtLS0g57yT5oWi77yMDQo+ICvkvYblvojmmI7noa7mr4/kuKrk
u7vliqHpg73mnInmiJDkuLrigJzmnIDlt6bkvqfku7vliqHigJ3nmoTmnLrkvJrvvIzlm6DmraTk
u7vliqHlsIbnoa7lrprmgKflnLDojrflvpfkuIDlrprph49DUFXml7bpl7TjgIINCj4gKw0KPiAr
5oC757uT5LiA5LiL77yMQ0ZT5bel5L2c5pa55byP5YOP6L+Z5qC377ya5a6D6L+Q6KGM5LiA5Liq
5Lu75Yqh5LiA5Lya5YS/77yM5b2T5Lu75Yqh5Y+R55Sf6LCD5bqm77yI5oiW6ICF6LCD5bqm5Zmo
5pe26ZKf5ru0562UDQo+ICt0aWNr5Lqn55Sf77yJ77yM5bCx5Lya6ICD6JmR5Lu75Yqh55qEQ1BV
5L2/55So546H77ya5Lu75Yqh5Yia5Yia6Iqx5Zyo54mp55CGQ1BV5LiK55qE77yI5bCR6YeP77yJ
5pe26Ze06KKr5Yqg5YiwDQo+ICtwLT5zZS52cnVudGltZeOAguS4gOaXpnAtPnNlLnZydW50aW1l
5Y+Y5b6X6Laz5aSf5aSn77yM5YW25a6D55qE5Lu75Yqh5bCG5oiQ5Li65oyJ5pe26Ze05o6S5bqP
55qE57qi6buR5qCR55qEDQo+ICvigJzmnIDlt6bkvqfku7vliqHigJ3vvIjnm7jovoPmnIDlt6bk
vqfnmoTku7vliqHvvIzov5jopoHliqDkuIrkuIDkuKrlvojlsI/nmoTigJznspLluqbigJ3ph4/v
vIzkvb/lvpfmiJHku6zkuI3kvJrlr7nku7vliqHov4fluqbosIPluqbvvIwNCj4gK+WvvOiHtOe8
k+WtmOmioOewuO+8ie+8jOeEtuWQjuaWsOeahOacgOW3puS+p+S7u+WKoeWwhuiiq+mAieS4re+8
jOW9k+WJjeS7u+WKoeiiq+aKouWNoOOAgg0KPiArDQo+ICsNCj4gKw0KPiArDQo+ICs0LiBDRlPn
moTkuIDkupvnibnlvoENCj4gKz09PT09PT09PT09PT09PT0NCj4gKw0KPiArQ0ZT5L2/55So57qz
56eS57KS5bqm55qE6K6h5pe277yM5LiN5L6d6LWW5LqO5Lu75L2VamlmZmllc+aIlkha55qE57uG
6IqC44CC5Zug5q2kQ0ZT5bm25LiN5YOP5LmL5YmN55qE6LCD5bqm5Zmo6YKj5qC3DQo+ICvmnIni
gJzml7bpl7TniYfigJ3nmoTmpoLlv7XvvIzkuZ/msqHmnInku7vkvZXlkK/lj5HlvI/nmoTorr7o
rqHjgILllK/kuIDlj6/osIPnmoTlj4LmlbDvvIjkvaDpnIDopoHmiZPlvIBDT05GSUdfU0NIRURf
REVCVUfvvInmmK/vvJoNCj4gKw0KPiArICAgL3Byb2Mvc3lzL2tlcm5lbC9zY2hlZF9taW5fZ3Jh
bnVsYXJpdHlfbnMNCj4gKw0KPiAr5a6D5Y+v5Lul55So5p2l5bCG6LCD5bqm5Zmo5LuO4oCc5qGM
6Z2i4oCd5qih5byP77yI5Lmf5bCx5piv5L2O5pe25bu277yJ6LCD6IqC5Li64oCc5pyN5Yqh5Zmo
4oCd77yI5Lmf5bCx5piv6auY5om55aSE55CG77yJ5qih5byP44CCDQo+ICvlroPnmoTpu5jorqTo
rr7nva7mmK/pgILlkIjmoYzpnaLnmoTlt6XkvZzotJ/ovb3jgIJTQ0hFRF9CQVRDSOS5n+iiq0NG
U+iwg+W6puWZqOaooeWdl+WkhOeQhuOAgg0KPiArDQo+ICtDRlPnmoTorr7orqHkuI3mmJPlj5fl
iLDlvZPliY3lrZjlnKjnmoTku7vkvZXpkojlr7lzdG9ja+iwg+W6puWZqOeahOKAnOaUu+WHu+KA
neeahOW9seWTje+8jOWMheaLrGZpZnR5cC5j77yMdGh1ZC5j77yMDQo+ICtjaGV3LmPvvIxyaW5n
LXRlc3QuY++8jG1hc3NpdmVfaW50ci5j77yM5a6D5Lus6YO96IO95b6I5aW95Zyw6L+Q6KGM77yM
5LiN5Lya5b2x5ZON5Lqk5LqS5oCn77yM5bCG5Lqn55SfDQo+ICvnrKblkIjpooTmnJ/nmoTooYzk
uLrjgIINCj4gKw0KPiArQ0ZT6LCD5bqm5Zmo5aSE55CGbmljZee6p+WIq+WSjFNDSEVEX0JBVENI
55qE6IO95Yqb5q+U5LmL5YmN55qE5Y6f5aeL6LCD5bqm5Zmo5pu05by677ya5Lik56eN57G75Z6L
55qE5bel5L2c6LSf6L29DQo+ICvpg73ooqvmm7Tmv4Dov5vlnLDpmpTnprvkuobjgIINCj4gKw0K
PiArU01Q6LSf6L295Z2H6KGh6KKr6YeN5YGaL+a4heeQhui/h++8mumBjeWOhui/kOihjOmYn+WI
l+eahOWBh+iuvuW3sue7j+S7jui0n+i9veWdh+ihoeeahOS7o+eggeS4reenu+mZpO+8jOS9v+eU
qOiwg+W6puaooeWdlw0KPiAr55qE6L+t5Luj5Zmo44CC57uT5p6c5piv77yM6LSf6L295Z2H6KGh
5Luj56CB5Y+Y5b6X566A5Y2V5LiN5bCR44CCDQo+ICsNCj4gKw0KPiArDQo+ICs1LiDosIPluqbn
rZbnlaUNCj4gKz09PT09PT09PT09DQo+ICsNCj4gK0NGU+WunueOsOS6huS4ieenjeiwg+W6puet
lueVpe+8mg0KPiArICAtIFNDSEVEX05PUk1BTO+8mu+8iOS8oOe7n+iiq+ensOS4ulNDSEVEX09U
SEVS77yJ77ya6K+l6LCD5bqm562W55Wl55So5LqO5pmu6YCa5Lu75Yqh44CCDQo+ICsNCj4gKyAg
LSBTQ0hFRF9CQVRDSO+8muaKouWNoOS4jeWDj+aZrumAmuS7u+WKoemCo+agt+mikee5ge+8jOWb
oOatpOWFgeiuuOS7u+WKoei/kOihjOabtOmVv+aXtumXtO+8jOabtOWlveWcsOWIqeeUqOe8k+Wt
mO+8jA0KPiArICAgIOS4jei/h+imgeS7peS6pOS6kuaAp+S4uuS7o+S7t+OAguWug+W+iOmAguWQ
iOaJueWkhOeQhuW3peS9nOOAgg0KPiArDQo+ICsgIC0gU0NIRURfSURMRe+8muWug+avlG5pY2Ug
MTnmm7TlvLHvvIzkuI3ov4flroPkuI3mmK/nnJ/mraPnmoRpZGxl5a6a5pe25Zmo6LCD5bqm5Zmo
77yM5Zug5Li66KaB6YG/5YWN57uZ5py65ZmoDQo+ICsgICAg5bim5p2l5q276ZSB55qE5LyY5YWI
57qn5Y+N6L2s6Zeu6aKY44CCDQo+ICsNCj4gK1NDSEVEX0ZJRk8vX1JS6KKr5a6e546w5Zyoc2No
ZWQvcnQuY+S4re+8jOWug+S7rOeUsVBPU0lY5YW35L2T6K+05piO44CCDQo+ICsNCj4gK3V0aWwt
bGludXgtbmcgMi4xMy4xLjHkuK3nmoRjaHJ05ZG95Luk5Y+v5Lul6K6+572u5Lul5LiK5omA5pyJ
562W55Wl77yM6Zmk5LqGU0NIRURfSURMReOAgg0KPiArDQo+ICsNCj4gKw0KPiArNi4g6LCD5bqm
57G7DQo+ICs9PT09PT09PT0NCj4gKw0KPiAr5paw55qEQ0ZT6LCD5bqm5Zmo6KKr6K6+6K6h5oiQ
5pSv5oyB4oCc6LCD5bqm57G74oCd77yM5LiA56eN6LCD5bqm5qih5Z2X55qE5Y+v5omp5bGV5bGC
5qyh57uT5p6E44CC6L+Z5Lqb5qih5Z2X5bCB6KOF5LqG6LCD5bqm562W55WlDQo+ICvnu4boioLv
vIznlLHosIPluqblmajmoLjlv4Pku6PnoIHlpITnkIbvvIzkuJTml6DpnIDlr7nlroPku6zlgZrl
pKrlpJrlgYforr7jgIINCj4gKw0KPiArc2NoZWQvZmFpci5jIOWunueOsOS6huS4iuaWh+aPj+i/
sOeahENGU+iwg+W6puWZqOOAgg0KPiArDQo+ICtzY2hlZC9ydC5jIOWunueOsOS6hlNDSEVEX0ZJ
Rk/lkoxTQ0hFRF9SUuivreS5ie+8jOS4lOavlOS5i+WJjeeahOWOn+Wni+iwg+W6puWZqOabtOeu
gOa0geOAguWug+S9v+eUqOS6hjEwMOS4qg0KPiAr6L+Q6KGM6Zif5YiX77yI5oC75YWxMTAw5Liq
5a6e5pe25LyY5YWI57qn77yM5pu/5Luj5LqG5LmL5YmN6LCD5bqm5Zmo55qEMTQw5Liq77yJ77yM
5LiU5LiN6ZyA6KaB6L+H5pyf5pWw57uE77yIZXhwaXJlZA0KPiArYXJyYXnvvInjgIINCj4gKw0K
PiAr6LCD5bqm57G755Sxc2NoZWRfY2xhc3Pnu5PmnoTkvZPlrp7njrDvvIzlroPljIXmi6zkuIDk
upvlh73mlbDpkqnlrZDvvIzlvZPmhJ/lhbTotqPnmoTkuovku7blj5HnlJ/ml7bvvIzpkqnlrZDo
oqvosIPnlKjjgIINCj4gKw0KPiAr6L+Z5piv77yI6YOo5YiG77yJ6ZKp5a2Q55qE5YiX6KGo77ya
DQo+ICsNCj4gKyAtIGVucXVldWVfdGFzayguLi4pDQo+ICsNCj4gKyAgIOW9k+S7u+WKoei/m+WF
peWPr+i/kOihjOeKtuaAgeaXtu+8jOiiq+iwg+eUqOOAguWug+Wwhuiwg+W6puWunuS9k++8iOS7
u+WKoe+8ieaUvuWIsOe6oum7keagkeS4re+8jOWinuWKoG5yX3J1bm5pbmflj5jph48NCj4gKyAg
IOeahOWAvOOAgg0KPiArDQo+ICsgLSBkZXF1ZXVlX3Rhc2soLi4uKQ0KPiArDQo+ICsgICDlvZPk
u7vliqHkuI3lho3lj6/ov5DooYzml7bvvIzov5nkuKrlh73mlbDooqvosIPnlKjvvIzlr7nlupTn
moTosIPluqblrp7kvZPooqvnp7vlh7rnuqLpu5HmoJHjgILlroPlh4/lsJFucl9ydW5uaW5n5Y+Y
6YePDQo+ICsgICDnmoTlgLzjgIINCj4gKw0KPiArIC0geWllbGRfdGFzayguLi4pDQo+ICsNCj4g
KyAgIOi/meS4quWHveaVsOeahOihjOS4uuWfuuacrOS4iuaYr+WHuumYn++8jOe0p+aOpeedgOWF
pemYn++8jOmZpOmdnmNvbXBhdF95aWVsZCBzeXNjdGzooqvlvIDlkK/jgILlnKjpgqPnp43mg4Xl
hrXkuIvvvIwNCj4gKyAgIOWug+Wwhuiwg+W6puWunuS9k+aUvuWcqOe6oum7keagkeeahOacgOWP
s+err+OAgg0KPiArDQo+ICsgLSBjaGVja19wcmVlbXB0X2N1cnIoLi4uKQ0KPiArDQo+ICsgICDo
v5nkuKrlh73mlbDmo4Dmn6Xov5vlhaXlj6/ov5DooYznirbmgIHnmoTku7vliqHog73lkKbmiqLl
jaDlvZPliY3mraPlnKjov5DooYznmoTku7vliqHjgIINCj4gKw0KPiArIC0gcGlja19uZXh0X3Rh
c2soLi4uKQ0KPiArDQo+ICsgICDov5nkuKrlh73mlbDpgInmi6nmjqXkuIvmnaXmnIDpgILlkIjo
v5DooYznmoTku7vliqHjgIINCj4gKw0KPiArIC0gc2V0X2N1cnJfdGFzayguLi4pDQo+ICsNCj4g
KyAgIOi/meS4quWHveaVsOWcqOS7u+WKoeaUueWPmOiwg+W6puexu+aIluaUueWPmOS7u+WKoee7
hOaXtuiiq+iwg+eUqOOAgg0KPiArDQo+ICsgLSB0YXNrX3RpY2soLi4uKQ0KPiArDQo+ICsgICDo
v5nkuKrlh73mlbDmnIDluLjooqvml7bpl7Tmu7TnrZTlh73mlbDosIPnlKjvvIzlroPlj6/og73l
r7zoh7Tov5vnqIvliIfmjaLjgILov5npqbHliqjkuobov5DooYzml7bmiqLljaDjgIINCj4gKw0K
PiArDQo+ICsNCj4gKw0KPiArNy4gQ0ZT55qE57uE6LCD5bqm5omp5bGVDQo+ICs9PT09PT09PT09
PT09PT09PT0NCj4gKw0KPiAr6YCa5bi477yM6LCD5bqm5Zmo5pON5L2c57KS5bqm5Li65Lu75Yqh
77yM5Yqq5Yqb5Li65q+P5Liq5Lu75Yqh5o+Q5L6b5YWs5bmz55qEQ1BV5pe26Ze044CC5pyJ5pe2
5Y+v6IO95biM5pyb5bCG5Lu75Yqh57yW57uE77yMDQo+ICvlubbkuLrmr4/kuKrnu4Tmj5Dkvpvl
hazlubPnmoRDUFXml7bpl7TjgILkuL7kvovmnaXor7TvvIzlj6/og73pppblhYjluIzmnJvkuLrn
s7vnu5/kuK3nmoTmr4/kuKrnlKjmiLfmj5DkvpvlhazlubPnmoRDUFUNCj4gK+aXtumXtO+8jOaO
peS4i+adpeaJjeaYr+afkOS4queUqOaIt+eahOavj+S4quS7u+WKoeOAgg0KPiArDQo+ICtDT05G
SUdfQ0dST1VQX1NDSEVEIOWKm+axguWunueOsOWug+OAguWug+WwhuS7u+WKoee8lue7hO+8jOW5
tuS4uui/meS6m+e7hOWFrOW5s+WcsOWIhumFjUNQVeaXtumXtOOAgg0KPiArDQo+ICtDT05GSUdf
UlRfR1JPVVBfU0NIRUQg5YWB6K645bCG5a6e5pe277yI5Lmf5bCx5piv6K+077yMU0NIRURfRklG
T+WSjFNDSEVEX1JS77yJ5Lu75Yqh57yW57uE44CCDQo+ICsNCj4gK0NPTkZJR19GQUlSX0dST1VQ
X1NDSEVEIOWFgeiuuOWwhkNGU++8iOS5n+WwseaYr+ivtO+8jFNDSEVEX05PUk1BTOWSjFNDSEVE
X0JBVENI77yJ5Lu75Yqh57yW57uE44CCDQo+ICsNCj4gKyAgIOi/meS6m+e8luivkemAiemhueim
geaxgkNPTkZJR19DR1JPVVBT6KKr5a6a5LmJ77yM54S25ZCO566h55CG5ZGY6IO95L2/55SoY2dy
b3Vw5Lyq5paH5Lu257O757uf5Lu75oSP5Yib5bu65Lu75Yqh57uE44CCDQo+ICsgICDlhbPkuo7o
r6Xmlofku7bns7vnu5/nmoTmm7TlpJrkv6Hmga/vvIzlj4Lop4FEb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2Nncm91cC12MS9jZ3JvdXBzLnJzdA0KPiArDQo+ICvlvZNDT05GSUdfRkFJUl9HUk9V
UF9TQ0hFROiiq+WumuS5ieWQju+8jOmAmui/h+S8quaWh+S7tuezu+e7n++8jOavj+S4que7hOii
q+WIm+W7uuS4gOS4quKAnGNwdS5zaGFyZXPigJ3mlofku7bjgIINCj4gK+WPguingeS4i+mdouea
hOS+i+WtkOadpeWIm+W7uuS7u+WKoee7hO+8jOW5tumAmui/h+KAnGNncm91cOKAneS8quaWh+S7
tuezu+e7n+S/ruaUueWug+S7rOeahENQVeS7veminTo6DQo+ICsNCj4gKyAgICAgICAjIG1vdW50
IC10IHRtcGZzIGNncm91cF9yb290IC9zeXMvZnMvY2dyb3VwDQo+ICsgICAgICAgIyBta2RpciAv
c3lzL2ZzL2Nncm91cC9jcHUNCj4gKyAgICAgICAjIG1vdW50IC10IGNncm91cCAtb2NwdSBub25l
IC9zeXMvZnMvY2dyb3VwL2NwdQ0KPiArICAgICAgICMgY2QgL3N5cy9mcy9jZ3JvdXAvY3B1DQo+
ICsNCj4gKyAgICAgICAjIG1rZGlyIG11bHRpbWVkaWEgICAgICAjIOWIm+W7uiAibXVsdGltZWRp
YSIg5Lu75Yqh57uEDQo+ICsgICAgICAgIyBta2RpciBicm93c2VyICAgICAgICAgIyDliJvlu7og
ImJyb3dzZXIiIOS7u+WKoee7hA0KPiArDQo+ICsgICAgICAgIyAj6YWN572ubXVsdGltZWRpYee7
hO+8jOS7pOWFtuiOt+W+l2Jyb3dzZXLnu4TkuKTlgI1DUFXluKblrr0NCj4gKw0KPiArICAgICAg
ICMgZWNobyAyMDQ4ID4gbXVsdGltZWRpYS9jcHUuc2hhcmVzDQo+ICsgICAgICAgIyBlY2hvIDEw
MjQgPiBicm93c2VyL2NwdS5zaGFyZXMNCj4gKw0KPiArICAgICAgICMgZmlyZWZveCAmICAgICAj
IOWQr+WKqGZpcmVmb3jlubbmiorlroPnp7vliLAgImJyb3dzZXIiIOe7hA0KPiArICAgICAgICMg
ZWNobyA8ZmlyZWZveF9waWQ+ID4gYnJvd3Nlci90YXNrcw0KPiArDQo+ICsgICAgICAgIyAj5ZCv
5YqoZ21wbGF5ZXLvvIjmiJbogIXkvaDmnIDllpzmrKLnmoTnlLXlvbHmkq3mlL7lmajvvIkNCj4g
KyAgICAgICAjIGVjaG8gPG1vdmllX3BsYXllcl9waWQ+ID4gbXVsdGltZWRpYS90YXNrcw0KPiAt
LQ0KPiAyLjE3LjENCj4NCg==

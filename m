Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B523DA3BB
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jul 2021 15:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237334AbhG2NR5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Jul 2021 09:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbhG2NR4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:17:56 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C0FC061765;
        Thu, 29 Jul 2021 06:17:52 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id x7so2486801ilh.10;
        Thu, 29 Jul 2021 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qyZRcJHKG1Vz8bu1zS3X4W4N77qf9O5oIz1dMRwNwVc=;
        b=NrhQ6P+dxJ0MN/se/KmuFCbu6NHltj6QMSRWEVxv+eAXKHplBFO09ojoL0XtdkcTqa
         BO0CuwK9guWH5O4UBKIL6zi2RwKRTGWNwl81+RpyevsF5s2Mup7rTuNwaITlfkqmcZdb
         griPOpq9r16aZrBbK0d3M3u4bEsIRSjqaUcq+256uPtcWlbXAAX2Nrd90rLnHeazulGJ
         zH2BffWEBwJksx5aOA1IxKqSB8yNbIMtRVcWMK7mksl5lYK2TH8m8d3WHwhIHTnG3jXk
         mtwY1d3UNVGc3nysQACmRrQIbT2H809iG4SIR6/zeEOG7yTv9zEbMvH+YVC0AlPyI8Mh
         mgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qyZRcJHKG1Vz8bu1zS3X4W4N77qf9O5oIz1dMRwNwVc=;
        b=SdoGNtNAkWVpY6Dg7gTJ1hqIvjrQSfl+ylGvD4s5jfHyaGCrdIQDUfgluoEBtX6gSG
         MLA/KYACNu54WcKc7AWNSxZmlV/r/FcfkGaBkg0/dcN3q3XiY2iQhyJt3WCtST5Q5/x1
         3zoMQ++q9KVIzinaz03YPKpyi4QPnPX/bKxfYkPt8mIQ+I+UnC6smNLfJsLUhyQp4gyp
         7ucxQuIIJxwgfdiZEH20b2Q54ZK1V55ltxvTBac5ilJoLbWfztCBaMFDzVLe4nXQCJpR
         9ANg+qQV9dihnJS5FeumyCOCRX17H+uaZFiAUU3GM7j9fIPKPtyzlpnICVmtUWDHrrhP
         iVwg==
X-Gm-Message-State: AOAM530PKPx9Cq7thZco/OJNTyes+pqlqC9Q3GOqlvM63LqZMn76iXCa
        sYSvVc95jFbxBO6avQbrpNL+4gVinvcZlEQJbAE=
X-Google-Smtp-Source: ABdhPJx8SlMGsTz5F6jCDlEuu3q7naEW+4wQ6wtjSIQl0DPyUIMKNTJUxil+eOFLruN7Oz3hXUAGSiEQd1u2rX/domU=
X-Received: by 2002:a05:6e02:602:: with SMTP id t2mr3696384ils.118.1627564671910;
 Thu, 29 Jul 2021 06:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210726135832.513115-1-yang.yang29@zte.com.cn>
In-Reply-To: <20210726135832.513115-1-yang.yang29@zte.com.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:17:15 +0800
Message-ID: <CAJy-Am=4Y132ZKEBCP+dgggYj+AxNUuJbUg3q7SGEGBDTS3mkw@mail.gmail.com>
Subject: Re: [PATCHv4] docs/zh_CN: Add zh_CN/accounting/psi.rst
To:     cgel.zte@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        YanTeng Si <sterlingteng@gmail.com>,
        Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        yang.yang29@zte.com.cn, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBKdWwgMjYsIDIwMjEgYXQgOTo1OCBQTSA8Y2dlbC56dGVAZ21haWwuY29tPiB3cm90
ZToNCj4NCj4gRnJvbTogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPg0KPg0KPiBB
ZGQgdHJhbnNsYXRpb24gemhfQ04vYWNjb3VudGluZy9wc2kucnN0IGFuZCB6aF9DTi9hY2NvdW50
aW5nL2luZGV4LnJzdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZYW5nIDx5YW5nLnlhbmcy
OUB6dGUuY29tLmNuPg0KPiBSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25n
c29uLmNuPg0KDQpOaWNlIGpvYiBmb3IgYm90aCBvZiB5b3UhDQoNClJldmlld2VkLWJ5OiBBbGV4
IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0KQlRXLCB3ZSBkb24ndCBoYXZlIHRvIHJlc2VuZCBh
IG5ldyB2ZXJzaW9uIGZvciBvbmx5ICdSZXZpZXdlZC1ieTonDQpwaWNraW5nLiBNYWludGFpbmVy
IHdpbGwgZG8gaXQgb2Z0ZW4uDQoNClRoYW5rcw0KQWxleA0KDQo+IC0tLQ0KPiB2NDogZGVsZXRl
IHdyb25nIFJldmlld2VkLWJ5DQo+IHYzOiBhZGQgcmV2aWV3ZXJzDQo+IHYyOiBjb3JyZWN0IHdy
b25nIGZvcm1hdCBhbmQgYWRkIHRyYW5zbGF0aW9ucyBmb3IgY29kZSBhbm5vdGF0aW9ucw0KPiAt
LS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vYWNjb3VudGluZy9pbmRleC5yc3QgICB8ICAy
NSArKysNCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vYWNjb3VudGluZy9wc2kucnN0ICAgICB8
IDE1NSArKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTgwIGluc2VydGlv
bnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9hY2NvdW50aW5nL2luZGV4LnJzdA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FjY291bnRpbmcvcHNpLnJzdA0KPg0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWNjb3VudGluZy9pbmRleC5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hY2NvdW50aW5nL2luZGV4LnJz
dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM2MmU5MDdi
NDFmOQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FjY291bnRpbmcvaW5kZXgucnN0DQo+IEBAIC0wLDAgKzEsMjUgQEANCj4gKy4uIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsNCj4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vYWNj
b3VudGluZy9pbmRleC5yc3QNCj4gKzpUcmFuc2xhdG9yOiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5
QHp0ZS5jb20uY24+DQo+ICsNCj4gKy4uIF9jbl9hY2NvdW50aW5nX2luZGV4LnJzdDoNCj4gKw0K
PiArDQo+ICs9PT09DQo+ICvorqHmlbANCj4gKz09PT0NCj4gKw0KPiArLi4gdG9jdHJlZTo6DQo+
ICsgICA6bWF4ZGVwdGg6IDENCj4gKw0KPiArICAgcHNpDQo+ICsNCj4gK1RvZG9saXN0Og0KPiAr
DQo+ICsgICBjZ3JvdXBzdGF0cw0KPiArICAgZGVsYXktYWNjb3VudGluZw0KPiArICAgdGFza3N0
YXRzDQo+ICsgICB0YXNrc3RhdHMtc3RydWN0DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9hY2NvdW50aW5nL3BzaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9hY2NvdW50aW5nL3BzaS5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hMGRkYjdiZDI1N2MNCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hY2NvdW50aW5nL3BzaS5y
c3QNCj4gQEAgLTAsMCArMSwxNTUgQEANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpo
X0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vYWNjb3VudGluZy9wc2ku
cnN0DQo+ICs6VHJhbnNsYXRvcjogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPg0K
PiArDQo+ICsuLiBfY25fcHNpLnJzdDoNCj4gKw0KPiArDQo+ICs9PT09PT09PT09PT09PT09PQ0K
PiArUFNJ4oCU4oCU5Y6L5Yqb6Zi75aGe5L+h5oGvDQo+ICs9PT09PT09PT09PT09PT09PQ0KPiAr
DQo+ICs65pel5pyfOiBBcHJpbCwgMjAxOA0KPiArOuS9nOiAhTogSm9oYW5uZXMgV2VpbmVyIDxo
YW5uZXNAY21weGNoZy5vcmc+DQo+ICsNCj4gK+W9k0NQVeOAgW1lbW9yeeaIlklP6K6+5aSH5aSE
5LqO56ue5LqJ54q25oCB77yM5Lia5Yqh6LSf6L295Lya6YGt5Y+X5pe25bu25q+b5Yi644CB5ZCe
5ZCQ6YeP6ZmN5L2O77yMDQo+ICvlj4rpnaLkuLRPT03nmoTpo47pmanjgIINCj4gKw0KPiAr5aaC
5p6c5rKh5pyJ5LiA56eN5YeG56Gu55qE5pa55rOV5bqm6YeP57O757uf56ue5LqJ56iL5bqm77yM
5YiZ5pyJ5Lik56eN5ZCO5p6c77ya5LiA56eN5piv55So5oi36L+H5LqO6IqC5Yi277yMDQo+ICvm
nKrlhYXliIbliKnnlKjns7vnu5/otYTmupDvvJvlj6bkuIDnp43mmK/ov4fluqbkvb/nlKjvvIzn
u4/luLjmgKfpnaLkuLTkuJrliqHkuK3mlq3nmoTpo47pmanjgIINCj4gKw0KPiArcHNp54m55oCn
6IO95aSf6K+G5Yir5ZKM6YeP5YyW6LWE5rqQ56ue5LqJ5a+86Ie055qE5Lia5Yqh5Lit5pat77yM
5Y+K5YW25a+55aSN5p2C6LSf6L295LmD6Iez5pW05Liq57O757uf5ZyoDQo+ICvml7bpl7TkuIrn
moTlvbHlk43jgIINCj4gKw0KPiAr5YeG56Gu5bqm6YeP5Zug6LWE5rqQ5LiN6Laz6YCg5oiQ55qE
55Sf5Lqn5Yqb5o2f5aSx77yM5pyJ5Yqp5LqO55So5oi35Z+65LqO56Gs5Lu26LCD5pW05Lia5Yqh
6LSf6L2977yM5oiW5Z+6DQo+ICvkuo7kuJrliqHotJ/ovb3phY3nva7noazku7bjgIINCj4gKw0K
PiArcHNp6IO95aSf5a6e5pe255qE5o+Q5L6b55u45YWz5L+h5oGv77yM5Zug5q2k57O757uf5Y+v
5Z+65LqOcHNp5a6e546w5Yqo5oCB55qE6LSf6L29566h55CG44CC5aaC5a6e5pa9DQo+ICvljbjo
vb3jgIHov4Hnp7vjgIHnrZbnlaXmgKfnmoTlgZzmraLmiJbmnYDmrbvkvY7kvJjlhYjnuqfmiJbl
j6/ph43lkK/nmoTmibnlpITnkIbku7vliqHjgIINCj4gKw0KPiArcHNp5biu5Yqp55So5oi35a6e
546w56Gs5Lu26LWE5rqQ5Yip55So546H55qE5pyA5aSn5YyW44CC5ZCM5pe25peg6ZyA54m654my
5Lia5Yqh6LSf6L295YGl5bq35bqm77yM5Lmf5peg6ZyADQo+ICvpnaLkuLRPT03nrYnpgKDmiJDk
uJrliqHkuK3mlq3nmoTpo47pmanjgIINCj4gKw0KPiAr5Y6L5Yqb5o6l5Y+jDQo+ICs9PT09PT09
PQ0KPiArDQo+ICvljovlipvkv6Hmga/lj6/pgJrov4cvcHJvYy9wcmVzc3VyZS8gLS1jcHXjgIFt
ZW1vcnnjgIFpb+aWh+S7tuWIhuWIq+iOt+WPluOAgg0KPiArDQo+ICtDUFXnm7jlhbPkv6Hmga/m
oLzlvI/lpoLkuIvvvJoNCj4gKw0KPiArICAgICAgICBzb21lIGF2ZzEwPTAuMDAgYXZnNjA9MC4w
MCBhdmczMDA9MC4wMCB0b3RhbD0wDQo+ICsNCj4gK+WGheWtmOWSjElP55u45YWz5L+h5oGv5aaC
5LiL77yaDQo+ICsNCj4gKyAgICAgICAgc29tZSBhdmcxMD0wLjAwIGF2ZzYwPTAuMDAgYXZnMzAw
PTAuMDAgdG90YWw9MA0KPiArICAgICAgICBmdWxsIGF2ZzEwPTAuMDAgYXZnNjA9MC4wMCBhdmcz
MDA9MC4wMCB0b3RhbD0wDQo+ICsNCj4gK3NvbWXooYzku6Pooajoh7PlsJHmnInkuIDkuKrku7vl
iqHpmLvloZ7kuo7nibnlrprotYTmupDnmoTml7bpl7TljaDmr5TjgIINCj4gKw0KPiArZnVsbOih
jOS7o+ihqOaJgOaciemdnmlkbGXku7vliqHlkIzml7bpmLvloZ7kuo7nibnlrprotYTmupDnmoTm
l7bpl7TljaDmr5TjgILlnKjov5nnp43nirbmgIHkuItDUFXotYTmupANCj4gK+WujOWFqOiiq+a1
qui0ue+8jOebuOWvueS6juato+W4uOi/kOihjO+8jOS4muWKoei0n+i9veeUseS6juiAl+i0ueab
tOWkmuaXtumXtOetieW+heiAjOWPl+WIsOS4pemHjeW9seWTjeOAgg0KPiArDQo+ICvnlLHkuo7m
raTmg4XlhrXkuKXph43lvbHlk43ns7vnu5/mgKfog73vvIzlm6DmraTmuIXmpZrnmoTor4bliKvm
nKzmg4XlhrXlubbkuI5zb21l6KGM5omA5Luj6KGo55qE5oOF5Ya15Yy65YiG5byA77yMDQo+ICvl
sIbmnInliqnkuo7liIbmnpDlj4rmj5DljYfns7vnu5/mgKfog73jgILov5nlsLHmmK9mdWxs54us
56uL5LqOc29tZeihjOeahOWOn+WboOOAgg0KPiArDQo+ICthdmfku6PooajpmLvloZ7ml7bpl7Tl
jaDmr5TvvIjnmb7liIbmr5TvvInvvIzkuLrmnIDov5ExMOenkuOAgTYw56eS44CBMzAw56eS5YaF
55qE5Z2H5YC844CC6L+Z5qC35oiR5LusDQo+ICvml6Llj6/op4Llr5/liLDnn63mnJ/kuovku7bn
moTlvbHlk43vvIzkuZ/lj6/nnIvliLDkuK3nrYnlj4rplb/ml7bpl7TlhoXnmoTotovlir/jgIJ0
b3RhbOS7o+ihqOaAu+mYu+Whng0KPiAr5pe26Ze077yI5Y2V5L2N5b6u56eS77yJ77yM5Y+v55So
5LqO6KeC5a+f5pe25bu25q+b5Yi677yM6L+Z56eN5q+b5Yi65Y+v6IO95Zyo5Z2H5YC85Lit5peg
5rOV5L2T546w44CCDQo+ICsNCj4gK+ebkeaOp+WOi+WKm+mXqOmZkA0KPiArPT09PT09PT09PT09
DQo+ICsNCj4gK+eUqOaIt+WPr+azqOWGjOinpuWPkeWZqO+8jOmAmui/h3BvbGwoKeebkeaOp+i1
hOa6kOWOi+WKm+aYr+WQpui2hei/h+mXqOmZkOOAgg0KPiArDQo+ICvop6blj5HlmajlrprkuYnv
vJrmjIflrprml7bpl7Tnqpflj6PmnJ/lhoXntK/np6/pmLvloZ7ml7bpl7TnmoTmnIDlpKflgLzj
gILmr5TlpoLlj6/lrprkuYk1MDBtc+WGheenr+e0rw0KPiArMTAwbXPpmLvloZ7vvIzljbPop6bl
j5HkuIDmrKHllKTphpLkuovku7bjgIINCj4gKw0KPiAr6Kem5Y+R5Zmo5rOo5YaM5pa55rOV77ya
55So5oi35omT5byA5Luj6KGo54m55a6a6LWE5rqQ55qEcHNp5o6l5Y+j5paH5Lu277yM5YaZ5YWl
6Zeo6ZmQ44CB5pe26Ze056qX5Y+j55qE5YC844CCDQo+ICvmiYDmiZPlvIDnmoTmlofku7bmj4/o
v7DnrKbnlKjkuo7nrYnlvoXkuovku7bvvIzlj6/kvb/nlKhzZWxlY3QoKeOAgXBvbGwoKeOAgWVw
b2xsKCnjgIINCj4gK+WGmeWFpeS/oeaBr+eahOagvOW8j+WmguS4i++8mg0KPiArDQo+ICsgICAg
ICAgIDxzb21lfGZ1bGw+IDxzdGFsbCBhbW91bnQgaW4gdXM+IDx0aW1lIHdpbmRvdyBpbiB1cz4N
Cj4gKw0KPiAr56S65L6L77ya5ZCRL3Byb2MvcHJlc3N1cmUvbWVtb3J55YaZ5YWlInNvbWUgMTUw
MDAwIDEwMDAwMDAi5bCG5paw5aKe6Kem5Y+R5Zmo77yM5bCG5ZyoDQo+ICsx56eS5YaF6Iez5bCR
5LiA5Liq5Lu75Yqh6Zi75aGe5LqO5YaF5a2Y55qE5oC75pe26Ze06LaF6L+HMTUwbXPml7bop6bl
j5HjgILlkJEvcHJvYy9wcmVzc3VyZS9pb+WGmeWFpQ0KPiArImZ1bGwgNTAwMDAgMTAwMDAwMCLl
sIbmlrDlop7op6blj5HlmajvvIzlsIblnKgx56eS5YaF5omA5pyJ5Lu75Yqh6YO96Zi75aGe5LqO
aW/nmoTmgLvml7bpl7TotoXov4c1MG1z5pe26Kem5Y+R44CCDQo+ICsNCj4gK+inpuWPkeWZqOWP
r+mSiOWvueWkmuS4qnBzaeW6pumHj+WAvOiuvue9ru+8jOWQjOS4gOS4qnBzaeW6pumHj+WAvOWP
r+iuvue9ruWkmuS4quinpuWPkeWZqOOAguavj+S4quinpuWPkeWZqOmcgOimgQ0KPiAr5Y2V54us
55qE5paH5Lu25o+P6L+w56ym55So5LqO6L2u6K+i77yM5Lul5Yy65YiG5LqO5YW25LuW6Kem5Y+R
5Zmo44CC5omA5Lul5Y2z5L2/5a+55LqO5ZCM5LiA5LiqcHNp5o6l5Y+j5paH5Lu277yMDQo+ICvm
r4/kuKrop6blj5HlmajkuZ/pnIDopoHljZXni6znmoTosIPnlKhvcGVuKCnjgIINCj4gKw0KPiAr
55uR5o6n5Zmo5Zyo6KKr55uR5o6n6LWE5rqQ6L+b5YWl6Zi75aGe54q25oCB5pe25ZCv5Yqo77yM
5Zyo57O757uf6YCA5Ye66Zi75aGe54q25oCB5ZCO5YGc55So44CC57O757uf6L+b5YWl6Zi75aGe
DQo+ICvnirbmgIHlkI7vvIznm5Hmjqdwc2nlop7plb/nmoTpopHnjofkuLrmr4/nm5Hmjqfnqpfl
j6PliLfmlrAxMOasoeOAgg0KPiArDQo+ICvlhoXmoLjmjqXlj5fnmoTnqpflj6PkuLo1MDBtc34x
MHPvvIzmiYDku6Xnm5Hmjqfpl7TpmpTkuLo1MG1zfjFz44CC6K6+572u56qX5Y+j5LiL6ZmQ55uu
55qE5piv5Li65LqGDQo+ICvpmLLmraLov4fkuo7popHnuYHnmoTova7or6LjgILorr7nva7nqpfl
j6PkuIrpmZDnmoTnm67nmoTmmK/lm6DkuLrnqpflj6Pov4fplb/liJnml6DmhI/kuYnvvIzmraTm
l7bmn6XnnIsNCj4gK3BzaeaOpeWPo+aPkOS+m+eahOWdh+WAvOWNs+WPr+OAgg0KPiArDQo+ICvn
m5HmjqflmajlnKjmv4DmtLvlkI7vvIzoh7PlsJHlnKjot5/ouKrnqpflj6PmnJ/pl7TlsIbkv53m
jIHmtLvliqjnirbmgIHjgILku6Xpgb/lhY3pmo/nnYDns7vnu5/ov5vlhaXlkozpgIDlh7oNCj4g
K+mYu+WhnueKtuaAge+8jOebkeaOp+WZqOi/h+S6jumikee5geeahOi/m+WFpeWSjOmAgOWHuua0
u+WKqOeKtuaAgeOAgg0KPiArDQo+ICvnlKjmiLfmgIHpgJrnn6XlnKjnm5Hmjqfnqpflj6PlhoXk
vJrlj5fliLDpgJ/njofpmZDliLbjgILlvZPlr7nlupTnmoTmlofku7bmj4/ov7DnrKblhbPpl63v
vIzop6blj5HlmajkvJroh6rliqjms6jplIDjgIINCj4gKw0KPiAr55So5oi35oCB55uR5o6n5Zmo
5L2/55So56S65L6LDQo+ICs9PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICs6Og0KPiArDQo+
ICsgICNpbmNsdWRlIDxlcnJuby5oPg0KPiArICAjaW5jbHVkZSA8ZmNudGwuaD4NCj4gKyAgI2lu
Y2x1ZGUgPHN0ZGlvLmg+DQo+ICsgICNpbmNsdWRlIDxwb2xsLmg+DQo+ICsgICNpbmNsdWRlIDxz
dHJpbmcuaD4NCj4gKyAgI2luY2x1ZGUgPHVuaXN0ZC5oPg0KPiArDQo+ICsgIC8qIOebkeaOp+WG
heWtmOmDqOWIhumYu+Whnu+8jOebkeaOp+aXtumXtOeql+WPo+S4ujHnp5LjgIHpmLvloZ7pl6jp
mZDkuLoxNTDmr6vnp5LjgIIqLw0KPiArICBpbnQgbWFpbigpIHsNCj4gKyAgICAgICAgY29uc3Qg
Y2hhciB0cmlnW10gPSAic29tZSAxNTAwMDAgMTAwMDAwMCI7DQo+ICsgICAgICAgIHN0cnVjdCBw
b2xsZmQgZmRzOw0KPiArICAgICAgICBpbnQgbjsNCj4gKw0KPiArICAgICAgICBmZHMuZmQgPSBv
cGVuKCIvcHJvYy9wcmVzc3VyZS9tZW1vcnkiLCBPX1JEV1IgfCBPX05PTkJMT0NLKTsNCj4gKyAg
ICAgICAgaWYgKGZkcy5mZCA8IDApIHsNCj4gKyAgICAgICAgICAgICAgICBwcmludGYoIi9wcm9j
L3ByZXNzdXJlL21lbW9yeSBvcGVuIGVycm9yOiAlc1xuIiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cmVycm9yKGVycm5vKSk7DQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIDE7DQo+
ICsgICAgICAgIH0NCj4gKyAgICAgICAgZmRzLmV2ZW50cyA9IFBPTExQUkk7DQo+ICsNCj4gKyAg
ICAgICAgaWYgKHdyaXRlKGZkcy5mZCwgdHJpZywgc3RybGVuKHRyaWcpICsgMSkgPCAwKSB7DQo+
ICsgICAgICAgICAgICAgICAgcHJpbnRmKCIvcHJvYy9wcmVzc3VyZS9tZW1vcnkgd3JpdGUgZXJy
b3I6ICVzXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgc3RyZXJyb3IoZXJybm8pKTsN
Cj4gKyAgICAgICAgICAgICAgICByZXR1cm4gMTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAg
ICAgIHByaW50Zigid2FpdGluZyBmb3IgZXZlbnRzLi4uXG4iKTsNCj4gKyAgICAgICAgd2hpbGUg
KDEpIHsNCj4gKyAgICAgICAgICAgICAgICBuID0gcG9sbCgmZmRzLCAxLCAtMSk7DQo+ICsgICAg
ICAgICAgICAgICAgaWYgKG4gPCAwKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwcmlu
dGYoInBvbGwgZXJyb3I6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIDE7DQo+ICsgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAg
ICAgICAgIGlmIChmZHMucmV2ZW50cyAmIFBPTExFUlIpIHsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIHByaW50ZigiZ290IFBPTExFUlIsIGV2ZW50IHNvdXJjZSBpcyBnb25lXG4iKTsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiArICAgICAgICAgICAgICAgIH0N
Cj4gKyAgICAgICAgICAgICAgICBpZiAoZmRzLnJldmVudHMgJiBQT0xMUFJJKSB7DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBwcmludGYoImV2ZW50IHRyaWdnZXJlZCFcbiIpOw0KPiArICAg
ICAgICAgICAgICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYo
InVua25vd24gZXZlbnQgcmVjZWl2ZWQ6IDB4JXhcbiIsIGZkcy5yZXZlbnRzKTsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAxOw0KPiArICAgICAgICAgICAgICAgIH0NCj4gKyAg
ICAgICAgfQ0KPiArDQo+ICsgICAgICAgIHJldHVybiAwOw0KPiArICB9DQo+ICsNCj4gK0Nncm91
cDLmjqXlj6MNCj4gKz09PT09PT09PT09DQo+ICsNCj4gK+WvueS6jkNPTkZJR19DR1JPVVA9eeWP
iuaMgui9veS6hmNncm91cDLmlofku7bns7vnu5/nmoTns7vnu5/vvIzog73lpJ/ojrflj5ZjZ3Jv
dXBz5YaF5Lu75Yqh55qEcHNp44CCDQo+ICvmraTlnLrmma/kuItjZ3JvdXBmc+aMgui9veeCueea
hOWtkOebruW9leWMheWQq2NwdS5wcmVzc3VyZeOAgW1lbW9yeS5wcmVzc3VyZeOAgWlvLnByZXNz
dXJl5paH5Lu277yMDQo+ICvlhoXlrrnmoLzlvI/kuI4vcHJvYy9wcmVzc3VyZS/kuIvnmoTmlofk
u7bnm7jlkIzjgIINCj4gKw0KPiAr5Y+v6K6+572u5Z+65LqOY2dyb3Vw55qEcHNp55uR5o6n5Zmo
77yM5pa55rOV5LiO57O757uf57qncHNp55uR5o6n5Zmo55u45ZCM44CCDQo+IC0tDQo+IDIuMjUu
MQ0KPg0K

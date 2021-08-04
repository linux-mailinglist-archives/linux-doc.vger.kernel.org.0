Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FEB3DF9B0
	for <lists+linux-doc@lfdr.de>; Wed,  4 Aug 2021 04:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhHDCb2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Aug 2021 22:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHDCb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:31:28 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905A3C06175F
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:31:15 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id d10so435520ils.7
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FikrkuXrZomKzs3Z9vLW8uiX17E6z6pWzEmODVguBcs=;
        b=ulHj1AXZggzhfutikQulk664BoIRfE4aDlzw2nVEtp8jdTUfpNri8x34DIgDY/XaSb
         CpDt1cU8Rq5QX86wZyR8OFeVWj1XjHJCJxkfOfiR668lfSH3E0FiAZxfHAgj0ZLMiSVO
         a9QHDeqOAthyOieDXuNuWeLmbRfrP53alb2yAyD60eAgC0Xvnaduf6+FnH6ca0r2jdlm
         lg8K1YdBSKZa9GC/y1eCCOcaclaTM47TJAENiFvwduT2AmkQkjC29e3yq/GKpMNuBp3j
         SkoZsDCJ3b4eiq1IU2un5XIyzrRKWmMMgtcdkGfLZr1t8Wiby56xnG1XZVahn7QAN1qt
         2IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FikrkuXrZomKzs3Z9vLW8uiX17E6z6pWzEmODVguBcs=;
        b=r3+MpewZKQ1Xr/ay5Zk83I9RH0zsqh+rN0mk64zj6HXYhAn/+9uNthKFY4XjYlR7WD
         2I3906XUTObu4wWcb6qLLpwTXa2imOAwnQVcMl2LhYlNwXC/F1nhEcQMJttJLIpXpJrF
         W4nPLU3Qx1AqOzQc+ufJqsG30A3WkMj+9nB2uK4jB2VqiKIunZEDhskJcl96pPmQwO4S
         2ddO8VE1/IZg5aVzfxn8IIZTjl6GGrt3hRltGv7khy2Iw0BIWLArt4zatZT29z1qLgXy
         Q8nY9lUovyEH5Ds+k+NAdRydVKd8dYnAuAzs+1MSQ+IPLkd0r4L9tZ2lOc2xHSPH90Yl
         JHnA==
X-Gm-Message-State: AOAM531sD/bOhkjCMc5xwo2fH+cqf8ym1vMU/CEKsUJw7mFk9nXMLhTu
        iBjmblyKQ+f8EP14blWCCEGNDYE2P3MQPhc+8tQ=
X-Google-Smtp-Source: ABdhPJxyUuDTuhooCLQNQq6ySJbvqLd66RvVharKISrpL1hvLrw8BA2NicqAnWjUURkd6gvQCONJyUAwjepm6I1yJoE=
X-Received: by 2002:a05:6e02:602:: with SMTP id t2mr603763ils.118.1628044274980;
 Tue, 03 Aug 2021 19:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <6f03543a3223734e77fb5c667567c00c3fd0510e.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <6f03543a3223734e77fb5c667567c00c3fd0510e.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:30:38 +0800
Message-ID: <CAJy-AmkMSnqhXonj-y60MpkEwf6Q1+T2fR2F_unQR42usQnE7Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] docs/zh_CN: add infiniband user_mad translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCA4OjI1IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL2luZmluaWJhbmQv
dXNlcl9tYWQucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhz
QGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJh
bmQvaW5kZXgucnN0ICAgfCAgIDIgKy0NCj4gIC4uLi96aF9DTi9pbmZpbmliYW5kL3VzZXJfbWFk
LnJzdCAgICAgICAgICAgICB8IDE2NCArKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTY1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3VzZXJfbWFk
LnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
aW5maW5pYmFuZC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9p
bmZpbmliYW5kL2luZGV4LnJzdA0KPiBpbmRleCBjMjczMDg4Yjg2ODYuLjU1NjQ1MTcxYTY3NSAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFu
ZC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5m
aW5pYmFuZC9pbmRleC5yc3QNCj4gQEAgLTI3LDEwICsyNywxMCBAQCBpbmZpbmliYW5kDQo+ICAg
ICBvcGFfdm5pYw0KPiAgICAgc3lzZnMNCj4gICAgIHRhZ19tYXRjaGluZw0KPiArICAgdXNlcl9t
YWQNCj4NCj4gIFRPRE9MSVNUOg0KPg0KPiAtICAgdXNlcl9tYWQNCj4gICAgIHVzZXJfdmVyYnMN
Cj4NCj4gIC4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC91c2VyX21hZC5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3VzZXJfbWFkLnJzdA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ5YWIyZWRmYjU1
OQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZmluaWJhbmQvdXNlcl9tYWQucnN0DQo+IEBAIC0wLDAgKzEsMTY0IEBADQo+ICsuLiBp
bmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1
bWVudGF0aW9uL2luZmluaWJhbmQvdXNlcl9tYWQucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsN
Cj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+
ICs65qCh6K+ROg0KPiArDQo+ICsg546L5pmu5a6HIFB1eXUgV2FuZyA8cmVhbHB1eXV3YW5nQGdt
YWlsLmNvbT4NCj4gKyDml7blpY7kuq4gQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+ICsN
Cj4gKy4uIF9jbl9pbmZpbmliYW5kX3VzZXJfbWFkOg0KPiArDQo+ICs9PT09PT09PT09PT09PT0N
Cj4gK+eUqOaIt+epuumXtE1BROiuv+mXrg0KPiArPT09PT09PT09PT09PT09DQo+ICsNCj4gK+iu
vuWkh+aWh+S7tg0KPiArPT09PT09PT0NCj4gKw0KPiArICDmr4/kuKpJbmZpbmlCYW5k6K6+5aSH
55qE5q+P5Liq56uv5Y+j6YO95pyJ5LiA5Liq4oCcdW1hZOKAneiuvuWkh+WSjOS4gOS4quKAnGlz
c23igJ3orr7lpIfov57mjqXjgIINCj4gKyAg5L6L5aaC77yM5LiA5Liq5Y+M56uv5Y+j55qESENB
5bCG5pyJ5Lik5LiqdW1hZOiuvuWkh+WSjOS4pOS4qmlzc23orr7lpIfvvIzogIzkuIDkuKrkuqTm
jaLmnLrlsIYNCj4gKyAg5pyJ5q+P5Liq57G75Z6L55qE5LiA5Liq6K6+5aSH77yI5a+55LqO5Lqk
5o2i5py656uv5Y+jMO+8ieOAgg0KPiArDQo+ICvliJvlu7pNQUTku6PnkIYNCj4gKz09PT09PT09
PT09DQo+ICsNCj4gKyAg5LiA5LiqTUFE5Luj55CG5Y+v5Lul6YCa6L+H5aGr5YaZ5LiA5Liq57uT
5p6E5L2TaWJfdXNlcl9tYWRfcmVnX3JlceadpeWIm+W7uu+8jOeEtuWQjuWcqA0KPiArICDpgILl
vZPnmoTorr7lpIfmlofku7bnmoTmlofku7bmj4/ov7DnrKbkuIrosIPnlKhJQl9VU0VSX01BRF9S
RUdJU1RFUl9BR0VOVCBpb2N0bOOAgg0KPiArICDlpoLmnpzms6jlhozor7fmsYLmiJDlip/vvIzn
u5PmnoTkvZPkuK3kvJrov5Tlm57kuIDkuKozMuS9jeeahElE44CC5q+U5aaC6K+0OjoNCj4gKw0K
PiArICAgICAgIHN0cnVjdCBpYl91c2VyX21hZF9yZWdfcmVxIHJlcSA9IHsgLyogLi4uICovIH07
DQo+ICsgICAgICAgcmV0ID0gaW9jdGwoZmQsIElCX1VTRVJfTUFEX1JFR0lTVEVSX0FHRU5ULCAo
Y2hhciAqKSAmcmVxKTsNCj4gKyAgICAgICAgaWYgKCFyZXQpDQo+ICsgICAgICAgICAgICAgICBt
eV9hZ2VudCA9IHJlcS5pZDsNCj4gKyAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICBwZXJy
b3IoImFnZW50IHJlZ2lzdGVyIik7DQo+ICsNCj4gKyAg5Luj55CG5Y+v5Lul6YCa6L+HSUJfVVNF
Ul9NQURfVU5SRUdJU1RFUl9BR0VOVCBpb2N0bOWPlua2iOazqOWGjOOAguWPpuWklu+8jOaJgOac
iQ0KPiArICDpgJrov4fmlofku7bmj4/ov7DnrKbms6jlhoznmoTku6PnkIblnKjmj4/ov7DnrKbl
hbPpl63ml7blsIbooqvlj5bmtojms6jlhozjgIINCj4gKw0KPiArICAyMDE0DQo+ICsgICAgICAg
546w5Zyo5o+Q5L6b5LqG5LiA5Liq5paw55qE5rOo5YaMSU9jdGzvvIzlhYHorrjlnKjms6jlhozm
l7bmj5Dkvpvpop3lpJbnmoTlrZfmrrXjgILov5nkuKrms6jlhowNCj4gKyAgICAgICDosIPnlKjn
moTnlKjmiLfpmpDlkKvkuoblr7lwa2V5X2luZGV455qE5L2/55So77yI6KeB5LiL5paH77yJ44CC
546w5Zyo5o+Q5L6b5LqG5LiA5Liq5paw55qEDQo+ICsgICAgICAg5rOo5YaMSU9jdGzvvIzlhYHo
rrjlnKjms6jlhozml7bmj5Dkvpvpop3lpJbnmoTlrZfmrrXjgILov5nkuKrms6jlhozosIPnlKjn
moTnlKjmiLfpmpDlkKvkuoblr7kNCj4gKyAgICAgICBwa2V5X2luZGV455qE5L2/55So77yI6KeB
5LiL5paH77yJ44CCDQo+ICsNCj4gK+aOpeaUtk1BRHMNCj4gKz09PT09PT09DQo+ICsNCj4gKyAg
5L2/55SocmVhZCgp5o6l5pS2TUFE44CC546w5Zyo5o6l5pS256uv5pSv5oyBUk1QUOOAguS8oOe7
mXJlYWQoKeeahOe8k+WGsuWMuuW/hemhu+iHs+WwkeaYrw0KPiArICDkuIDkuKpzdHJ1Y3QgaWJf
dXNlcl9tYWQgKyAyNTblrZfoioLjgILmr5TlpoLor7Q6DQo+ICsNCj4gKyAg5aaC5p6c5Lyg6YCS
55qE57yT5Yay5Yy65LiN6Laz5Lul5a6557qz5pS25Yiw55qETUFE77yIUk1QUO+8ie+8jGVycm5v
6KKr6K6+572u5Li6RU5PU1BD77yM6ZyADQo+ICsgIOimgeeahOe8k+WGsuWMuumVv+W6puiiq+iu
vue9ruWcqG1hZC5sZW5ndGjkuK3jgIINCj4gKw0KPiArICDmraPluLhNQUQo6Z2eUk1QUCnnmoTo
r7vlj5bnpLrkvos6Og0KPiArDQo+ICsgICAgICAgc3RydWN0IGliX3VzZXJfbWFkICptYWQ7DQo+
ICsgICAgICAgbWFkID0gbWFsbG9jKHNpemVvZiAqbWFkICsgMjU2KTsNCj4gKyAgICAgICByZXQg
PSByZWFkKGZkLCBtYWQsIHNpemVvZiAqbWFkICsgMjU2KTsNCj4gKyAgICAgICBpZiAocmV0ICE9
IHNpemVvZiBtYWQgKyAyNTYpIHsNCj4gKyAgICAgICAgICAgICAgIHBlcnJvcigicmVhZCIpOw0K
PiArICAgICAgICAgICAgICAgZnJlZShtYWQpOw0KPiArICAgICAgIH0NCj4gKw0KPiArICBSTVBQ
6K+75Y+W56S65L6LOjoNCj4gKw0KPiArICAgICAgIHN0cnVjdCBpYl91c2VyX21hZCAqbWFkOw0K
PiArICAgICAgIG1hZCA9IG1hbGxvYyhzaXplb2YgKm1hZCArIDI1Nik7DQo+ICsgICAgICAgcmV0
ID0gcmVhZChmZCwgbWFkLCBzaXplb2YgKm1hZCArIDI1Nik7DQo+ICsgICAgICAgaWYgKHJldCA9
PSAtRU5PU1BDKSkgew0KPiArICAgICAgICAgICAgICAgbGVuZ3RoID0gbWFkLmxlbmd0aDsNCj4g
KyAgICAgICAgICAgICAgIGZyZWUobWFkKTsNCj4gKyAgICAgICAgICAgICAgIG1hZCA9IG1hbGxv
YyhzaXplb2YgKm1hZCArIGxlbmd0aCk7DQo+ICsgICAgICAgICAgICAgICByZXQgPSByZWFkKGZk
LCBtYWQsIHNpemVvZiAqbWFkICsgbGVuZ3RoKTsNCj4gKyAgICAgICB9DQo+ICsgICAgICAgaWYg
KHJldCA8IDApIHsNCj4gKyAgICAgICAgICAgICAgIHBlcnJvcigicmVhZCIpOw0KPiArICAgICAg
ICAgICAgICAgZnJlZShtYWQpOw0KPiArICAgICAgIH0NCj4gKw0KPiArICDpmaTkuoblrp7pmYXn
moRNQUTlhoXlrrnlpJbvvIzlhbbku5bnu5PmnoTkvZNpYl91c2VyX21hZOWtl+auteWwhuiiq+Wh
q+WFpeaUtuWIsOeahE1BROeahOS/oQ0KPiArICDmga/jgILkvovlpoLvvIzov5znqItMSUTlsIbl
nKhtYWQubGlk5Lit44CCDQo+ICsNCj4gKyAg5aaC5p6c5Y+R6YCB6LaF5pe277yM5bCG5Lqn55Sf
5LiA5Liq5o6l5pS277yMbWFkLnN0YXR1c+iuvue9ruS4ukVUSU1FRE9VVOOAguWQpuWIme+8jOW9
k+S4gOS4qg0KPiArICBNQUTooqvmiJDlip/mjqXmlLblkI7vvIxtYWQuc3RhdHVz5bCG5pivMOOA
gg0KPiArDQo+ICsgIHBvbGwoKS9zZWxlY3QoKeWPr+S7peeUqOadpeetieW+heS4gOS4qk1BROWP
r+S7peiiq+ivu+WPluOAgg0KPiArDQo+ICsgIHBvbGwoKS9zZWxlY3QoKeWPr+S7peeUqOadpeet
ieW+he+8jOebtOWIsOWPr+S7peivu+WPluS4gOS4qk1BROOAgg0KPiArDQo+ICvlj5HpgIFNQURz
DQo+ICs9PT09PT09PQ0KPiArDQo+ICsgIE1BRHPmmK/nlKh3cml0ZSgp5Y+R6YCB55qE44CC5Y+R
6YCB55qE5Luj55CGSUTlupTor6XloavlhaVNQUTnmoRpZOWtl+aute+8jOebrueahOWcsExJROW6
lOivpQ0KPiArICDloavlhaVsaWTlrZfmrrXvvIzku6XmraTnsbvmjqjjgILlj5HpgIHnq6/noa7l
rp7mlK/mjIFSTVBQ77yM5omA5Lul5Y+v5Lul5Y+R6YCB5Lu75oSP6ZW/5bqm55qETUFE44CCDQo+
ICsgIOavlOWmguivtDo6DQo+ICsNCj4gKyAgICAgICBzdHJ1Y3QgaWJfdXNlcl9tYWQgKm1hZDsN
Cj4gKw0KPiArICAgICAgIG1hZCA9IG1hbGxvYyhzaXplb2YgKm1hZCArIG1hZF9sZW5ndGgpOw0K
PiArDQo+ICsgICAgICAgLyogZmlsbCBpbiBtYWQtPmRhdGEgKi8NCj4gKw0KPiArICAgICAgIG1h
ZC0+aGRyLmlkICA9IG15X2FnZW50OyAgICAgICAgLyogcmVxLmlkIGZyb20gYWdlbnQgcmVnaXN0
cmF0aW9uICovDQo+ICsgICAgICAgbWFkLT5oZHIubGlkID0gbXlfZGVzdDsgICAgICAgICAvKiBp
biBuZXR3b3JrIGJ5dGUgb3JkZXIuLi4gKi8NCj4gKyAgICAgICAvKiBldGMuICovDQo+ICsNCj4g
KyAgICAgICByZXQgPSB3cml0ZShmZCwgJm1hZCwgc2l6ZW9mICptYWQgKyBtYWRfbGVuZ3RoKTsN
Cj4gKyAgICAgICBpZiAocmV0ICE9IHNpemVvZiAqbWFkICsgbWFkX2xlbmd0aCkNCj4gKyAgICAg
ICAgICAgICAgIHBlcnJvcigid3JpdGUiKTsNCj4gKw0KPiAr5Lqk5o2iSURzDQo+ICs9PT09PT09
DQo+ICsNCj4gKyAgdW1hZOiuvuWkh+eahOeUqOaIt+WPr+S7peWcqOWPkemAgeeahE1BROS4reS9
v+eUqOS6pOaNoklE5a2X5q6155qE5L2OMzLkvY3vvIjkuZ/lsLHmmK/nvZHnu5zlrZfoioLpobrl
uo/kuK0NCj4gKyAg5pyA5bCP5pyJ5pWI55qE5LiA5Y2K5a2X5q6177yJ5p2l5Yy56YWN6K+35rGC
L+WTjeW6lOWvueOAguS4iumdoueahDMy5L2N5piv5L+d55WZ57uZ5YaF5qC45L2/55So55qE77yM
5Zyo5Y+R6YCBDQo+ICsgIE1BROS5i+WJjeS8muiiq+aUueWGmeOAgg0KPiArDQo+ICtQX0tleee0
ouW8leWkhOeQhg0KPiArPT09PT09PT09PT09PQ0KPiArDQo+ICsgIOaXp+eahGliX3VtYWTmjqXl
j6PkuI3lhYHorrjkuLrlj5HpgIHnmoRNQUTorr7nva5QX0tleee0ouW8le+8jOS5n+ayoeacieaP
kOS+m+iOt+WPluaOpeaUtueahE1BROeahA0KPiArICBQX0tleee0ouW8leeahOaWueazleOAguS4
gOS4quW4puaciXBrZXlfaW5kZXjmiJDlkZjnmoRzdHJ1Y3QgaWJfdXNlcl9tYWRfaGRy55qE5paw
5biD5bGA5beyDQo+ICsgIOe7j+iiq+WumuS5ie+8m+eEtuiAjO+8jOS4uuS6huS/neaMgeS4juaX
p+eahOW6lOeUqOeoi+W6j+eahOS6jOi/m+WItuWFvOWuueaAp++8jOmZpOmdnuWcqOaWh+S7tuaP
j+i/sOespuiiq+eUqOS6jg0KPiArICDlhbbku5bnlKjpgJTkuYvliY3osIPnlKhJQl9VU0VSX01B
RF9FTkFCTEVfUEtFWeaIlklCX1VTRVJfTUFEX1JFR0lTVEVSX0FHRU5UMiBpb2N0bA0KPiArICDk
uYvkuIDvvIzlkKbliJnkuI3kvJrkvb/nlKjov5nnp43mlrDluIPlsYDjgIINCj4gKw0KPiArICDl
nKgyMDA45bm0OeaciO+8jElCX1VTRVJfTUFEX0FCSV9WRVJTSU9O5bCG6KKr5aKe5Yqg5YiwNu+8
jOm7mOiupOS9v+eUqOaWsOeahGliX3VzZXJfbWFkX2hkcg0KPiArICDnu5PmnoTluIPlsYDvvIzl
ubbkuJRJQl9VU0VSX01BRF9FTkFCTEVfUEtFWSBpb2N0bOWwhuiiq+WIoOmZpOOAgg0KPiArDQo+
ICvorr7nva5Jc1NN5Yqf6IO95L2NDQo+ICs9PT09PT09PT09PT09PQ0KPiArDQo+ICsgIOimgeS4
uuS4gOS4querr+WPo+iuvue9rklzU03lip/og73kvY3vvIzlj6rpnIDmiZPlvIDnm7jlupTnmoRp
c3Nt6K6+5aSH5paH5Lu244CC5aaC5p6cSXNTTeS9jeW3sue7j+iiq+iuvue9ru+8jOmCow0KPiAr
ICDkuYjmiZPlvIDosIPnlKjlsIbpmLvloZ7vvIznm7TliLDor6XkvY3ooqvmuIXpmaTvvIjmiJbo
gIXlpoLmnpxPX05PTkJMT0NL5qCH5b+X6KKr5Lyg6YCS57uZb3Blbigp77yM5YiZ56uL5Y2z6L+U
DQo+ICsgIOWbnu+8jGVycm5v6K6+572u5Li6RUFHQUlO77yJ44CC5b2TaXNzbeaWh+S7tuiiq+WF
s+mXreaXtu+8jElzU03kvY3lsIbooqvmuIXpmaTjgILlnKhpc3Nt5paH5Lu25LiK5LiN6IO96L+b
DQo+ICsgIOihjOS7u+S9leivu+OAgeWGmeaIluWFtuS7luaTjeS9nOOAgg0KPiArDQo+ICsvZGV2
5paH5Lu2DQo+ICs9PT09PT09PQ0KPiArDQo+ICvkuLrkuobnlKggdWRlduiHquWKqOWIm+W7uueb
uOW6lOeahOWtl+espuiuvuWkh+aWh+S7tu+8jOS4gOS4quexu+S8vDo6DQo+ICsNCj4gKyAgICBL
RVJORUw9PSJ1bWFkKiIsIE5BTUU9ImluZmluaWJhbmQvJWsiDQo+ICsgICAgS0VSTkVMPT0iaXNz
bSoiLCBOQU1FPSJpbmZpbmliYW5kLyVrIg0KPiArDQo+ICsgIOeahOinhOWImeWPr+S7peiiq+S9
v+eUqOOAguWug+WwhuWIm+W7uuiKgueCueeahOWQjeWtlzo6DQo+ICsNCj4gKyAgICAvZGV2L2lu
ZmluaWJhbmQvdW1hZDANCj4gKyAgICAvZGV2L2luZmluaWJhbmQvaXNzbTANCj4gKw0KPiArICDk
uLrnrKzkuIDkuKrnq6/lj6PvvIzku6XmraTnsbvmjqjjgILkuI7ov5nkupvorr7lpIfnm7jlhbPn
moRpbmZpbmliYW5k6K6+5aSH5ZKM56uv5Y+j5Y+v5Lul5LuO5Lul5LiL5paH5Lu25Lit56Gu5a6a
OjoNCj4gKw0KPiArICAgIC9zeXMvY2xhc3MvaW5maW5pYmFuZF9tYWQvdW1hZDAvaWJkZXYNCj4g
KyAgICAvc3lzL2NsYXNzL2luZmluaWJhbmRfbWFkL3VtYWQwL3BvcnQNCj4gKw0KPiArICDlkow6
Og0KPiArDQo+ICsgICAgL3N5cy9jbGFzcy9pbmZpbmliYW5kX21hZC9pc3NtMC9pYmRldg0KPiAr
ICAgIC9zeXMvY2xhc3MvaW5maW5pYmFuZF9tYWQvaXNzbTAvcG9ydA0KPiAtLQ0KPiAyLjI3LjAN
Cj4NCg==

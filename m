Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBCF3751CB
	for <lists+linux-doc@lfdr.de>; Thu,  6 May 2021 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhEFJtd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 May 2021 05:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhEFJtd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 05:49:33 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F694C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 02:48:35 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso4362507otv.6
        for <linux-doc@vger.kernel.org>; Thu, 06 May 2021 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iJCvxkjRIJK0DXZlXFPeMHXgxUVuRzPI6efb/ZQ1bfo=;
        b=gFPcw7CCpT67rdTl+9FBudlnoIQ7GH7HnLmPAXAGFQyVvVAfqMV5sbjAibsNGtoKlW
         CkjaNL7R7A/3rRPPbpU0EutALYZN4NAhIdJVemHeATiq/HsgOBS0879zBLnNPf+lOZz2
         95OqX4jrTQZsVjHmPQrxYZhZrWV9bQA/46ZiPS1YWJoYvuFjrqQWI4mW5RLnuIegvYHz
         D0Ekil0qtst05da60FzKxpAnmfkhMGyJhhelzY2XSTvfQUowSYn/uF4aU3XrhKaSBNWb
         BnoUA6PW9anxx5ixsOJULVeNcykjrIJNGdrOdnYOVjO7fhaA8Yn9ADOGgeXwu4t/qZOJ
         ZUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iJCvxkjRIJK0DXZlXFPeMHXgxUVuRzPI6efb/ZQ1bfo=;
        b=jy94kJGiPwrTPkEyoiO+Z+OhHwLsbjUY9Qc7B1h23hx0kc+9ZJqm9WjlztojznIlky
         doCz4vgAiUUunjR/7yDh/6W6gVoQdrL2l/zzWMU8gPLpejM2IoNpAHWRrOGjpCTUnRoG
         wYjXMDaerAEOqY2uxqC6bbDrJ8TXrMz2LViaycbsjP1Fp5oW4Rqicrz9RKKhro4sXtOF
         AP5jcRNaY2gwxdMd5x+pL9LQmp+XmjuiB8HyqEEQllINnODh9XMgnK/vd5AkPI1rNOaa
         LKqVqMPDbfkOieIT+t5qPnIs3QVm10RXlQ3DAZUTp4iG3VT8qHqIMdSDfE9/A9zP0fD5
         2FSw==
X-Gm-Message-State: AOAM531x4su5EENIbzjEID3V+ZhxlKXRG7m2J/LTKyUno1HD8q46byt2
        9SKWpk1FOP0tXvFv9SxpatHoIMl9mG5X0SCkDHc=
X-Google-Smtp-Source: ABdhPJwOQvG0KC4nJWPDDhq90rBfLE2QMfviizfNEjOgT5JH0aZLfg5iU1fXi0nPPBSbRKOzfaA5O1v7I/qKiwvUZ14=
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr2919851oth.243.1620294514622;
 Thu, 06 May 2021 02:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619665430.git.siyanteng@loongson.cn> <45fb9f5b1000c99dff42aabbcfec94e429926235.1619665430.git.siyanteng@loongson.cn>
 <20210429151513.GC23087@bobwxc.top> <CAEensMyp52Td5NTvW1o1vOz49pjb9DSvSa0fQY2CkCzwW0WMKQ@mail.gmail.com>
In-Reply-To: <CAEensMyp52Td5NTvW1o1vOz49pjb9DSvSa0fQY2CkCzwW0WMKQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 6 May 2021 17:48:26 +0800
Message-ID: <CAEensMwsPe6ZnsPYPP9yUWhWuhOiC0EyZuqkxTmM7YCO07_t8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN: add parisc registers.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgWGlhbmdjaGVuZ++8mg0KDQphbiBhc3Rlcmlza++8iCrvvIkgaXMgdXNlZCBmb3IgcGxhbm5l
ZCB1c2FnZSB3aGljaCBpcyBjdXJyZW50bHkgdW5pbXBsZW1lbnRlZC4NCnNvLCBJIGFkZCAiKiIg
IHRvIGNvcnJlc3BvbmRpbmcgcGxhY2UuDQoNCnlhbnRlbmcgc2kgPHNpeWFudGVuZzAxQGdtYWls
LmNvbT4g5LqOMjAyMeW5tDXmnIg05pel5ZGo5LqMIOS4i+WNiDM6MjblhpnpgZPvvJoNCj4NCj4g
V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDI55pel5ZGo5ZubIOS4i+WN
iDExOjE15YaZ6YGT77yaDQo+ID4NCj4gPiBPbiBUaHUsIEFwciAyOSwgMjAyMSBhdCAxMTozMzoz
NUFNICswODAwLCBZYW50ZW5nIFNpIHdyb3RlOg0KPiA+ID4gVGhpcyBwYXRjaCB0cmFuc2xhdGVz
IERvY3VtZW50YXRpb24vcGFyaXNjL3JlZ2lzdGVycy5yc3QgaW50byBDaGluZXNlLg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4N
Cj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2luZGV4LnJz
dCAgICAgICB8ICAgMiArLQ0KPiA+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL3Jl
Z2lzdGVycy5yc3QgICB8IDE1MyArKysrKysrKysrKysrKysrKysNCj4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3BhcmlzYy9yZWdpc3Rl
cnMucnN0DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3BhcmlzYy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9wYXJpc2MvaW5kZXgucnN0DQo+ID4gPiBpbmRleCBiOTEzZDY2NGU3MzUuLmE0NzQ1NGVi
ZTMyZSAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3BhcmlzYy9pbmRleC5yc3QNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3BhcmlzYy9pbmRleC5yc3QNCj4gPiA+IEBAIC0xNCwxMCArMTQsMTAgQEAgUEEtUklT
Q+S9k+ezu+aetuaehA0KPiA+ID4gICAgIDptYXhkZXB0aDogMg0KPiA+ID4NCj4gPiA+ICAgICBk
ZWJ1Z2dpbmcNCj4gPiA+ICsgICByZWdpc3RlcnMNCj4gPiA+DQo+ID4gPiAgVG9kb2xpc3Q6DQo+
ID4gPg0KPiA+ID4gLSAgIHJlZ2lzdGVycw0KPiA+ID4gICAgIGZlYXR1cmVzDQo+ID4gPg0KPiA+
ID4gIC4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KPiA+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3BhcmlzYy9yZWdpc3RlcnMucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL3JlZ2lzdGVycy5yc3QNCj4gPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdhMjE5MzY3
NGNiMA0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vcGFyaXNjL3JlZ2lzdGVycy5yc3QNCj4gPiA+IEBAIC0wLDAgKzEsMTUz
IEBADQo+ID4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gPiAr
DQo+ID4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3BhcmlzYy9yZWdpc3RlcnMucnN0DQo+
ID4gPiArOlRyYW5zbGF0b3I6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4g
PiA+ICsNCj4gPiA+ICsuLiBfY25fcGFyaXNjX3JlZ2lzdGVyczoNCj4gPiA+ICsNCj4gPiA+ICs9
PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiArTGludXgvUEEtUklTQ+eahOWvhOWtmOWZ
qOeUqOazlQ0KPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ICsNCj4gPiA+
ICtbIOeUqOaYn+WPt+ihqOekuuebruWJjeWwmuacquWunueOsOeahOiuoeWIkueUqOmAlOOAgiBd
DQo+ID4gPiArDQo+ID4gPiArQUJJ57qm5a6a55qE6YCa55So5a+E5a2Y5ZmoDQo+ID4gPiArPT09
PT09PT09PT09PT09PT09PQ0KPiA+ID4gKw0KPiA+ID4gK+aOp+WItuWvhOWtmOWZqA0KPiA+ID4g
Ky0tLS0tLS0tLS0NCj4gPiA+ICsNCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
ICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gK0NSIDAgKOaBouWk
jeiuoeaVsOWZqCkgICAgICAgICAgICAgICDnlKjkuo5wdHJhY2UNCj4gPiA+ICtDUiAxLUNSIDco
5peg5a6a5LmJKSAgICAgICAgICAgICAgIOacquS9v+eUqA0KPiA+ID4gK0NSIDggKFByb3RlY3Rp
b24gSUQpICAgICAgICAgICAg5q+P6L+b56iLIHZhbHVlKg0K5q+P6L+b56iL5YC8Kg0KPiA+DQo+
ID4g5L+d5oqkSUQg77yfDQo+IEkgdGhpbmsgdGhlIHdvcmRzIHRyYW5zbGF0ZWQgaGVyZSBtYXkg
bWFrZSBpdCBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZOOAgg0KPg0KPiA+IOmAkOi/m+eoi+WAvA0K
PiDpgJAgPSDmr48NCj4NCj4gPg0KPiA+ID4gK0NSIDksIDEyLCAxMyAoUElEUykgICAgICAgICAg
ICAg5pyq5L2/55So55qEDQo+ID4NCj4gPiByZW1vdmUg55qEDQo+IE9L77yBDQo+ID4NCj4gPiA+
ICtDUjEwIChDQ1IpICAgICAgICAgICAgICAgICAgICAgIOaHkuaDsEZQVSBzYXZpbmcqDQo+ID4N
Cj4gPiBGUFXlu7bov5/kv53lrZgNCj4gT0vvvIENCiBGUFXlu7bov5/kv53lrZgqDQo+ID4gRllJ
IDxodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy8zNDg1MTMxPg0KPiA+DQo+ID4g
PiArQ1IxMSAgICAgICAgICAgICAgICAgICAgICAgICAgICDmjInnhadBQknnmoTop4TlrprvvIhT
QVLvvInjgIINCj4gPiA+ICtDUjE0ICjkuK3mlq3lkJHph48pICAgICAgICAgICAgICAgICDliJ3l
p4vljJbkuLogZmF1bHRfdmVjdG9yDQo+ID4gPiArQ1IxNSAoRUlFTSkgICAgICAgICAgICAgICAg
ICAgICDliJ3lp4vljJbkuLrmiYDmnInnmoQgb25lcyoNCj4gPg0KPiA+IFdoYXQgaXMgIm9uZXMi
ID8NCj4gSSBUaGluayAib25lcyIgaXMgYSBwb2ludC4NCj4gTmVlZCB0byBzZWUgdGhlIGNvZGUg
dG8ga25vdywgSSBuZWVkIHNvbWUgdGltZS4NCuaJgOacieS9jeWIneWni+WMluS4ujENCj4gPg0K
PiA+ID4gK0NSMTYgKOmXtOmalOiuoeaXtuWZqCkgICAgICAgICAgICAgICDor7vlj5blkajmnJ/m
lbAv5YaZ5YWl5byA5aeL5pe26Ze06Ze06ZqUIFRtcg0KPiA+DQo+ID4gVChpKW0oZSlyDQo+IE9y
aWdpbiBEb2MgaXMgVG1yLiA6KQ0KPg0KPiA+DQo+ID4gPiArQ1IxNy1DUjIyICAgICAgICAgICAg
ICAgICAgICAgICDkuK3mlq3lj4LmlbANCj4gPiA+ICtDUjE5ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIOS4reaWreaMh+S7pOWvhOWtmOWZqA0KPiA+ID4gK0NSMjAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAg5Lit5pat56m66Ze05a+E5a2Y5ZmoDQo+ID4gPiArQ1IyMSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICDkuK3mlq3lgY/np7vph4/lr4TlrZjlmagNCj4gPiA+ICtDUjIyICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIOS4reaWrSBQU1cNCj4gPiA+ICtDUjIzIChFSVJSKSAg
ICAgICAgICAgICAgICAgICAgIOivu+WPluacquWGs+S4reaWrS/lhpnlhaXmuIXpmaTkvY0NCj4g
PiA+ICtDUjI0IChUUiAwKSAgICAgICAgICAgICAgICAgICAgIOWGheaguOepuumXtOmhteebruW9
leaMh+mSiA0KPiA+ID4gK0NSMjUgKFRSIDEpICAgICAgICAgICAgICAgICAgICAg55So5oi356m6
6Ze06aG155uu5b2V5oyH6ZKIDQo+ID4gPiArQ1IyNiAoVFIgMikgICAgICAgICAgICAgICAgICAg
ICDkuI3kvb/nlKgNCj4gPiA+ICtDUjI3IChUUiAzKSAgICAgICAgICAgICAgICAgICAgIOe6v+eo
i+aPj+i/sOespuaMh+mSiA0KPiA+ID4gK0NSMjggKFRSIDQpICAgICAgICAgICAgICAgICAgICAg
5LiN5L2/55SoDQo+ID4gPiArQ1IyOSAoVFIgNSkgICAgICAgICAgICAgICAgICAgICDkuI3kvb/n
lKgNCj4gPiA+ICtDUjMwIChUUiA2KSAgICAgICAgICAgICAgICAgICAgIOW9kyAvIDANCj4gPg0K
PiA+IOW9kyA/DQo+IOW9k+WJjQ0KPiA+DQo+ID4gPiArQ1IzMSAoVFIgNykgICAgICAgICAgICAg
ICAgICAgICDkuLTml7blr4TlrZjlmajvvIzlnKjkuI3lkIzlnLDmlrnkvb/nlKgNCj4gPiA+ICs9
PT09PT09PT09PT09PT09PT09PT09PT09PT09ICAgID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+ID4gKw0KPiA+ID4gK+epuumXtOWvhOWtmOWZqO+8iOWGheaguOaooeW8j++8
iQ0KPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICsNCj4gPiA+ICs9PT09PT09
PSAgICAgICAgICAgICAgICAgICAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiA+ID4gK1NSMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg5Li05pe256m66Ze05a+E5a2Y
5ZmoDQo+ID4gPiArU1I0LVNSNyAgICAgICAgICAgICAgICAgICAgICAgICDorr7nva7kuLowDQo+
ID4gPiArU1IxICAgICAgICAgICAgICAgICAgICAgICAgICAgICDkuLTml7bnqbrpl7Tlr4TlrZjl
magNCj4gPiA+ICtTUjIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOWGheaguOS4jeW6lOiv
peegtOWdj+Wugw0KPiA+ID4gK1NSMyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg55So5LqO
55So5oi356m66Ze06K6/6Zeu77yI5b2T5YmN6L+b56iL77yJ44CCDQo+ID4NCj4gPiByZW1vdmUg
44CCDQo+IE9L77yBDQo+ID4NCj4gPiA+ICs9PT09PT09PSAgICAgICAgICAgICAgICAgICAgICAg
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gKw0KPiA+ID4gK+epuumXtOWv
hOWtmOWZqO+8iOeUqOaIt+aooeW8j++8iQ0KPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPiA+ICsNCj4gPiA+ICs9PT09PT09PSAgICAgICAgICAgICAgICAgICAgICAgID09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ICtTUjAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIOS4tOaXtuepuumXtOWvhOWtmOWZqA0KPiA+ID4gK1NSMSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAg5Li05pe256m66Ze05a+E5a2Y5ZmoDQo+ID4gPiArU1IyICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICDkv53lrZhMaW51eOe9keWFs+mhteeahOepuumXtA0KPiA+DQo+ID4g572R
5YWzPyBJIGFtIG5vdCBzdXJlIGlmIGl0J3MgY29ycmVjdC4NCj4gRW1tbW1t77yMUGxlYXNlIGdp
dmUgbWUgc29tZSB0aW1lDQoNClRoZSBMaW51eCBnYXRld2F5IHBhZ2Ugb24gUEEtUklTQyBpcyAi
c3BlY2lhbCIuDQpJdCBhY3R1YWxseSBoYXMgUEFHRV9HQVRFV0FZIGJpdHMgc2V0ICh0aGlzIGlz
IGxpbnV4IHRlcm1pbm9sb2d5OyBpbiBwYXJpc2MNCnRlcm1pbm9sb2d5IGl0J3MgRXhlY3V0ZSwg
cHJvbW90ZSB0byBQTDApIGluIHRoZSBwYWdlIG1hcC4gIFNvIGFueXRoaW5nDQpleGVjdXRpbmcg
b24gdGhpcyBwYWdlIGV4ZWN1dGVzIHdpdGgga2VybmVsIGxldmVsIHByaXZpbGVnZSAodGhlcmUn
cyBtb3JlIHRvIGl0DQp0aGFuIHRoYXQ6IHRvIGhhdmUgdGhpcyBoYXBwZW4sIHlvdSBhbHNvIGhh
dmUgdG8gdXNlIGEgYnJhbmNoIHdpdGggYSAsZ2F0ZQ0KY29tcGxldGVyIHRvIGFjdGl2YXRlIHRo
ZSBwcml2aWxlZ2UgcHJvbW90aW9uKS4gIFRoZSB1cHNob3QgaXMgdGhhdCBldmVyeXRoaW5nDQp0
aGF0IHJ1bnMgb24gdGhlIGdhdGV3YXkgcGFnZSBydW5zIGF0IGtlcm5lbCBwcml2aWxlZ2UgYnV0
IHdpdGggdGhlIGN1cnJlbnQNCnVzZXIgcHJvY2VzcyBhZGRyZXNzIHNwYWNlIChhbHRob3VnaCB5
b3UgaGF2ZSBhY2Nlc3MgdG8ga2VybmVsIHNwYWNlIHZpYSAlc3IyKS4NCkZvciB0aGUgMHgxMDAg
c3lzY2FsbCBlbnRyeSwgd2UgcmVkbyB0aGUgc3BhY2UgcmVnaXN0ZXJzIHRvIHBvaW50IHRvIHRo
ZSBrZXJuZWwNCmFkZHJlc3Mgc3BhY2UgKHByZXNlcnZpbmcgdGhlIHVzZXIgYWRkcmVzcyBzcGFj
ZSBpbiAlc3IzKSwgbW92ZSB0byB3aWRlIG1vZGUgaWYNCnJlcXVpcmVkLCBzYXZlIHRoZSB1c2Vy
IHJlZ2lzdGVycyBhbmQgYnJhbmNoIGludG8gdGhlIGtlcm5lbCBzeXNjYWxsIGVudHJ5DQpwb2lu
dC4gIEZvciBhbGwgdGhlIG90aGVyIGZ1bmN0aW9ucywgd2UgZXhlY3V0ZSBhdCBrZXJuZWwgcHJp
dmlsZWdlIGJ1dCBkb24ndA0KZmxpcCBhZGRyZXNzIHNwYWNlcy4gVGhlIGJhc2ljIHVwc2hvdCBv
ZiB0aGlzIGlzIHRoYXQgdGhlc2UgY29kZSBzbmlwcGV0cyBhcmUNCmV4ZWN1dGVkIGF0b21pY2Fs
bHkgKGJlY2F1c2UgdGhlIGtlcm5lbCBjYW4ndCBiZSBwcmUtZW1wdGVkKSBhbmQgdGhleSBtYXkN
CnBlcmZvcm0gYXJjaGl0ZWN0dXJhbGx5IGZvcmJpZGRlbiAodG8gUEwzKSBvcGVyYXRpb25zIChs
aWtlIHNldHRpbmcgY29udHJvbA0KcmVnaXN0ZXJzKS4NCg0KVGhlICJnYXRld2F5IHBhZ2UiIGlz
IGEgdHJhcCwgdGhlIHBhZ2UgY29udGFpbnMgcHJpdmlsZWdlZCBjb2RlIHRvDQpoZWxwIGhhbmRs
ZSB1c2VyDQpzdGF0ZSBleGNlcHRpb25zLiBTaW5jZSB0aGVyZSBpcyBubyAic3lzY2FsbCIgY29t
bWFuZCBpbiBwYXJpc2MsIHNvDQoic3lzY2FsbCIgaXMgYSBqdW1wDQppbnRvICJnYXRld2F5IHBh
Z2UiLCBhbmQgSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8ga2VlcCBpdCBpbiBFbmdsaXNoLg0KDQrk
v53lrZhMaW51eCBnYXRld2F5IHBhZ2XnmoTnqbrpl7Q/IDopDQoNCj4gPg0KPiA+ID4gK1NSMyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAg5Zyo5YaF5qC45Lit5L+d5a2Y55So5oi35Zyw5Z2A
56m66Ze055qE5YC8DQo+ID4gPiArU1I0LVNSNyAgICAgICAgICAgICAgICAgICAgICAgICDlrprk
uYnkuobnlKjmiLcv5YaF5qC455qE55+t5Zyw5Z2A56m66Ze0DQo+ID4gPiArPT09PT09PT0gICAg
ICAgICAgICAgICAgICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiAr
DQo+ID4gPiArDQo+ID4gPiAr5aSE55CG5Zmo54q25oCB5a2XDQo+ID4gPiArLS0tLS0tLS0tLS0t
DQo+ID4gPiArDQo+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PSAgICAgICAgICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ICtXIO+8iDY0
5L2N5Zyw5Z2A77yJICAgICAgICAgICAgICAgICAgMA0KPiA+ID4gK0Ug77yI5bCP5bC+56uv77yJ
ICAgICAgICAgICAgICAgICAgICAwDQo+ID4gPiArUyDvvIjlronlhajpl7TpmpTorqHml7blmajv
vIkgICAgICAgICAgICAwDQo+ID4gPiArVCDvvIjkuqfnlJ/liIbmlK/pmbfpmLHvvIkgICAgICAg
ICAgICAgIDANCj4gPiA+ICtIIO+8iOmrmOeJueadg+e6p+mZt+mYse+8iSAgICAgICAgICAgICAg
MA0KPiA+ID4gK0wg77yI5L2O54m55p2D57qn6Zm36Zix77yJICAgICAgICAgICAgICAwDQo+ID4g
PiArTiDvvIjmkqTplIDkuIvkuIDmnaHmjIfku6TvvIkgICAgICAgICAgICDooqtD5Luj56CB5L2/
55SoDQo+ID4gPiArWCDvvIjmlbDmja7lrZjlgqjkuK3mlq3npoHnlKjvvIkgICAgICAgICAgMA0K
PiA+ID4gK0Ig77yI5Lqn55Sf5YiG5pSv77yJICAgICAgICAgICAgICAgICAg6KKrQ+S7o+eggeS9
v+eUqA0KPiA+ID4gK0Mg77yI5Luj56CB5Zyw5Z2A6L2s6K+R77yJICAgICAgICAgICAgICAxLCDl
nKjmiafooYzlrp7mqKHlvI/ku6PnoIHml7bkuLowDQo+ID4gPiArViDvvIjpmaTms5XmraXplb/m
oKHmraPvvIkgICAgICAgICAgICAgIOiiq0Pku6PnoIHkvb/nlKgNCj4gPiA+ICtNIO+8iEhQTUMg
5o6p56CB77yJICAgICAgICAgICAgICAgICAwLCDlnKjmiafooYxIUE1DIGhhbmRsZXIqIOaXtuS4
ujENCj4gPg0KPiA+IGhhbmRsZXINCj4gSSB0aGluayAiaGFuZGxlciIgaXMgYSBwb2ludC4NCmhh
bmRsZXIgLT4g5pON5L2cDQo+ID4NCj4gPiA+ICtDL0Ig77yI6L+bL+WAnyDkvY3vvIkgICAgICAg
ICAgICAgICAg6KKrQ+S7o+eggeS9v+eUqA0KPiA+ID4gK08g77yI5pyJ5bqP5byV55So77yJICAg
ICAgICAgICAgICAgICAgMSoNCj4gPiA+ICtGIO+8iOaAp+iDveebkeinhuWZqO+8iSAgICAgICAg
ICAgICAgICAwDQo+ID4gPiArUiDvvIjlm57mlLborqHmlbDlmajpmbfpmLHvvIkgICAgICAgICAg
ICAwDQo+ID4gPiArUSDvvIjmlLbpm4bkuK3mlq3nirbmgIHvvIkgICAgICAgICAgICAgIDEg77yI
5ZyocmZp5LmL5YmN55qE5Luj56CB5Lit5Li6MO+8iQ0KPiA+ID4gK1Ag77yI5L+d5oqk5qCH6K+G
56ym77yJICAgICAgICAgICAgICAgIDEqDQo+ID4gPiArRCDvvIjmlbDmja7lnLDlnYDovazor5Hv
vIkgICAgICAgICAgICAgIDEsIOWcqOaJp+ihjOWunuaooWV4dGVybmFsIGludGVycnVwdCBtYXNr
5byP5Luj56CB5pe25Li6MA0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+IOWcqOaJp+ihjOWunuaooeW8
j+S7o+eggeaXtuS4ujANCj4gPg0KPiA+ID4gK0kg77yI5aSW6YOo5Lit5pat5o6p56CB77yJICAg
ICAgICAgICAgICDnlLFjbGkoKS9zdGkoKeWuj+S9v+eUqOOAgg0KPiA+ID4gKz09PT09PT09PT09
PT09PT09PT09PT0gICAgICAgICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+ID4gPiArDQo+ID4gPiAr4oCc6ZqQ5b2i4oCdIOWvhOWtmOWZqO+8iOW9
seWtkOWvhOWtmOWZqO+8iQ0KPiA+IC0tLS0tLS0tLV4NCj4gPiBleHRyYSBzcGFjZQ0KPiBPSyEg
REVMDQo+ID4NCj4gPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICsNCj4g
PiA+ICs9PT09PT09PT09PT09ICAgICAgICAgICAgICAgICAgID09PT09PT09PT09PT09PT09PT0N
Cj4gPiA+ICtQU1cgVyDpu5jorqTlgLwgICAgICAgICAgICAgICAgICAgIDANCj4gPiA+ICtQU1cg
RSDpu5jorqTlgLwgICAgICAgICAgICAgICAgICAgIDANCj4gPiA+ICvlvbHlrZDlr4TlrZjlmagg
ICAgICAgICAgICAgICAgICAgICAg6KKr5Lit5pat5aSE55CG5Luj56CB5L2/55SoDQo+ID4gPiAr
VE9D5ZCv55So5L2NICAgICAgICAgICAgICAgICAgICAgICAxDQo+ID4gPiArPT09PT09PT09PT09
PSAgICAgICAgICAgICAgICAgICA9PT09PT09PT09PT09PT09PT09DQo+ID4gPiArDQo+ID4gPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ID4gKw0KPiA+ID4gK1BBLVJJU0PmnrbmnoTlrprkuYnkuoY35Liq5a+E5a2Y5Zmo5L2c
5Li6ICLlvbHlrZDlr4TlrZjlmagi44CC6L+Z5Lqb5a+E5a2Y5Zmo5ZyoDQo+ID4NCj4gPiAiIiAt
PiDigJzigJ0NCj4gb2shDQo+ID4NCj4gPiA+ICtSRVRVUk4gRlJPTSBJTlRFUlJVUFRJT04gQU5E
IFJFU1RPUkXmjIfku6TkuK3kvb/nlKjvvIzpgJrov4fmtogNCj4gPiA+ICvpmaTkuK3mlq3lpITn
kIbnqIvluo/kuK3lr7nkuIDoiKzlr4TlrZjlmajvvIhHUu+8ieeahOS/neWtmOWSjOaBouWkjeea
hOmcgOimgeadpeWHjw0KPiA+ID4gK+WwkeeKtuaAgeS/neWtmOWSjOaBouWkjeaXtumXtOOAguW9
seWtkOWvhOWtmOWZqOaYr0dScyAxLCA4LCA5LCAxNiwgMTcsDQo+ID4gPiArMjTlkowyNeOAgg0K
PiA+ID4gKw0KPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICsNCj4gPiA+ICvlr4TlrZjl
majkvb/nlKjor7TmmI7vvIzmnIDliJ3nlLHnuqbnv7At6ams5paH5o+Q5L6b77yM5bm255SxUmFu
ZG9scGggQ2h1bmfmj5DkvpvkuIDkupvooaXlhYXor7TmmI7jgIINCj4gPg0KPiA+IHMvLS/Cty8N
Cj4gPiBvciBkb24ndCB0cmFuc2xhdGUgbmFtZQ0KPiBPS++8gQ0KPiBKb2huIE1hcnZpbg0KPiA+
DQo+ID4gPiArDQo+ID4gPiAr5a+55LqO6YCa55So5a+E5a2Y5ZmoOg0KPiA+ID4gKw0KPiA+ID4g
K3IxLHIyLHIxOS1yMjYscjI4LHIyOSAmIHIzMeWPr+S7peWcqOS4jeS/neWtmOWug+S7rOeahOaD
heWGteS4i+iiq+S9v+eUqOOAguW9k+eEtu+8jOWmguaenOS9oA0KPiA+ID4gK+WFs+W/g+Wug+S7
rO+8jOWcqOiwg+eUqOWPpuS4gOS4queoi+W6j+S5i+WJje+8jOS9oOS5n+mcgOimgeS/neWtmOWu
g+S7rOOAguS4iumdoueahOS4gOS6m+WvhOWtmOWZqOehruWung0KPiA+ID4gK+acieeJueauiuea
hOWQq+S5ie+8jOS9oOW6lOivpeazqOaEj+S4gOS4izoNCj4gPiA+ICsNCj4gPiA+ICsgICAgcjE6
DQo+ID4NCj4gPiBOZXh0IHBhcmFncmFwaCdzIGluZGVudGF0aW9uIHNob3VsZCBiZSBhIDgtd2lk
dGggVEFCLg0KPiA+IFNvIGFzIGZvbGxvd2VkLg0KPiBPS++8gQ0KPiA+DQo+ID4gPiArICAgIGFk
ZGls5oyH5Luk5piv56Gs5oCn6KeE5a6a5bCG5YW257uT5p6c5pS+5ZyocjHkuK3vvIzmiYDku6Xl
poLmnpzkvaDkvb/nlKjov5nmnaHmjIfku6TopoENCj4gPiA+ICsgICAg5rOo5oSP6L+Z54K544CC
DQo+ID4gPiArDQo+ID4gPiArICAgIHIyOg0KPiA+ID4gKyAgICDov5nlsLHmmK/ov5Tlm57mjIfp
kojjgILkuIDoiKzmnaXor7TvvIzkvaDkuI3mg7Pkvb/nlKjlroPvvIzlm6DkuLrkvaDpnIDopoHo
v5nkuKrmjIfpkojmnaXov5QNCj4gPiA+ICsgICAg5Zue57uZ5L2g55qE6LCD55So6ICF44CC54S2
6ICM77yM5a6D5LiO6L+Z57uE5a+E5a2Y5Zmo57uE5ZCI5Zyo5LiA6LW377yM5Zug5Li66LCD55So
6ICF5LiN6IO9DQo+ID4gPiArICAgIOS+nei1luS9oOi/lOWbnuaXtueahOWAvOaYr+ebuOWQjOea
hO+8jOS5n+WwseaYr+ivtO+8jOS9oOWPr+S7peWwhnIy5aSN5Yi25Yiw5Y+m5LiA5Liq5a+E5a2Y
DQo+ID4gPiArICAgIOWZqO+8jOW5tuWcqOS9nOW6n3Iy5ZCO6YCa6L+H6K+l5a+E5a2Y5Zmo6L+U
5Zue77yM6L+Z5bqU6K+l5LiN5Lya57uZ6LCD55So56iL5bqP5bim5p2l6Zeu6aKY44CCDQo+ID4g
PiArDQo+ID4gPiArICAgIHIxOS1yMjI6DQo+ID4gPiArICAgIOi/meS6m+mAmuW4uOiiq+iupOS4
uuaYr+S4tOaXtuWvhOWtmOWZqOOAgg0KPiA+ID4gKyAgICDor7fms6jmhI/vvIzlnKg2NOS9jeS4
reWug+S7rOaYr2FyZzctYXJnNOOAgg0KPiA+ID4gKw0KPiA+ID4gKyAgICByMjMtcjI2Og0KPiA+
ID4gKyAgICDov5nkupvmmK9hcmczLWFyZzDvvIzkuZ/lsLHmmK/or7TvvIzlpoLmnpzkvaDkuI3l
ho3lhbPlv4PkvKDlhaXnmoTlgLzvvIzkvaDlj6/ku6Xkvb/nlKgNCj4gPiA+ICsgICAg5a6D5Lus
44CCDQo+ID4gPiArDQo+ID4gPiArICAgIHIyOCxyMjk6DQo+ID4gPiArICAgIOaYr3JldDDlkoxy
ZXQx44CC5a6D5Lus5piv5L2g5Lyg6YCS6L+U5Zue5YC855qE5Lic6KW/44CCcjI45piv5Li76KaB
55qE6L+U5Zue44CC5b2T6L+UDQo+ID4gPiArICAgIOWbnuWwj+e7k+aehOaXtu+8jHIyOeS5n+WP
r+S7peeUqOadpeWwhuaVsOaNruS8oOWbnue7meiwg+eUqOiAheOAgg0KPiA+DQo+ID4g6L+Z5L+p
5pivcmV0MOWSjHJldDHjgILlroPku6zmmK/kvaDkvKDlhaXov5Tlm57lgLznmoTlnLDmlrnjgIJy
MjjmmK/kuLvov5Tlm57lgLzjgILlvZPov5Tlm54NCj4gPiDlsI/nu5PmnoTkvZPml7bvvIxyMjnk
uZ/lj6/ku6XnlKjmnaXlsIbmlbDmja7kvKDlm57nu5nosIPnlKjogIXjgIINCj4gT0vvvIENCj4g
6LCD55So6ICFIC0+IOiwg+eUqOeoi+W6j++8n++8mu+8iQ0KPiA+DQo+ID4gPiArDQo+ID4gPiAr
ICAgIHIzMDoNCj4gPiA+ICsgICAg5qCI5oyH6ZKIDQo+ID4gPiArDQo+ID4gPiArICAgIHIzMToN
Cj4gPiA+ICsgICAgYmxl5oyH5Luk5bCG6L+U5Zue5oyH6ZKI5pS+5Zyo6L+Z6YeM44CCDQo+ID4g
PiArDQo+ID4gPiArDQo+ID4gTmV4dCBwYXJhZ3JhcGgncyBpbmRlbnRhdGlvbiBpcyBjb3JyZWN0
Lg0KPiA+ID4gKyAgICByMy1yMTgscjI3LHIzMOmcgOimgeiiq+S/neWtmOWSjOaBouWkjeOAgnIz
LXIxOOWPquaYr+S4gOiIrOeUqOmAlOeahOWvhOWtmOWZqOOAgg0KPiA+ID4gKyAgICByMjfmmK/m
lbDmja7mjIfpkojvvIznlKjmnaXkvb/lr7nlhajlsYDlj5jph4/nmoTlvJXnlKjmm7TlrrnmmJPj
gIJyMzDmmK/moIjmjIfpkojjgIINCj4gPiA+IC0tDQo+ID4gPiAyLjI3LjANCj4gPg0KPiA+IFRo
YW5rcw0KPiA+DQo+ID4gV3UgWC5DLg0KPiA+DQo+IFRoYW5rcyB5b3VyIHJldmlldyENCj4NCj4g
VGhhbmtzLA0KPg0KPiBZYW50ZW5nDQoNClRoYW5rc++8jA0KDQpZYW50ZW5nDQo=

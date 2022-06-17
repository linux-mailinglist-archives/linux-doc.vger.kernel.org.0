Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB67554F27F
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 10:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380734AbiFQIGm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jun 2022 04:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380252AbiFQIGm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 04:06:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E50567D3C
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 01:06:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B87AAB827A4
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 08:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7F4C341C0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655453198;
        bh=ajnYmOOxTUii9cZ5GAsDd2Of1eCFawODk9KJY8KP0Z0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HPX8Ja3v0ckikrU/QkF8AhplE0VL6TSmT/T7M455O8o0vwlVI6vzYi1yu9bOrxCOj
         FhuCnQPjNXuMSOmegoQA6X1hxSDRfpbTBbgiPZ+nB0yZgTOJOcOrHsELr2MYr8Lvvy
         Zml4Lah36olHMH3p0/P2wucrxy+hYNM/f45ewD6pYkmSqHU/T3EXvyyO5iotoDn8nT
         vBT/YsryhtU7cBq4GSItHL2aemJYRZhzuT8HzsCowsdUfmMExN1R3sXrIny8h2QnW8
         n+gU9qYYUzMn40xvqWjANHgUppUfkBnsLquUbWqq1T733BDDkk5aH0nOncpmRys+dj
         IDQYuY9H8Q0Ww==
Received: by mail-lf1-f45.google.com with SMTP id s6so5743312lfo.13
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 01:06:38 -0700 (PDT)
X-Gm-Message-State: AJIora81P4qgoZkAls972Q0/qYZBb5QUxWR1zLkFPUHZ9XlnF368II6X
        5anxHLV3z8XdfXOUejLD5qyvAKERk15wa6gBRdc=
X-Google-Smtp-Source: AGRyM1t+BMTGaBXQqA6qlN7+RTAb+kFl408jddD3j9HRXprarInufx4mxWvS56p0Idti64JGN5VONCV06VxKx+oA28Y=
X-Received: by 2002:a05:6512:e9c:b0:479:1fd9:1b94 with SMTP id
 bi28-20020a0565120e9c00b004791fd91b94mr4643947lfb.591.1655453196412; Fri, 17
 Jun 2022 01:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655450200.git.siyanteng@loongson.cn> <151c8e9725b51d8629335a828ab0115705e7696c.1655450200.git.siyanteng@loongson.cn>
In-Reply-To: <151c8e9725b51d8629335a828ab0115705e7696c.1655450200.git.siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 17 Jun 2022 16:06:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5-wZ0WBy3v=ZRQ-uYDcHLQKtYL359-GgigONZw6fWjmw@mail.gmail.com>
Message-ID: <CAAhV-H5-wZ0WBy3v=ZRQ-uYDcHLQKtYL359-GgigONZw6fWjmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: rewrite all the notes
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGksIFlhbnRlbmcsDQoNCk9uIEZyaSwgSnVuIDE3LCAyMDIyIGF0IDM6MTcgUE0gWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPiB3cm90ZToNCj4NCj4gTm90ZSBpcyBhbiBhZG1vbml0
aW9uLCBsZXQncyB1c2UgdGhlIGRpcmVjdGl2ZXMNCj4gaW1wbGVtZW50ZWQgaW4gdGhlIHJlZmVy
ZW5jZSByZVN0cnVjdHVyZWRUZXh0IHBhcnNlci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVu
ZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vbG9vbmdhcmNoL2ludHJvZHVjdGlvbi5yc3QgfCAxNCArKysrKysrKy0tLS0tLQ0KPiAg
Li4uL3poX0NOL2xvb25nYXJjaC9pcnEtY2hpcC1tb2RlbC5yc3QgICAgICAgICAgICB8IDE1ICsr
KysrKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vbG9vbmdhcmNoL2ludHJvZHVjdGlvbi5yc3QNCj4gaW5kZXggZTMxYTFhOTI4
YzQ4Li5hOGE1YWFjYTdkOTQgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0DQo+IEBAIC00
NiwxMCArNDYsMTEgQEAgTEE2NOS4reavj+S4quWvhOWtmOWZqOS4ujY05L2N5a6944CCIGBgJHIw
YGAg55qE5YaF5a655oC75piv5Zu65a6a5Li6MO+8jOiAjOWFtg0KPiAgYGAkcjIzYGAtYGAkcjMx
YGAgYGAkczBgYC1gYCRzOGBgIOmdmeaAgeWvhOWtmOWZqCAgICAgICAgICDmmK8NCj4gID09PT09
PT09PT09PT09PT09ID09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09ID09PT09PT09
PT0NCj4NCj4gLeazqOaEj++8mmBgJHIyMWBg5a+E5a2Y5Zmo5ZyoRUxGIHBzQUJJ5Lit5L+d55WZ
5pyq5L2/55So77yM5L2G5piv5ZyoTGludXjlhoXmoLjnlKjkuo7kv53lrZjmr49DUFUNCj4gLeWP
mOmHj+WfuuWcsOWdgOOAguivpeWvhOWtmOWZqOayoeaciUFCSeWRveWQje+8jOS4jei/h+WcqOWG
heaguOS4reensOS4umBgJHUwYGDjgILlnKjkuIDkupvpgZfnlZnku6PnoIENCj4gLeS4reacieaX
tuWPr+iDveingeWIsGBgJHYwYGDlkoxgYCR2MWBg77yM5a6D5Lus5pivYGAkYTBgYOWSjGBgJGEx
YGDnmoTliKvlkI3vvIzlsZ7kuo7lt7Lnu4/lup/lvIMNCj4gLeeahOeUqOazleOAgg0KPiArLi4g
bm90ZTo6DQo+ICsgICAg5rOo5oSP77yaIGBgJHIyMWBg5a+E5a2Y5Zmo5ZyoRUxGIHBzQUJJ5Lit
5L+d55WZ5pyq5L2/55So77yM5L2G5piv5ZyoTGludXjlhoXmoLjnlKjkuo7kv50NCj4gKyAgICDl
rZjmr49DUFXlj5jph4/ln7rlnLDlnYDjgILor6Xlr4TlrZjlmajmsqHmnIlBQknlkb3lkI3vvIzk
uI3ov4flnKjlhoXmoLjkuK3np7DkuLpgYCR1MGBg44CC5Zyo5LiADQo+ICsgICAg5Lqb6YGX55WZ
5Luj56CB5Lit5pyJ5pe25Y+v6IO96KeB5YiwYGAkdjBgYOWSjGBgJHYxYGDvvIzlroPku6zmmK9g
YCRhMGBg5ZKMYGAkYTFgYOeahA0KPiArICAgIOWIq+WQje+8jOWxnuS6juW3sue7j+W6n+W8g+ea
hOeUqOazleOAgg0KVGhlcmUgc2hvdWxkIGJlIGEgc3BhY2UgYmV0d2VlbiBgYCRyMjFgYCBhbmQg
Q2hpbmVzZSB0ZXh0IGZvciBIVE1MDQpkaXNwbGF5LCBwbGVhc2UgZml4IGFsbCBvZiBzdWNoIHBy
b2JsZW1zLCB0aGFua3MuDQoNCkh1YWNhaQ0KPg0KPiAg5rWu54K55a+E5a2Y5ZmoDQo+ICAtLS0t
LS0tLS0tDQo+IEBAIC02OCw4ICs2OSw5IEBAIExBNjTkuK3mr4/kuKrlr4TlrZjlmajkuLo2NOS9
jeWuveOAgiBgYCRyMGBgIOeahOWGheWuueaAu+aYr+WbuuWumuS4ujDvvIzogIzlhbYNCj4gIGBg
JGYyNGBgLWBgJGYzMWBgIGBgJGZzMGBgLWBgJGZzN2BgICDpnZnmgIHlr4TlrZjlmaggICAgICAg
ICAg5pivDQo+ICA9PT09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT0gPT09PT09PT09
PT09PT09PT09PSA9PT09PT09PT09DQo+DQo+IC3ms6jmhI/vvJrlnKjkuIDkupvpgZfnlZnku6Pn
oIHkuK3mnInml7blj6/og73op4HliLAgYGAkdjBgYCDlkowgYGAkdjFgYCDvvIzlroPku6zmmK8g
YGAkYTBgYA0KPiAt5ZKMIGBgJGExYGAg55qE5Yir5ZCN77yM5bGe5LqO5bey57uP5bqf5byD55qE
55So5rOV44CCDQo+ICsuLiBub3RlOjoNCj4gKyAgICDms6jmhI/vvJrlnKjkuIDkupvpgZfnlZnk
u6PnoIHkuK3mnInml7blj6/og73op4HliLAgYGAkdjBgYCDlkowgYGAkdjFgYCDvvIzlroPku6zm
mK8NCj4gKyAgICBgYCRhMGBg5ZKMIGBgJGExYGAg55qE5Yir5ZCN77yM5bGe5LqO5bey57uP5bqf
5byD55qE55So5rOV44CCDQo+DQo+DQo+ICDlkJHph4/lr4TlrZjlmagNCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2xvb25nYXJjaC9pcnEtY2hpcC1tb2Rl
bC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9sb29uZ2FyY2gvaXJxLWNo
aXAtbW9kZWwucnN0DQo+IGluZGV4IDJhNGMzYWQzOGJlNC4uNDliN2JkYjU5YTRhIDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9sb29uZ2FyY2gvaXJxLWNo
aXAtbW9kZWwucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2xv
b25nYXJjaC9pcnEtY2hpcC1tb2RlbC5yc3QNCj4gQEAgLTE0Nyw5ICsxNDcsMTIgQEAgUENILUxQ
Qzo6DQo+DQo+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9sb29uZ3Nvbi9Mb29uZ0FyY2gtRG9jdW1l
bnRhdGlvbi9yZWxlYXNlcy9sYXRlc3QvZG93bmxvYWQvTG9vbmdzb24tN0ExMDAwLXVzZXJtYW51
YWwtMi4wMC1FTi5wZGYgKOiLseaWh+eJiCkNCj4NCj4gLeazqO+8mkNQVUlOVEPljbPjgIrpvpno
iq/mnrbmnoTlj4LogIPmiYvlhozljbfkuIDjgIvnrKw3LjToioLmiYDmj4/ov7DnmoRDU1IuRUNG
Ry9DU1IuRVNUQVTlr4TlrZjlmajlj4rlhbbkuK3mlq0NCj4gLeaOp+WItumAu+i+ke+8m0xJT0lO
VEPljbPjgIrpvpnoiq8zQTUwMDDlpITnkIblmajkvb/nlKjmiYvlhozjgIvnrKwxMS4x6IqC5omA
5o+P6L+w55qE4oCc5Lyg57ufSS9P5Lit5pat4oCd77ybRUlPSU5UQw0KPiAt5Y2z44CK6b6Z6Iqv
M0E1MDAw5aSE55CG5Zmo5L2/55So5omL5YaM44CL56ysMTEuMuiKguaJgOaPj+i/sOeahOKAnOaJ
qeWxlUkvT+S4reaWreKAne+8m0hUVkVDSU5UQ+WNs+OAium+meiKrzNBNTAwMA0KPiAt5aSE55CG
5Zmo5L2/55So5omL5YaM44CL56ysMTQuM+iKguaJgOaPj+i/sOeahOKAnEh5cGVyVHJhbnNwb3J0
5Lit5pat4oCd77ybUENILVBJQy9QQ0gtTVNJ5Y2z44CK6b6Z6IqvN0ExMDAw5qGlDQo+IC3niYfn
lKjmiLfmiYvlhozjgIvnrKw156ug5omA5o+P6L+w55qE4oCc5Lit5pat5o6n5Yi25Zmo4oCd77yb
UENILUxQQ+WNs+OAium+meiKrzdBMTAwMOahpeeJh+eUqOaIt+aJi+WGjOOAi+esrDI0LjPoioLm
iYANCj4gLeaPj+i/sOeahOKAnExQQ+S4reaWreKAneOAgg0KPiArLi4gbm90ZTo6DQo+ICsgICDm
s6jvvJoNCj4gKyAgICAtIENQVUlOVEPvvJrljbPjgIrpvpnoiq/mnrbmnoTlj4LogIPmiYvlhozl
jbfkuIDjgIvnrKw3LjToioLmiYDmj4/ov7DnmoRDU1IuRUNGRy9DU1IuRVNUQVTlr4TlrZjlmajl
j4rlhbYNCj4gKyAgICAgIOS4reaWreaOp+WItumAu+i+ke+8mw0KPiArICAgIC0gTElPSU5UQ++8
muWNs+OAium+meiKrzNBNTAwMOWkhOeQhuWZqOS9v+eUqOaJi+WGjOOAi+esrDExLjHoioLmiYDm
j4/ov7DnmoTigJzkvKDnu59JL0/kuK3mlq3igJ3vvJsNCj4gKyAgICAtIEVJT0lOVEPvvJrljbPj
gIrpvpnoiq8zQTUwMDDlpITnkIblmajkvb/nlKjmiYvlhozjgIvnrKwxMS4y6IqC5omA5o+P6L+w
55qE4oCc5omp5bGVSS9P5Lit5pat4oCd77ybDQo+ICsgICAgLSBIVFZFQ0lOVEPvvJrljbPjgIrp
vpnoiq8zQTUwMDDlpITnkIblmajkvb/nlKjmiYvlhozjgIvnrKwxNC4z6IqC5omA5o+P6L+w55qE
4oCcSHlwZXJUcmFuc3BvcnTkuK3mlq3igJ3vvJsNCj4gKyAgICAtIFBDSC1QSUMvUENILU1TSe+8
muWNs+OAium+meiKrzdBMTAwMOahpeeJh+eUqOaIt+aJi+WGjOOAi+esrDXnq6DmiYDmj4/ov7Dn
moTigJzkuK3mlq3mjqfliLblmajigJ3vvJsNCj4gKyAgICAtIFBDSC1MUEPvvJrljbPjgIrpvpno
iq83QTEwMDDmoaXniYfnlKjmiLfmiYvlhozjgIvnrKwyNC4z6IqC5omA5o+P6L+w55qE4oCcTFBD
5Lit5pat4oCd44CCDQo+IC0tDQo+IDIuMjcuMA0KPg0K

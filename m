Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538023501A9
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 15:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhCaNqX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 09:46:23 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50066 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbhCaNqP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 09:46:15 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 12VDk1wK014128;
        Wed, 31 Mar 2021 22:46:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 12VDk1wK014128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617198362;
        bh=+Wv9DWGrv+mFQSDa9ZPLJJyRfOGQozwUexiaDJL3Y8c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=urRWFJPyP9Yubthut60Dxrk/VrnNDdKXkCjdwXiUircAASMtboAOnBN9RnPsryuu7
         LugGfC7tRetUpJjXev1io6recadoShvRl2H9BMy72TrP3YpLtYpNEb15tAdV2ip0xO
         QRgWNbsbt73XZRgSd/0v9p2CPV3OFaxd9+HBA6fCY+7gNlDuoFjgWM0QUqvs8jA//R
         tw+czXaemaZPSMMyxtg2IVr9CpI+peGW249JsdScLKw/RMJSlylLWSqoBAIv7fHLd/
         AEenSKd2RxGBD1vx28UoscWqYSwKikIKnePrSDZ/17HxBjf3MIhATLa7jRAzFlF5pT
         JmDCR3/W8z8GQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id h8so7929750plt.7;
        Wed, 31 Mar 2021 06:46:02 -0700 (PDT)
X-Gm-Message-State: AOAM531fzuhq6arfAvDFgQ0/GeoInw5PoTHZiJzbQy1YR9C/vNtrM91e
        ZAJEgVZfcStORdFneArwYQRDY1kGETXfxBHtzG4=
X-Google-Smtp-Source: ABdhPJw7d5TsfqLGmOcT61yOXkS0uApMWd9Znjmyuc1BgedU5sR6XAyvI+3cOd0wEh3lQqcEusuCNuVC5XPz1rWpfww=
X-Received: by 2002:a17:90a:fb54:: with SMTP id iq20mr3390477pjb.153.1617198361204;
 Wed, 31 Mar 2021 06:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210302141822.504773-1-masahiroy@kernel.org>
In-Reply-To: <20210302141822.504773-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 31 Mar 2021 22:45:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUHbBgJdAtfqzn=X5f_+Nram00VtMQfZwOQdYLCygChA@mail.gmail.com>
Message-ID: <CAK7LNAQUHbBgJdAtfqzn=X5f_+Nram00VtMQfZwOQdYLCygChA@mail.gmail.com>
Subject: Re: [PATCH] docs: Remove make headers_check from checklist in translations
To:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgSm9uLA0KDQoNCk9uIFR1ZSwgTWFyIDIsIDIwMjEgYXQgMTE6MTkgUE0gTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6DQo+DQo+IENvbW1pdCAxYTYzZjljY2U3
YjcgKCJkb2NzOiBSZW1vdmUgbWFrZSBoZWFkZXJzX2NoZWNrIGZyb20gY2hlY2tsaXN0IikNCj4g
Zml4ZWQgb25seSB0aGUgRW5nbGlzaCB2ZXJzaW9uLg0KPg0KPiBMZXQncyBmaXggdGhlIHRyYW5z
bGF0ZWQgdmFyaWFudHMgdG9vLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEg
PG1hc2FoaXJveUBrZXJuZWwub3JnPg0KDQpwaW5nPw0KDQoNCg0KPiAtLS0NCj4NCj4gIC4uLi9p
dF9JVC9wcm9jZXNzL3N1Ym1pdC1jaGVja2xpc3QucnN0ICAgICAgICAgICAgIHwgMTQgKysrKysr
LS0tLS0tLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL1N1Ym1pdENoZWNr
bGlzdCAgIHwgIDggKysrLS0tLS0NCj4gIC4uLi96aF9DTi9wcm9jZXNzL3N1Ym1pdC1jaGVja2xp
c3QucnN0ICAgICAgICAgICAgIHwgMTQgKysrKysrLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9pdF9JVC9wcm9jZXNzL3N1Ym1pdC1jaGVja2xpc3Qu
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvaXRfSVQvcHJvY2Vzcy9zdWJtaXQtY2hl
Y2tsaXN0LnJzdA0KPiBpbmRleCA2MTRmYzE3ZDkwODYuLjYyYmE0NzE5MjFiNiAxMDA2NDQNCj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvaXRfSVQvcHJvY2Vzcy9zdWJtaXQtY2hl
Y2tsaXN0LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9pdF9JVC9wcm9j
ZXNzL3N1Ym1pdC1jaGVja2xpc3QucnN0DQo+IEBAIC05NSwzMSArOTUsMjkgQEAgc290dG9taXNz
aW9uZSBkZWxsZSBwYXRjaCwgaW4gcGFydGljb2xhcmUNCj4gICAgICBpbmZvcm1hemlvbmkuICBM
ZSBwYXRjaCBjaGUgbW9kaWZpY2FubyBsZSBpbnRlcmZhY2NlIHV0ZW50ZSBkb3ZyZWJiZXJvDQo+
ICAgICAgZXNzZXJlIGludmlhdGUgaW4gY29waWEgYW5jaGUgYSBsaW51eC1hcGlAdmdlci5rZXJu
ZWwub3JnLg0KPg0KPiAtMjApIFZlcmlmaWNhIGNoZSBpbCBrZXJuZWwgcGFzc2kgY29uIHN1Y2Nl
c3NvIGBgbWFrZSBoZWFkZXJzX2NoZWNrYGANCj4gLQ0KPiAtMjEpIExhIHBhdGNoIMOoIHN0YXRh
IHZlcmlmaWNhdGEgY29uIGwnaW5pZXppb25lIGRpIGZhbGxpbWVudGkgaW4gc2xhYiBlDQo+ICsy
MCkgTGEgcGF0Y2ggw6ggc3RhdGEgdmVyaWZpY2F0YSBjb24gbCdpbmllemlvbmUgZGkgZmFsbGlt
ZW50aSBpbiBzbGFiIGUNCj4gICAgICBuZWxsJ2FsbG9jYXppb25lIGRpIHBhZ2luZS4gIFZlZGVy
ZSBgYERvY3VtZW50YXRpb24vZmF1bHQtaW5qZWN0aW9uL2BgLg0KPg0KPiAgICAgIFNlIGlsIG51
b3ZvIGNvZGljZSDDqCBjb3Jwb3NvLCBwb3RyZWJiZSBlc3NlcmUgb3Bwb3J0dW5vIGFnZ2l1bmdl
cmUNCj4gICAgICBsJ2luaWV6aW9uZSBkaSBmYWxsaW1lbnRpIHNwZWNpZmljaSBwZXIgaWwgc290
dG9zaXN0ZW1hLg0KPg0KPiAtMjIpIElsIG51b3ZvIGNvZGljZSDDqCBzdGF0byBjb21waWxhdG8g
Y29uIGBgZ2NjIC1XYGAgKHVzYXRlDQo+ICsyMSkgSWwgbnVvdm8gY29kaWNlIMOoIHN0YXRvIGNv
bXBpbGF0byBjb24gYGBnY2MgLVdgYCAodXNhdGUNCj4gICAgICBgYG1ha2UgS0NGTEFHUz0tV2Bg
KS4gIFF1ZXN0byBnZW5lcmVyw6AgbW9sdGkgYXZ2aXNpLCBtYSDDqCBvdHRpbW8NCj4gICAgICBw
ZXIgc2NvdmFyZSBiYWNoaSBjb21lICAid2FybmluZzogY29tcGFyaXNvbiBiZXR3ZWVuIHNpZ25l
ZCBhbmQgdW5zaWduZWQiLg0KPg0KPiAtMjMpIExhIHBhdGNoIMOoIHN0YXRhIHZlcmlmaWNhdGEg
ZG9wbyBlc3NlcmUgc3RhdGEgaW5jbHVzYSBuZWxsYSBzZXJpZSBkaSBwYXRjaA0KPiArMjIpIExh
IHBhdGNoIMOoIHN0YXRhIHZlcmlmaWNhdGEgZG9wbyBlc3NlcmUgc3RhdGEgaW5jbHVzYSBuZWxs
YSBzZXJpZSBkaSBwYXRjaA0KPiAgICAgIC1tbTsgcXVlc3RvIGFsIGZpbmUgZGkgYXNzaWN1cmFy
c2kgY2hlIGNvbnRpbnVpIGEgZnVuemlvbmFyZSBhc3NpZW1lIGENCj4gICAgICB0dXR0ZSBsZSBh
bHRyZSBwYXRjaCBpbiBjb2RhIGUgaSB2YXJpIGNhbWJpYW1lbnRpIG5laSBzb3R0b3Npc3RlbWkg
Vk0sIFZGUw0KPiAgICAgIGUgYWx0cmkuDQo+DQo+IC0yNCkgVHV0dGUgbGUgYmFycmllcmUgZGkg
c2luY3Jvbml6emF6aW9uZSB7cGVyIGVzZW1waW8sIGBgYmFycmllcigpYGAsDQo+ICsyMykgVHV0
dGUgbGUgYmFycmllcmUgZGkgc2luY3Jvbml6emF6aW9uZSB7cGVyIGVzZW1waW8sIGBgYmFycmll
cigpYGAsDQo+ICAgICAgYGBybWIoKWBgLCBgYHdtYigpYGB9IGRldm9ubyBlc3NlcmUgYWNjb21w
YWduYXRlIGRhIHVuIGNvbW1lbnRvIG5laQ0KPiAgICAgIHNvcmdlbnRpIGNoZSBuZSBzcGllZ2hp
IGxhIGxvZ2ljYTogY29zYSBmYW5ubyBlIHBlcmNow6kuDQo+DQo+IC0yNSkgU2UgbGEgcGF0Y2gg
YWdnaXVuZ2UgbnVvdmUgY2hpYW1hdGUgaW9jdGwsIGFsbG9yYSBhZ2dpb3JuYXRlDQo+ICsyNCkg
U2UgbGEgcGF0Y2ggYWdnaXVuZ2UgbnVvdmUgY2hpYW1hdGUgaW9jdGwsIGFsbG9yYSBhZ2dpb3Ju
YXRlDQo+ICAgICAgYGBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwvaW9jdGwtbnVt
YmVyLnJzdGBgLg0KPg0KPiAtMjYpIFNlIGlsIGNvZGljZSBjaGUgYXZldGUgbW9kaWZpY2F0byBk
aXBlbmRlIG8gdXNhIHVuYSBxdWFsc2lhc2kgaW50ZXJmYWNjaWEgbw0KPiArMjUpIFNlIGlsIGNv
ZGljZSBjaGUgYXZldGUgbW9kaWZpY2F0byBkaXBlbmRlIG8gdXNhIHVuYSBxdWFsc2lhc2kgaW50
ZXJmYWNjaWEgbw0KPiAgICAgIGZ1bnppb25hbGl0w6AgZGVsIGtlcm5lbCBjaGUgw6ggYXNzb2Np
YXRhIGEgdW5vIGRlaSBzZWd1ZW50aSBzaW1ib2xpDQo+ICAgICAgYGBLY29uZmlnYGAsIGFsbG9y
YSB2ZXJpZmljYXRlIGNoZSBpbCBrZXJuZWwgY29tcGlsaSBjb24gZGl2ZXJzZQ0KPiAgICAgIGNv
bmZpZ3VyYXppb25pIGRvdmUgaSBzaW1ib2xpIHNvbm8gZGlzYWJpbGl0YXRpIGUvbyBgYD1tYGAg
KHNlIGMnw6ggbGENCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2ph
X0pQL1N1Ym1pdENoZWNrbGlzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL1N1
Ym1pdENoZWNrbGlzdA0KPiBpbmRleCBiNDIyMjBkM2Q0NmMuLjQ0Mjk0NDdiMDk2NSAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvamFfSlAvU3VibWl0Q2hlY2tsaXN0
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL1N1Ym1pdENoZWNrbGlz
dA0KPiBAQCAtODgsMjAgKzg4LDE4IEBAIExpbnV4IOOCq+ODvOODjeODq+ODkeODg+ODgeaKleeo
v+iAheWQkeOBkeODgeOCp+ODg+OCr+ODquOCueODiA0KPiAgMTg6IOaWsOOBl+OBhHVzZXJzcGFj
ZeOCpOODs+OCv+ODleOCp+ODvOOCueOCkuS9nOaIkOOBl+OBn+WgtOWQiOOBq+OBr+OAgURvY3Vt
ZW50YXRpb24vQUJJLyDjgasNCj4gICAgICBEb2N1bWVudGF0aW9uL0FCSS9SRUFETUUg44KS5Y+C
6ICD44Gr44GX44Gm5b+F44Ga44OJ44Kt44Ol44Oh44Oz44OI44KS6L+95Yqg44GX44Gm44GP44Gg
44GV44GE44CCDQo+DQo+IC0xOTogJ21ha2UgaGVhZGVyc19jaGVjayfjgpLlrp/ooYzjgZfjgabl
hajjgY/llY/poYzjgYzjgarjgYTjgZPjgajjgpLnorroqo3jgZfjgabjgY/jgaDjgZXjgYTjgIIN
Cj4gLQ0KPiAtMjA6IOWwkeOBquOBj+OBqOOCgnNsYWLjgqLjg63jgrHjg7zjgrfjg6fjg7Pjgahw
YWdl44Ki44Ot44Kx44O844K344On44Oz44Gr5aSx5pWX44GX44Gf5aC05ZCI44GuDQo+ICsxOTog
5bCR44Gq44GP44Go44KCc2xhYuOCouODreOCseODvOOCt+ODp+ODs+OBqHBhZ2XjgqLjg63jgrHj
g7zjgrfjg6fjg7PjgavlpLHmlZfjgZfjgZ/loLTlkIjjga4NCj4gICAgICDmjJnli5XjgavjgaTj
gYTjgabjgIFmYXVsdC1pbmplY3Rpb27jgpLliKnnlKjjgZfjgabnorroqo3jgZfjgabjgY/jgaDj
gZXjgYTjgIINCj4gICAgICBEb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi8g44KS5Y+C54Wn
44GX44Gm44GP44Gg44GV44GE44CCDQo+DQo+ICAgICAg6L+95Yqg44GX44Gf44Kz44O844OJ44GM
44GL44Gq44KK44Gu6YeP44Gn44GC44Gj44Gf44Gq44KJ44Gw44CB44K144OW44K344K544OG44Og
54m55pyJ44GuDQo+ICAgICAgZmF1bHQtaW5qZWN0aW9u44KS6L+95Yqg44GX44Gf44G744GG44GM
6Imv44GE44GL44KC44GX44KM44G+44Gb44KT44CCDQo+DQo+IC0yMTog5paw44Gf44Gr6L+95Yqg
44GX44Gf44Kz44O844OJ44Gv44CBYGdjYyAtVyfjgafjgrPjg7Pjg5HjgqTjg6vjgZfjgabjgY/j
gaDjgZXjgYTjgIINCj4gKzIwOiDmlrDjgZ/jgavov73liqDjgZfjgZ/jgrPjg7zjg4njga/jgIFg
Z2NjIC1XJ+OBp+OCs+ODs+ODkeOCpOODq+OBl+OBpuOBj+OBoOOBleOBhOOAgg0KPiAgICAgIOOB
k+OBruOCquODl+OCt+ODp+ODs+OBr+Wkp+mHj+OBruS4jeimgeOBquODoeODg+OCu+ODvOOCuOOC
kuWHuuWKm+OBl+OBvuOBmeOBjOOAgQ0KPiAgICAgICJ3YXJuaW5nOiBjb21wYXJpc29uIGJldHdl
ZW4gc2lnbmVkIGFuZCB1bnNpZ25lZCIg44Gu44KI44GG44Gq44Oh44OD44K744O844K444Gv44CB
DQo+ICAgICAg44OQ44Kw44KS6KaL44Gk44GR44KL44Gu44Gr5b2544Gr56uL44Gh44G+44GZ44CC
DQo+DQo+IC0yMjog5oqV56i/44GX44Gf44OR44OD44OB44GMIC1tbSDjg5Hjg4Pjg4Hjgrvjg4Pj
g4jjgavjg57jg7zjgrjjgZXjgozjgZ/lvozjgIHlhajjgabjga7ml6LlrZjjga7jg5Hjg4Pjg4Hj
goQNCj4gKzIxOiDmipXnqL/jgZfjgZ/jg5Hjg4Pjg4HjgYwgLW1tIOODkeODg+ODgeOCu+ODg+OD
iOOBq+ODnuODvOOCuOOBleOCjOOBn+W+jOOAgeWFqOOBpuOBruaXouWtmOOBruODkeODg+ODgeOC
hA0KPiAgICAgIFZNLCBWRlMg44GK44KI44Gz44Gd44Gu5LuW44Gu44K144OW44K344K544OG44Og
44Gr6Zai44GZ44KL5qeY44CF44Gq5aSJ5pu044Go44CB54++5pmC54K544Gn44KC5YWx5a2YDQo+
ICAgICAg44Gn44GN44KL44GT44Go44KS56K66KqN44GZ44KL44OG44K544OI44KS6KGM44Gj44Gm
44GP44Gg44GV44GE44CCDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9wcm9jZXNzL3N1Ym1pdC1jaGVja2xpc3QucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0LnJzdA0KPiBpbmRleCA1MDM4
NmUwZTQyZTcuLmE2NDg1OGQzMjFmYyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0LnJzdA0KPiArKysgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1pdC1jaGVja2xpc3QucnN0
DQo+IEBAIC04MiwyNCArODIsMjIgQEAgTGludXjlhoXmoLjooaXkuIHmj5DkuqTmuIXljZUNCj4g
ICAgICDor7flj4LpmIUgYGBEb2N1bWVudGF0aW9uL0FCSS9SRUFETUVgYCDjgILmm7TmlLnnlKjm
iLfnqbrpl7TmjqXlj6PnmoTooaXkuIHlupTor6XmioTpgIENCj4gICAgICBsaW51eC1hcGlAdmdl
ci5rZXJuZWwub3Jn44CCDQo+DQo+IC0yMCkg5qOA5p+l5piv5ZCm5YWo6YOo6YCa6L+HIGBgbWFr
ZSBoZWFkZXJzX2NoZWNrYGAg44CCDQo+IC0NCj4gLTIxKSDlt7LpgJrov4foh7PlsJHms6jlhaVz
bGFi5ZKMcGFnZeWIhumFjeWksei0pei/m+ihjOajgOafpeOAguivt+WPgumYhSBgYERvY3VtZW50
YXRpb24vZmF1bHQtaW5qZWN0aW9uL2BgDQo+ICsyMCkg5bey6YCa6L+H6Iez5bCR5rOo5YWlc2xh
YuWSjHBhZ2XliIbphY3lpLHotKXov5vooYzmo4Dmn6XjgILor7flj4LpmIUgYGBEb2N1bWVudGF0
aW9uL2ZhdWx0LWluamVjdGlvbi9gYA0KPiAgICAgIOWmguaenOaWsOS7o+eggeaYr+Wunui0qOaA
p+eahO+8jOmCo+S5iOa3u+WKoOWtkOezu+e7n+eJueWumueahOaVhemanOazqOWFpeWPr+iDveaY
r+WQiOmAgueahOOAgg0KPg0KPiAtMjIpIOaWsOa3u+WKoOeahOS7o+eggeW3sue7j+eUqCBgYGdj
YyAtV2BgIOe8luivke+8iOS9v+eUqCBgYG1ha2UgRVhUUkEtQ0ZMQUdTPS1XYGAg77yJ44CC6L+Z
DQo+ICsyMSkg5paw5re75Yqg55qE5Luj56CB5bey57uP55SoIGBgZ2NjIC1XYGAg57yW6K+R77yI
5L2/55SoIGBgbWFrZSBFWFRSQS1DRkxBR1M9LVdgYCDvvInjgILov5kNCj4gICAgICDlsIbkuqfn
lJ/lpKfph4/lmarlo7DvvIzkvYblr7nkuo7mn6Xmib7or7jlpoLigJzorablkYrvvJrmnInnrKbl
j7flkozml6DnrKblj7fkuYvpl7TnmoTmr5TovoPigJ3kuYvnsbvnmoTplJnor68NCj4gICAgICDl
vojmnInnlKjjgIINCj4NCj4gLTIzKSDlnKjlroPooqvlkIjlubbliLAtbW3ooaXkuIHpm4bkuK3k
uYvlkI7ov5vooYzmtYvor5XvvIzku6Xnoa7kv53lroPku43nhLbkuI7miYDmnInlhbbku5bmjpLp
mJ/nmoTooaXkuIHku6UNCj4gKzIyKSDlnKjlroPooqvlkIjlubbliLAtbW3ooaXkuIHpm4bkuK3k
uYvlkI7ov5vooYzmtYvor5XvvIzku6Xnoa7kv53lroPku43nhLbkuI7miYDmnInlhbbku5bmjpLp
mJ/nmoTooaXkuIHku6UNCj4gICAgICDlj4pWTeOAgVZGU+WSjOWFtuS7luWtkOezu+e7n+S4reea
hOWQhOenjeabtOaUueS4gOi1t+W3peS9nOOAgg0KPg0KPiAtMjQpIOaJgOacieWGheWtmOWxj+ma
nOS+i+WmgiBgYGJhcnJpZXIoKWBgLCBgYHJtYigpYGAsIGBgd21iKClgYCDpg73pnIDopoHmupDk
u6PnoIHkuK3nmoTms6gNCj4gKzIzKSDmiYDmnInlhoXlrZjlsY/pmpzkvovlpoIgYGBiYXJyaWVy
KClgYCwgYGBybWIoKWBgLCBgYHdtYigpYGAg6YO96ZyA6KaB5rqQ5Luj56CB5Lit55qE5rOoDQo+
ICAgICAg6YeK5p2l6Kej6YeK5a6D5Lus5q2j5Zyo5omn6KGM55qE5pON5L2c5Y+K5YW25Y6f5Zug
55qE6YC76L6R44CCDQo+DQo+IC0yNSkg5aaC5p6c6KGl5LiB5re75Yqg5LqG5Lu75L2VaW9jdGzv
vIzpgqPkuYjkuZ/opoHmm7TmlrAgYGBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9jdGwv
aW9jdGwtbnVtYmVyLnJzdGBgDQo+ICsyNCkg5aaC5p6c6KGl5LiB5re75Yqg5LqG5Lu75L2VaW9j
dGzvvIzpgqPkuYjkuZ/opoHmm7TmlrAgYGBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9j
dGwvaW9jdGwtbnVtYmVyLnJzdGBgDQo+DQo+IC0yNikg5aaC5p6c5L+u5pS55ZCO55qE5rqQ5Luj
56CB5L6d6LWW5oiW5L2/55So5LiO5Lul5LiLIGBgS2NvbmZpZ2BgIOespuWPt+ebuOWFs+eahOS7
u+S9leWGheaguEFQSeaIlg0KPiArMjUpIOWmguaenOS/ruaUueWQjueahOa6kOS7o+eggeS+nei1
luaIluS9v+eUqOS4juS7peS4iyBgYEtjb25maWdgYCDnrKblj7fnm7jlhbPnmoTku7vkvZXlhoXm
oLhBUEnmiJYNCj4gICAgICDlip/og73vvIzliJnlnKjnpoHnlKjnm7jlhbMgYGBLY29uZmlnYGAg
56ym5Y+35ZKML+aIliBgYD1tYGAg77yI5aaC5p6c6K+l6YCJ6aG55Y+v55So77yJ55qE5oOF5Ya1
DQo+ICAgICAg5LiL5rWL6K+V5Lul5LiL5aSa5Liq5p6E5bu6W+W5tumdnuaJgOaciei/meS6m+mD
veWQjOaXtuWtmOWcqO+8jOWPquaYr+Wug+S7rOeahOWQhOenjS/pmo/mnLrnu4TlkIhd77yaDQo+
DQo+IC0tDQo+IDIuMjcuMA0KPg0KDQoNCi0tIA0KQmVzdCBSZWdhcmRzDQpNYXNhaGlybyBZYW1h
ZGENCg==

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459A64E39F2
	for <lists+linux-doc@lfdr.de>; Tue, 22 Mar 2022 08:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiCVHzm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Mar 2022 03:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiCVHzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:55:41 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7350749F12
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:54:14 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id c23so19329748ioi.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=occ92gr6fSw6Oe3oNkFhKm8Zhh0GPaqmS1EEkeaT8PE=;
        b=Y6R/POyewwrfKRMZsYi/kCGAfVjPGbgU2FnBc/PdVghdNdtlwQsjfC5hnq+t/9KR+e
         O5pWiRDuoYv/pD3AlraM52FssxucZHPwEaXEavP7/3MWMz51f0FoXj+8ajGUfF4SOeIh
         QTXuPn73D04CAXivX6OXFsLeYSEr+YSuM8b7rQymD9WnIS8SEhEjcFQZ2b8UCYufVZwh
         Kr+viR4UpM3GLS+LabQwgiH0/EkZ1Lr2aBxjvHPLPBngMba/OMiK3ONbEx9693z+QFQl
         ymmeYZSvOtTxi754R2moan08TQQqUYNb7YO46xWcWavKek6LEHZNMulAoSDdlwebePL8
         b6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=occ92gr6fSw6Oe3oNkFhKm8Zhh0GPaqmS1EEkeaT8PE=;
        b=WfILIRZx0YNTZ2ojeBa0tNgx6UQ2kcwQm/hA366SgK5I/izqCtBuNr0cIjzlhE60aU
         ueUTm76TnVrMZlqcyeanaTBNAjbui5orShLSC5PEdCOlFBE4cDu0yjd0k9XSkLyY5bF+
         jL2grw6TdNPcXVx0N4h/Glu3rz8b6/ShV0aCjEtWVAVWNpUJlTTP1nQxtEyUZwGYnE6d
         aixADiK5bLFzBlYizn8rNp5noDbUKc1Q5Jug8Rn3/65OrO0MEKx2SMWSxydAqAV/yKO1
         bwdFAuwH8KV7BsDLDphPY7lF8A3//0gnd5XP89PVbH+R+FUbRXErCSsoHp0NZfWCufe7
         4iKw==
X-Gm-Message-State: AOAM531yqPFFkgKfk34dT8ZyLCJ0IlPYHzeugNbGz8qeyXa6U2SArksP
        Fyhf4s4LuS5D3/6ovlmS3iybRQDLSx7NgIiWQ+M=
X-Google-Smtp-Source: ABdhPJzw4jIgIoGpWHfiPxTXZJOxZwtW+/ILBt8/wGX9h99apHRvMcQsMTkhldkmyR/0OfTsJZcI283MBT3XenfjcDM=
X-Received: by 2002:a02:3501:0:b0:314:48d3:2d6b with SMTP id
 k1-20020a023501000000b0031448d32d6bmr11999827jaa.169.1647935653789; Tue, 22
 Mar 2022 00:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <5e0b757bb4e1d938654a9010cd39860bf71d264d.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <5e0b757bb4e1d938654a9010cd39860bf71d264d.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:53:37 +0800
Message-ID: <CAJy-AmnRQrBkfpg+C8t4Qj8f76Amdn1YtFcZDJX1NmO8h0X_Tg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] docs/zh_CN: add vm page_owner translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vcGFnZV9vd25lci5yc3QgaW50byBDaGluZXNl
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgIDIgKy0NCj4g
IC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcGFnZV9vd25lci5yc3QgICAgICB8IDExNiArKysr
KysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9wYWdlX293bmVyLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IGluZGV4IGY0NzgwMzJjZDQ3Ny4uYWE5ODNk
MDIzMDQ1IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
bS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0v
aW5kZXgucnN0DQo+IEBAIC0zMyw2ICszMyw3IEBAIFRPRE865b6F5byV55So5paH5qGj6ZuG6KKr
57+76K+R5a6M5q+V5ZCO6K+35Y+K5pe25L+u5pS55q2k5aSE77yJDQo+ICAgICBtbXVfbm90aWZp
ZXINCj4gICAgIG92ZXJjb21taXQtYWNjb3VudGluZw0KPiAgICAgcGFnZV9mcmFncw0KPiArICAg
cGFnZV9vd25lcg0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+
IEBAIC00MSw3ICs0Miw2IEBAIFRPRE9MSVNUOg0KPiAgKiBodWdldGxiZnNfcmVzZXJ2DQo+ICAq
IG51bWENCj4gICogcGFnZV9taWdyYXRpb24NCj4gLSogcGFnZV9vd25lcg0KPiAgKiBwYWdlX3Rh
YmxlX2NoZWNrDQo+ICAqIHJlbWFwX2ZpbGVfcGFnZXMNCj4gICogc2x1Yg0KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcGFnZV9vd25lci5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX293bmVyLnJzdA0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjllOTUxZmFiYmE5ZA0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Zt
L3BhZ2Vfb3duZXIucnN0DQo+IEBAIC0wLDAgKzEsMTE2IEBADQo+ICs6T3JpZ2luYWw6IERvY3Vt
ZW50YXRpb24vdm0vcGFnZV9vd25lci5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArIOWP
uOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4gKzrmoKHo
r5E6DQo+ICsNCj4gKw0KPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK3Bh
Z2Ugb3duZXI6IOi3n+i4quiwgeWIhumFjeeahOavj+S4qumhtemdog0KPiArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiAr5qaC6L+wDQo+ICs9PT09DQo+ICsNCj4gK3Bh
Z2Ugb3duZXLmmK/nlKjmnaXov73ouKrosIHliIbphY3nmoTmr4/kuIDkuKrpobXpnaLjgILlroPl
j6/ku6XnlKjmnaXosIPor5XlhoXlrZjms4TmvI/miJbmib7liLDlhoXlrZjljaDnlKjogIXjgIIN
Cj4gK+W9k+WIhumFjeWPkeeUn+aXtu+8jOacieWFs+WIhumFjeeahOS/oeaBr++8jOWmguiwg+eU
qOWghuagiOWSjOmhtemdoueahOmhuuW6j+iiq+WtmOWCqOWIsOavj+S4qumhtemdoueahOeJueWu
muWtmOWCqOS4reOAgg0KPiAr5b2T5oiR5Lus6ZyA6KaB5LqG6Kej5omA5pyJ6aG16Z2i55qE54q2
5oCB5pe277yM5oiR5Lus5Y+v5Lul6I635b6X5bm25YiG5p6Q6L+Z5Lqb5L+h5oGv44CCDQo+ICsN
Cj4gK+WwveeuoeaIkeS7rOW3sue7j+acieS6hui/vei4qumhtemdouWIhumFjS/ph4rmlL7nmoR0
cmFjZXBvaW5077yM5L2G55So5a6D5p2l5YiG5p6Q6LCB5YiG6YWN55qE5q+P5Liq6aG16Z2i5piv
DQo+ICvnm7jlvZPlpI3mnYLnmoTjgILmiJHku6zpnIDopoHmianlpKfot5/ouKrnvJPlhrLljLrv
vIzku6XpmLLmraLlnKjnlKjmiLfnqbrpl7TnqIvluo/lkK/liqjliY3lh7rnjrDph43lj6DjgILo
gIzkuJTvvIzlkK8NCj4gK+WKqOeahOeoi+W6j+S8muS4jeaWreWcsOWwhui3n+i4que8k+WGsuWM
uui9rOWHuu+8jOS+m+S7peWQjuWIhuaekO+8jOi/meWwhuS8muaUueWPmOezu+e7n+eahOihjOS4
uu+8jOS8muS6p+eUn+abtOWkmueahA0KPiAr5Y+v6IO95oCn77yM6ICM5LiN5piv5LuF5LuF5L+d
55WZ5Zyo5YaF5a2Y5Lit77yM5omA5Lul5LiN5Yip5LqO6LCD6K+V44CCDQo+ICsNCj4gK+mhtemd
ouaJgOacieiAheS5n+WPr+S7peeUqOS6juWQhOenjeebrueahOOAguS+i+Wmgu+8jOWPr+S7pemA
mui/h+avj+S4qumhtemdoueahGdmcOagh+W/l+S/oeaBr+iOt+W+l+eyvuehrueahOeijueJhw0K
PiAr57uf6K6h44CC5aaC5p6c5ZCv55So5LqGcGFnZSBvd25lcu+8jOWug+WwseW3sue7j+WunueO
sOW5tua/gOa0u+S6huOAguaIkeS7rOmdnuW4uOasoui/juWFtuS7lueUqOmAlOOAgg0KPiArDQo+
ICtwYWdlIG93bmVy5Zyo6buY6K6k5oOF5Ya15LiL5piv56aB55So55qE44CC5omA5Lul77yM5aaC
5p6c5L2g5oOz5L2/55So5a6D77yM5L2g6ZyA6KaB5Zyo5L2g55qE5ZCv5YqoY21kbGluZQ0KPiAr
5Lit5Yqg5YWlInBhZ2Vfb3duZXI9b24i44CC5aaC5p6c5YaF5qC45piv55SocGFnZSBvd25lcuae
hOW7uueahO+8jOW5tuS4lOeUseS6juayoeacieWQr+eUqOWQr+WKqA0KPiAr6YCJ6aG56ICM5Zyo
6L+Q6KGM5pe256aB55SocGFnZSBvd25lcu+8jOmCo+S5iOi/kOihjOaXtueahOW8gOmUgOaYr+W+
iOWwj+eahOOAguWmguaenOWcqOi/kOihjOaXtuemgeeUqO+8jOWug+S4jQ0KPiAr6ZyA6KaB5YaF
5a2Y5p2l5a2Y5YKo5omA5pyJ6ICF5L+h5oGv77yM5omA5Lul5rKh5pyJ6L+Q6KGM5pe25YaF5a2Y
5byA6ZSA44CC6ICM5LiU77yM6aG16Z2i5omA5pyJ6ICF5Zyo6aG16Z2i5YiG6YWN5Zmo55qEDQo+
ICvng63ot6/lvoTkuK3lj6rmj5LlhaXkuobkuKTkuKrkuI3lj6/og73nmoTliIbmlK/vvIzlpoLm
npzkuI3lkK/nlKjvvIzpgqPkuYjliIbphY3lsLHkvJrlg4/msqHmnInpobXpnaLmiYDmnInogIXn
moTlhoXmoLgNCj4gK+S4gOagt+i/m+ihjOOAgui/meS4pOS4quS4jeWPr+iDveeahOWIhuaUr+W6
lOivpeS4jeS8muW9seWTjeWIsOWIhumFjeeahOaAp+iDve+8jOeJueWIq+aYr+WcqOmdmeaAgemU
rui3s+i9rOagh+etvuS/ruihpQ0KPiAr5Yqf6IO95Y+v55So55qE5oOF5Ya15LiL44CC5Lul5LiL
5piv55Sx5LqO6L+Z5Liq5Yqf6IO96ICM5a+86Ie055qE5YaF5qC45Luj56CB5aSn5bCP55qE5Y+Y
5YyW44CCDQo+ICsNCj4gKy0g5rKh5pyJcGFnZSBvd25lcjo6DQo+ICsNCj4gKyAgIHRleHQgICAg
ZGF0YSAgICAgYnNzICAgICBkZWMgICAgIGhleCBmaWxlbmFtZQ0KPiArICAgNDgzOTIgICAyMzMz
ICAgICA2NDQgICA1MTM2OSAgICBjOGE5IG1tL3BhZ2VfYWxsb2Mubw0KPiArDQo+ICstIOaciXBh
Z2Ugb3duZXI6Og0KPiArDQo+ICsgICB0ZXh0ICAgIGRhdGEgICAgIGJzcyAgICAgZGVjICAgICBo
ZXggZmlsZW5hbWUNCj4gKyAgIDQ4ODAwICAgMjQ0NSAgICAgNjQ0ICAgNTE4ODkgICAgY2FiMSBt
bS9wYWdlX2FsbG9jLm8NCj4gKyAgIDY2NjIgICAgIDEwOCAgICAgIDI5ICAgIDY3OTkgICAgMWE4
ZiBtbS9wYWdlX293bmVyLm8NCj4gKyAgIDEwMjUgICAgICAgOCAgICAgICA4ICAgIDEwNDEgICAg
IDQxMSBtbS9wYWdlX2V4dC5vDQo+ICsNCj4gK+iZveeEtuaAu+WFseWinuWKoOS6hjhLQueahOS7
o+egge+8jOS9hnBhZ2VfYWxsb2Mub+WinuWKoOS6hjUyMOWtl+iKgu+8jOWFtuS4reS4jeWIsOS4
gOWNiuaYr+WcqGhvdHBhdGgNCj4gK+S4reOAguaehOW7uuW4puaciXBhZ2Ugb3duZXLnmoTlhoXm
oLjvvIzlubblnKjpnIDopoHml7bmiZPlvIDlroPvvIzlsIbmmK/osIPor5XlhoXmoLjlhoXlrZjp
l67popjnmoTmnIDkvbPpgInmi6njgIINCj4gKw0KPiAr5pyJ5LiA5Liq6Zeu6aKY5piv55Sx5a6e
546w57uG6IqC5byV6LW355qE44CC6aG15omA5pyJ6ICF5bCG5L+h5oGv5a2Y5YKo5Yiwc3RydWN0
IHBhZ2XmianlsZXnmoTlhoXlrZjkuK3jgILov5kNCj4gK+S4quWGheWtmOeahOWIneWni+WMluaX
tumXtOavlOeogOeWj+WGheWtmOezu+e7n+S4reeahOmhtemdouWIhumFjeWZqOWQr+WKqOeahOaX
tumXtOimgeaZmuS4gOS6m++8jOaJgOS7pe+8jOWcqOWIneWni+WMlg0KPiAr5LmL5YmN77yM6K64
5aSa6aG16Z2i5Y+v5Lul6KKr5YiG6YWN77yM5L2G5a6D5Lus5rKh5pyJ5omA5pyJ6ICF5L+h5oGv
44CC5Li65LqG6Kej5Yaz6L+Z5Liq6Zeu6aKY77yM6L+Z5Lqb5pep5pyf5YiG6YWN55qEDQo+ICvp
obXpnaLlnKjliJ3lp4vljJbpmLbmrrXooqvosIPmn6XlubbmoIforrDkuLrliIbphY3jgILomb3n
hLbov5nlubbkuI3mhI/lkbPnnYDlroPku6zmnInmraPnoa7nmoTmiYDmnInogIXkv6Hmga/vvIzk
vYboh7MNCj4gK+Wwke+8jOaIkeS7rOWPr+S7peabtOWHhuehruWcsOWIpOaWreivpemhteaYr+WQ
puiiq+WIhumFjeOAguWcqDJHQuWGheWtmOeahHg4Ni02NOiZmuaLn+acuuS4iu+8jOaciTEzMzQz
DQo+ICvkuKrml6nmnJ/liIbphY3nmoTpobXpnaLooqvmjZXmjYnlkozmoIforrDvvIzlsL3nrqHl
roPku6zlpKfpg6jliIbmmK/nlLHnu5PmnoTpobXmianlsZXlip/og73liIbphY3nmoTjgILmgLvk
uYvvvIzlnKjov5kNCj4gK+S5i+WQju+8jOayoeacieS7u+S9lemhtemdouWkhOS6juacqui/vei4
queKtuaAgeOAgg0KPiArDQo+ICvkvb/nlKjmlrnms5UNCj4gKz09PT09PT09DQo+ICsNCj4gKzEp
IOaehOW7uueUqOaIt+epuumXtOeahOW4ruWKqTo6DQo+ICsNCj4gKyAgICAgICBjZCB0b29scy92
bQ0KPiArICAgICAgIG1ha2UgcGFnZV9vd25lcl9zb3J0DQo+ICsNCj4gKzIpIOWQr+eUqHBhZ2Ug
b3duZXI6IOa3u+WKoCAicGFnZV9vd25lcj1vbiIg5YiwIGJvb3QgY21kbGluZS4NCj4gKw0KPiAr
Mykg5YGa5L2g5oOz6LCD6K+V55qE5bel5L2c44CCDQo+ICsNCj4gKzQpIOWIhuaekOadpeiHqumh
temdouaJgOacieiAheeahOS/oeaBrzo6DQo+ICsNCj4gKyAgICAgICBjYXQgL3N5cy9rZXJuZWwv
ZGVidWcvcGFnZV9vd25lciA+IHBhZ2Vfb3duZXJfZnVsbC50eHQNCj4gKyAgICAgICAuL3BhZ2Vf
b3duZXJfc29ydCBwYWdlX293bmVyX2Z1bGwudHh0IHNvcnRlZF9wYWdlX293bmVyLnR4dA0KPiAr
DQo+ICsgICBgYHBhZ2Vfb3duZXJfZnVsbC50eHRgYCDnmoTkuIDoiKzovpPlh7rmg4XlhrXlpoLk
uIso6L6T5Ye65L+h5oGv5peg57+76K+R5Lu35YC8KTo6DQo+ICsNCj4gKyAgICAgICBQYWdlIGFs
bG9jYXRlZCB2aWEgb3JkZXIgWFhYLCAuLi4NCj4gKyAgICAgICBQRk4gWFhYIC4uLg0KPiArICAg
ICAgIC8vIERldGFpbGVkIHN0YWNrDQo+ICsNCj4gKyAgICAgICBQYWdlIGFsbG9jYXRlZCB2aWEg
b3JkZXIgWFhYLCAuLi4NCj4gKyAgICAgICBQRk4gWFhYIC4uLg0KPiArICAgICAgIC8vIERldGFp
bGVkIHN0YWNrDQo+ICsNCj4gKyAgIGBgcGFnZV9vd25lcl9zb3J0YGAg5bel5YW35b+955Wl5LqG
IGBgUEZOYGAg6KGM77yM5bCG5Ymp5L2Z55qE6KGM5pS+5ZyoYnVm5Lit77yM5L2/55SocmVnZXhw
5o+QDQo+ICsgICDlj5bpobXluo/lgLzvvIzorqHnrpdidWbnmoTmrKHmlbDlkozpobXmlbDvvIzm
nIDlkI7moLnmja7lj4LmlbDov5vooYzmjpLluo/jgIINCj4gKw0KPiArICAg5ZyoIGBgc29ydGVk
X3BhZ2Vfb3duZXIudHh0YGAg5Lit5Y+v5Lul55yL5Yiw5YWz5LqO6LCB5YiG6YWN5LqG5q+P5Liq
6aG16Z2i55qE57uT5p6c44CC5LiA6Iis6L6T5Ye6OjoNCj4gKw0KPiArICAgICAgIFhYWCB0aW1l
cywgWFhYIHBhZ2VzOg0KPiArICAgICAgIFBhZ2UgYWxsb2NhdGVkIHZpYSBvcmRlciBYWFgsIC4u
Lg0KPiArICAgICAgIC8vIERldGFpbGVkIHN0YWNrDQo+ICsNCj4gKyAgIOm7mOiupOaDheWGteS4
i++8jCBgYHBhZ2Vfb3duZXJfc29ydGBgIOaYr+agueaNrmJ1ZueahOaXtumXtOadpeaOkuW6j+ea
hOOAguWmguaenOS9oOaDsw0KPiArICAg5oyJYnVm55qE6aG15pWw5o6S5bqP77yM6K+35L2/55So
LW3lj4LmlbDjgILor6bnu4bnmoTlj4LmlbDmmK86DQo+ICsNCj4gKyAgIOWfuuacrOWHveaVsDoN
Cj4gKw0KPiArICAgICAgIFNvcnQ6DQo+ICsgICAgICAgICAgICAgICAtYSAgICAgICAgICAgICAg
5oyJ5YaF5a2Y5YiG6YWN5pe26Ze05o6S5bqPDQo+ICsgICAgICAgICAgICAgICAtbSAgICAgICAg
ICAgICAg5oyJ5oC75YaF5a2Y5o6S5bqPDQo+ICsgICAgICAgICAgICAgICAtcCAgICAgICAgICAg
ICAg5oyJcGlk5o6S5bqP44CCDQo+ICsgICAgICAgICAgICAgICAtUCAgICAgICAgICAgICAg5oyJ
dGdpZOaOkuW6j+OAgg0KPiArICAgICAgICAgICAgICAgLXIgICAgICAgICAgICAgIOaMieWGheWt
mOmHiuaUvuaXtumXtOaOkuW6j+OAgg0KPiArICAgICAgICAgICAgICAgLXMgICAgICAgICAgICAg
IOaMieWghuagiOi3n+i4quaOkuW6j+OAgg0KPiArICAgICAgICAgICAgICAgLXQgICAgICAgICAg
ICAgIOaMieaXtumXtOaOkuW6j++8iOm7mOiupO+8ieOAgg0KPiArDQo+ICsgICDlhbblroPlh73m
lbA6DQo+ICsNCj4gKyAgICAgICBDdWxsOg0KPiArICAgICAgICAgICAgICAgLWMgICAgICAgICAg
ICAgIOmAmui/h+avlOi+g+WghuagiOi3n+i4quiAjOS4jeaYr+aAu+Wdl+adpei/m+ihjOWJlOmZ
pOOAgg0KPiArDQo+ICsgICAgICAgRmlsdGVyOg0KPiArICAgICAgICAgICAgICAgLWYgICAgICAg
ICAgICAgIOi/h+a7pOaOieWGheWtmOW3suiiq+mHiuaUvueahOWdl+eahOS/oeaBr+OAgg0KPiAt
LQ0KPiAyLjI3LjANCj4NCg==

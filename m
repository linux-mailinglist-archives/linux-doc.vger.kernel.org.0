Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217C54D18A4
	for <lists+linux-doc@lfdr.de>; Tue,  8 Mar 2022 14:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344996AbiCHNFs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Mar 2022 08:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346893AbiCHNFr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 08:05:47 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA24348314
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 05:04:50 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id k25so4951015iok.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 05:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1XjXj2jXhetk9IqI/+Fagzr7QudR4vH61nqW2UA5SqY=;
        b=ZTRJRbINSTegn0XD8Ooxr1nTBnGXAKD6lEpGx4DB/5D67E0XN19aFmgoMfCmYwVP//
         eUsPYfHtqjbX/ky1+nXzLrYjFUV2zOoLyGMC23reGZqWOF80J65s3x0t0V2/80YLwZTP
         GRZu+wEKMlqJj0TnONo82Y1la4338DXKXDEA7razuPEH6lMXICpbqeak1uELAYFSwdt0
         +itEwz2xAfPsusBnFhZ3S/So/vky+OR+Yg9Rg0lqhh6mJW6z24OhCzOGOt08/QmbhQai
         jwHvpl4DB50RiTy6zd8FDXvcWEVCPKD/szByABt6buFgyt5UtDS3xi1QWOa2cilE6uGT
         r77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1XjXj2jXhetk9IqI/+Fagzr7QudR4vH61nqW2UA5SqY=;
        b=rZbCNQaBlRY/I3GWJJcWwBSaQPKmL7kPzRgzIQSFkSthpNXhrSwKF4DnFMGtxRBtqT
         ScAkxwx5iRvxmMS/yE9Rg3si1xxJ/Dwpq1e6/mlV+JrcG4wK9jOnyQj3S0sGBwfPZMI4
         +9ibYoCLObbXNi2KlQjrMoyMkw9G4dwXh4Re8XHgqBgOHZaVp9fwnOmpm0Tvmf3dmc+8
         rsI3K+ffWcLk0KZsmyYSb3BCwxGk6JrCrxqwIE30/obDtvr5U1QDQsIpECHBiHkoDv0h
         +lECoq1YrQZloCIzqai60zJPh3WcE7IeyNnaCivHwotDhbNbH60HKEFgdAK88iAdArlk
         fVqg==
X-Gm-Message-State: AOAM533ufsAaVUFjOdbwGRyY8emAUjAwihSSbuLkZfBrTLTd48QLjXTb
        fNtcM2sjPpXr4/BDjA9cExF8zdMaZpw0dqQVPOb+aYSzmjrzNH7Y
X-Google-Smtp-Source: ABdhPJx01Yewb8nt9NBISfcmgKGV+JLJQxLafeWP+diyElErXKbCQuxPe6mIBvM01VNMDlAB9KRlI2hDUgpAB8p1dRw=
X-Received: by 2002:a02:928e:0:b0:317:c128:be69 with SMTP id
 b14-20020a02928e000000b00317c128be69mr9122529jah.2.1646744689741; Tue, 08 Mar
 2022 05:04:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646496448.git.siyanteng@loongson.cn> <e3bf0689a815a73665e57fe46ea81259ff08e660.1646496448.git.siyanteng@loongson.cn>
In-Reply-To: <e3bf0689a815a73665e57fe46ea81259ff08e660.1646496448.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 8 Mar 2022 21:04:13 +0800
Message-ID: <CAJy-Amk6M24F9xSVZq7TdMkYR8RHttwxr4JoDYifNqYrcpwyZA@mail.gmail.com>
Subject: Re: [PATCH 02/12] docs/zh_CN: add vm hwpoison translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBNYXIgNiwgMjAyMiBhdCAxMjoyNCBBTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgLi4uL3ZtL2h3cG9pc29uLnJzdCBpbnRv
IENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJz
dCAgICAgICAgfCAxNjYgKysrKysrKysrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgIDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTY3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9od3BvaXNvbi5yc3QNCj4NCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJzdA0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdjNDQ3N2MzM2U1Ng0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3ZtL2h3cG9pc29uLnJzdA0KPiBAQCAtMCwwICsxLDE2NiBAQA0KPiArDQo+ICs6T3JpZ2luYWw6
IERvY3VtZW50YXRpb24vdm0vaHdwb2lzb24ucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs6
5qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09DQo+ICtod3BvaXNvbg0KPiArPT09PT09PT0N
Cj4gKw0KPiAr5LuA5LmI5pivaHdwb2lzb24/DQo+ICs9PT09PT09PT09PT09PT0NCj4gKw0KPiAr
DQo+ICvljbPlsIbmjqjlh7rnmoToi7HnibnlsJRDUFXmlK/mjIHku47kuIDkupvlhoXlrZjplJno
r6/kuK3mgaLlpI3vvIggYGBNQ0HmgaLlpI1gYCDvvInjgILov5npnIDopoHmk43kvZzns7vnu5/l
rqPluIMNCj4gK+S4gOS4qumhtemdoiJwb2lzb25lZCLvvIzmnYDmrbvkuI7kuYvnm7jlhbPnmoTo
v5vnqIvvvIzlubbpgb/lhY3lnKjmnKrmnaXkvb/nlKjlroPjgIINCj4gKw0KPiAr6L+Z5Liq6KGl
5LiB5YyF5Zyo6Jma5ouf5py65Lit5a6e546w5LqG5b+F6KaB55qE5Z+656GA6K6+5pa944CCDQoN
CiLlrp7njrDkuoblv4XopoHnmoQo57yW56iLKeahhuaetiI/DQoNCj4gKw0KPiAr5byV55So5qaC
6L+w5Lit55qE6K+E6K66OjoNCj4gKw0KPiArICAgICAgIOmrmOawtOW5s+eahOacuuWZqOajgOaf
peWkhOeQhueoi+W6j+OAguWkhOeQhuiiq+ehrOS7tuaKpeWRiuS4uuaNn+Wdj+eahOmhtemdou+8
jOmAmuW4uOaYr+eUseS6jjLkvY1FQ0PlhoXlrZjmiJYNCg0K4oCc6auY5bGC5qyh55qE5py65Zmo
5qOA5p+l5aSE55CG56iL5bqP4oCd77yfDQoNCj4gKyAgICAgICDpq5jpgJ/nvJPlrZjmlYXpmpzj
gIINCj4gKw0KPiArICAgICAgIOi/meS4u+imgeaYr+mSiOWvueWcqOWQjuWPsOajgOa1i+WIsOea
hOaNn+Wdj+eahOmhtemdouOAguW9k+W9k+WJjeeahENQVeivleWbvuiuv+mXruWug+aXtu+8jOW9
k+WJjei/kOihjOeahOi/m+eoiw0KPiArICAgICAgIOWPr+S7peebtOaOpeiiq+adgOatu+OAgui/
meaEj+WRs+edgO+8jOWmguaenOmUmeivr+eUseS6juafkOenjeWOn+WboOS4jeiDveiiq+WkhOeQ
hu+8jOWwseWPr+S7peWuieWFqOWcsOW/veeVpeWug++8jA0KPiArICAgICAgIOWboOS4uui/mOay
oeacieiuv+mXruaNn+Wdj+eahOmhtemdouOAguebuOWPje+8jOW9k+i/meenjeaDheWGteWPkeeU
n+aXtu+8jOWPpuS4gOS4quacuuWZqOajgOafpeWwhuWHuueOsOOAgg0KDQpjaGFuZ2UgdGhlIHdv
cmRzIHRvOiDlm6DkuLrov5jmsqHmnInorr/pl67mjZ/lnY/nmoTpobXpnaIsIOWmguaenOmUmeiv
r+eUseS6juafkOenjeWOn+WboOS4jeiDveiiq+WkhOeQhu+8jOWwseWPr+S7peWuieWFqOWcsOW/
veeVpeWugy4g6ICM5LiN5piv55So5Y+m5aSW5LiA5Liq5py65Zmo5qOA5p+l5Y675aSE55CG5a6D
44CCDQoNCj4gKw0KPiArICAgICAgIOWkhOeQhuS4jeWQjOeKtuaAgeeahOmhtemdoue8k+WtmOmh
teOAgui/memHjOajmOaJi+eahOmDqOWIhuaYr++8jOaIkeS7rOWPr+S7peW8guatpeiuv+mXruS7
u+S9lemhtemdoue7meWFtuS7luiZmuaLnw0KDQrnm7jlr7nkuo7lhbbku5bomZrmi5/mnLrnlKjm
iLfvvIwg5oiR5Lus5Y+v5Lul5byC5q2l6K6/6Zeu5Lu75L2V6aG16Z2i44CCDQoNCj4gKyAgICAg
ICDmnLrnlKjmiLfvvIzlm6DkuLrlhoXlrZjmlYXpmpzlj6/og73pmo/ml7bpmo/lnLDlj5HnlJ/v
vIzlj6/og73ov53lj43kuobku5bku6znmoTkuIDkupvlgYforr7jgILov5nlsLHmmK/kuLrku4Dk
uYjov5kNCj4gKyAgICAgICDmrrXku6PnoIHlv4XpobvpnZ7luLjlsI/lv4PjgILkuIDoiKzmnaXo
r7TvvIzlroPor5Xlm77kvb/nlKjmraPluLjnmoTplIHlrprop4TliJnvvIzlpoLojrflvpfmoIfl
h4bplIHvvIzljbPkvb/ov5nmhI8NCj4gKyAgICAgICDlkbPnnYDplJnor6/lpITnkIblj6/og73p
nIDopoHlvojplb/nmoTml7bpl7TjgIINCj4gKw0KPiArICAgICAgIOi/memHjOeahOS4gOS6m+aT
jeS9nOacieeCueS9juaViO+8jOW5tuS4lOWFt+aciemdnue6v+aAp+eahOeul+azleWkjeadguaA
p++8jOWboOS4uuaVsOaNrue7k+aehOayoeaciemSiOWvuei/meenjeaDhQ0KPiArICAgICAgIOWG
tei/m+ihjOS8mOWMluOAgueJueWIq+aYr+S7jnZtYeWIsOi/m+eoi+eahOaYoOWwhOWwseaYr+i/
meenjeaDheWGteOAgueUseS6jui/meenjeaDheWGtemihOiuoeaYr+e9leingeeahO+8jOaIkQ0K
PiArICAgICAgIOS7rOW4jOacm+aIkeS7rOWPr+S7peaRhuiEsei/meenjeaDheWGteOAgg0KPiAr
DQo+ICvor6Xku6PnoIHnlLFtbS9tZW1vcnktZmFpbHVyZS5j5Lit55qE6auY57qn5aSE55CG56iL
5bqP44CB5LiA5Liq5paw55qE6aG16Z2icG9pc29uIOS9jeWSjOiZmuaLn+acuuS4reeahA0KPiAr
5ZCE56eN5qOA5p+l57uE5oiQ77yM55So5p2l5aSE55CGcG9pc29uIOeahOmhtemdouOAgg0KPiAr
DQo+ICvnjrDlnKjnmoTkuLvopoHpkojlr7nnmoTmmK9LVk3lrqLmiLfmnLrvvIzkvYblroPpgILn
lKjkuo7miYDmnInnsbvlnovnmoTlupTnlKjnqIvluo/jgILmlK/mjIFLVk3pnIDopoHmnIDov5Hn
moRxZW11LWt2bQ0KDQrnjrDlnKjkuLvopoHnm67moIfmmK9LVk3lrqLmiLfmnLrvvJ8NCg0KPiAr
54mI5pys44CCDQo+ICsNCj4gK+WvueS6jktWTeeahOS9v+eUqO+8jOmcgOimgeS4gOS4quaWsOea
hOS/oeWPt+exu+Wei++8jOi/meagt0tWTeWwseWPr+S7peeUqOmAguW9k+eahOWcsOWdgOWwhuac
uuWZqOajgOafpeazqOWFpeWIsOWuouaItw0KPiAr5py65Lit44CC6L+Z5Zyo55CG6K665LiK5Lmf
5YWB6K645YW25LuW5bqU55So56iL5bqP5aSE55CG5YaF5a2Y5pWF6Zqc44CC5oiR5Lus55qE5pyf
5pyb5piv77yM5Yeg5LmO5omA5pyJ55qE5bqU55So56iL5bqP6YO95LiNDQo+ICvkvJrov5nmoLfl
gZrvvIzkvYbkuIDkupvpnZ7luLjkuJPkuJrnmoTlupTnlKjnqIvluo/lj6/og73kvJrov5nmoLfl
gZrjgIINCg0KY2hhbmdlIHRvOiDigJzmiYDmnInnmoTlupTnlKjnqIvluo/pg73kuI3opoHov5nm
oLflgZrigJ3vvJ8NCg0KPiArDQo+ICvmlYXpmpzmgaLlpI3mqKHlvI8NCj4gKz09PT09PT09PT09
PQ0KPiArDQo+ICvmnInkuKTnp43vvIjlrp7pmYXkuIrmmK/kuInnp43vvInmqKHlvI/nmoTlhoXl
rZjmlYXpmpzmgaLlpI3lj6/ku6XlnKjjgIINCj4gKw0KPiArdm0ubWVtb3J5X2ZhaWx1cmVfcmVj
b3Zlcnkgc3lzY3RsIOe9rumbtjoNCj4gKyAgICAgICDmiYDmnInnmoTlhoXlrZjmlYXpmpzpg73k
vJrlr7zoh7RwYW5pY+OAguivt+S4jeimgeWwneivleaBouWkjeOAgg0KPiArDQo+ICtlYXJseSBr
aWxsDQoNCuaXqeacn+WkhOeQhu+8nw0KDQo+ICsgICAgICAgKOWPr+S7peWcqOWFqOWxgOWSjOav
j+S4qui/m+eoi+S4reaOp+WItikg5LiA5pem5qOA5rWL5Yiw6ZSZ6K+v77yM56uL5Y2z5ZCR5bqU
55So56iL5bqP5Y+R6YCBU0lHQlVTIOi/meWFgeiuuA0KPiArICAgICAgIOW6lOeUqOeoi+W6j+S7
pea4qeWSjOeahOaWueW8j+WkhOeQhuWGheWtmOmUmeivr++8iOS+i+Wmgu+8jOaUvuW8g+WPl+W9
seWTjeeahOWvueixoe+8iSDov5nmmK9LVk0gcWVtdeS9v+eUqOeahA0KPiArICAgICAgIOaooeW8
j+OAgg0KPiArDQo+ICtsYXRlIGtpbGwNCg0K5o6o6L+f5aSE55CG77yfDQoNCj4gKyAgICAgICDl
vZPlupTnlKjnqIvluo/ov5DooYzliLDmjZ/lnY/nmoTpobXpnaLml7bvvIzlj5HpgIFTSUdCVVPj
gILov5nlr7nkuI3nn6XpgZPlhoXlrZjplJnor6/nmoTlupTnlKjnqIvluo/mnaXor7TmmK8NCj4g
KyAgICAgICDmnIDlpb3nmoTvvIzpu5jorqTmg4XlhrXkuIvms6jmhI/kuIDkupvpobXpnaLmgLvm
mK/ooqvlvZPkvZwgbGF0ZSBraWxs5aSE55CG44CCDQo+ICsNCj4gK+eUqOaIt+aOp+WItg0KPiAr
PT09PT09PT0NCj4gKw0KPiArdm0ubWVtb3J5X2ZhaWx1cmVfcmVjb3ZlcnkNCj4gKyAgICAgICDl
j4LpmIUgc3lzY3RsLnR4dA0KPiArDQo+ICt2bS5tZW1vcnlfZmFpbHVyZV9lYXJseV9raWxsDQo+
ICsgICAgICAg5YWo5bGA5ZCv55SoZWFybHkga2lsbA0KPiArDQo+ICtQUl9NQ0VfS0lMTA0KPiAr
ICAgICAgIOiuvue9rmVhcmx5L2xhdGUga2lsbCBtb2RlL3JldmVydCDliLDns7vnu5/pu5jorqTl
gLzjgIINCj4gKw0KPiArICAgICAgIGFyZzE6IFBSX01DRV9LSUxMX0NMRUFSOg0KPiArICAgICAg
ICAgICAgICAg5oGi5aSN5Yiw57O757uf6buY6K6k5YC8DQo+ICsgICAgICAgYXJnMTogUFJfTUNF
X0tJTExfU0VUOg0KPiArICAgICAgICAgICAgICAgYXJnMuWumuS5ieS6hue6v+eoi+eJueWumuao
oeW8jw0KPiArDQo+ICsgICAgICAgICAgICAgICBQUl9NQ0VfS0lMTF9FQVJMWToNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgRWFybHkga2lsbA0KPiArICAgICAgICAgICAgICAgUFJfTUNFX0tJ
TExfTEFURToNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgTGF0ZSBraWxsDQo+ICsgICAgICAg
ICAgICAgICBQUl9NQ0VfS0lMTF9ERUZBVUxUDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIOS9
v+eUqOezu+e7n+WFqOWxgOm7mOiupOWAvA0KPiArDQo+ICsgICAgICAg5rOo5oSP77yM5aaC5p6c
5L2g5oOz5pyJ5LiA5Liq5LiT6Zeo55qE57q/56iL5Luj6KGo6L+b56iL5aSE55CGU0lHQlVTKEJV
U19NQ0VFUlJfQU8p77yM5L2g5bqU6K+l5ZyoDQo+ICsgICAgICAg5oyH5a6a57q/56iL5LiK6LCD
55SocHJjdGwoUFJfTUNFX0tJTExfRUFSTFkp44CC5ZCm5YiZ77yMU0lHQlVT5bCG6KKr5Y+R6YCB
5Yiw5Li757q/56iL44CCDQo+ICsNCj4gK1BSX01DRV9LSUxMX0dFVA0KPiArICAgICAgIOi/lOWb
nuW9k+WJjeaooeW8jw0KPiArDQo+ICvmtYvor5UNCj4gKz09PT0NCj4gKw0KPiArKiBtYWR2aXNl
KE1BRFZfSFdQT0lTT04sIC4uLi4pIChhcyByb290KSAtIOWcqOa1i+ivlei/h+eoi+S4rVBvaXNv
buS4gOS4qumhtemdog0KPiArDQo+ICsqIOmAmui/h2RlYnVnZnMgYGAvc3lzL2tlcm5lbC9kZWJ1
Zy9od3BvaXNvbi9gYCBod3BvaXNvbi1pbmplY3TmqKHlnZcNCj4gKw0KPiArICBjb3JydXB0LXBm
bg0KPiArICAgICAgIOWcqFBGTuWkhOazqOWFpWh3cG9pc29u5pWF6Zqc77yM5bm2ZWNob2Vk5Yiw
6L+Z5Liq5paH5Lu244CC6L+Z5YGa5LqG5LiA5Lqb5pep5pyf6L+H5ruk77yM5Lul6YG/DQo+ICsg
ICAgICAg5YWN5Zyo5rWL6K+V5aWX5Lu25Lit5o2f5Z2P55qE6Z2e6aKE5pyf6aG16Z2i44CCDQoN
CuS7pemBv+WFjeWcqOa1i+ivleWll+S7tuS4reaNn+Wdj+mdnumihOacn+mhtemdou+8nw0KDQpU
aGlzIGRvYyBpcyBoYXJkIHRvIHVuZGVyc3RhbmQgZm9yIGRldGFpbHMsIGd1ZXNzIHRoYXQgY2F1
c2UgbW9yZQ0KdHJvdWJsZSB0byB0cmFuc2FsYXRlLg0KDQpUaGFua3MNCkFsZXgNCg0KPiArICB1
bnBvaXNvbi1wZm4NCj4gKyAgICAgICDlnKhQRk7nmoRTb2Z0d2FyZS11bnBvaXNvbiDpobXpnaLl
kbzlupTliLDov5nkuKrmlofku7bjgILov5nmoLfvvIzkuIDkuKrpobXpnaLlj6/ku6Xlho3mrKHo
oqsNCj4gKyAgICAgICDlpI3nlKjjgILov5nlj6rlr7lMaW51eOazqOWFpeeahOaVhemanOi1t+S9
nOeUqO+8jOWvueecn+ato+eahOWGheWtmOaVhemanOS4jei1t+S9nOeUqOOAgg0KPiArDQo+ICsg
IOazqOaEj+i/meS6m+azqOWFpeaOpeWPo+W5tuS4jeeos+Wumu+8jOWPr+iDveS8muWcqOS4jeWQ
jOeahOWGheaguOeJiOacrOS4reWPkeeUn+WPmOWMlg0KPiArDQo+ICsgIGNvcnJ1cHQtZmlsdGVy
LWRldi1tYWpvciwgY29ycnVwdC1maWx0ZXItZGV2LW1pbm9yDQo+ICsgICAgICAg5Y+q5aSE55CG
5LiO5Z2X6K6+5aSHbWFqb3IvbWlub3LlrprkuYnnmoTmlofku7bns7vnu5/nm7jlhbPnmoTpobXp
naLnmoTlhoXlrZjmlYXpmpzjgIItMVXmmK/pgJoNCj4gKyAgICAgICDphY3nrKblgLzjgILov5nl
upTor6Xlj6rnlKjkuo7kurrlt6Xms6jlhaXnmoTmtYvor5XjgIINCj4gKw0KPiArICBjb3JydXB0
LWZpbHRlci1tZW1jZw0KPiArICAgICAgIOmZkOWItuazqOWFpeWIsG1lbWdyb3Vw5oul5pyJ55qE
6aG16Z2i44CC55SxbWVtY2fnmoRpbm9kZeWPt+aMh+WumuOAgg0KPiArDQo+ICsgICAgICAgRXhh
bXBsZTo6DQo+ICsNCj4gKyAgICAgICAgICAgICAgIG1rZGlyIC9zeXMvZnMvY2dyb3VwL21lbS9o
d3BvaXNvbg0KPiArDQo+ICsgICAgICAgICAgICAgICB1c2VtZW0gLW0gMTAwIC1zIDEwMDAgJg0K
PiArICAgICAgICAgICAgICAgZWNobyBgam9icyAtcGAgPiAvc3lzL2ZzL2Nncm91cC9tZW0vaHdw
b2lzb24vdGFza3MNCj4gKw0KPiArICAgICAgICAgICAgICAgbWVtY2dfaW5vPSQobHMgLWlkIC9z
eXMvZnMvY2dyb3VwL21lbS9od3BvaXNvbiB8IGN1dCAtZjEgLWQnICcpDQo+ICsgICAgICAgICAg
ICAgICBlY2hvICRtZW1jZ19pbm8gPiAvZGVidWcvaHdwb2lzb24vY29ycnVwdC1maWx0ZXItbWVt
Y2cNCj4gKw0KPiArICAgICAgICAgICAgICAgcGFnZS10eXBlcyAtcCBgcGlkb2YgaW5pdGAgICAt
LWh3cG9pc29uICAjIHNoYWxsIGRvIG5vdGhpbmcNCj4gKyAgICAgICAgICAgICAgIHBhZ2UtdHlw
ZXMgLXAgYHBpZG9mIHVzZW1lbWAgLS1od3BvaXNvbiAgIyBwb2lzb24gaXRzIHBhZ2VzDQo+ICsN
Cj4gKyAgY29ycnVwdC1maWx0ZXItZmxhZ3MtbWFzaywgY29ycnVwdC1maWx0ZXItZmxhZ3MtdmFs
dWUNCj4gKyAgICAgICDlvZPmjIflrprml7bvvIzlj6rmnInlnKgoKHBhZ2VfZmxhZ3MgJiBtYXNr
KSA9PSB2YWx1ZSnnmoTmg4XlhrXkuIvmiY3kvJpwb2lzb27pobXpnaLjgIINCj4gKyAgICAgICDo
v5nlhYHorrjlr7norrjlpJrnp43nsbvnmoTpobXpnaLov5vooYzljovlipvmtYvor5XjgIJwYWdl
X2ZsYWdz5LiOL3Byb2Mva3BhZ2VmbGFnc+S4reeahOebuA0KPiArICAgICAgIOWQjOOAgui/meS6
m+agh+W/l+S9jeWcqGluY2x1ZGUvbGludXgva2VybmVsLXBhZ2UtZmxhZ3MuaOS4reWumuS5ie+8
jOW5tuWcqA0KPiArICAgICAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW0vcGFnZW1hcC5y
c3TkuK3orrDlvZXjgIINCj4gKw0KPiArKiDmnrbmnoTnibnlrprnmoRNQ0Xms6jlhaXlmagNCj4g
Kw0KPiArICB4ODYg5pyJIG1jZS1pbmplY3QsIG1jZS10ZXN0DQo+ICsNCj4gKyAg5ZyobWNlLXRl
c3TkuK3nmoTkuIDkupvkvr/mkLrlvI9od3BvaXNvbua1i+ivleeoi+W6j++8jOingeS4i+aWh+OA
gg0KPiArDQo+ICvlvJXnlKgNCj4gKz09PT0NCj4gKw0KPiAraHR0cDovL2hhbG9iYXRlcy5kZS9t
Y2UtbGMwOS0yLnBkZg0KPiArICAgICAgIDA55bm0TGludXhDb27nmoTmpoLov7DmvJTorrINCj4g
Kw0KPiArZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9jcHUvbWNlL21jZS10ZXN0
LmdpdA0KPiArICAgICAgIOa1i+ivleWll+S7tu+8iOWcqHRzcmPkuK3nmoRod3BvaXNvbueJueWu
muWPr+enu+akjea1i+ivle+8ieOAgg0KPiArDQo+ICtnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL3V0aWxzL2NwdS9tY2UvbWNlLWluamVjdC5naXQNCj4gKyAgICAgICB4ODbnibnlrprnmoTm
s6jlhaXlmagNCj4gKw0KPiArDQo+ICvpmZDliLYNCj4gKz09PT0NCj4gKy0g5LiN5piv5omA5pyJ
55qE6aG16Z2i57G75Z6L6YO96KKr5pSv5oyB77yM6ICM5LiU5rC46L+c5LiN5Lya44CC5aSn5aSa
5pWw5YaF5qC45YaF6YOo5a+56LGh5LiN6IO96KKr5oGiDQo+ICsgIOWkje+8jOebruWJjeWPquac
iUxSVemhteOAgg0KPiArDQo+ICstLS0NCj4gK0FuZGkgS2xlZW4sIDIwMDnlubQxMOaciA0KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IGluZGV4
IGNjOGQ2OGIwY2JiNS4uZGQwYjNkNGMwYWI4IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IEBAIC0yNywxMiArMjcsMTIgQEAgVE9E
TzrlvoXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTl
pITvvIkNCj4gICAgIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gICAgIGhpZ2htZW0NCj4gICAgIGZy
b250c3dhcA0KPiArICAgaHdwb2lzb24NCj4NCj4gIFRPRE9MSVNUOg0KPiAgKiBhcmNoX3BndGFi
bGVfaGVscGVycw0KPiAgKiBmcmVlX3BhZ2VfcmVwb3J0aW5nDQo+ICAqIGhtbQ0KPiAtKiBod3Bv
aXNvbg0KPiAgKiBodWdldGxiZnNfcmVzZXJ2DQo+ICAqIG1lbW9yeS1tb2RlbA0KPiAgKiBtbXVf
bm90aWZpZXINCj4gLS0NCj4gMi4yNy4wDQo+DQo=

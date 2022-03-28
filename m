Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81904E9667
	for <lists+linux-doc@lfdr.de>; Mon, 28 Mar 2022 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiC1MWE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Mar 2022 08:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbiC1MWE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:22:04 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F8C46662
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:20:21 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id r2so16734400iod.9
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TVaN/C15Pf3jEySb4FT2TQ/xAL4rQEkfJ+SS/zVZe2g=;
        b=JJ3LI0x0sZm36cBgfY5NQUTgPNuAGPx4yV+PRpOEF//PLaVv1/deQ3l/LI0BJaV2IM
         qR6F+AIUBr96pCdeffcTbRJCc5vk7Y3l2nBOTLkjtg3HSMtD6empk7+aCS7Ds+xbdbvQ
         QfPOWg83/W7V2pET0ORc6JHf3XMBUkOMNfEqKCkWMmOsZjQCkO9ZiNa+LoBLuBYlH+mz
         wxP3dDL9hqxSLqnvtZ0Kkm4ZuTcei2AGIo0ylq/D/8Asx9b8zc/QiD/CJZ5I/KtHCJvo
         UbMvytBTli7BVBo6jVai1Rkd0mCWttXHKx4+nRoVKGAZiKO/v8+wrpAPOyLNOdr3dKLM
         2iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TVaN/C15Pf3jEySb4FT2TQ/xAL4rQEkfJ+SS/zVZe2g=;
        b=8DFLS1oGBM7s4Xfovrm0HoYBf4Zj7gYRz4fqwWbWH9IAgag7vAcnlUQZ9VV9KR2bRy
         S1Bds0d36Go7d76QyurjibGvXLg3XmBzVzGIYfoLMakaWPG4edZxvEaWHPJ6cbEXXZXw
         Fdr4vWu33MtMvsIxCuELBzZBbg8Xfa/TbTqxYEoWa9xQnQcEbY/BjUEFamSyop1cdSj/
         77ktVuW9FvttvPMEtnIMirSB3aC+PAuqmS0dkQTY1ocFAMVDu/xCCNOSffs8pEWoiaev
         37miRgb9KH6PfO6Bj6iFWv082t7mCd/c5gFO9u5T+xyOc7fqamyDkA4aIyAJil8CnxNe
         24hQ==
X-Gm-Message-State: AOAM533/z/lhwmQHJ0zcXb6IoO6TgWS6uzB3QnnarSrNDiEgby5Kc+bs
        FTJIvV9THkJo/6zDKB/amIwNBVcvfMLx533t3ZAVyltnA9I=
X-Google-Smtp-Source: ABdhPJzz8JY6S9yL1KELZ0lAOUaobYuYWBGgS10JYXlmhj8oxoKveG0WHBioE50Y5JVSZz+9N1092DpZYvbdmVkB/Wk=
X-Received: by 2002:a02:7709:0:b0:323:69fb:c5f3 with SMTP id
 g9-20020a027709000000b0032369fbc5f3mr2571051jac.209.1648470020724; Mon, 28
 Mar 2022 05:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648458742.git.siyanteng@loongson.cn> <41853e4068a2f6c6de37bd23708b8b154cd17716.1648458742.git.siyanteng@loongson.cn>
In-Reply-To: <41853e4068a2f6c6de37bd23708b8b154cd17716.1648458742.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 28 Mar 2022 20:19:44 +0800
Message-ID: <CAJy-Am=h0aY4Q=-s135EZhgDoDcO2_V3ec3KmdNjJ9E7Qszc8w@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] docs/zh_CN: add vm hwpoison translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBNYXIgMjgsIDIwMjIgYXQgNTo1OCBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vaHdwb2lzb24ucnN0IGludG8gQ2hpbmVzZS4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0K
DQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICAu
Li4vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJzdCAgICAgICAgfCAxNjYgKysrKysr
KysrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRl
eC5yc3QgfCAgIDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTY3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9od3BvaXNvbi5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM2ZTFlN2JkYjA1Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2h3cG9pc29uLnJzdA0KPiBA
QCAtMCwwICsxLDE2NiBAQA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdm0vaHdw
b2lzb24ucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4g
Kz09PT09PT09DQo+ICtod3BvaXNvbg0KPiArPT09PT09PT0NCj4gKw0KPiAr5LuA5LmI5pivaHdw
b2lzb24/DQo+ICs9PT09PT09PT09PT09PT0NCj4gKw0KPiArDQo+ICvljbPlsIbmjqjlh7rnmoTo
i7HnibnlsJRDUFXmlK/mjIHku47kuIDkupvlhoXlrZjplJnor6/kuK3mgaLlpI3vvIggYGBNQ0Hm
gaLlpI1gYCDvvInjgILov5npnIDopoHmk43kvZzns7vnu5/lrqPluIMNCj4gK+S4gOS4qumhtemd
oiJwb2lzb25lZCLvvIzmnYDmrbvkuI7kuYvnm7jlhbPnmoTov5vnqIvvvIzlubbpgb/lhY3lnKjm
nKrmnaXkvb/nlKjlroPjgIINCj4gKw0KPiAr6L+Z5Liq6KGl5LiB5YyF5Zyo6Jma5ouf5py65Lit
5a6e546w5LqG5b+F6KaB55qEKOe8lueoiynmoYbmnrbjgIINCj4gKw0KPiAr5byV55So5qaC6L+w
5Lit55qE6K+E6K66OjoNCj4gKw0KPiArICAgICAgIOmrmOe6p+acuuWZqOeahOajgOafpeS4juWk
hOeQhuOAguWkhOeQhuaWueazleaYr+aNn+Wdj+eahOmhtemdouiiq+ehrOS7tuaKpeWRiu+8jOmA
muW4uOaYr+eUseS6jjLkvY1FQ0PlhoUNCj4gKyAgICAgICDlrZjmiJbpq5jpgJ/nvJPlrZjmlYXp
mpzjgIINCj4gKw0KPiArICAgICAgIOi/meS4u+imgeaYr+mSiOWvueWcqOWQjuWPsOajgOa1i+WI
sOeahOaNn+Wdj+eahOmhtemdouOAguW9k+W9k+WJjeeahENQVeivleWbvuiuv+mXruWug+aXtu+8
jOW9k+WJjei/kOihjOeahOi/m+eoiw0KPiArICAgICAgIOWPr+S7peebtOaOpeiiq+adgOatu+OA
guWboOS4uui/mOayoeacieiuv+mXruaNn+Wdj+eahOmhtemdoiwg5aaC5p6c6ZSZ6K+v55Sx5LqO
5p+Q56eN5Y6f5Zug5LiN6IO96KKr5aSE55CG77yM5bCx5Y+vDQo+ICsgICAgICAg5Lul5a6J5YWo
5Zyw5b+955Wl5a6DLiDogIzkuI3mmK/nlKjlj6blpJbkuIDkuKrmnLrlmajmo4Dmn6XljrvlpITn
kIblroPjgIINCj4gKw0KPiArICAgICAgIOWkhOeQhuS4jeWQjOeKtuaAgeeahOmhtemdoue8k+Wt
mOmhteOAgui/memHjOajmOaJi+eahOmDqOWIhuaYr++8jOebuOWvueS6juWFtuS7luiZmuaLn+WG
heWtmOeUqOaIt++8jCDmiJHku6zlj6/ku6XlvIINCj4gKyAgICAgICDmraXorr/pl67ku7vkvZXp
obXpnaLjgILlm6DkuLrlhoXlrZjmlYXpmpzlj6/og73pmo/ml7bpmo/lnLDlj5HnlJ/vvIzlj6/o
g73ov53lj43kuobku5bku6znmoTkuIDkupvlgYforr7jgILov5nlsLHmmK8NCj4gKyAgICAgICDk
uLrku4DkuYjov5nmrrXku6PnoIHlv4XpobvpnZ7luLjlsI/lv4PjgILkuIDoiKzmnaXor7TvvIzl
roPor5Xlm77kvb/nlKjmraPluLjnmoTplIHop4TliJnvvIzlpoLojrflvpfmoIflh4bplIHvvIzl
jbPkvb8NCj4gKyAgICAgICDov5nmhI/lkbPnnYDplJnor6/lpITnkIblj6/og73pnIDopoHlvojp
lb/nmoTml7bpl7TjgIINCj4gKw0KPiArICAgICAgIOi/memHjOeahOS4gOS6m+aTjeS9nOacieeC
ueS9juaViO+8jOW5tuS4lOWFt+aciemdnue6v+aAp+eahOeul+azleWkjeadguaAp++8jOWboOS4
uuaVsOaNrue7k+aehOayoeaciemSiOWvuei/meenjeaDhQ0KPiArICAgICAgIOWGtei/m+ihjOS8
mOWMluOAgueJueWIq+aYr+S7jnZtYeWIsOi/m+eoi+eahOaYoOWwhOWwseaYr+i/meenjeaDheWG
teOAgueUseS6jui/meenjeaDheWGteWkp+amgueOh+aYr+e9leingeeahO+8jOaJgA0KPiArICAg
ICAgIOS7peaIkeS7rOW4jOacm+aIkeS7rOWPr+S7peaRhuiEsei/meenjeaDheWGteOAgg0KPiAr
DQo+ICvor6Xku6PnoIHnlLFtbS9tZW1vcnktZmFpbHVyZS5j5Lit55qE6auY57qn5aSE55CG56iL
5bqP44CB5LiA5Liq5paw55qE6aG16Z2icG9pc29u5L2N5ZKM6Jma5ouf5py65Lit55qEDQo+ICvl
kITnp43mo4Dmn6Xnu4TmiJDvvIznlKjmnaXlpITnkIZwb2lzb27nmoTpobXpnaLjgIINCj4gKw0K
PiAr546w5Zyo5Li76KaB55uu5qCH5pivS1ZN5a6i5oi35py677yM5L2G5a6D6YCC55So5LqO5omA
5pyJ57G75Z6L55qE5bqU55So56iL5bqP44CC5pSv5oyBS1ZN6ZyA6KaB5pyA6L+R55qEcWVtdS1r
dm0NCj4gK+eJiOacrOOAgg0KPiArDQo+ICvlr7nkuo5LVk3nmoTkvb/nlKjvvIzpnIDopoHkuIDk
uKrmlrDnmoTkv6Hlj7fnsbvlnovvvIzov5nmoLdLVk3lsLHlj6/ku6XnlKjpgILlvZPnmoTlnLDl
nYDlsIbmnLrlmajmo4Dmn6Xms6jlhaXliLDlrqLmiLcNCj4gK+acuuS4reOAgui/meWcqOeQhuiu
uuS4iuS5n+WFgeiuuOWFtuS7luW6lOeUqOeoi+W6j+WkhOeQhuWGheWtmOaVhemanOOAguaIkeS7
rOeahOacn+acm+aYr++8jOaJgOacieeahOW6lOeUqOeoi+W6j+mDveS4jeimgei/mQ0KPiAr5qC3
5YGa77yM5L2G5LiA5Lqb6Z2e5bi45LiT5Lia55qE5bqU55So56iL5bqP5Y+v6IO95Lya6L+Z5qC3
5YGa44CCDQo+ICsNCj4gK+aVhemanOaBouWkjeaooeW8jw0KPiArPT09PT09PT09PT09DQo+ICsN
Cj4gK+acieS4pOenje+8iOWunumZheS4iuaYr+S4ieenje+8ieaooeW8j+eahOWGheWtmOaVhema
nOaBouWkjeWPr+S7peWcqOOAgg0KPiArDQo+ICt2bS5tZW1vcnlfZmFpbHVyZV9yZWNvdmVyeSBz
eXNjdGwg572u6Zu2Og0KPiArICAgICAgIOaJgOacieeahOWGheWtmOaVhemanOmDveS8muWvvOiH
tHBhbmlj44CC6K+35LiN6KaB5bCd6K+V5oGi5aSN44CCDQo+ICsNCj4gK+aXqeacn+WkhOeQhg0K
PiArICAgICAgICjlj6/ku6XlnKjlhajlsYDlkozmr4/kuKrov5vnqIvkuK3mjqfliLYpIOS4gOaX
puajgOa1i+WIsOmUmeivr++8jOeri+WNs+WQkeW6lOeUqOeoi+W6j+WPkemAgVNJR0JVU+i/meWF
geiuuA0KPiArICAgICAgIOW6lOeUqOeoi+W6j+S7pea4qeWSjOeahOaWueW8j+WkhOeQhuWGheWt
mOmUmeivr++8iOS+i+Wmgu+8jOaUvuW8g+WPl+W9seWTjeeahOWvueixoe+8iSDov5nmmK9LVk0g
cWVtdeS9v+eUqOeahA0KPiArICAgICAgIOaooeW8j+OAgg0KPiArDQo+ICvmjqjov5/lpITnkIYN
Cj4gKyAgICAgICDlvZPlupTnlKjnqIvluo/ov5DooYzliLDmjZ/lnY/nmoTpobXpnaLml7bvvIzl
j5HpgIFTSUdCVVPjgILov5nlr7nkuI3nn6XpgZPlhoXlrZjplJnor6/nmoTlupTnlKjnqIvluo/m
naXor7TmmK8NCj4gKyAgICAgICDmnIDlpb3nmoTvvIzpu5jorqTmg4XlhrXkuIvms6jmhI/kuIDk
upvpobXpnaLmgLvmmK/ooqvlvZPkvZxsYXRlIGtpbGzlpITnkIbjgIINCj4gKw0KPiAr55So5oi3
5o6n5Yi2DQo+ICs9PT09PT09PQ0KPiArDQo+ICt2bS5tZW1vcnlfZmFpbHVyZV9yZWNvdmVyeQ0K
PiArICAgICAgIOWPgumYhSBzeXNjdGwudHh0DQo+ICsNCj4gK3ZtLm1lbW9yeV9mYWlsdXJlX2Vh
cmx5X2tpbGwNCj4gKyAgICAgICDlhajlsYDlkK/nlKhlYXJseSBraWxsDQo+ICsNCj4gK1BSX01D
RV9LSUxMDQo+ICsgICAgICAg6K6+572uZWFybHkvbGF0ZSBraWxsIG1vZGUvcmV2ZXJ0IOWIsOez
u+e7n+m7mOiupOWAvOOAgg0KPiArDQo+ICsgICAgICAgYXJnMTogUFJfTUNFX0tJTExfQ0xFQVI6
DQo+ICsgICAgICAgICAgICAgICDmgaLlpI3liLDns7vnu5/pu5jorqTlgLwNCj4gKyAgICAgICBh
cmcxOiBQUl9NQ0VfS0lMTF9TRVQ6DQo+ICsgICAgICAgICAgICAgICBhcmcy5a6a5LmJ5LqG57q/
56iL54m55a6a5qih5byPDQo+ICsNCj4gKyAgICAgICAgICAgICAgIFBSX01DRV9LSUxMX0VBUkxZ
Og0KPiArICAgICAgICAgICAgICAgICAgICAgICBFYXJseSBraWxsDQo+ICsgICAgICAgICAgICAg
ICBQUl9NQ0VfS0lMTF9MQVRFOg0KPiArICAgICAgICAgICAgICAgICAgICAgICBMYXRlIGtpbGwN
Cj4gKyAgICAgICAgICAgICAgIFBSX01DRV9LSUxMX0RFRkFVTFQNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAg5L2/55So57O757uf5YWo5bGA6buY6K6k5YC8DQo+ICsNCj4gKyAgICAgICDms6jm
hI/vvIzlpoLmnpzkvaDmg7PmnInkuIDkuKrkuJPpl6jnmoTnur/nqIvku6Pooajov5vnqIvlpITn
kIZTSUdCVVMoQlVTX01DRUVSUl9BTynvvIzkvaDlupTor6XlnKgNCj4gKyAgICAgICDmjIflrprn
ur/nqIvkuIrosIPnlKhwcmN0bChQUl9NQ0VfS0lMTF9FQVJMWSnjgILlkKbliJnvvIxTSUdCVVPl
sIbooqvlj5HpgIHliLDkuLvnur/nqIvjgIINCj4gKw0KPiArUFJfTUNFX0tJTExfR0VUDQo+ICsg
ICAgICAg6L+U5Zue5b2T5YmN5qih5byPDQo+ICsNCj4gK+a1i+ivlQ0KPiArPT09PQ0KPiArDQo+
ICsqIG1hZHZpc2UoTUFEVl9IV1BPSVNPTiwgLi4uLikgKGFzIHJvb3QpIC0g5Zyo5rWL6K+V6L+H
56iL5LitUG9pc29u5LiA5Liq6aG16Z2iDQo+ICsNCj4gKyog6YCa6L+HZGVidWdmcyBgYC9zeXMv
a2VybmVsL2RlYnVnL2h3cG9pc29uL2BgIGh3cG9pc29uLWluamVjdOaooeWdlw0KPiArDQo+ICsg
IGNvcnJ1cHQtcGZuDQo+ICsgICAgICAg5ZyoUEZO5aSE5rOo5YWlaHdwb2lzb27mlYXpmpzvvIzl
ubZlY2hvZWTliLDov5nkuKrmlofku7bjgILov5nlgZrkuobkuIDkupvml6nmnJ/ov4fmu6TvvIzk
u6Xpgb8NCj4gKyAgICAgICDlhY3lnKjmtYvor5XlpZfku7bkuK3mjZ/lnY/pnZ7pooTmnJ/pobXp
naLjgIINCj4gKyAgdW5wb2lzb24tcGZuDQo+ICsgICAgICAg5ZyoUEZO55qEU29mdHdhcmUtdW5w
b2lzb27pobXpnaLlr7nlupTliLDov5nkuKrmlofku7bjgILov5nmoLfvvIzkuIDkuKrpobXpnaLl
j6/ku6Xlho3mrKHooqsNCj4gKyAgICAgICDlpI3nlKjjgILov5nlj6rlr7lMaW51eOazqOWFpeea
hOaVhemanOi1t+S9nOeUqO+8jOWvueecn+ato+eahOWGheWtmOaVhemanOS4jei1t+S9nOeUqOOA
gg0KPiArDQo+ICsgIOazqOaEj+i/meS6m+azqOWFpeaOpeWPo+W5tuS4jeeos+Wumu+8jOWPr+iD
veS8muWcqOS4jeWQjOeahOWGheaguOeJiOacrOS4reWPkeeUn+WPmOWMlg0KPiArDQo+ICsgIGNv
cnJ1cHQtZmlsdGVyLWRldi1tYWpvciwgY29ycnVwdC1maWx0ZXItZGV2LW1pbm9yDQo+ICsgICAg
ICAg5Y+q5aSE55CG5LiO5Z2X6K6+5aSHbWFqb3IvbWlub3LlrprkuYnnmoTmlofku7bns7vnu5/n
m7jlhbPnmoTpobXpnaLnmoTlhoXlrZjmlYXpmpzjgIItMVXmmK/pgJoNCj4gKyAgICAgICDphY3n
rKblgLzjgILov5nlupTor6Xlj6rnlKjkuo7kurrlt6Xms6jlhaXnmoTmtYvor5XjgIINCj4gKw0K
PiArICBjb3JydXB0LWZpbHRlci1tZW1jZw0KPiArICAgICAgIOmZkOWItuazqOWFpeWIsG1lbWdy
b3Vw5oul5pyJ55qE6aG16Z2i44CC55SxbWVtY2fnmoRpbm9kZeWPt+aMh+WumuOAgg0KPiArDQo+
ICsgICAgICAgRXhhbXBsZTo6DQo+ICsNCj4gKyAgICAgICAgICAgICAgIG1rZGlyIC9zeXMvZnMv
Y2dyb3VwL21lbS9od3BvaXNvbg0KPiArDQo+ICsgICAgICAgICAgICAgICB1c2VtZW0gLW0gMTAw
IC1zIDEwMDAgJg0KPiArICAgICAgICAgICAgICAgZWNobyBgam9icyAtcGAgPiAvc3lzL2ZzL2Nn
cm91cC9tZW0vaHdwb2lzb24vdGFza3MNCj4gKw0KPiArICAgICAgICAgICAgICAgbWVtY2dfaW5v
PSQobHMgLWlkIC9zeXMvZnMvY2dyb3VwL21lbS9od3BvaXNvbiB8IGN1dCAtZjEgLWQnICcpDQo+
ICsgICAgICAgICAgICAgICBlY2hvICRtZW1jZ19pbm8gPiAvZGVidWcvaHdwb2lzb24vY29ycnVw
dC1maWx0ZXItbWVtY2cNCj4gKw0KPiArICAgICAgICAgICAgICAgcGFnZS10eXBlcyAtcCBgcGlk
b2YgaW5pdGAgICAtLWh3cG9pc29uICAjIHNoYWxsIGRvIG5vdGhpbmcNCj4gKyAgICAgICAgICAg
ICAgIHBhZ2UtdHlwZXMgLXAgYHBpZG9mIHVzZW1lbWAgLS1od3BvaXNvbiAgIyBwb2lzb24gaXRz
IHBhZ2VzDQo+ICsNCj4gKyAgY29ycnVwdC1maWx0ZXItZmxhZ3MtbWFzaywgY29ycnVwdC1maWx0
ZXItZmxhZ3MtdmFsdWUNCj4gKyAgICAgICDlvZPmjIflrprml7bvvIzlj6rmnInlnKgoKHBhZ2Vf
ZmxhZ3MgJiBtYXNrKSA9PSB2YWx1ZSnnmoTmg4XlhrXkuIvmiY3kvJpwb2lzb27pobXpnaLjgIIN
Cj4gKyAgICAgICDov5nlhYHorrjlr7norrjlpJrnp43nsbvnmoTpobXpnaLov5vooYzljovlipvm
tYvor5XjgIJwYWdlX2ZsYWdz5LiOL3Byb2Mva3BhZ2VmbGFnc+S4reeahOebuA0KPiArICAgICAg
IOWQjOOAgui/meS6m+agh+W/l+S9jeWcqGluY2x1ZGUvbGludXgva2VybmVsLXBhZ2UtZmxhZ3Mu
aOS4reWumuS5ie+8jOW5tuWcqA0KPiArICAgICAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
bW0vcGFnZW1hcC5yc3TkuK3orrDlvZXjgIINCj4gKw0KPiArKiDmnrbmnoTnibnlrprnmoRNQ0Xm
s6jlhaXlmagNCj4gKw0KPiArICB4ODYg5pyJIG1jZS1pbmplY3QsIG1jZS10ZXN0DQo+ICsNCj4g
KyAg5ZyobWNlLXRlc3TkuK3nmoTkuIDkupvkvr/mkLrlvI9od3BvaXNvbua1i+ivleeoi+W6j++8
jOingeS4i+aWh+OAgg0KPiArDQo+ICvlvJXnlKgNCj4gKz09PT0NCj4gKw0KPiAraHR0cDovL2hh
bG9iYXRlcy5kZS9tY2UtbGMwOS0yLnBkZg0KPiArICAgICAgIDA55bm0TGludXhDb27nmoTmpoLo
v7DmvJTorrINCj4gKw0KPiArZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9jcHUv
bWNlL21jZS10ZXN0LmdpdA0KPiArICAgICAgIOa1i+ivleWll+S7tu+8iOWcqHRzcmPkuK3nmoRo
d3BvaXNvbueJueWumuWPr+enu+akjea1i+ivle+8ieOAgg0KPiArDQo+ICtnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL3V0aWxzL2NwdS9tY2UvbWNlLWluamVjdC5naXQNCj4gKyAgICAgICB4
ODbnibnlrprnmoTms6jlhaXlmagNCj4gKw0KPiArDQo+ICvpmZDliLYNCj4gKz09PT0NCj4gKy0g
5LiN5piv5omA5pyJ55qE6aG16Z2i57G75Z6L6YO96KKr5pSv5oyB77yM6ICM5LiU5rC46L+c5LiN
5Lya44CC5aSn5aSa5pWw5YaF5qC45YaF6YOo5a+56LGh5LiN6IO96KKr5oGiDQo+ICsgIOWkje+8
jOebruWJjeWPquaciUxSVemhteOAgg0KPiArDQo+ICstLS0NCj4gK0FuZGkgS2xlZW4sIDIwMDnl
ubQxMOaciA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgu
cnN0DQo+IGluZGV4IGE3ODA2MGEwYzJlZC4uYzViM2Q1YmEyMWYxIDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IEBAIC0yOCwxMiAr
MjgsMTIgQEAgVE9ETzrlvoXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5XlkI7or7flj4rm
l7bkv67mlLnmraTlpITvvIkNCj4gICAgIGhpZ2htZW0NCj4gICAgIGtzbQ0KPiAgICAgZnJvbnRz
d2FwDQo+ICsgICBod3BvaXNvbg0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9o
ZWxwZXJzDQo+ICAqIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gICogaG1tDQo+IC0qIGh3cG9pc29u
DQo+ICAqIGh1Z2V0bGJmc19yZXNlcnYNCj4gICogbWVtb3J5LW1vZGVsDQo+ICAqIG1tdV9ub3Rp
Zmllcg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==

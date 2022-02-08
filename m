Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE524ACE6C
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 02:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344372AbiBHBw3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Feb 2022 20:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345308AbiBHBwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 20:52:20 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECBCC02B5E9
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 17:49:46 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id c6so45564985ybk.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Feb 2022 17:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j0ZYFeZLsBPfwQ300unbbDjX++yHyXHz+wrIZnEyq/g=;
        b=q8EGgGvwZ/Aq9fyGMHNViC5pN0cZok7L6mj8wAhq7BUQ8cAtuYeY9inuMIOcER/4TK
         NTz13H1wtw00pXA0zxaNEaj4AYNhmWE7vXMgSd1IZAXsUEDn6EYa2xZ2SdNSl0nKmPp9
         BckrIqiZbfu5ib7ZR7v413QFPSaDN7gtD0YYWGHf4ItSgcj/feJBa9kRuTFufHtfOanh
         5h/Q/kzdNgdxNz2fucW8ie6vhOLYeqfrAVpFGCLx0ooinpxj0yQMQkS1mLAnblh5nO/2
         DXGJ9WY69z91DXzBbttwQyBb7nQ587QymwSU4dh+jvP0zX2Qk0sgBdix8gR7MUbkrwOi
         LDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j0ZYFeZLsBPfwQ300unbbDjX++yHyXHz+wrIZnEyq/g=;
        b=MCcKZawau3iUqG42I+zkN6uzONAFyoG4wmCqKuVphalPvzO5NxybIVccl5ql/g4MnZ
         YC0KivufjV2PW3StJ9pQ/66eRJZ5N3mGuf4HxLiDUjxLPer6YLhm0ssIRi4ojHmQMWyt
         yPjI4z9EGJfOro70SihyTtfOkUJ6UAWhphFh8vyzY6c5H3Vr126w+kOrIVifSiHa9Idt
         2VUUw2aCRTHaE/RkySV4w6UInRrE6zgfa2YAq61EeQSH3GSAAovZfPsH/HMbs9gSylJr
         fu8jUnRZTYND8IAmjGz56AD+Z+wtLNvnG58A9TyRWlyhEzqiFSgz0E5N5MKUHdIdkq/3
         efzw==
X-Gm-Message-State: AOAM531NMpZWYbs/AEa1ktPuBYePLGbfw9cgQN3lVEfSFmBqMRkE/lgq
        DmXUni6tKil9PABV21SG56Ps2NSJMjcE++v12DA=
X-Google-Smtp-Source: ABdhPJwVEFVRx/VKkXX82VyNcCKAzjBp65DOSQKsXSyvyO/pA0grYbG7B/sZxm3almOwzaurVcN9zRnebSK/VpzHZAQ=
X-Received: by 2002:a5b:3cc:: with SMTP id t12mr2588996ybp.397.1644284985256;
 Mon, 07 Feb 2022 17:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20220207022521.27487-1-tangyizhou@huawei.com> <CAEensMyP7yLWGuLUNXjj=ceMJBhj3KeG7t=9SuKaMjX9NOoGag@mail.gmail.com>
 <0224799c-8135-b363-63b6-bbe1f4ebdea1@huawei.com>
In-Reply-To: <0224799c-8135-b363-63b6-bbe1f4ebdea1@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 8 Feb 2022 09:49:16 +0800
Message-ID: <CAEensMzHjd=xz4wZSm0EOitRZmeAKRzJV7+OvVzfWCKMqxyGvQ@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-energy Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMuW5tDLmnIg35pel5ZGo
5LiAIDE5OjU35YaZ6YGT77yaDQo+DQo+DQo+DQo+IE9uIDIwMjIvMi83IDE1OjExLCB5YW50ZW5n
IHNpIHdyb3RlOg0KPiA+IFRhbmcgWWl6aG91IDx0YW5neWl6aG91QGh1YXdlaS5jb20+IOS6jjIw
MjLlubQy5pyIN+aXpeWRqOS4gCAwOTo1MuWGmemBk++8mg0KPiA+Pg0KPiA+PiBUcmFuc2xhdGUg
c2NoZWR1bGVyL3NjaGVkLWVuZXJneS5yc3QgaW50byBDaGluZXNlLg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBUYW5nIFlpemhvdSA8dGFuZ3lpemhvdUBodWF3ZWkuY29tPg0KPiA+PiAtLS0N
Cj4gPj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2luZGV4LnJzdCAgICB8ICAg
NCArLQ0KPiA+PiAgLi4uL3poX0NOL3NjaGVkdWxlci9zY2hlZC1lbmVyZ3kucnN0ICAgICAgICAg
IHwgMzUxICsrKysrKysrKysrKysrKysrKw0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzNTMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZW5lcmd5LnJzdA0K
PiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
c2NoZWR1bGVyL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Nj
aGVkdWxlci9pbmRleC5yc3QNCj4gPj4gaW5kZXggZjhmOGYzNWQ1M2M3Li5hYjc5MjU5ODAyNjYg
MTAwNjQ0DQo+ID4+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVk
dWxlci9pbmRleC5yc3QNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vc2NoZWR1bGVyL2luZGV4LnJzdA0KPiA+PiBAQCAtNSw2ICs1LDcgQEANCj4gPj4gIDrnv7vo
r5E6DQo+ID4+DQo+ID4+ICAg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nv
bi5jbj4NCj4gPj4gKyDllJDoibroiJ8gVGFuZyBZaXpob3UgPHRhbmd5ZWVjaG91QGdtYWlsLmNv
bT4NCj4gPj4NCj4gPj4gIDrmoKHor5E6DQo+ID4+DQo+ID4+IEBAIC0yMywxMyArMjQsMTIgQEAg
TGludXjosIPluqblmagNCj4gPj4gICAgICBzY2hlZC1kZXNpZ24tQ0ZTDQo+ID4+ICAgICAgc2No
ZWQtZG9tYWlucw0KPiA+PiAgICAgIHNjaGVkLWNhcGFjaXR5DQo+ID4+ICsgICAgc2NoZWQtZW5l
cmd5DQo+ID4+DQo+ID4+DQo+ID4+ICBUT0RPTGlzdDoNCj4gPj4NCj4gPj4gLSAgICBzY2hlZC1i
d2MNCj4gPj4gICAgICBzY2hlZC1kZWFkbGluZQ0KPiA+PiAtICAgIHNjaGVkLWVuZXJneQ0KPiA+
PiAgICAgIHNjaGVkLW5pY2UtZGVzaWduDQo+ID4+ICAgICAgc2NoZWQtcnQtZ3JvdXANCj4gPj4g
ICAgICBzY2hlZC1zdGF0cw0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWVuZXJneS5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZW5lcmd5LnJzdA0KPiA+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjVlYTM5ODBiMGViZA0KPiA+
PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3NjaGVkdWxlci9zY2hlZC1lbmVyZ3kucnN0DQo+ID4+IEBAIC0wLDAgKzEsMzUxIEBADQo+
ID4+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+PiArLi4gaW5jbHVk
ZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4+ICsNCj4gPj4gKzpPcmlnaW5hbDogRG9j
dW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtZW5lcmd5LnJzdA0KPiA+PiArDQo+ID4+ICs657+7
6K+ROg0KPiA+PiArDQo+ID4+ICsgIOWUkOiJuuiInyBUYW5nIFlpemhvdSA8dGFuZ3llZWNob3VA
Z21haWwuY29tPg0KPiA+PiArDQo+ID4+ICs9PT09PT09PT09PT0NCj4gPj4gK+iDvemHj+aEn+ef
peiwg+W6pg0KPiA+PiArPT09PT09PT09PT09DQo+ID4+ICsNCj4gPj4gKzEuIOeugOS7iw0KPiA+
PiArLS0tLS0tLQ0KPiA+PiArDQo+ID4+ICvog73ph4/mhJ/nn6XosIPluqbvvIhFQVPvvInkvb/o
sIPluqblmajmnInog73lipvpooTmtYvlhbblhrPnrZblr7lDUFXmiYDmtojogJfnmoTog73ph4/n
moTlvbHlk43jgIJFQVPkvp3pnaANCj4NCj4gPiBIb3cgYWJvdXQgQ1BVIOaJgOa2iOiAl+eahOeU
teiDvS/og73mupDvvJ8NCj4NCj4gMS4g55S16IO96IKv5a6a5piv5LiN5aal55qE77yMZW5lcmd5
5LiN5b+F54S25piv55S16IO944CCDQo+IDIuIOaIkeiAg+iZkei/h+e/u+ivkeaIkOiDvea6kO+8
jOazqOaEj+WIsOesrDLnq6DnmoTmnK/or63or7TmmI7ov5jmj5DliLDlip/njofvvIzlip/njofk
uZjku6Xml7bpl7TkuLrog73ph4/vvIzlkIzmoLfmmK8NCj4gZW5lcmd56L+Z5Liq6K+N77yM5pWF
6ICM57uf5LiA57+76K+R5oiQ6IO96YeP5LqG44CCDQo+DQo+ID4+ICvkuIDkuKrog73ph4/mqKHl
novvvIhFTe+8ieadpeS4uuavj+S4quS7u+WKoemAieaLqeS4gOS4quiKguiDveeahENQVe+8jOWQ
jOaXtuacgOWwj+WMluWvueWQnuWQkOeOh+eahOW9seWTjeOAgg0KPg0KPiA+IEhvdyBhYm91dCDo
ioLog73nmoRDUFXmoLjlv4PvvJ8NCj4NCj4g5Y6f5paH5pivQ1BV6ICM5LiN5pivQ1BVIGNvcmXv
vIzlj6/ku6XpgbXnhafljp/mlofvvIzlkIzmoLflnKjkuK3mlofor63looPkuIvkuZ/mnInmt7fn
lKjjgIINCuWcqOS4jeW9seWTjeivreS5ieeahOaDheWGteS4i++8jOaIkeabtOWAvuWQkeS6jueo
jeWKoOS/rumlsO+8jOS7juiAjOe/u+ivkeeahOabtOa4healmuS4gOeCueOAguWboOS4uuWvueS6
juS4gOS4quiAgeaJi+adpeivtOWPr+iDveS4gOeci+WwseaHgu+8jA0K5L2G5piv5a+55LqO5paw
5omL5p2l6K+077yM5Y+v6IO95Lya5LuO5q2k5ZKM5YaF5qC45rC45Yir44CCDQpZb3VyIHRyYW5z
bGF0aW9uIGlzIGNvcnJlY3QsIGl0J3MganVzdCBteSBzdWdnZXN0aW9uLCBpdCdzIHVwIHRvIHlv
dS4NCg0KVGhhbmtzLA0KWWFudGVuZw0KPg0KPiA+PiAr5pys5paH5qGj6Ie05Yqb5LqO5LuL57uN
5LuL57uNRUFT5piv5aaC5L2V5bel5L2c55qE77yM5a6D6IOM5ZCO55qE5Li76KaB6K6+6K6h5Yaz
562W5piv5LuA5LmI77yM5Lul5Y+K5L2/5YW26L+Q6KGMDQo+ID4+ICvmiYDpnIDnmoTmnaHku7bn
u4boioLjgIINCj4gPj4gKw0KPiA+PiAr5Zyo6L+b5LiA5q2l6ZiF6K+75LmL5YmN77yM6K+35rOo
5oSP77yM5Zyo5pKw5YaZ5pys5paH5pe2OjoNCj4gPj4gKw0KPiA+PiArICAgLyFcIEVBU+S4jeaU
r+aMgeWvueensENQVeaLk+aJkeeahOW5s+WPsCAvIVwNCj4gPj4gKw0KPiA+PiArRUFT5Y+q5Zyo
5byC5p6EQ1BV5ouT5omR57uT5p6E77yI5aaCQXJt5aSn5bCP5qC477yMYmlnLkxJVFRMRe+8ieS4
iui/kOihjOOAguWboOS4uuWcqOi/meenjeaDheWGteS4i++8jA0KPiA+PiAr6YCa6L+H6LCD5bqm
5p2l6IqC57qm6IO96YeP55qE5r2c5Yqb5piv5pyA5aSn55qE44CCDQo+ID4+ICsNCj4gPj4gK0VB
U+WunumZheS9v+eUqOeahEVN5LiN5piv55Sx6LCD5bqm5Zmo57u05oqk55qE77yM6ICM5piv5LiA
5Liq5LiT6Zeo55qE5qGG5p6244CC5YWz5LqO6L+Z5Liq5qGG5p6255qE57uG6IqC5ZKMDQo+ID4+
ICvlroPmj5DkvpvnmoTlhoXlrrnvvIzor7flj4LogIPlhbbmlofmoaPvvIjop4FEb2N1bWVudGF0
aW9uL3Bvd2VyL2VuZXJneS1tb2RlbC5yc3TvvInjgIINCj4gPj4gKw0KPiA+PiArDQo+ID4+ICsy
LiDog4zmma/lkozmnK/or60NCj4gPj4gKy0tLS0tLS0tLS0tLS0NCj4gPj4gKw0KPiA+PiAr5LuO
5LiA5byA5aeL5bCx6K+05riF5qWa5a6a5LmJOg0KPiA+PiArIC0g6IO96YePID0gW+eEpuiAs10g
77yI5q+U5aaC5L6b55S16K6+5aSH5LiK55qE55S15rGg5o+Q5L6b55qE6LWE5rqQ77yJDQo+ID4+
ICsgLSDlip/njocgPSDog73ph48v5pe26Ze0ID0gW+eEpuiAsy/np5JdID0gW+eTpueJuV0NCj4g
Pj4gKw0KPiA+PiArIEVBU+eahOebruagh+aYr+acgOWwj+WMluiDvemHj++8jOWQjOaXtuS7jeiD
veWwhuW3peS9nOWujOaIkOOAguS5n+WwseaYr+ivtO+8jOaIkeS7rOimgeacgOWkp+WMljo6DQo+
DQo+ID4g5pyA5bCP5YyW6IO95rqQL+eUteiDvea2iOiAl++8nw0KPg0KPiDomb3nhLbljp/mlofk
u4XkuLplbmVyZ3nvvIzogIPomZHliLDkuK3mlofnmoTlj6/or7vmgKfvvIzkuIvkuIDniYjlsIbn
v7vor5HkuLrog73ph4/mtojogJfjgIINCj4NCj4gPj4gKw0KPiA+PiArICAgICAgIOaAp+iDvSBb
5oyH5Luk5pWwL+enkl0NCj4gPj4gKyAgICAgICAtLS0tLS0tLS0tLS0tLS0tDQo+ID4+ICsgICAg
ICAgICAg5Yqf546HIFvnk6bnibldDQo+ID4+ICsNCj4gPj4gK+Wug+etieaViOS6juacgOWwj+WM
ljo6DQo+ID4+ICsNCj4gPj4gKyAgICAgICDog73ph48gW+eEpuiAs10NCj4gPj4gKyAgICAgICAt
LS0tLS0tLS0tLQ0KPiA+PiArICAgICAgICAgIOaMh+S7pOaVsA0KPiA+PiArDQo+ID4+ICvlkIzm
l7bku43nhLbojrflvpfigJzoia/lpb3igJ3nmoTmgKfog73jgILlvZPliY3osIPluqblmajlj6ro
gIPomZHmgKfog73nm67moIfvvIzlm6DmraTor6XlvI/lrZDmnKzotKjkuIrmmK/kuIDkuKoNCj4g
Pj4gK+WPr+mAieeahOS8mOWMluebruagh++8jOWug+WQjOaXtuiAg+iZkeS6huS4pOS4quebruag
h++8muiDvemHj+aViOeOh+WSjOaAp+iDveOAgg0KPiA+PiArDQo+ID4+ICvlvJXlhaVFTeeahOaD
s+azleaYr+S4uuS6huiuqeiwg+W6puWZqOivhOS8sOWFtuWGs+etlueahOW9seWTje+8jOiAjOS4
jeaYr+ebsuebruWcsOW6lOeUqOWPr+iDveS7heWcqOmDqOWIhg0KPiA+PiAr5bmz5Y+w5pyJ5q2j
6Z2i5pWI5p6c55qE6IqC6IO95oqA5pyv44CC5ZCM5pe277yMRU3lv4XpobvlsL3lj6/og73nmoTn
roDljZXvvIzku6XmnIDlsI/ljJbosIPluqblmajnmoTml7blu7YNCj4gPj4gK+W9seWTjeOAgg0K
PiA+PiArDQo+ID4+ICvnroDogIzoqIDkuYvvvIxFQVPmlLnlj5jkuoZDRlPku7vliqHliIbphY3n
u5lDUFXnmoTmlrnlvI/jgILlvZPosIPluqblmajlhrPlrprkuIDkuKrku7vliqHlupTor6XlnKjl
k6rph4wNCj4gPj4gK+i/kOihjOaXtu+8iOWcqOWUpOmGkuacn+mXtO+8ie+8jEVN6KKr55So5p2l
5Zyo5LiN5o2f5a6z57O757uf5ZCe5ZCQ546H55qE5oOF5Ya15LiL77yM5LuO5Yeg5Liq6L6D5aW9
55qE5YCZ6YCJDQo+ID4+ICtDUFXkuK3mjJHpgInkuIDkuKrnu4/pooTmtYvog73ph4/mtojogJfm
nIDkvJjnmoRDUFXjgIJFQVPnmoTpooTmtYvkvp3otZbkuo7lr7nlubPlj7Dmi5PmiZHnu5PmnoTn
ibnlrprlhYPntKANCj4gPj4gK+eahOS6huino++8jOWMheaLrENQVeeahOKAnOeul+WKm+KAne+8
jOS7peWPiuWug+S7rOWQhOiHqueahOiDvemHj+aIkOacrOOAgg0KPiA+PiArDQo+ID4+ICsNCj4g
Pj4gKzMuIOaLk+aJkeS/oeaBrw0KPiA+PiArLS0tLS0tLS0tLS0NCj4gPj4gKw0KPiA+PiArRUFT
77yI5Lul5Y+K6LCD5bqm5Zmo55qE5Ymp5L2Z6YOo5YiG77yJ5L2/55So4oCc566X5Yqb4oCd55qE
5qaC5b+15p2l5Yy65YiG5LiN5ZCM6K6h566X5ZCe5ZCQ546H55qEQ1BV44CC5LiA5LiqDQo+ID4+
ICtDUFXnmoTigJznrpflipvigJ3ku6PooajkuoblroPlnKjmnIDpq5jpopHnjofkuIvov5DooYzm
l7bog73lrozmiJDnmoTlt6XkvZzph4/vvIzkuJTov5nkuKrlgLzmmK/nm7jlr7nns7vnu5/kuK0N
Cj4gPj4gK+eul+WKm+acgOWkp+eahENQVeiAjOiogOeahOOAgueul+WKm+WAvOiiq+W9kuS4gOWM
luS4ujEwMjTku6XlhoXvvIzlubbkuJTlj6/kuI7nlLHlrp7kvZPotJ/ovb3ot5/ouKoNCj4gPj4g
K++8iFBFTFTvvInmnLrliLbnrpflh7rnmoTliKnnlKjnjofkv6Hlj7flgZrlr7nmr5TjgILnlLHk
uo7mnInnrpflipvlgLzlkozliKnnlKjnjoflgLzvvIxFQVPog73lpJ/kvLDorqHkuIDkuKoNCj4g
Pj4gK+S7u+WKoS9DUFXmnInlpJrlpKcv5pyJ5aSa5b+Z77yM5bm25Zyo6K+E5Lyw5oCn6IO95LiO
6IO96YeP5pe25bCG5YW26ICD6JmR5Zyo5YaF44CCQ1BV566X5Yqb55Sx54m55a6a5L2T57O7DQo+
ID4+ICvnu5PmnoTlrp7njrDnmoRhcmNoX3NjYWxlX2NwdV9jYXBhY2l0eSgp5Zue6LCD5Ye95pWw
5o+Q5L6b44CCDQo+ID4+ICsNCj4gPj4gK0VBU+S9v+eUqOeahOWFtuS9meW5s+WPsOS/oeaBr+aY
r+ebtOaOpeS7juiDvemHj+aooeWei++8iEVN77yJ5qGG5p625Lit6K+75Y+W55qE44CC5LiA5Liq
5bmz5Y+w55qERU3mmK/kuIDlvKANCj4gPj4gK+ihqO+8jOihqOS4reavj+mhueS7o+ihqOezu+e7
n+S4reS4gOS4quKAnOaAp+iDveWfn+KAneeahOWKn+eOh+aIkOacrOOAgu+8iOiLpeimgeS6huin
o+abtOWkmuWFs+S6juaAp+iDveWfn+eahOe7huiKgu+8jA0KPiA+PiAr6KeB5paH5qGjL3Bvd2Vy
L2VuZXJneS1tb2RlbC5yc3TvvIkNCj4NCj4gPiBIaSBZaVpob3UsIFdoYXQgaXMg5paH5qGjL3Bv
d2VyL2VuZXJneS1tb2RlbC5yc3Q/ICA6KQ0KPg0KPiBUaGF0J3MgbXkgZmF1bHQuIFRoYW5rcy4N
Cj4NCj4gPj4gKw0KPiA+PiAr5b2T6LCD5bqm5Z+f6KKr5bu656uL5oiW6YeN5paw5bu656uL5pe2
77yM6LCD5bqm5Zmo566h55CG5a+55ouT5omR5Luj56CB5LitRU3lr7nosaHnmoTlvJXnlKjjgILl
r7nkuo7mr4/kuKrmoLnln58NCj4gPj4gK++8iHJk77yJ77yM6LCD5bqm5Zmo57u05oqk5LiA5Liq
5LiO5b2T5YmNcmQtPnNwYW7nm7jkuqTnmoTmiYDmnInmgKfog73ln5/nmoTljZXlkJHpk77ooajj
gILpk77ooajkuK3nmoTmr4/kuKoNCj4gPj4gK+iKgueCuemDveWMheWQq+S4gOS4quaMh+WQkUVN
5qGG5p625omA5o+Q5L6b55qE57uT5p6E5L2TZW1fcGVyZl9kb21haW7nmoTmjIfpkojjgIINCj4g
Pj4gKw0KPiA+PiAr6ZO+6KGo6KKr6ZmE5Yqg5Zyo5qC55Z+f5LiK77yM5Lul5bqU5a+554us5Y2g
55qEY3B1c2V055qE6YWN572u44CC55Sx5LqO54us5Y2g55qEY3B1c2V055qE6L6555WM5LiN5LiA
5a6a5LiODQo+ID4+ICvmgKfog73ln5/nmoTovrnnlYzkuIDoh7TvvIzkuI3lkIzmoLnln5/nmoTp
k77ooajlj6/og73ljIXlkKvph43lpI3nmoTlhYPntKDjgIINCj4gPj4gKw0KPiA+PiAr56S65L6L
MQ0KPiA+PiArICAgIOiuqeaIkeS7rOiAg+iZkeS4gOS4quaciTEy5LiqQ1BV55qE5bmz5Y+w77yM
5YiG5oiQM+S4quaAp+iDveWfn++8jO+8iHBkMO+8jHBkNOWSjHBkOO+8ie+8jOaMieS7peS4iw0K
PiA+PiArICAgIOaWueW8j+e7hOe7hzo6DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgICAgICAgICAg
Q1BVczogICAwIDEgMiAzIDQgNSA2IDcgOCA5IDEwIDExDQo+ID4+ICsgICAgICAgICAgICAgICAg
IFBEczogICB8LS1wZDAtLXwtLXBkNC0tfC0tLXBkOC0tLXwNCj4gPj4gKyAgICAgICAgICAgICAg
ICAgUkRzOiAgIHwtLS0tcmQxLS0tLXwtLS0tLXJkMi0tLS0tfA0KPiA+PiArDQo+ID4+ICsgICAg
546w5Zyo77yM6ICD6JmR55So5oi356m66Ze05Yaz5a6a5bCG57O757uf5YiG5oiQ5Lik5Liq54us
5Y2g55qEY3B1c2V0c++8jOWboOatpOWIm+W7uuS6huS4pOS4queLrOeri+eahOagueWfn++8jA0K
PiA+PiArICAgIOavj+S4quagueWfn+WMheWQqzbkuKpDUFXjgILov5nkuKTkuKrmoLnln5/lnKjk
uIrlm77kuK3ooqvooajnpLrkuLpyZDHlkoxyZDLjgILnlLHkuo5wZDTkuI5yZDHlkoxyZDINCj4g
Pj4gKyAgICDpg73mnInkuqTpm4bvvIzlroPlsIblkIzml7blh7rnjrDkuo7pmYTliqDlnKjov5nk
uKTkuKrmoLnln5/nmoTigJwtPnBk4oCd6ZO+6KGo5LitOg0KPiA+PiArDQo+ID4+ICsgICAgICAg
KiByZDEtPnBkOiBwZDAgLT4gcGQ0DQo+ID4+ICsgICAgICAgKiByZDItPnBkOiBwZDQgLT4gcGQ4
DQo+ID4+ICsNCj4gPj4gKyAgICDor7fms6jmhI/vvIzosIPluqblmajlsIbkuLpwZDTliJvlu7rk
uKTkuKrph43lpI3nmoTpk77ooajoioLngrnvvIjmr4/kuKrpk77ooajkuK3lkITkuIDkuKrvvInj
gILnhLbogIzov5kNCj4gPj4gKyAgICDkuKTkuKroioLngrnmjIHmnInmjIflkJHlkIzkuIDkuKpF
TeahhuaetueahOWFseS6q+aVsOaNrue7k+aehOeahOaMh+mSiOOAgg0KPiA+PiArDQo+ID4+ICvn
lLHkuo7lr7nov5nkupvpk77ooajnmoTorr/pl67lj6/og73kuI7ng63mj5Lmi5Tlj4rlhbblroPk
uovku7blubblj5Hlj5HnlJ/vvIzlm6DmraTlroPku6zlj5dSQ1XplIHkv53miqTvvIzlsLHlg48N
Cj4gPj4gK+iiq+iwg+W6puWZqOaTjeaOp+eahOaLk+aJkee7k+aehOS4reWJqeS4i+Wtl+auteS4
gOagt+OAgg0KPg0KPiA+IOe7k+aehOS9kw0KPg0KPiBPSw0KPg0KPiA+PiArDQo+ID4+ICtFQVPl
kIzmoLfnu7TmiqTkuobkuIDkuKrpnZnmgIHplK7vvIhzY2hlZF9lbmVyZ3lfcHJlc2VudO+8ie+8
jOW9k+iHs+WwkeacieS4gOS4quagueWfn+a7oei2s0VBUw0KPiA+PiAr5ZCv5Yqo55qE5omA5pyJ
5p2h5Lu25pe277yM6L+Z5Liq6ZSu5bCx5Lya6KKr5ZCv5Yqo44CC5Zyo56ysNuiKguS4reaAu+e7
k+S6hui/meS6m+adoeS7tuOAgg0KPiA+PiArDQo+ID4+ICsNCj4gPj4gKzQuIOiDvemHj+aEn+ef
peS7u+WKoeaUvue9rg0KPiA+PiArLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiArDQo+ID4+ICtF
QVPopobnm5bkuoZDRlPnmoTku7vliqHllKTphpLlubPooaHku6PnoIHjgILlnKjllKTphpLlubPo
oaHml7bvvIzlroPkvb/nlKjlubPlj7DnmoRFTeWSjFBFTFTkv6Hlj7fmnaXpgInmi6noioLog70N
Cj4gPj4gK+eahOebruagh0NQVeOAguW9k0VBU+iiq+WQr+eUqOaXtu+8jHNlbGVjdF90YXNrX3Jx
X2ZhaXIoKeiwg+eUqGZpbmRfZW5lcmd5X2VmZmljaWVudF9jcHUoKQ0KPiA+PiAr5p2l5YGa5Lu7
5Yqh5pS+572u5Yaz5a6a44CC6L+Z5Liq5Ye95pWw5a+75om+5Zyo5q+P5Liq5oCn6IO95Z+f5Lit
5a+75om+5YW35pyJ5pyA6auY5Ymp5L2Z566X5Yqb77yIQ1BV566X5YqbIC0gQ1BVDQo+ID4+ICvl
iKnnlKjnjofvvInnmoRDUFXvvIzlm6DkuLrlroPog73orqnmiJHku6zkv53mjIHmnIDkvY7nmoTp
opHnjofjgILnhLblkI7vvIzor6Xlh73mlbDmo4Dmn6XlsIbku7vliqHmlL7lnKjmlrBDUFXnm7jo
voMNCj4gPj4gK+S+neeEtuaUvuWcqOS5i+WJjea0u+WKqOeahHByZXZfY3B15piv5ZCm5Y+v5Lul
6IqC55yB6IO96YeP44CCDQo+ID4+ICsNCj4gPj4gK2ZpbmRfZW5lcmd5X2VmZmljaWVudF9jcHUo
KeS9v+eUqGNvbXB1dGVfZW5lcmd5KCnmnaXkvLDnrpflpoLmnpzllKTphpLnmoTku7vliqHooqvo
v4Hnp7vvvIwNCj4NCj4gPiDlpoLmnpzllKTphpLnmoTku7vliqHooqvov4Hnp7vvvIxmaW5kX2Vu
ZXJneV9lZmZpY2llbnRfY3B1KCnkvb/nlKhjb21wdXRlX2VuZXJneSgp5p2l5Lyw566XDQo+DQo+
IE9LDQo+DQo+ID4+ICvns7vnu5/lsIbmtojogJflpJrlsJHog73ph4/jgIJjb21wdXRlX2VuZXJn
eSgp5qOA5p+l5ZCEQ1BV5b2T5YmN55qE5Yip55So546H5oOF5Ya177yM5bm25bCd6K+V6LCD5pW0
5p2lDQo+ID4+ICvigJzmqKHmi5/igJ3ku7vliqHov4Hnp7vjgIJFTeahhuaetuaPkOS+m+S6hkFQ
SSBlbV9wZF9lbmVyZ3koKeiuoeeul+avj+S4quaAp+iDveWfn+WcqOe7meWumueahOWIqeeUqOeO
h+adoeS7tg0KPiA+PiAr5LiL55qE6aKE5pyf6IO96YeP5raI6ICX44CCDQo+ID4+ICsNCj4NCj4N
Cj4gVGhhbmtzLA0KPiBUYW5nDQo=

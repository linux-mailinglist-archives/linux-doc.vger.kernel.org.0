Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3D9369580
	for <lists+linux-doc@lfdr.de>; Fri, 23 Apr 2021 17:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243641AbhDWPCU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 23 Apr 2021 11:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243414AbhDWPBt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 11:01:49 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96CCC061358
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:00:36 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e9so8372309plj.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KmAFEdNnAYEfrO+mwgZPgUSxHNuBOrzaSesNX/twQ3A=;
        b=syb0llQ7kIr/XETOGqgR4U2HY8DfvTQ/KsQd1OaBSjIJb+k7ELOUcOomzTalEL78ul
         r0xrewISawLjgdjscivlX6rMQIMO991YN0UsIO7+Dlr5inlNDwv1PbGC6xNq8YYkEYaK
         OrlNPXnjojKzjdqk2AJIPuC8UD6czYwHASWXgM4gf/Anv8mdsAtx2Rladh55/Y1P8uxx
         oJyBmLz+XnCmJFwWbVq/BeFpPsmXlkqNRwRBmvA5KshDHxSRzlGOi6BWwU+icxgU5mN0
         NI229IySNfe7zC2ah2hREfQdPendqLxmwTbHGI2okXFpAxnOmooi98LnZMq8e70yDL7j
         YE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KmAFEdNnAYEfrO+mwgZPgUSxHNuBOrzaSesNX/twQ3A=;
        b=BY4S2RgPCgc1AKejMn6WO32rJOc/KHZd0NlcH9l+rp8KbKUBjO9WwgmDPoc1cRp/VD
         YR7eMWCMZhMK3TrzoHCR47sW9Av3nhDC6fDkTs4/4zKwsx5i50NzI19LbChB9k2sjgfN
         XvIY2/nCBKMWvPunICVt5Gpc2cSqtNUDRbj04qK38gfhhqt8tNWSsk/jTPPtx6B3kbmd
         vJf4lJG06JLos3cfbTCJGW/NZq8AGgLyN33WlNunyXsmO1lW1hOrx2uZ7d0TaSKFP7Cy
         S9eGDjHBJZ5QJp2LWwqqHi/1M/4sQNK16loZiqbKlWoi+dvUVPtxROtCZeorPd7FUEAb
         CiJQ==
X-Gm-Message-State: AOAM531Kah3TeVOcx+p9YGcCAgl6Eq8eI04qF/Y51p4LARaI+On0NkoE
        /yuaAJbVIxZfv8KUivCNNXFPtRsSHJLj0YHfrstcgzjVTFgXTjrL09g=
X-Google-Smtp-Source: ABdhPJx0CWjFpcPWCBpDRG34FS+fsUKP15ZTQp8PoDoIRU6bS10U71r9GnqTjk4QYpECqjGc/5wUGjHLzkeZxev9qg0=
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr6483486pjr.179.1619190036374;
 Fri, 23 Apr 2021 08:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619093668.git.bobwxc@email.cn> <a3964f4a3dd174bcaa7303c4c2078db99bb426ba.1619093668.git.bobwxc@email.cn>
In-Reply-To: <a3964f4a3dd174bcaa7303c4c2078db99bb426ba.1619093668.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 23 Apr 2021 23:00:24 +0800
Message-ID: <CAMU9jJrBabCmPXyfJuicWKSNUoFqYTRZMWq5StoVLyxKrHVc0w@mail.gmail.com>
Subject: Re: [PATCH 4/6] docs/zh_CN: Add translation zh_CN/maintainer/pull-requests.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDIy5pel5ZGo5Zub
IOS4i+WNiDg6MjjlhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9wdWxsLXJlcXVlc3RzLnJz
dA0KPiBhbmQgbGluayBpdCB0byB6aF9DTi9tYWludGFpbmVyL2luZGV4LnJzdA0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+IC0tLQ0KPiAgLi4u
L3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2luZGV4LnJzdCAgIHwgICAyICstDQo+ICAu
Li4vemhfQ04vbWFpbnRhaW5lci9wdWxsLXJlcXVlc3RzLnJzdCAgICAgICAgfCAxNDggKysrKysr
KysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0OSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vbWFpbnRhaW5lci9wdWxsLXJlcXVlc3RzLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2luZGV4LnJzdA0KPiBp
bmRleCAyMWFiN2NlYmY3OGIuLjFhMTIyMmI3ODcxNSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QNCj4gQEAg
LTE1LDkgKzE1LDkgQEANCj4NCj4gICAgIGNvbmZpZ3VyZS1naXQNCj4gICAgIHJlYmFzaW5nLWFu
ZC1tZXJnaW5nDQo+ICsgICBwdWxsLXJlcXVlc3RzDQo+DQo+ICBUT0RPTGlzdDoNCj4NCj4gLS0g
ICBwdWxsLXJlcXVlc3RzDQo+ICAtICAgbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlDQo+ICAtICAg
bW9kaWZ5aW5nLXBhdGNoZXMNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL21haW50YWluZXIvcHVsbC1yZXF1ZXN0cy5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL3B1bGwtcmVxdWVzdHMucnN0DQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2VkNTU3MDhlMDliDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRh
aW5lci9wdWxsLXJlcXVlc3RzLnJzdA0KPiBAQCAtMCwwICsxLDE0OCBAQA0KPiArLi4gaW5jbHVk
ZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRh
dGlvbi9tYWludGFpbmVyL3B1bGwtcmVxdWVzdHMucnN0DQo+ICsNCj4gKzror5HogIU6DQo+ICsN
Cj4gKyDlkLTmg7PmiJAgV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiArDQo+ICsu
LiBfcHVsbHJlcXVlc3RzX3poOg0KPiArDQo+ICvlpoLkvZXliJvlu7rmi4nlj5bor7fmsYINCj4g
Kz09PT09PT09PT09PT09PT0NCj4gKw0KPiAr5pys56ug5o+P6L+w57u05oqk5Lq65ZGY5aaC5L2V
5Yib5bu65bm25ZCR5YW25LuW57u05oqk5Lq65ZGY5o+Q5Lqk5ouJ5Y+W6K+35rGC44CC6L+Z5a+5
5bCG5pu05pS55LuO5LiA5Liq57u05oqk6ICFDQo+ICvmoJHovaznp7vliLDlj6bkuIDkuKrnu7Tm
iqTogIXmoJHpnZ7luLjmnInnlKjjgIINCj4gKw0KPiAr5pys5paH5qGj55SxVG9iaW4gQy4gSGFy
ZGluZ++8iOW9k+aXtuS7luWwmuS4jeaYr+S4gOWQjee7j+mqjOS4sOWvjOeahOe7tOaKpOS6uuWR
mO+8iee8luWGme+8jOWGheWuueS4u+imgQ0KPiAr5p2l6IeqR3JlZyBLcm9haCBIYXJ0bWFu5ZKM
TGludXMgVG9ydmFsZHPlnKhMS01M5LiK55qE6K+E6K6644CCSm9uYXRoYW4gQ29yYmV05ZKMTWF1
cm8NCj4gK0NhcnZhbGhvIENoZWhhYuaPkOWHuuS6huS4gOS6m+W7uuiuruWSjOS/ruaUueOAgumU
meivr+S4jeWPr+mBv+WFje+8jOWmguaciemXrumimO+8jOivt+aJvlRvYmluIEMuDQo+ICtIYXJk
aW5nIDxtZUB0b2Jpbi5jYz7jgIINCj4gKw0KPiAr5Y6f5aeL6YKu5Lu257q/56iLOjoNCj4gKw0K
PiArICAgICAgIGh0dHA6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE3MTExNDExMDUwMC5HQTIxMTc1
QGtyb2FoLmNvbQ0KPiArDQo+ICsNCj4gK+WIm+W7uuWIhuaUrw0KPiArLS0tLS0tLS0NCj4gKw0K
PiAr6aaW5YWI77yM5oKo6ZyA6KaB5bCG5biM5pyb5YyF5ZCr5ouJ5Y+W6K+35rGC6YeM55qE5omA
5pyJ5pu05pS56YO95pS+5Zyo5Y2V54us5YiG5pSv5Lit44CC6YCa5bi45oKo5Lya5Z+65LqO5oKo
5omT566XDQo+ICvlkJHlhbblj5HpgIHmi4nlj5bor7fmsYLnmoTlvIDlj5HkurrlkZjmoJHkuK3n
moTmn5DkuKrliIbmlK/jgIINCkNhbiB5b3Ugc3BsaXQgaXQgaW50byBzaG9ydCBzZW50ZW5jZXM/
IEkgaGF2ZSBkaWZmaWN1bHR5IGluIHVuZGVyc3RhbmRpbmcgaXQuDQo+ICsNCj4gK+S4uuS6huWI
m+W7uuaLieWPluivt+axgu+8jOaCqOW/hemhu+mmluWFiOagh+iusOWImuWImuWIm+W7uueahOWI
huaUr+OAguW7uuiuruaCqOmAieaLqeS4gOS4quacieaEj+S5ieeahOagh+iusOWQje+8jA0KPiAr
5Lul5Y2z5L2/6L+H5LqG5LiA5q615pe26Ze05oKo5ZKM5LuW5Lq65LuN6IO955CG6Kej55qE5pa5
5byP44CC5Zyo5ZCN56ew5Lit5YyF5ZCr5rqQ5a2Q57O757uf5ZKM55uu5qCH5YaF5qC454mI5pys
DQo+ICvnmoTmjIfnpLrkuZ/mmK/kuIDkuKrlpb3nmoTlgZrms5XjgIINCj4gKw0KPiArR3JlZ+aP
kOS+m+S6huS7peS4i+WGheWuueOAguWvueS6juS4gOS4quWQq+aciWRyaXZlcnMvY2hhcuS4rea3
t+adguS6i+mhueOAgeWwhuW6lOeUqOS6jjQuMTUtcmMx5YaF5qC455qEDQo+ICvmi4nlj5bor7fm
sYLvvIzlj6/ku6Xlkb3lkI3kuLogYGBjaGFyLW1pc2MtNC4xNS1yYzFgYCDjgILlpoLmnpzov5nm
oLfnmoTmoIforrDkvJrmoIfms6jlnKjlkI3kuLoNCuS8miAtPiDlsIbopoHvvJ8NCm1heWJlIOWm
guaenOi/meagt+eahOagh+etvuS8muS7juS4gOS4quWQjeS4umBgY2hhci1taXNjLW5leHRgYCDn
moTliIbmlK/kuK3kuqfnlJ8s6YKj5LmI5oKo5bCG5Y+v5Lul4oCm4oCm77yfDQo+ICtgYGNoYXIt
bWlzYy1uZXh0YGAg55qE5YiG5pSv5LiK77yM5oKo5bCG5L2/55So5Lul5LiL5ZG95LukOjoNCj4g
Kw0KPiArICAgICAgIGdpdCB0YWcgLXMgY2hhci1taXNjLTQuMTUtcmMxIGNoYXItbWlzYy1uZXh0
DQo+ICsNCj4gK+i/meWwhuWcqCBgYGNoYXItbWlzYy1uZXh0YGAg5YiG5pSv55qE5pyA5ZCO5LiA
5Liq5o+Q5Lqk5LiK5Yib5bu65LiA5Liq5ZCN5Li6IGBgY2hhci1taXNjLTQuMTUtcmMxYGANCj4g
K+eahOagh+iusO+8jOW5tueUqOaCqOeahGdwZ+WvhumSpeetvuWQje+8iOWPguingSBEb2N1bWVu
dGF0aW9uL21haW50YWluZXIvY29uZmlndXJlLWdpdC5yc3Qg77yJ44CCDQo+ICsNCj4gK0xpbnVz
5Y+q5o6l5Y+X5Z+65LqO562+5ZCN6L+H55qE5qCH6K6w55qE5ouJ5Y+W6K+35rGC44CC5YW25LuW
57u05oqk6ICF5Y+v6IO95Lya5pyJ5omA5LiN5ZCM44CCDQo+ICsNCj4gK+W9k+aCqOi/kOihjOS4
iui/sOWRveS7pOaXtiBgYGdpdGBgIOS8muaJk+W8gOe8lui+keWZqOimgeaxguS9oOaPj+i/sOS4
gOS4i+i/meS4quagh+etvuOAguWcqOacrOS+i+S4reaCqOmcgOimgQ0KPiAr5o+P6L+w5ouJ5Y+W
6K+35rGC77yM5omA5Lul6K+35qaC6L+w5LiA5LiL5YyF5ZCr55qE5YaF5a6577yM5Li65LuA5LmI
6KaB5ZCI5bm277yM5piv5ZCm5a6M5oiQ5Lu75L2V5rWL6K+V44CC5omA5pyJDQo+ICvov5nkupvk
v6Hmga/pg73lsIbnlZnlnKjmoIforrDkuK3vvIznhLblkI7lnKjnu7TmiqTogIXlkIjlubbmi4nl
j5bor7fmsYLml7bkv53nlZnlnKjlkIjlubbmj5DkuqTkuK3jgILmiYDku6XmiorlroMNCuaJgOS7
peivt+aKiuWug+WGmeWlve+8iG9y5YaZ6K+m57uGL+WHhuehru+8n++8iQ0KPiAr5YaZ5aW977yM
5a6D5bCG5rC46L+c55WZ5Zyo5YaF5qC45Lit44CCDQo+ICsNCj4gK+ato+WmgkxpbnVz5omA6K+0
OjoNCj4gKw0KPiArICAgICAgIOS4jeeuoeaAjuS5iOagt++8jOiHs+WwkeWvueaIkeadpeivtO+8
jOmHjeimgeeahOaYryAq5raI5oGvKiDjgILmiJHpnIDopoHnn6XpgZPmiJHlnKjmi4nlj5bku4Dk
uYjjgIENCm1heWJlIOa2iOaBryAtPiDkv6Hmga/vvJ8NCj4gKyAgICAgICDkuLrku4DkuYjmiJHo
poHmi4nlj5bjgILmiJHkuZ/luIzmnJvlsIbmraTmtojmga/nlKjkuo7lkIjlubbmtojmga/vvIzl
m6DmraTlroPkuI3ku4XlupTor6Xlr7nmiJHmnIkNCj4gKyAgICAgICDmhI/kuYnvvIzkuZ/lupTo
r6Xlj6/ku6XmiJDkuLrkuIDkuKrmnInmhI/kuYnnmoTljoblj7LorrDlvZXjgIINCj4gKw0KPiAr
ICAgICAgIOazqOaEj++8jOWmguaenOaLieWPluivt+axguacieS4gOS6m+S4jeWvu+W4uOeahOWc
sOaWue+8jOivt+ivpue7huivtOaYjuOAguWmguaenOS9oOS/ruaUueS6huW5tumdng0KPiArICAg
ICAgIOeUseS9oOe7tOaKpOeahOaWh+S7tu+8jOivt+ino+mHiiAqKuS4uuS7gOS5iCoqIOOAguaI
keaAu+S8muWcqOW3ruW8guS4reeci+WIsOeahO+8jOWmguaenOS9oOS4jQ0KPiArICAgICAgIOaP
kOeahOivne+8jOaIkeWPquS8muinieW+l+WIhuWkluWPr+eWkeOAguW9k+S9oOWcqOWQiOW5tueq
l+WPo+WQjue7meaIkeWPkeaWsOS4nOilv+eahOaXtuWAme+8jA0KPiArICAgICAgIO+8iOeUmuiH
s+aYr+avlOi+g+mHjeWkp+eahOmUmeivr+S/ruWkje+8ie+8jOS4jeS7hemcgOimgeino+mHiuWB
muS6huS7gOS5iOOAgeS4uuS7gOS5iOi/meS5iOWBmu+8jA0KPiArICAgICAgIOi/mOivt+ino+mH
iuS4gOS4iyAqKuaXtumXtCoqIOOAguS4uuS7gOS5iOmUmei/h+S6huWQiOW5tueql+WPo+KApuKA
pg0KPiArDQo+ICsgICAgICAg5oiR5Lya55yL5L2g5YaZ5Zyo5ouJ5Y+W6K+35rGC6YKu5Lu25ZKM
562+5ZCN5qCH6K6w6YeM6Z2i55qE5YaF5a6577yM5omA5Lul5qC55o2u5L2g55qE5bel5L2c5rWB
77yMDQo+ICsgICAgICAg5L2g5Y+v5Lul5Zyo562+5ZCN5qCH6K6w6YeM6Z2i5o+P6L+w5bel5L2c
5YaF5a6577yI5Lmf5Lya6Ieq5Yqo5pS+6L+b5ouJ5Y+W6K+35rGC6YKu5Lu277yJ77yM5LmfDQo+
ICsgICAgICAg5Y+v5Lul5Y+q5Zyo5qCH6K6w6YeM6Z2i5pS+5Liq5Y2g5L2N56ym77yM56iN5ZCO
5Zyo5L2g5a6e6ZmF5Y+R57uZ5oiR5ouJ5Y+W6K+35rGC5pe25o+P6L+w5bel5L2c5YaF5a6544CC
DQo+ICsNCj4gKyAgICAgICDmmK/nmoTvvIzmiJHkvJrnvJbovpHov5nkupvmtojmga/jgILpg6jl
iIblm6DkuLrmiJHpnIDopoHlgZrkuIDkupvnkJDnoo7nmoTmoLzlvI/osIPmlbTvvIjmlbTkvZPn
vKnov5vjgIENCj4gKyAgICAgICDmi6zlj7fnrYnvvInvvIzkuZ/lm6DkuLrmraTmtojmga/lj6/o
g73lr7nmiJHmnInmhI/kuYnvvIjmj4/ov7DkuoblhrLnqoHmiJbkuIDkupvkuKrkurrpl67popjv
vInogIzlr7kNCj4gKyAgICAgICDlkIjlubbmj5DkuqTkv6Hmga/kuIrkuIvmlofmsqHllaXmhI/k
uYnvvIzml6DlmaLogLbmiJHpnIDopoHlsL3lipvorqnlroPmnInmhI/kuYnotbfmnaXjgILmiJHk
uZ/kvJoNCndoYXQgaXMgIuaXoOWZouiAtuKAnD8gIDopDQo+ICsgICAgICAg5L+u5aSN5LiA5Lqb
5ou85YaZ5ZKM6K+t5rOV6ZSZ6K+v77yM54m55Yir5piv6Z2e5q+N6K+t6ICF77yI5q+N6K+t6ICF
5Lmf5pivO17vvInjgILkvYbmiJHkuZ/kvJrliKDmjokNCj4gKyAgICAgICDmiJblop7liqDkuIDk
upvlhoXlrrnjgIINCj4gKw0KPiArICAgICAgICAgICAgICAgICAgICAgICBMaW51cw0KPiArDQo+
ICtHcmVn57uZ5Ye65LqG5LiA5Liq5ouJ5Y+W6K+35rGC55qE5L6L5a2QOjoNCj4gKw0KPiArICAg
ICAgIENoYXIvTWlzYyBwYXRjaGVzIGZvciA0LjE1LXJjMQ0KPiArDQo+ICsgICAgICAgSGVyZSBp
cyB0aGUgYmlnIGNoYXIvbWlzYyBwYXRjaCBzZXQgZm9yIHRoZSA0LjE1LXJjMSBtZXJnZSB3aW5k
b3cuDQo+ICsgICAgICAgQ29udGFpbmVkIGluIGhlcmUgaXMgdGhlIG5vcm1hbCBzZXQgb2YgbmV3
IGZ1bmN0aW9ucyBhZGRlZCB0byBhbGwNCj4gKyAgICAgICBvZiB0aGVzZSBjcmF6eSBkcml2ZXJz
LCBhcyB3ZWxsIGFzIHRoZSBmb2xsb3dpbmcgYnJhbmQgbmV3DQo+ICsgICAgICAgc3Vic3lzdGVt
czoNCj4gKyAgICAgICAgICAgICAgIC0gdGltZV90cmF2ZWxfY29udHJvbGxlcjogRmluYWxseSBh
IHNldCBvZiBkcml2ZXJzIGZvciB0aGUNCj4gKyAgICAgICAgICAgICAgICAgbGF0ZXN0IHRpbWUg
dHJhdmVsIGJ1cyBhcmNoaXRlY3R1cmUgdGhhdCBwcm92aWRlcyBpL28gdG8NCj4gKyAgICAgICAg
ICAgICAgICAgdGhlIENQVSBiZWZvcmUgaXQgYXNrZWQgZm9yIGl0LCBhbGxvd2luZyB1bmludGVy
cnVwdGVkDQo+ICsgICAgICAgICAgICAgICAgIHByb2Nlc3NpbmcNCj4gKyAgICAgICAgICAgICAg
IC0gcmVsYXRpdml0eV9zaGlmdGVyczogZHVlIHRvIHRoZSBhZmZlY3QgdGhhdCB0aGUNCj4gKyAg
ICAgICAgICAgICAgICAgdGltZV90cmF2ZWxfY29udHJvbGxlcnMgaGF2ZSBvbiB0aGUgb3ZlcmFs
bCBzeXN0ZW0sIHRoZXJlDQo+ICsgICAgICAgICAgICAgICAgIHdhcyBhIG5lZWQgZm9yIGEgbmV3
IHNldCBvZiByZWxhdGl2aXR5IHNoaWZ0ZXIgZHJpdmVycyB0bw0KPiArICAgICAgICAgICAgICAg
ICBhY2NvbW1vZGF0ZSB0aGUgbmV3bHkgZm9ybWVkIGJsYWNrIGhvbGVzIHRoYXQgd291bGQNCj4g
KyAgICAgICAgICAgICAgICAgdGhyZWF0ZW4gdG8gc3VjayBDUFVzIGludG8gdGhlbS4gIFRoaXMg
c3Vic3lzdGVtIGhhbmRsZXMNCj4gKyAgICAgICAgICAgICAgICAgdGhpcyBpbiBhIHdheSB0byBz
dWNjZXNzZnVsbHkgbmV1dHJhbGl6ZSB0aGUgcHJvYmxlbXMuDQo+ICsgICAgICAgICAgICAgICAg
IFRoZXJlIGlzIGEgS2NvbmZpZyBvcHRpb24gdG8gZm9yY2UgdGhlc2UgdG8gYmUgZW5hYmxlZA0K
PiArICAgICAgICAgICAgICAgICB3aGVuIG5lZWRlZCwgc28gcHJvYmxlbXMgc2hvdWxkIG5vdCBv
Y2N1ci4NCj4gKw0KPiArICAgICAgIEFsbCBvZiB0aGVzZSBwYXRjaGVzIGhhdmUgYmVlbiBzdWNj
ZXNzZnVsbHkgdGVzdGVkIGluIHRoZSBsYXRlc3QNCj4gKyAgICAgICBsaW51eC1uZXh0IHJlbGVh
c2VzLCBhbmQgdGhlIG9yaWdpbmFsIHByb2JsZW1zIHRoYXQgaXQgZm91bmQgaGF2ZQ0KPiArICAg
ICAgIGFsbCBiZWVuIHJlc29sdmVkIChhcG9sb2dpZXMgdG8gYW55b25lIGxpdmluZyBuZWFyIENh
bmJlcnJhIGZvciB0aGUNCj4gKyAgICAgICBsYWNrIG9mIHRoZSBLY29uZmlnIG9wdGlvbnMgaW4g
dGhlIGVhcmxpZXIgdmVyc2lvbnMgb2YgdGhlDQo+ICsgICAgICAgbGludXgtbmV4dCB0cmVlIGNy
ZWF0aW9ucy4pDQo+ICsNCj4gKyAgICAgICBTaWduZWQtb2ZmLWJ5OiBZb3VyLW5hbWUtaGVyZSA8
eW91cl9lbWFpbEBkb21haW4+DQo+ICsNCj4gKw0KPiAr5q2k5qCH6K6w5raI5oGv5qC85byP5bCx
5YOP5LiA5LiqZ2l05o+Q5Lqk44CC6aG26YOo5pyJ5LiA6KGM4oCc5oC757uT5qCH6aKY4oCd77yM
IOS4gOWumuimgeWcqOS4i+mdonNpZ24tb2Zm44CCDQo+ICsNCj4gK+eOsOWcqOaCqOW3sue7j+ac
ieS6huS4gOS4quacrOWcsOetvuWQjeagh+iusO+8jOaCqOmcgOimgeWwhuWug+aOqOmAgeWIsOWP
r+S7peiiq+aLieWPlueahOS9jee9rjo6DQo+ICsNCj4gKyAgICAgICBnaXQgcHVzaCBvcmlnaW4g
Y2hhci1taXNjLTQuMTUtcmMxDQo+ICsNCj4gKw0KPiAr5Yib5bu65ouJ5Y+W6K+35rGCDQo+ICst
LS0tLS0tLS0tLS0NCj4gKw0KPiAr5pyA5ZCO6KaB5YGa55qE5piv5Yib5bu65ouJ5Y+W6K+35rGC
5raI5oGv44CC5Y+v5Lul5L2/55SoIGBgZ2l0IHJlcXVlc3QtcHVsbGBgIOWRveS7pOiuqSBgYGdp
dGBgDQo+ICvkuLrkvaDlgZrov5nku7bkuovvvIzkvYblroPpnIDopoHnoa7lrprkvaDmg7Pmi4nl
j5bku4DkuYjvvIzku6Xlj4rmi4nlj5bpkojlr7nnmoTln7rnoYDvvIjmmL7npLrmraPnoa7nmoTm
i4nlj5YNCj4gK+abtOaUueWSjOWPmOabtOeKtuaAge+8ieOAguS7peS4i+WRveS7pOWwhueUn+aI
kOS4gOS4quaLieWPluivt+axgjo6DQo+ICsNCj4gKyAgICAgICBnaXQgcmVxdWVzdC1wdWxsIG1h
c3RlciBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2to
L2NoYXItbWlzYy5naXQvIGNoYXItbWlzYy00LjE1LXJjMQ0KPiArDQo+ICvlvJXnlKhHcmVn55qE
6K+dOjoNCj4gKw0KPiArICAgICAgIOatpOWRveS7pOimgeaxgmdpdOavlOi+g+S7juKAnGNoYXIt
bWlzYy00LjE1LXJjMeKAneagh+iusOS9jee9ruWIsOKAnG1hc3RlcuKAneWIhuaUr+WktO+8iOS4
iui/sA0KPiArICAgICAgIOS+i+WtkOS4reaMh+WQkeS6huaIkeS7jkxpbnVz55qE5qCR5YiG5Y+J
55qE5Zyw5pa577yM6YCa5bi45pivLXJj5Y+R5biD77yJ55qE5beu5byC77yM5bm25Y675L2/55So
DQo+ICsgICAgICAgZ2l0Oi8vIOWNj+iuruaLieWPluOAguWmguaenOS9oOW4jOacm+S9v+eUqCBo
dHRwczovLyDljY/orq7vvIzkuZ/lj6/ku6XnlKjlnKjov5nph4zvvIjkvYbmmK/or7cNCj4gKyAg
ICAgICDms6jmhI/vvIzpg6jliIbkurrnlLHkuo7pmLLngavlopnpl67popjmsqHms5XnlKhodHRw
c+WNj+iuruaLieWPlu+8ieOAgg0KPiArDQo+ICsgICAgICAg5aaC5p6cY2hhci1taXNjLTQuMTUt
cmMx5qCH6K6w5rKh5pyJ5Ye6546w5Zyo5oiR6KaB5rGC5ouJ5Y+W55qE5LuT5bqT5Lit77yMZ2l0
5Lya5o+Q6YaSDQo+ICsgICAgICAg5a6D5LiN5Zyo6YKj6YeM77yM5omA5Lul6K6w5b6X5o6o6YCB
5Yiw5YWs5byA5Zyw5pa544CCDQo+ICsNCj4gKyAgICAgICDigJxnaXQgcmVxdWVzdC1wdWxs4oCd
5Lya5YyF5ZCrZ2l05qCR55qE5Zyw5Z2A5ZKM6ZyA6KaB5ouJ5Y+W55qE54m55a6a5qCH6K6w77yM
5Lul5Y+K5qCH6K6wDQo+ICsgICAgICAg5o+P6L+w5YWo5paH77yI6K+m5bC95o+P6L+w5qCH6K6w
77yJ44CC5ZCM5pe25a6D5Lmf5Lya5Yib5bu65q2k5ouJ5Y+W6K+35rGC55qE5beu5byC54q25oCB
5ZKM5Y2V5LiqDQo+ICsgICAgICAg5o+Q5Lqk55qE57yp55+t5pel5b+X44CCDQo+ICsNCj4gK0xp
bnVz5Zue5aSN6K+05LuW5YC+5ZCR5LqOIGBgZ2l0Oi8vYGAg5Y2P6K6u44CC5YW25LuW57u05oqk
6ICF5Y+v6IO95pyJ5LiN5ZCM55qE5YGP5aW944CC5Y+m5aSW77yM6K+35rOo5oSPDQo+ICvlpoLm
npzkvaDliJvlu7rnmoTmi4nlj5bor7fmsYLmsqHmnInnrb7lkI3moIforrDvvIwgYGBodHRwczov
L2BgIOWPr+iDveaYr+abtOWlveeahOmAieaLqeOAguWujOaVtOeahOiuqOiuug0KPiAr6K+355yL
5Y6f6YKu5Lu244CCDQo+ICsNCj4gKw0KPiAr5o+Q5Lqk5ouJ5Y+W6K+35rGCDQo+ICstLS0tLS0t
LS0tLS0NCj4gKw0KPiAr5ouJ5Y+W6K+35rGC55qE5o+Q5Lqk5pa55byP5LiO5pmu6YCa6KGl5LiB
55u45ZCM44CC5ZCR57u05oqk5Lq65ZGY5Y+R6YCB5YaF6IGU55S15a2Q6YKu5Lu25bm25oqE6YCB
TEtNTOS7peWPig0KPiAr5Lu75L2V5b+F6KaB54m55a6a5a2Q57O757uf55qE5YiX6KGo44CC5a+5
TGludXPnmoTmi4nlj5bor7fmsYLpgJrluLjmnInlpoLkuIvkuLvpopjooYw6Og0KPiArDQo+ICsg
ICAgICAgW0dJVCBQVUxMXSA8c3Vic3lzdGVtPiBjaGFuZ2VzIGZvciB2NC4xNS1yYzENCj4gLS0N
Cj4gMi4yMC4xDQo+DQoNClRoYW5rcywNCg0KWWFudGVuZw0K

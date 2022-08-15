Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9A4592FB5
	for <lists+linux-doc@lfdr.de>; Mon, 15 Aug 2022 15:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242885AbiHONVD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Aug 2022 09:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242923AbiHONUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Aug 2022 09:20:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543DCE0FD;
        Mon, 15 Aug 2022 06:20:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id e15so10656922lfs.0;
        Mon, 15 Aug 2022 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=0eNzNalmYjkLj3EvZ8xRmVYE7i+Fqcg6gXdcN8bJlbw=;
        b=I7Kc18o+y3uvxPQoqg/ACPdlfO+rqscnm+UWMlal3Z18E9ogjH4f7X9pSTFn+bLwZX
         jCowvhfPlbU7Ams988hCK/NNxlVdDCUD4tRL/SGfZvM8cY1TWHFJoG4jNpUdeSHIW5QW
         Xi68GqylclJTN/pXXjvz82UZTBIidAho9wXiLoZCAIVst2VUt/GheGncVpmZb11eXKjU
         CVu50WvWbIxAdObifdaD/v5xxT/JFuXs2MO1BrvJGRHU6TNj/fkPYe/WxgMU6AAydNXu
         HTixB/Re+jGDcxC7Sn7Ru8LaMBewhSksXUXIoDhZMW46XoyDJTDXO9KdoSo5H7CgznMB
         7Tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=0eNzNalmYjkLj3EvZ8xRmVYE7i+Fqcg6gXdcN8bJlbw=;
        b=oEVeUOMV8YNRLTDpCF3slCOOMwSi5+nmc3vYmJiDnNurPNcW+ZNyic6NGuGS/r3WBL
         ouuBNetRPqjSeXoQQSvAD5boMexmE8gUCtVQ3S+OR1xlitMGCWrT3pBx2NIRAkUaflRG
         D3eu5oMrAisp3G1jHmVAd9NE3AgMK0COLZqSgy6l1QnX5LIhXDY3uXjCexNa/j2zoOw+
         ZwlZloMF2AiXMFLELSt87tXvNM7vLVT5O+8JXq2n2Iie05tY9n4E4i9vGYKLKH03G46y
         Ob6GVEGNW/jwQW7t/K3kAI3J+AIqHhbnA1ZCYhj6YTaEgegTE3SACrITr8F5IzzpcO7i
         D8Ww==
X-Gm-Message-State: ACgBeo16poTyU/HuMQmfILCAicpVeymGCvH3s96BrxvweLVy9Tb7PfIs
        emfmWcCeeHd0A4AKurTmJ9uRxNXN3YlpXcTrA5I=
X-Google-Smtp-Source: AA6agR6l8AbhKikYGe0wPutWl1lMTJbPC5w9OsU/ElQlUgovO1Vrnky2xTWBTSWd5um3AuwR2+kNaITW9rPAjMPjKL8=
X-Received: by 2002:a05:6512:2023:b0:48a:f7e5:8ca2 with SMTP id
 s3-20020a056512202300b0048af7e58ca2mr6027886lfs.592.1660569638216; Mon, 15
 Aug 2022 06:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815091357.2723152-1-siyanteng@loongson.cn>
In-Reply-To: <20220815091357.2723152-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 15 Aug 2022 21:20:01 +0800
Message-ID: <CAJy-AmkuPqjAErNgNZAMmmQz299r6J8LsBDSCw=-OD+Qdd2pFA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update the translation of gpio to 6.0-rc1
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tekkamanninja@gmail.com,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <wu.xiangcheng@linux.dev>,
        linux-gpio@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
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

T24gTW9uLCBBdWcgMTUsIDIwMjIgYXQgNToxNCBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBVcGRhdGUgdG8gY29tbWl0IDU1MTNiNDExZWE1YiAoIkRv
Y3VtZW50YXRpb246IHJlbmFtZSBwaW5jdGwgdG8NCj4gcGluLWNvbnRyb2wiKQ0KPiBNb3ZlIC4u
Li96aF9DTi9ncGlvLnR4dCB0byAuLi4vemhfQ04vZHJpdmVyLWFwaS9ncGlvL2xlZ2FjeS5yc3QN
Cj4gVHJhbnNsYXRlIC4uLi9kcml2ZXItYXBpL2luZGV4LnJzdCBpbnRvIENoaW5lc2UuDQo+IFRy
YW5zbGF0ZSAuLi4vZHJpdmVyLWFwaS9ncGlvL2luZGV4LnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2
aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3po
X0NOL2RyaXZlci1hcGkvZ3Bpby9pbmRleC5yc3QgICAgICAgICAgIHwgIDY5ICsrKysrKw0KPiAg
Li4uL3tncGlvLnR4dCA9PiBkcml2ZXItYXBpL2dwaW8vbGVnYWN5LnJzdH0gIHwgMjIxICsrKysr
KysrKysrKy0tLS0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9kcml2ZXItYXBpL2luZGV4
LnJzdCAgIHwgMTMyICsrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9pbmRleC5yc3QgICAgfCAgIDIgKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzQ4IGluc2Vy
dGlvbnMoKyksIDc2IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RyaXZlci1hcGkvZ3Bpby9pbmRleC5yc3QNCj4gIHJl
bmFtZSBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi97Z3Bpby50eHQgPT4gZHJpdmVy
LWFwaS9ncGlvL2xlZ2FjeS5yc3R9ICg4NiUpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZHJpdmVyLWFwaS9pbmRleC5yc3QNCj4NCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RyaXZlci1hcGkvZ3Bp
by9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kcml2ZXItYXBp
L2dwaW8vaW5kZXgucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uOWFiNjRlOTRhY2VkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vZHJpdmVyLWFwaS9ncGlvL2luZGV4LnJzdA0KPiBAQCAtMCww
ICsxLDY5IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArDQo+
ICsuLiBpbmNsdWRlOjogLi4vLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdp
bmFsOiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZ3Bpby9pbmRleC5yc3QNCj4gKw0KPiArOue/
u+ivkToNCj4gKw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24u
Y24+DQo+ICsNCj4gKzrmoKHor5E6DQo+ICsNCj4gKz09PT09PT09PT09PT09PT09PT09PT09DQo+
ICvpgJrnlKjlnovovpPlhaUv6L6T5Ye677yIR1BJT++8iQ0KPiArPT09PT09PT09PT09PT09PT09
PT09PT0NCj4gKw0KPiAr55uu5b2VOg0KPiArDQo+ICsuLiB0b2N0cmVlOjoNCj4gKyAgIDptYXhk
ZXB0aDogMg0KPiArDQo+ICsgICBsZWdhY3kNCj4gKw0KPiArVG9kb2xpc3Q6DQo+ICsNCj4gKyog
ICBpbnRybw0KPiArKiAgIHVzaW5nLWdwaW8NCj4gKyogICBkcml2ZXINCj4gKyogICBjb25zdW1l
cg0KPiArKiAgIGJvYXJkDQo+ICsqICAgZHJpdmVycy1vbi1ncGlvDQo+ICsqICAgYnQ4eHhncGlv
DQo+ICsNCj4gK+aguOW/gw0KPiArPT09PQ0KPiArDQo+ICvor6VBUEnlnKjku6XkuIvlhoXmoLjk
u6PnoIHkuK06DQo+ICsNCj4gK2luY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaA0KPiArDQo+ICtk
cml2ZXJzL2dwaW8vZ3Bpb2xpYi5jDQo+ICsNCj4gK0FDUEnmlK/mjIENCj4gKz09PT09PT09DQo+
ICsNCj4gK+ivpUFQSeWcqOS7peS4i+WGheaguOS7o+eggeS4rToNCj4gKw0KPiArZHJpdmVycy9n
cGlvL2dwaW9saWItYWNwaS5jDQo+ICsNCj4gK+iuvuWkh+agkeaUr+aMgQ0KPiArPT09PT09PT09
PQ0KPiArDQo+ICvor6VBUEnlnKjku6XkuIvlhoXmoLjku6PnoIHkuK06DQo+ICsNCj4gK2RyaXZl
cnMvZ3Bpby9ncGlvbGliLW9mLmMNCj4gKw0KPiAr6K6+5aSH566h55CG5pSv5oyBDQo+ICs9PT09
PT09PT09PT0NCj4gKw0KPiAr6K+lQVBJ5Zyo5Lul5LiL5YaF5qC45Luj56CB5LitOg0KPiArDQo+
ICtkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1kZXZyZXMuYw0KPiArDQo+ICtzeXNmc+W4ruWKqe+8iOWH
veaVsO+8iQ0KPiArPT09PT09PT09PT09PT09PT0NCj4gKw0KPiAr6K+lQVBJ5Zyo5Lul5LiL5YaF
5qC45Luj56CB5LitOg0KPiArDQo+ICtkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1zeXNmcy5jDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ncGlvLnR4dCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RyaXZlci1hcGkvZ3Bpby9sZWdhY3kucnN0
DQo+IHNpbWlsYXJpdHkgaW5kZXggODYlDQo+IHJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL2dwaW8udHh0DQo+IHJlbmFtZSB0byBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9kcml2ZXItYXBpL2dwaW8vbGVnYWN5LnJzdA0KPiBpbmRleCBhMjNlZTE0
ZmM5MjcuLjc2MTY1NjllZDc2MiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vZ3Bpby50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vZHJpdmVyLWFwaS9ncGlvL2xlZ2FjeS5yc3QNCj4gQEAgLTEsMzAgKzEsMTkgQEANCj4g
LUNoaW5lc2UgdHJhbnNsYXRlZCB2ZXJzaW9uIG9mIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
Z3Bpbw0KPiAtDQo+IC1JZiB5b3UgaGF2ZSBhbnkgY29tbWVudCBvciB1cGRhdGUgdG8gdGhlIGNv
bnRlbnQsIHBsZWFzZSBjb250YWN0IHRoZQ0KPiAtb3JpZ2luYWwgZG9jdW1lbnQgbWFpbnRhaW5l
ciBkaXJlY3RseS4gIEhvd2V2ZXIsIGlmIHlvdSBoYXZlIGEgcHJvYmxlbQ0KPiAtY29tbXVuaWNh
dGluZyBpbiBFbmdsaXNoIHlvdSBjYW4gYWxzbyBhc2sgdGhlIENoaW5lc2UgbWFpbnRhaW5lciBm
b3INCj4gLWhlbHAuICBDb250YWN0IHRoZSBDaGluZXNlIG1haW50YWluZXIgaWYgdGhpcyB0cmFu
c2xhdGlvbiBpcyBvdXRkYXRlZA0KPiAtb3IgaWYgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhl
IHRyYW5zbGF0aW9uLg0KPiAtDQo+IC1NYWludGFpbmVyOiBHcmFudCBMaWtlbHkgPGdyYW50Lmxp
a2VseUBzZWNyZXRsYWIuY2E+DQo+IC0gICAgICAgICAgICAgICBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IC1DaGluZXNlIG1haW50YWluZXI6IEZ1IFdlaSA8dGVr
a2FtYW5uaW5qYUBnbWFpbC5jb20+DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLURvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvZ3BpbyDnmoTkuK3mlofnv7vor5ENCj4gLQ0KPiAt5aaC5p6c5oOz6K+E6K66
5oiW5pu05paw5pys5paH55qE5YaF5a6577yM6K+355u05o6l6IGU57O75Y6f5paH5qGj55qE57u0
5oqk6ICF44CC5aaC5p6c5L2g5L2/55So6Iux5paHDQo+IC3kuqTmtYHmnInlm7Dpmr7nmoTor53v
vIzkuZ/lj6/ku6XlkJHkuK3mlofniYjnu7TmiqTogIXmsYLliqnjgILlpoLmnpzmnKznv7vor5Hm
m7TmlrDkuI3lj4rml7bmiJbogIXnv7sNCj4gLeivkeWtmOWcqOmXrumimO+8jOivt+iBlOezu+S4
reaWh+eJiOe7tOaKpOiAheOAgg0KPiAt6Iux5paH54mI57u05oqk6ICF77yaIEdyYW50IExpa2Vs
eSA8Z3JhbnQubGlrZWx5QHNlY3JldGxhYi5jYT4NCj4gLSAgICAgICAgICAgICAgIExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gLeS4reaWh+eJiOe7tOaKpOiAhe+8
miDlgoXngpwgRnUgV2VpIDx0ZWtrYW1hbm5pbmphQGdtYWlsLmNvbT4NCj4gLeS4reaWh+eJiOe/
u+ivkeiAhe+8miDlgoXngpwgRnUgV2VpIDx0ZWtrYW1hbm5pbmphQGdtYWlsLmNvbT4NCj4gLeS4
reaWh+eJiOagoeivkeiAhe+8miDlgoXngpwgRnUgV2VpIDx0ZWtrYW1hbm5pbmphQGdtYWlsLmNv
bT4NCj4gLQ0KPiAtDQo+IC3ku6XkuIvkuLrmraPmlocNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAtR1BJ
TyDmjqXlj6MNCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsNCj4g
Ky4uIGluY2x1ZGU6OiAuLi8uLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2lu
YWw6IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlvL2xlZ2FjeS5yc3QNCj4gKw0KPiArOue/
u+ivkToNCj4gKw0KPiArIOWCheeCnCBGdSBXZWkgPHRla2thbWFubmluamFAZ21haWwuY29tPg0K
PiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4g
KzrmoKHor5E6DQo+ICsNCj4gKw0KPiAr5Lyg57ufR1BJT+aOpeWPow0KPiArPT09PT09PT09PT09
DQo+DQo+ICDmnKzmlofmoaPmj5DkvpvkuobkuIDkuKrlnKhMaW51eOS4i+iuv+mXrkdQSU/nmoTl
haznuqbmpoLov7DjgIINCj4NCj4gQEAgLTMyLDggKzIxLDggQEAgR1BJTyDmjqXlj6MNCj4gIF9f
Z3Bpb18qIOWJjee8gOOAgg0KPg0KPg0KPiAt5LuA5LmI5pivR1BJTz8NCj4gLT09PT09PT09PT0N
Cj4gK+S7gOS5iOaYr0dQSU/vvJ8NCj4gKz09PT09PT09PT09PQ0KPiAgIumAmueUqOi+k+WFpS/o
vpPlh7rlj6MiKEdQSU8p5piv5LiA5Liq54G15rS755qE55Sx6L2v5Lu25o6n5Yi255qE5pWw5a2X
5L+h5Y+344CC5LuW5Lus5Y+vDQo+ICDnlLHlpJrnp43oiq/niYfmj5Dkvpss5LiU5a+55LqO5LuO
5LqL5bWM5YWl5byP5ZKM5a6a5Yi256Gs5Lu255qEIExpbnV4IOW8gOWPkeiAheadpeivtOaYrw0K
PiAg5q+U6L6D54af5oKJ44CC5q+P5LiqR1BJTyDpg73ku6PooajkuIDkuKrov57mjqXliLDnibnl
rprlvJXohJrmiJbnkIPmoIXpmLXliJcoQkdBKeWwgeijheS4rQ0KPiBAQCAtOTksNiArODgsNyBA
QCBHUElPIOWFrOe6pg0KPg0KPiAg5qCH6K+GIEdQSU8NCj4gIC0tLS0tLS0tLQ0KPiArDQo+ICBH
UElPIOaYr+mAmui/h+aXoOespuWPt+aVtOWei+adpeagh+ivhueahCzojIPlm7TmmK8gMCDliLAg
TUFYX0lOVOOAguS/neeVmeKAnOi0n+KAneaVsA0KPiAg55So5LqO5YW25LuW55uu55qELOS+i+Wm
guagh+ivhuS/oeWPt+KAnOWcqOi/meS4quadv+WtkOS4iuS4jeWPr+eUqOKAneaIluaMh+ekuumU
meivr+OAguacquaOpeinpuW6leWxgg0KPiAg56Gs5Lu255qE5Luj56CB5Lya5b+955Wl6L+Z5Lqb
5pW05pWw44CCDQo+IEBAIC0xMTUsNyArMTA1LDcgQEAgRlBHQSDnmoTnibnlrprmnb/lrZDkuIrk
vb/nlKggODAtOTXjgILnvJblj7fkuI3kuIDlrpropoHov57nu60s6YKj5Lqb5bmz5Y+w5LitDQo+
DQo+ICDlpoLmnpzkvaDopoHliJ3lp4vljJbkuIDkuKrluKbmnInml6DmlYggR1BJTyDnvJblj7fn
moTnu5PmnoTkvZMs5Y+v5Lul5L2/55So5LiA5Lqb6LSf57yW56CBDQo+ICAo5aaCIi1FSU5WQUwi
Ke+8jOmCo+WwhuS9v+WFtuawuOi/nOS4jeS8muaYr+acieaViOOAguadpea1i+ivlei/meagt+S4
gOS4que7k+aehOS9k+S4reeahOe8luWPtw0KPiAt5piv5ZCm5YWz6IGU5LiA5LiqIEdQSU/vvIzk
vaDlj6/kvb/nlKjku6XkuIvmlq3oqIA6DQo+ICvmmK/lkKblhbPogZTkuIDkuKogR1BJT++8jOS9
oOWPr+S9v+eUqOS7peS4i+aWreiogDo6DQo+DQo+ICAgICAgICAgaW50IGdwaW9faXNfdmFsaWQo
aW50IG51bWJlcik7DQo+DQo+IEBAIC0xMjgsMTEgKzExOCwxMiBAQCBGUEdBIOeahOeJueWumuad
v+WtkOS4iuS9v+eUqCA4MC05NeOAgue8luWPt+S4jeS4gOWumuimgei/nue7rSzpgqPkupvlubPl
j7DkuK0NCj4NCj4gIOS9v+eUqCBHUElPDQo+ICAtLS0tLS0tLS0NCj4gKw0KPiAg5a+55LqO5LiA
5LiqIEdQSU/vvIzns7vnu5/lupTor6XlgZrnmoTnrKzkuIDku7bkuovmg4XlsLHmmK/pgJrov4cg
Z3Bpb19yZXF1ZXN0KCkNCj4gIOWHveaVsOWIhumFjeWug++8jOingeS4i+aWh+OAgg0KPg0KPiAg
5o6l5LiL5p2l5piv6K6+572uSS9P5pa55ZCR77yM6L+Z6YCa5bi45piv5Zyo5p2/57qn5ZCv5Yqo
5Luj56CB5Lit5Li65omA5L2/55So55qEIEdQSU8g6K6+572uDQo+IC1wbGF0Zm9ybV9kZXZpY2Ug
5pe25a6M5oiQ44CCDQo+ICtwbGF0Zm9ybV9kZXZpY2Ug5pe25a6M5oiQOjoNCj4NCj4gICAgICAg
ICAvKiDorr7nva7kuLrovpPlhaXmiJbovpPlh7osIOi/lOWbniAwIOaIlui0n+eahOmUmeivr+S7
o+eggSAqLw0KPiAgICAgICAgIGludCBncGlvX2RpcmVjdGlvbl9pbnB1dCh1bnNpZ25lZCBncGlv
KTsNCj4gQEAgLTE1NywxMiArMTQ4LDEzIEBAIGdldC9zZXQo6I635Y+WL+iuvue9rinlh73mlbDo
sIPnlKjmsqHms5Xov5Tlm57plJnor68s5LiU5pyJ5Y+v6IO95piv6YWN572u6ZSZ6K+vDQo+DQo+
DQo+ICDorr/pl67oh6rml4vplIHlronlhajnmoQgR1BJTw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gIOWkp+WkmuaVsCBHUElPIOaOp+WI
tuWZqOWPr+S7pemAmui/h+WGheWtmOivuy/lhpnmjIfku6TmnaXorr/pl67jgILov5nkupvmjIfk
u6TkuI3kvJrkvJHnnKAs5Y+v5LulDQo+ICDlronlhajlnLDlnKjnoawo6Z2e57q/56iLKeS4reaW
reS+i+eoi+WSjOexu+S8vOeahOS4iuS4i+aWh+S4reWujOaIkOOAgg0KPg0KPiAg5a+55LqO6YKj
5Lqb55SoIGdwaW9fY2Fuc2xlZXAoKea1i+ivleaAu+aYr+i/lOWbnuWksei0peeahCBHUElPKOin
geS4i+aWhynvvIzkvb/nlKgNCj4gLeS7peS4i+eahOWHveaVsOiuv+mXrjoNCj4gK+S7peS4i+ea
hOWHveaVsOiuv+mXrjo6DQo+DQo+ICAgICAgICAgLyogR1BJTyDovpPlhaU66L+U5Zue6Zu25oiW
6Z2e6Zu2ICovDQo+ICAgICAgICAgaW50IGdwaW9fZ2V0X3ZhbHVlKHVuc2lnbmVkIGdwaW8pOw0K
PiBAQCAtMTg4LDE3ICsxODAsMTggQEAgR1BJT+WAvOaYr+W4g+WwlOWAvO+8jOmbtuihqOekuuS9
jueUteW5s++8jOmdnumbtuihqOekuumrmOeUteW5s+OAguW9k+ivu+WPluS4gA0KPg0KPg0KPiAg
6K6/6Zeu5Y+v6IO95LyR55yg55qEIEdQSU8NCj4gLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICstLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gIOafkOS6myBHUElPIOaOp+WItuWZqOW/hemhu+mAmui/
h+WfuuS6juaAu+e6vyjlpoIgSTJDIOaIliBTUEkp55qE5raI5oGv6K6/6Zeu44CC6K+75oiW5YaZ
6L+Z5LqbDQo+ICBHUElPIOWAvOeahOWRveS7pOmcgOimgeetieW+heWFtuS/oeaBr+aOkuWIsOmY
n+mmluaJjeWPkemAgeWRveS7pO+8jOWGjeiOt+W+l+WFtuWPjemmiOOAguacn+mXtOmcgOimgQ0K
PiAg5LyR55yg77yM6L+Z5LiN6IO95ZyoIElSUSDkvovnqIso5Lit5pat5LiK5LiL5paHKeS4reaJ
p+ihjOOAgg0KPg0KPiAg5pSv5oyB5q2k57G7IEdQSU8g55qE5bmz5Y+w6YCa6L+H5Lul5LiL5Ye9
5pWw6L+U5Zue6Z2e6Zu25YC85p2l5Yy65YiG5Ye66L+Z56eNIEdQSU/jgIIo5q2k5Ye95pWw6ZyA
6KaBDQo+IC3kuIDkuKrkuYvliY3pgJrov4cgZ3Bpb19yZXF1ZXN0IOWIhumFjeWIsOeahOacieaV
iCBHUElPIOe8luWPtyk6DQo+ICvkuIDkuKrkuYvliY3pgJrov4cgZ3Bpb19yZXF1ZXN0IOWIhumF
jeWIsOeahOacieaViCBHUElPIOe8luWPtyk6Og0KPg0KPiAgICAgICAgIGludCBncGlvX2NhbnNs
ZWVwKHVuc2lnbmVkIGdwaW8pOw0KPg0KPiAt5Li65LqG6K6/6Zeu6L+Z56eNIEdQSU8s5YaF5qC4
5a6a5LmJ5LqG5LiA5aWX5LiN5ZCM55qE5Ye95pWwOg0KPiAr5Li65LqG6K6/6Zeu6L+Z56eNIEdQ
SU8s5YaF5qC45a6a5LmJ5LqG5LiA5aWX5LiN5ZCM55qE5Ye95pWwOjoNCj4NCj4gICAgICAgICAv
KiBHUElPIOi+k+WFpTrov5Tlm57pm7bmiJbpnZ7pm7YgLOWPr+iDveS8muS8keecoCAqLw0KPiAg
ICAgICAgIGludCBncGlvX2dldF92YWx1ZV9jYW5zbGVlcCh1bnNpZ25lZCBncGlvKTsNCj4gQEAg
LTIxNCwyNSArMjA3LDI2IEBAIEdQSU8g5YC855qE5ZG95Luk6ZyA6KaB562J5b6F5YW25L+h5oGv
5o6S5Yiw6Zif6aaW5omN5Y+R6YCB5ZG95Luk77yM5YaN6I635b6X5YW2DQo+ICDkuovlrp7vvIzo
v5nkupvlpITnkIbkvovnqIvlrp7pmYXkuIrlkozoh6rml4vplIHlronlhajnmoTlh73mlbDmmK/k
uIDmoLfnmoTjgIINCj4NCj4gICoqIOmZpOatpOS5i+WkliAqKiDosIPnlKjorr7nva7lkozphY3n
va7mraTnsbsgR1BJTyDnmoTlh73mlbDkuZ/lv4XpobvlnKjlhYHorrjkvJHnnKDnmoTkuIrkuIvm
lofkuK3vvIwNCj4gLeWboOS4uuWug+S7rOWPr+iDveS5n+mcgOimgeiuv+mXriBHUElPIOaOp+WI
tuWZqOiKr+eJhzogKOi/meS6m+iuvue9ruWHveaVsOmAmuW4uOWcqOadv+e6p+WQr+WKqOS7o+eg
geaIluiAhQ0KPiAt6amx5Yqo5o6i5rWLL+aWreW8gOS7o+eggeS4re+8jOaJgOS7pei/meaYr+S4
gOS4quWuueaYk+a7oei2s+eahOe6puadn+adoeS7tuOAgikNCj4gK+WboOS4uuWug+S7rOWPr+iD
veS5n+mcgOimgeiuv+mXriBHUElPIOaOp+WItuWZqOiKr+eJhyAo6L+Z5Lqb6K6+572u5Ye95pWw
6YCa5bi45Zyo5p2/57qn5ZCv5Yqo5Luj56CB5oiW6ICFDQo+ICvpqbHliqjmjqLmtYsv5pat5byA
5Luj56CB5Lit77yM5omA5Lul6L+Z5piv5LiA5Liq5a655piT5ruh6Laz55qE57qm5p2f5p2h5Lu2
44CCKSA6Og0KPg0KPiAtICAgICAgIGdwaW9fZGlyZWN0aW9uX2lucHV0KCkNCj4gLSAgICAgICBn
cGlvX2RpcmVjdGlvbl9vdXRwdXQoKQ0KPiAtICAgICAgIGdwaW9fcmVxdWVzdCgpDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpb19kaXJlY3Rpb25faW5wdXQoKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW9fZGlyZWN0aW9uX291dHB1dCgpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpb19yZXF1ZXN0KCkNCj4NCj4gLSMjICAg
ICBncGlvX3JlcXVlc3Rfb25lKCkNCj4gLSMjICAgICBncGlvX3JlcXVlc3RfYXJyYXkoKQ0KPiAt
IyMgICAgIGdwaW9fZnJlZV9hcnJheSgpDQo+ICsgICAgICAgICAgICAgICAjIyAgICAgIGdwaW9f
cmVxdWVzdF9vbmUoKQ0KPiArICAgICAgICAgICAgICAgIyMgICAgICBncGlvX3JlcXVlc3RfYXJy
YXkoKQ0KPiArICAgICAgICAgICAgICAgIyMgICAgICBncGlvX2ZyZWVfYXJyYXkoKQ0KPg0KPiAt
ICAgICAgIGdwaW9fZnJlZSgpDQo+IC0gICAgICAgZ3Bpb19zZXRfZGVib3VuY2UoKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW9fZnJlZSgpDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZ3Bpb19zZXRfZGVib3VuY2UoKQ0KPg0KPg0KPg0KPiAg5aOw5piO
5ZKM6YeK5pS+IEdQSU8NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLeS4uuS6
huacieWKqeS6juaNleiOt+ezu+e7n+mFjee9rumUmeivryzlrprkuYnkuobkuKTkuKrlh73mlbDj
gIINCj4gKy0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5Li65LqG5pyJ5Yqp5LqO5o2V6I6357O7
57uf6YWN572u6ZSZ6K+vLOWumuS5ieS6huS4pOS4quWHveaVsDo6DQo+DQo+ICAgICAgICAgLyog
55Sz6K+3IEdQSU8sIOi/lOWbniAwIOaIlui0n+eahOmUmeivr+S7o+eggS4NCj4gICAgICAgICAg
KiDpnZ7nqbrmoIfnrb7lj6/og73mnInliqnkuo7or4rmlq0uDQo+IEBAIC0yNzgsNyArMjcyLDcg
QEAgZ3Bpb19yZXF1ZXN0KCnliY3lsIbov5nnsbvnu4boioLphY3nva7lpb3vvIzkvovlpoLkvb/n
lKggcGluY3RybCDlrZDns7vnu5/nmoTmmKANCj4NCj4gIOazqOaEjzrnlLPor7fkuIDkuKogR1BJ
TyDlubbmsqHmnInku6Xku7vkvZXmlrnlvI/phY3nva7lroPvvIzlj6rkuI3ov4fmoIfor4bpgqPk
uKogR1BJTyDlpITkuo7kvb/nlKgNCj4gIOeKtuaAgeOAguW/hemhu+acieWPpuWklueahOS7o+eg
geadpeWkhOeQhuW8leiEmumFjee9rijlpoLmjqfliLYgR1BJTyDkvb/nlKjnmoTlvJXohJrjgIHk
uIrmi4kv5LiL5ouJKeOAgg0KPiAt6ICD6JmR5Yiw5aSn5aSa5pWw5oOF5Ya15LiL5aOw5piOIEdQ
SU8g5LmL5ZCO5bCx5Lya56uL5Y2z6YWN572u5a6D5LusLOaJgOS7peWumuS5ieS6huS7peS4i+S4
ieS4qui+heWKqeWHveaVsDoNCj4gK+iAg+iZkeWIsOWkp+WkmuaVsOaDheWGteS4i+WjsOaYjiBH
UElPIOS5i+WQjuWwseS8mueri+WNs+mFjee9ruWug+S7rCzmiYDku6XlrprkuYnkuobku6XkuIvk
uInkuKrovoXliqnlh73mlbA6Og0KPg0KPiAgICAgICAgIC8qIOeUs+ivt+S4gOS4qiBHUElPIOS/
oeWPtywg5ZCM5pe26YCa6L+H54m55a6a55qEJ2ZsYWdzJ+WIneWni+WMlumFjee9riwNCj4gICAg
ICAgICAgKiDlhbbku5blkowgZ3Bpb19yZXF1ZXN0KCnnmoTlj4LmlbDlkozov5Tlm57lgLznm7jl
kIwNCj4gQEAgLTI5NCw3ICsyODgsNyBAQCBncGlvX3JlcXVlc3QoKeWJjeWwhui/meexu+e7huiK
gumFjee9ruWlve+8jOS+i+WmguS9v+eUqCBwaW5jdHJsIOWtkOezu+e7n+eahOaYoA0KPiAgICAg
ICAgICAqLw0KPiAgICAgICAgIHZvaWQgZ3Bpb19mcmVlX2FycmF5KHN0cnVjdCBncGlvICphcnJh
eSwgc2l6ZV90IG51bSk7DQo+DQo+IC3ov5nph4wgJ2ZsYWdzJyDlvZPliY3lrprkuYnlj6/mjIfl
rprku6XkuIvlsZ7mgKc6DQo+ICvov5nph4wgJ2ZsYWdzJyDlvZPliY3lrprkuYnlj6/mjIflrprk
u6XkuIvlsZ7mgKc6Og0KPg0KPiAgICAgICAgICogR1BJT0ZfRElSX0lOICAgICAgICAgIC0g6YWN
572u5pa55ZCR5Li66L6T5YWlDQo+ICAgICAgICAgKiBHUElPRl9ESVJfT1VUICAgICAgICAgLSDp
hY3nva7mlrnlkJHkuLrovpPlh7oNCj4gQEAgLTMwNyw3ICszMDEsNyBAQCBncGlvX3JlcXVlc3Qo
KeWJjeWwhui/meexu+e7huiKgumFjee9ruWlve+8jOS+i+WmguS9v+eUqCBwaW5jdHJsIOWtkOez
u+e7n+eahOaYoA0KPiAgICAgICAgICogR1BJT0ZfRVhQT1JUX0RJUl9GSVhFRCAgICAgICAgLSDl
sIYgZ3BpbyDlr7zlh7rliLAgc3lzZnPvvIzlubbkv53mjIHmlrnlkJENCj4gICAgICAgICAqIEdQ
SU9GX0VYUE9SVF9ESVJfQ0hBTkdFQUJMRSAgIC0g5ZCM5qC35piv5a+85Ye6LCDkvYblhYHorrjm
lLnlj5jmlrnlkJENCj4NCj4gLeWboOS4uiBHUElPRl9JTklUXyog5LuF5pyJ5Zyo6YWN572u5Li6
6L6T5Ye655qE5pe25YCZ5omN5a2Y5ZyoLOaJgOS7peacieaViOeahOe7hOWQiOS4ujoNCj4gK+Wb
oOS4uiBHUElPRl9JTklUXyog5LuF5pyJ5Zyo6YWN572u5Li66L6T5Ye655qE5pe25YCZ5omN5a2Y
5ZyoLOaJgOS7peacieaViOeahOe7hOWQiOS4ujo6DQo+DQo+ICAgICAgICAgKiBHUElPRl9JTiAg
ICAgICAgICAgICAgLSDphY3nva7kuLrovpPlhaUNCj4gICAgICAgICAqIEdQSU9GX09VVF9JTklU
X0xPVyAgICAtIOmFjee9ruS4uui+k+WHuizlubbliJ3lp4vljJbkuLrkvY7nlLXlubMNCj4gQEAg
LTMyNiw3ICszMjAsNyBAQCBncGlvX3JlcXVlc3QoKeWJjeWwhui/meexu+e7huiKgumFjee9ruWl
ve+8jOS+i+WmguS9v+eUqCBwaW5jdHJsIOWtkOezu+e7n+eahOaYoA0KPiAg5bCG5p2l6L+Z5Lqb
5qCH5b+X5Y+v6IO95omp5bGV5Yiw5pSv5oyB5pu05aSa55qE5bGe5oCn44CCDQo+DQo+ICDmm7To
v5vkuIDmraUs5Li65LqG5pu0566A5Y2V5Zyw5aOw5piOL+mHiuaUvuWkmuS4qiBHUElPLCdzdHJ1
Y3QgZ3BpbyfooqvlvJXov5vmnaXlsIHoo4XmiYDmnIkNCj4gLei/meS4ieS4qumihuWfnzoNCj4g
K+i/meS4ieS4qumihuWfnzo6DQo+DQo+ICAgICAgICAgc3RydWN0IGdwaW8gew0KPiAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgICAgICAgIGdwaW87DQo+IEBAIC0zMzQsNyArMzI4LDcgQEAgZ3Bp
b19yZXF1ZXN0KCnliY3lsIbov5nnsbvnu4boioLphY3nva7lpb3vvIzkvovlpoLkvb/nlKggcGlu
Y3RybCDlrZDns7vnu5/nmoTmmKANCj4gICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgICAgICAq
bGFiZWw7DQo+ICAgICAgICAgfTsNCj4NCj4gLeS4gOS4quWFuOWei+eahOeUqOS+izoNCj4gK+S4
gOS4quWFuOWei+eahOeUqOS+izo6DQo+DQo+ICAgICAgICAgc3RhdGljIHN0cnVjdCBncGlvIGxl
ZHNfZ3Bpb3NbXSA9IHsNCj4gICAgICAgICAgICAgICAgIHsgMzIsIEdQSU9GX09VVF9JTklUX0hJ
R0gsICJQb3dlciBMRUQiIH0sIC8qIOm7mOiupOW8gOWQryAqLw0KPiBAQCAtMzU2LDkgKzM1MCwx
MCBAQCBncGlvX3JlcXVlc3QoKeWJjeWwhui/meexu+e7huiKgumFjee9ruWlve+8jOS+i+WmguS9
v+eUqCBwaW5jdHJsIOWtkOezu+e7n+eahOaYoA0KPg0KPg0KPiAgR1BJTyDmmKDlsITliLAgSVJR
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICBH
UElPIOe8luWPt+aYr+aXoOespuWPt+aVtOaVsDtJUlEg57yW5Y+35Lmf5piv44CC6L+Z5Lqb5p6E
5oiQ5LqG5Lik5Liq6YC76L6R5LiK5LiN5ZCM55qE5ZG95ZCN56m66Ze0DQo+IC0oR1BJTyAwIOS4
jeS4gOWumuS9v+eUqCBJUlEgMCnjgILkvaDlj6/ku6XpgJrov4fku6XkuIvlh73mlbDlnKjlroPk
u6zkuYvpl7Tlrp7njrDmmKDlsIQ6DQo+ICsoR1BJTyAwIOS4jeS4gOWumuS9v+eUqCBJUlEgMCnj
gILkvaDlj6/ku6XpgJrov4fku6XkuIvlh73mlbDlnKjlroPku6zkuYvpl7Tlrp7njrDmmKDlsIQ6
Og0KPg0KPiAgICAgICAgIC8qIOaYoOWwhCBHUElPIOe8luWPt+WIsCBJUlEg57yW5Y+3ICovDQo+
ICAgICAgICAgaW50IGdwaW9fdG9faXJxKHVuc2lnbmVkIGdwaW8pOw0KPiBAQCAtMzg0LDcgKzM3
OSw4IEBAIGlycV90b19ncGlvKCnov5Tlm57nmoTpnZ7plJnor6/lgLzlpKflpJrmlbDpgJrluLjl
j6/ku6XooqsgZ3Bpb19nZXRfdmFsdWUoKeaJgA0KPg0KPg0KPiAg5qih5ouf5byA5ryP5L+h5Y+3
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICstLS0tLS0tLS0tLS0NCj4gKw0K
PiAg5pyJ5pe25Zyo5Y+q5pyJ5L2O55S15bmz5L+h5Y+35L2c5Li65a6e6ZmF6amx5Yqo57uT5p6c
KOivkeiAheazqDrlpJrkuKrovpPlh7rov57mjqXkuo7kuIDngrnvvIzpgLvovpHnlLXlubMNCj4g
IOe7k+aenOS4uuaJgOaciei+k+WHuueahOmAu+i+keS4jinnmoTml7blgJks5YWx5Lqr55qE5L+h
5Y+357q/6ZyA6KaB5L2/55So4oCc5byA5ryP4oCd5L+h5Y+344CCKOivpeacr+ivrQ0KPiAg6YCC
55So5LqOIENNT1Mg566h77yb6ICMIFRUTCDnlKjigJzpm4bnlLXmnoHlvIDot6/igJ3jgIIp5LiA
5Liq5LiK5ouJ55S16Zi75L2/5L+h5Y+35Li66auY55S15bmz44CC6L+ZDQo+IEBAIC00MDgsOSAr
NDA0LDQ0IEBAIGlycV90b19ncGlvKCnov5Tlm57nmoTpnZ7plJnor6/lgLzlpKflpJrmlbDpgJrl
uLjlj6/ku6XooqsgZ3Bpb19nZXRfdmFsdWUoKeaJgA0KPiAg6L+Z5LiN5LiA5a6a5piv6ZSZ6K+v
55qE44CC5LiA5Liq5bi46KeB55qE5L6L5a2Q5bCx5pivIEkyQyDml7bpkp/nmoTlu7bplb/vvJrk
uIDkuKrpnIDopoHovoPmhaLml7bpkp/nmoQNCj4gIOS7juiuvuWkh+W7tui/nyBTQ0sg55qE5LiK
5Y2H5rK/77yM6ICMIEkyQyDkuLvorr7lpIfnm7jlupTlnLDosIPmlbTlhbbkv6Hlj7fkvKDovpPp
gJ/njofjgIINCj4NCj4gK0dQSU/mjqfliLblmajlkoxwaW5jdHJs5a2Q57O757ufDQo+ICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK1NPQ+S4iueahEdQSU/mjqfliLblmajlj6/o
g73kuI5waW5jdHJs5a2Q57O757uf57Sn5a+G57uT5ZCI77yM5Y2z5byV6ISa5Y+v5Lul5LiO5Y+v
6YCJ55qEZ3Bpb+WKnw0KPiAr6IO95LiA6LW36KKr5YW25LuW5Yqf6IO95L2/55So44CC5oiR5Lus
5bey57uP5ra155uW5LqG6L+Z5qC355qE5oOF5Ya177yM5L6L5aaC5LiA5LiqR1BJT+aOp+WItuWZ
qOmcgOimgeS/nQ0KPiAr55WZ5LiA5Liq5byV6ISa5oiW6YCa6L+H6LCD55So5Lul5LiL5Lu75L2V
5LiA5Liq5byV6ISa5p2l6K6+572u5YW25pa55ZCROjoNCj4gKw0KPiArICBwaW5jdHJsX2dwaW9f
cmVxdWVzdCgpDQo+ICsgIHBpbmN0cmxfZ3Bpb19mcmVlKCkNCj4gKyAgcGluY3RybF9ncGlvX2Rp
cmVjdGlvbl9pbnB1dCgpDQo+ICsgIHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KCkNCj4g
Kw0KPiAr5L2G5piv77yM5byV6ISa5o6n5Yi25a2Q57O757uf5piv5aaC5L2V5bCGR1BJT+WPt+eg
ge+8iOi/meaYr+S4gOS4quWFqOWxgOS6i+mhue+8ieS4juafkOS4quW8leiEmuaOp+WItuWZqA0K
PiAr5LiK55qE5p+Q5Liq5byV6ISa5Lqk5Y+J5YWz6IGU55qE77yfDQo+ICsNCj4gK+i/meaYr+mA
mui/h+azqOWGjOW8leiEmueahOKAnOiMg+WbtOKAneadpeWunueOsOeahO+8jOi/meWfuuacrOS4
iuaYr+S6pOWPieWPguiAg+ihqOOAgui/meS6m+aPj+i/sOaYr+WcqA0KPiArRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL3Bpbi1jb250cm9sLnJzdA0KPiArDQo+ICvomb3nhLblvJXohJrliIbphY3l
rozlhajnlLFwaW5jdHJs5a2Q57O757uf566h55CG77yM5L2GZ3Bpb++8iOWcqGdwaW9saWLkuIvv
vInku43nlLFncGlv6amx5YqoDQo+ICvnu7TmiqTjgILlj6/og73lj5HnlJ/nmoTmg4XlhrXmmK/v
vIxTb0PkuK3nmoTkuI3lkIzlvJXohJrojIPlm7TnlLHkuI3lkIznmoRncGlv6amx5Yqo5Zmo566h
55CG44CCDQo+ICsNCj4gK+i/meS9v+W+l+WcqOiwg+eUqCAicGluY3RybF9ncGlvX3JlcXVlc3Qi
IOS5i+WJje+8jOiuqWdwaW/pqbHliqjlkJFwaW4gY3RybOWtkOezuw0KPiAr57uf5a6j5biD5a6D
5Lus55qE5byV6ISa6IyD5Zu05piv5ZCI55CG55qE77yM5Lul5L6/5Zyo5L2/55So5Lu75L2VZ3Bp
b+S5i+WJjeimgeaxgnBpbmN0cmzlrZDns7vnu5/lh4YNCj4gK+Wkh+ebuOW6lOeahOW8leiEmuOA
gg0KPiArDQo+ICvkuLrmraTvvIxncGlv5o6n5Yi25Zmo5Y+v5Lul55SocGluY3RybOWtkOezu+e7
n+azqOWGjOWFtuW8leiEmuiMg+WbtOOAguebruWJjeacieS4pOenjeaWueazle+8muacieaIlg0K
PiAr5pegRFTjgIINCj4gKw0KPiAr5YWz5LqO5a+5RFTnmoTmlK/mjIHvvIzor7flj4LogIMgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby50eHQuDQo+ICsNCj4gK+Wv
ueS6jumdnkRU5pSv5oyB77yM55So5oi35Y+v5Lul55So6YCC5b2T55qE5Y+C5pWw6LCD55SoZ3Bp
b2NoaXBfYWRkX3Bpbl9yYW5nZSgp77yM5bCG5LiADQo+ICvns7vliJfnmoRncGlv5byV6ISa5rOo
5YaM5YiwcGluY3RybOmpseWKqOS4iuOAguS4uuatpO+8jOW/hemhu+WwhnBpbmN0cmzorr7lpIfn
moTlkI3np7DlrZfnrKbkuLINCj4gK+S9nOS4uuWPguaVsOS5i+S4gOS8oOe7mei/meS4queoi+W6
j+OAgg0KPiArDQo+ICsNCj4gK+i/meS6m+WFrOe6puW/veeVpeS6huS7gOS5iO+8nw0KPiArPT09
PT09PT09PT09PT09PT09PT0NCj4NCj4gLei/meS6m+WFrOe6puW/veeVpeS6huS7gOS5iD8NCj4g
LT09PT09PT09PT09PT09PT0NCj4gIOi/meS6m+WFrOe6puW/veeVpeeahOacgOWkp+S4gOS7tuS6
i+WwseaYr+W8leiEmuWkjeeUqO+8jOWboOS4uui/meWxnuS6jumrmOW6puiKr+eJh+eJueWumuea
hOWxnuaAp+S4lA0KPiAg5rKh5pyJ5Y+v56e75qSN5oCn44CC5p+Q5Liq5bmz5Y+w5Y+v6IO95LiN
6ZyA6KaB5piO56Gu55qE5aSN55So5L+h5oGv77yb5pyJ55qE5a+55LqO5Lu75oSP57uZ5a6a55qE
5byV6ISaDQo+ICDlj6/og73lj6rmnInkuKTkuKrlip/og73pgInpobnvvJvmnInnmoTlj6/og73m
r4/kuKrlvJXohJrmnInlhavkuKrlip/og73pgInpobnvvJvmnInnmoTlj6/og73lj6/ku6XlsIYN
Cj4gQEAgLTQzMyw4ICs0NjQsOSBAQCBMaW51eCDnmoTns7vnu5/jgIIpDQo+ICDlvZPliY3vvIzl
iqjmgIHlrprkuYkgR1BJTyDlubbkuI3mmK/moIflh4bnmoTvvIzkvovlpoLkvZzkuLrphY3nva7k
uIDkuKrluKbmnInmn5DkupsgR1BJTyDmianlsZXlmajnmoQNCj4gIOmZhOWKoOeUtei3r+adv+ea
hOWJr+S9nOeUqOOAgg0KPg0KPiAtR1BJTyDlrp7njrDogIXnmoTmoYbmnrYgKOWPr+mAiSkNCj4g
LT09PT09PT09PT09PT09PT09PT09PQ0KPiArR1BJTyDlrp7njrDogIXnmoTmoYbmnrbvvIjlj6/p
gInvvIkNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiAg5YmN6Z2i5o+Q5Yiw
5LqG77yM5pyJ5LiA5Liq5Y+v6YCJ55qE5a6e546w5qGG5p6277yM6K6p5bmz5Y+w5L2/55So55u4
5ZCM55qE57yW56iL5o6l5Y+j77yM5pu05Yqg566A5Y2V5Zyw5pSv5oyBDQo+ICDkuI3lkIznp43n
sbvnmoQgR1BJTyDmjqfliLblmajjgILov5nkuKrmoYbmnrbnp7DkuLoiZ3Bpb2xpYiLjgIINCj4N
Cj4gQEAgLTQ0NCwxNSArNDc2LDE2IEBAIEdQSU8g5a6e546w6ICF55qE5qGG5p62ICjlj6/pgIkp
DQo+DQo+DQo+ICDmjqfliLblmajpqbHliqg6IGdwaW9fY2hpcA0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gIOWcqOahhuaetuS4reavj+S4
qiBHUElPIOaOp+WItuWZqOmDveWMheijheS4uuS4gOS4qiAic3RydWN0IGdwaW9fY2hpcCLvvIzk
u5bljIXlkKvkuoYNCj4gLeivpeexu+Wei+eahOavj+S4quaOp+WItuWZqOeahOW4uOeUqOS/oeaB
rzoNCj4gK+ivpeexu+Wei+eahOavj+S4quaOp+WItuWZqOeahOW4uOeUqOS/oeaBrzo6DQo+DQo+
IC0gLSDorr7nva4gR1BJTyDmlrnlkJHnmoTmlrnms5UNCj4gLSAtIOeUqOS6juiuv+mXriBHUElP
IOWAvOeahOaWueazlQ0KPiAtIC0g5ZGK55+l6LCD55So5YW25pa55rOV5piv5ZCm5Y+v6IO95LyR
55yg55qE5qCH5b+XDQo+IC0gLSDlj6/pgInnmoQgZGVidWdmcyDkv6Hmga/lr7zlh7rmlrnms5Ug
KOaYvuekuuexu+S8vOS4iuaLiemFjee9ruS4gOagt+eahOmineWklueKtuaAgSkNCj4gLSAtIOiv
iuaWreagh+etvg0KPiArICAgICAgIOiuvue9riBHUElPIOaWueWQkeeahOaWueazlQ0KPiArICAg
ICAgIOeUqOS6juiuv+mXriBHUElPIOWAvOeahOaWueazlQ0KPiArICAgICAgIOWRiuefpeiwg+eU
qOWFtuaWueazleaYr+WQpuWPr+iDveS8keecoOeahOagh+W/lw0KPiArICAgICAgIOWPr+mAieea
hCBkZWJ1Z2ZzIOS/oeaBr+WvvOWHuuaWueazlSAo5pi+56S657G75Ly85LiK5ouJ6YWN572u5LiA
5qC355qE6aKd5aSW54q25oCBKQ0KPiArICAgICAgIOiviuaWreagh+etvg0KPg0KPiAg5Lmf5YyF
5ZCr5LqG5p2l6IeqIGRldmljZS5wbGF0Zm9ybV9kYXRhIOeahOavj+S4quWunuS+i+eahOaVsOaN
ru+8muWug+esrOS4gOS4qiBHUElPIOeahA0KPiAg57yW5Y+35ZKM5a6D5Y+v55So55qEIEdQSU8g
55qE5pWw6YeP44CCDQo+IEBAIC00NzAsOCArNTAzLDM2IEBAIEdQSU8g5a6e546w6ICF55qE5qGG
5p62ICjlj6/pgIkpDQo+ICDlsLHov5Tlm57nm7jlhbPnmoTmoIfnrb7vvIzlkKbliJnov5Tlm54g
TlVMTOOAgg0KPg0KPg0KPiAr5o6n5Yi25Zmo6amx5Yqo56iL5bqP77yaZ3Bpb19jaGlwDQo+ICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK+WcqOi/meS4quahhuaetuS4re+8jOav
j+S4qkdQSU/mjqfliLblmajpg73ooqvmiZPljIXmiJDkuIDkuKogImdwaW9fY2hpcOe7k+aehOS9
kyIg77yM5YW25LitDQo+ICvljIXlkKvor6XnsbvlnovnmoTmr4/kuKrmjqfliLblmajnmoTpgJrn
lKjkv6Hmga/jgIINCj4gKw0KPiArIC0g5bu656uLR1BJT+aWueWQkeeahOaWueazlQ0KPiArIC0g
55So5LqO6K6/6ZeuR1BJT+WAvOeahOaWueazlQ0KPiArIC0g6KGo56S65a+55YW25pa55rOV55qE
6LCD55So5piv5ZCm5Y+v5Lul5LyR55yg55qE5qCH5b+XDQo+ICsgLSDlj6/pgInnmoRkZWJ1Z2Zz
IGR1bXDmlrnms5XvvIjmmL7npLrpop3lpJbnmoTnirbmgIHvvIzlpoLkuIrmi4nphY3nva7vvInj
gIINCj4gKyAtIOeUqOS6juiviuaWreeahOagh+etvg0KPiArDQo+ICvov5jmnInmr4/kuKrlrp7k
vovnmoTmlbDmja7vvIzlj6/og73mnaXoh6pkZXZpY2UucGxhdGZvcm1fZGF0Ye+8muWug+eahOes
rOS4gOS4qkdQSU/nmoQNCj4gK+e8luWPt++8jOS7peWPiuWug+aatOmcsueahEdQSU/nmoTmlbDp
h4/jgIINCj4gKw0KPiAr5a6e546wZ3Bpb19jaGlw55qE5Luj56CB5bqU6K+l5pSv5oyB5o6n5Yi2
5Zmo55qE5aSa5Liq5a6e5L6L77yM5Y+v6IO95L2/55So6amx5Yqo5qih5Z6L44CCIOivpeS7o+eg
gQ0KPiAr5bCG6YWN572u5q+P5LiqZ3Bpb19jaGlw5bm25Y+R5Ye6Z3Bpb2NoaXBfYWRkKCnjgIIg
56e76Zmk5LiA5LiqR1BJT+aOp+WItuWZqOW6lOivpeaYrw0KPiAr5b6I572V6KeB55qE77yb5b2T
5a6D5LiN5Y+v6YG/5YWN55qE5pe25YCZ77yM5L2/55SoZ3Bpb2NoaXBfcmVtb3ZlKCnjgIINCj4g
Kw0KPiAr5aSn5aSa5pWw5oOF5Ya15LiL77yMZ3Bpb19jaGlw5piv5LiA5Liq54m55a6a5a6e5L6L
57uT5p6E55qE5LiA6YOo5YiG77yM5YW35pyJR1BJT+aOpeWPo+ayoeacieaatA0KPiAr6Zyy55qE
54q25oCB77yM5aaC5a+75Z2A44CB55S15rqQ566h55CG562J44CCIOWDj+e8luino+eggeWZqOi/
meagt+eahOiKr+eJh+S8muacieWkjeadgueahOmdnkdQSU/nirbmgIHjgIINCj4gKw0KPiAr5Lu7
5L2VZGVidWdmcyBkdW1w5pa55rOV6YCa5bi45bqU6K+l5b+955Wl6YKj5Lqb5rKh5pyJ6KKr6K+3
5rGC5Li6R1BJT+eahOS/oeWPt+OAgiDku5bku6zlj6/ku6UNCj4gK+S9v+eUqGdwaW9jaGlwX2lz
X3JlcXVlc3RlZCgp77yM5a6D6L+U5ZueTlVMTOaIluS4juivpUdQSU/nm7jlhbPnmoTmoIfnrb7v
vIzlvZPlroMNCj4gK+iiq+ivt+axguaXtuOAgg0KPiArDQo+ICsNCj4gIOW5s+WPsOaUr+aMgQ0K
PiAtLS0tLS0tLQ0KPiArLS0tLS0tLS0NCj4gKw0KPiAg5Li65LqG5pSv5oyB6L+Z5Liq5qGG5p62
77yM5LiA5Liq5bmz5Y+w55qEIEtjb25maWcg5paH5Lu25bCG5LyaICJzZWxlY3QiKOmAieaLqSkN
Cj4gIEFSQ0hfUkVRVUlSRV9HUElPTElCIOaIliBBUkNIX1dBTlRfT1BUSU9OQUxfR1BJT0xJQu+8
jOW5tuiuqeWug+eahA0KPiAgPGFzbS9ncGlvLmg+IOWMheWQqyA8YXNtLWdlbmVyaWMvZ3Bpby5o
Pu+8jOWQjOaXtuWumuS5ieS4ieS4quaWueazlToNCj4gQEAgLTQ4OSw3ICs1NTAsNyBAQCBBUkNI
X1dBTlRfT1BUSU9OQUxfR1BJT0xJQiDmhI/lkbPnnYAgZ3Bpb2xpYiDmoLjlv4Ppu5jorqTlhbPp
l60s5LiU55So5oi35Y+v5LulDQo+ICDlpoLmnpzov5nkupvpgInpobnpg73msqHooqvpgInmi6ks
6K+l5bmz5Y+w5bCx5LiN6YCa6L+HIEdQSU8tbGliIOaUr+aMgSBHUElPLOS4lOS7o+eggeS4jeWP
r+S7pQ0KPiAg6KKr55So5oi35L2/6IO944CCDQo+DQo+IC3ku6XkuIvov5nkupvmlrnms5XnmoTl
rp7njrDlj6/ku6Xnm7TmjqXkvb/nlKjmoYbmnrbku6PnoIEs5bm25oC75piv6YCa6L+HIGdwaW9f
Y2hpcCDosIPluqY6DQo+ICvku6XkuIvov5nkupvmlrnms5XnmoTlrp7njrDlj6/ku6Xnm7TmjqXk
vb/nlKjmoYbmnrbku6PnoIEs5bm25oC75piv6YCa6L+HIGdwaW9fY2hpcCDosIPluqY6Og0KPg0K
PiAgICAjZGVmaW5lIGdwaW9fZ2V0X3ZhbHVlICAgICAgIF9fZ3Bpb19nZXRfdmFsdWUNCj4gICAg
I2RlZmluZSBncGlvX3NldF92YWx1ZSAgICAgICBfX2dwaW9fc2V0X3ZhbHVlDQo+IEBAIC01MDgs
NyArNTY5LDggQEAgYXJjaF9pbml0Y2FsbCgp5oiW6ICF5pu05pep55qE5Zyw5pa56ZuG5oiQ6L+b
5bmz5Y+w5Yid5aeL5YyW5Luj56CB77yM5L2/6L+Z5LqbIEcNCj4gIOS4lOS7luS7rOmAmuW4uOWP
r+S7peS9nOS4uiBJUlEg5L2/55So44CCDQo+DQo+ICDmnb/nuqfmlK/mjIENCj4gLS0tLS0tLS0N
Cj4gKy0tLS0tLS0tDQo+ICsNCj4gIOWvueS6juWklumDqCBHUElPIOaOp+WItuWZqCjkvovlpoIg
STJDIOaIliBTUEkg5omp5bGV5Zmo44CB5LiT55So6Iqv54mH44CB5aSa5Yqf6IO95Zmo5Lu244CB
RlBHQQ0KPiAg5oiWIENQTEQp77yM5aSn5aSa5pWw5bi455So5p2/57qn54m55a6a5Luj56CB6YO9
5Y+v5Lul5rOo5YaM5o6n5Yi25Zmo6K6+5aSH77yM5bm25L+d6K+B5LuW5Lus55qE6amx5Yqo55+l
6YGTDQo+ICBncGlvY2hpcF9hZGQoKeaJgOS9v+eUqOeahCBHUElPIOe8luWPt+OAguS7luS7rOea
hOi1t+Wni+e8luWPt+mAmuW4uOi3n+WcqOW5s+WPsOeJueWumueahCBHUElPDQo+IEBAIC01MjYs
OCArNTg4LDkgQEAgR1BJTyDlj6/ku6Xlt6XkvZzkuYvlkI7miY3lj6/ooqvms6jlhozjgILop6Pl
hrPov5nnsbvkvp3otZbnmoTnmoTkuIDnp43mlrnms5XmmK8NCj4gIOiuvuWkh+WPmOaIkOaXoOaV
iOaXtuenu+mZpOWug+S7rOOAgg0KPg0KPg0KPiAt55So5oi356m66Ze055qEIFN5c2ZzIOaOpeWP
oyjlj6/pgIkpDQo+IC09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK+eUqOaIt+epuumXtOea
hCBTeXNmcyDmjqXlj6PvvIjlj6/pgInvvIkNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+ICsNCj4gIOS9v+eUqOKAnGdwaW9saWLigJ3lrp7njrDmoYbmnrbnmoTlubPlj7Dlj6/k
u6XpgInmi6nphY3nva7kuIDkuKogR1BJTyDnmoQgc3lzZnMg55So5oi35o6l5Y+j44CCDQo+ICDo
v5nkuI3lkIzkuo4gZGVidWdmcyDmjqXlj6PvvIzlm6DkuLrlroPmj5DkvpvnmoTmmK/lr7kgR1BJ
T+aWueWQkeWSjOWAvOeahOaOp+WItu+8jOiAjOS4jeWPquaYvuekug0KPiAg5LiA5LiqR1BJTyDn
moTnirbmgIHmkZjopoHjgILmraTlpJYs5a6D5Y+v5Lul5Ye6546w5Zyo5rKh5pyJ6LCD6K+V5pSv
5oyB55qE5Lqn5ZOB57qn57O757uf5Lit44CCDQo+IEBAIC01NDgsNyArNjExLDggQEAgR1BJTyDl
j6/ku6Xlt6XkvZzkuYvlkI7miY3lj6/ooqvms6jlhozjgILop6PlhrPov5nnsbvkvp3otZbnmoTn
moTkuIDnp43mlrnms5XmmK8NCj4NCj4gIFN5c2ZzIOS4reeahOi3r+W+hA0KPiAgLS0tLS0tLS0t
LS0tLS0NCj4gLeWcqC9zeXMvY2xhc3MvZ3BpbyDkuK3mnIkgMyDnsbvlhaXlj6M6DQo+ICsNCj4g
K+WcqC9zeXMvY2xhc3MvZ3BpbyDkuK3mnIkgMyDnsbvlhaXlj6M6Og0KPg0KPiAgICAgLSAgIOeU
qOS6juWcqOeUqOaIt+epuumXtOaOp+WItiBHUElPIOeahOaOp+WItuaOpeWPozsNCj4NCj4gQEAg
LTYyNSw4ICs2ODksOSBAQCBHUElPIOaOp+WItuWZqOeahOi3r+W+hOexu+S8vCAvc3lzL2NsYXNz
L2dwaW8vZ3Bpb2NoaXA0Mi8gKOWvueS6juS7jiM0MiBHUElPDQo+DQo+DQo+ICDku47lhoXmoLjk
u6PnoIHkuK3lr7zlh7oNCj4gLS0tLS0tLS0tLS0tLS0NCj4gLeWGheaguOS7o+eggeWPr+S7peaY
juehruWcsOeuoeeQhumCo+S6m+W3sumAmui/hyBncGlvX3JlcXVlc3QoKeeUs+ivt+eahCBHUElP
IOeahOWvvOWHujoNCj4gKy0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5YaF5qC45Luj56CB5Y+v
5Lul5piO56Gu5Zyw566h55CG6YKj5Lqb5bey6YCa6L+HIGdwaW9fcmVxdWVzdCgp55Sz6K+355qE
IEdQSU8g55qE5a+85Ye6OjoNCj4NCj4gICAgICAgICAvKiDlr7zlh7ogR1BJTyDliLDnlKjmiLfn
qbrpl7QgKi8NCj4gICAgICAgICBpbnQgZ3Bpb19leHBvcnQodW5zaWduZWQgZ3BpbywgYm9vbCBk
aXJlY3Rpb25fbWF5X2NoYW5nZSk7DQo+IEBAIC02NDgsMyArNzEzLDkgQEAgR1BJTyDmjqfliLbl
majnmoTot6/lvoTnsbvkvLwgL3N5cy9jbGFzcy9ncGlvL2dwaW9jaGlwNDIvICjlr7nkuo7ku44j
NDIgR1BJTw0KPiAg5ZyoIEdQSU8g6KKr5a+85Ye65LmL5ZCO77yMZ3Bpb19leHBvcnRfbGluaygp
5YWB6K645ZyoIHN5c2ZzIOaWh+S7tuezu+e7n+eahOS7u+S9leWcsOaWuQ0KPiAg5Yib5bu65LiA
5Liq5Yiw6L+Z5LiqIEdQSU8gc3lzZnMg6IqC54K555qE56ym5Y+36ZO+5o6l44CC6L+Z5qC36amx
5Yqo5bCx5Y+v5Lul6YCa6L+H5LiA5Liq5o+P6L+w5oCn55qEDQo+ICDlkI3lrZfvvIzlnKggc3lz
ZnMg5Lit5LuW5Lus5omA5oul5pyJ55qE6K6+5aSH5LiL5o+Q5L6b5LiA5LiqKOWIsOi/meS4qiBH
UElPIHN5c2ZzIOiKgueCueeahCnmjqXlj6PjgIINCj4gKw0KPiArDQo+ICtBUEnlj4LogIMNCj4g
Kz09PT09PT0NCj4gKw0KPiAr5pys6IqC5Lit5YiX5Ye655qE5Ye95pWw5bey6KKr5bqf5byD44CC
5Zyo5paw55qE5Luj56CB5Lit5bqU6K+l5L2/55So5Z+65LqOR1BJT+aPj+i/sOespueahEFQSeOA
gg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZHJpdmVy
LWFwaS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kcml2ZXIt
YXBpL2luZGV4LnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjI0ZWIyMTk4ZTVmMQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2RyaXZlci1hcGkvaW5kZXgucnN0DQo+IEBAIC0wLDAgKzEsMTMy
IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArDQo+ICsuLiBp
bmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvaW5kZXgucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs6
5qCh6K+ROg0KPiArDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK0xpbnV46amx5Yqo
5a6e546w6ICF55qEQVBJ5oyH5Y2XDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0K
PiAr5YaF5qC45o+Q5L6b5LqG5ZCE56eN5ZCE5qC355qE5o6l5Y+j5p2l5pSv5oyB6K6+5aSH6amx
5Yqo55qE5byA5Y+R44CC6L+Z5Lu95paH5qGj5Y+q5piv5a+55YW25Lit5LiA5Lqb5o6l5Y+j6L+b
6KGM5LqGDQo+ICvkuIDlrprnqIvluqbnmoTmlbTnkIbigJTigJTluIzmnJvpmo/nnYDml7bpl7Tn
moTmjqjnp7vvvIzlroPog73lj5jlvpfmm7Tlpb3vvIHlj6/nlKjnmoTlsI/oioLlj6/ku6XlnKjk
uIvpnaLnnIvliLDjgIINCj4gKw0KPiArLi4gY2xhc3M6OiB0b2MtdGl0bGUNCj4gKw0KPiArICAg
ICAgICAgIOebruW9leWIl+ihqO+8mg0KPiArDQo+ICsuLiB0b2N0cmVlOjoNCj4gKyAgIDptYXhk
ZXB0aDogMg0KPiArDQo+ICsgICBncGlvL2luZGV4DQo+ICsNCj4gK1RvZG9saXN0Og0KPiArDQo+
ICsqICAgZHJpdmVyLW1vZGVsL2luZGV4DQo+ICsqICAgYmFzaWNzDQo+ICsqICAgaW5mcmFzdHJ1
Y3R1cmUNCj4gKyogICBpb2N0bA0KPiArKiAgIGVhcmx5LXVzZXJzcGFjZS9pbmRleA0KPiArKiAg
IHBtL2luZGV4DQo+ICsqICAgY2xrDQo+ICsqICAgZGV2aWNlLWlvDQo+ICsqICAgZG1hLWJ1Zg0K
PiArKiAgIGRldmljZV9saW5rDQo+ICsqICAgY29tcG9uZW50DQo+ICsqICAgbWVzc2FnZS1iYXNl
ZA0KPiArKiAgIGluZmluaWJhbmQNCj4gKyogICBhcGVydHVyZQ0KPiArKiAgIGZyYW1lLWJ1ZmZl
cg0KPiArKiAgIHJlZ3VsYXRvcg0KPiArKiAgIHJlc2V0DQo+ICsqICAgaWlvL2luZGV4DQo+ICsq
ICAgaW5wdXQNCj4gKyogICB1c2IvaW5kZXgNCj4gKyogICBmaXJld2lyZQ0KPiArKiAgIHBjaS9p
bmRleA0KPiArKiAgIGN4bC9pbmRleA0KPiArKiAgIHNwaQ0KPiArKiAgIGkyYw0KPiArKiAgIGlw
bWINCj4gKyogICBpcG1pDQo+ICsqICAgaTNjL2luZGV4DQo+ICsqICAgaW50ZXJjb25uZWN0DQo+
ICsqICAgZGV2ZnJlcQ0KPiArKiAgIGhzaQ0KPiArKiAgIGVkYWMNCj4gKyogICBzY3NpDQo+ICsq
ICAgbGliYXRhDQo+ICsqICAgdGFyZ2V0DQo+ICsqICAgbWFpbGJveA0KPiArKiAgIG10ZG5hbmQN
Cj4gKyogICBtaXNjZWxsYW5lb3VzDQo+ICsqICAgbWVpL2luZGV4DQo+ICsqICAgbXRkL2luZGV4
DQo+ICsqICAgbW1jL2luZGV4DQo+ICsqICAgbnZkaW1tL2luZGV4DQo+ICsqICAgdzENCj4gKyog
ICByYXBpZGlvL2luZGV4DQo+ICsqICAgczM5MC1kcml2ZXJzDQo+ICsqICAgdm1lDQo+ICsqICAg
ODAyMTEvaW5kZXgNCj4gKyogICB1aW8taG93dG8NCj4gKyogICBmaXJtd2FyZS9pbmRleA0KPiAr
KiAgIHBpbi1jb250cm9sDQo+ICsqICAgbWQvaW5kZXgNCj4gKyogICBtZWRpYS9pbmRleA0KPiAr
KiAgIG1pc2NfZGV2aWNlcw0KPiArKiAgIG5mYy9pbmRleA0KPiArKiAgIGRtYWVuZ2luZS9pbmRl
eA0KPiArKiAgIHNsaW1idXMNCj4gKyogICBzb3VuZHdpcmUvaW5kZXgNCj4gKyogICB0aGVybWFs
L2luZGV4DQo+ICsqICAgZnBnYS9pbmRleA0KPiArKiAgIGFjcGkvaW5kZXgNCj4gKyogICBhdXhp
bGlhcnlfYnVzDQo+ICsqICAgYmFja2xpZ2h0L2xwODU1eC1kcml2ZXIucnN0DQo+ICsqICAgY29u
bmVjdG9yDQo+ICsqICAgY29uc29sZQ0KPiArKiAgIGRjZGJhcw0KPiArKiAgIGVpc2ENCj4gKyog
ICBpc2ENCj4gKyogICBpc2FwbnANCj4gKyogICBpby1tYXBwaW5nDQo+ICsqICAgaW9fb3JkZXJp
bmcNCj4gKyogICBnZW5lcmljLWNvdW50ZXINCj4gKyogICBtZW1vcnktZGV2aWNlcy9pbmRleA0K
PiArKiAgIG1lbi1jaGFtZWxlb24tYnVzDQo+ICsqICAgbnRiDQo+ICsqICAgbnZtZW0NCj4gKyog
ICBwYXJwb3J0LWxvd2xldmVsDQo+ICsqICAgcHBzDQo+ICsqICAgcHRwDQo+ICsqICAgcGh5L2lu
ZGV4DQo+ICsqICAgcHdtDQo+ICsqICAgcGxkbWZ3L2luZGV4DQo+ICsqICAgcmZraWxsDQo+ICsq
ICAgc2VyaWFsL2luZGV4DQo+ICsqICAgc201MDENCj4gKyogICBzdXJmYWNlX2FnZ3JlZ2F0b3Iv
aW5kZXgNCj4gKyogICBzd2l0Y2h0ZWMNCj4gKyogICBzeW5jX2ZpbGUNCj4gKyogICB0dHkvaW5k
ZXgNCj4gKyogICB2ZmlvLW1lZGlhdGVkLWRldmljZQ0KPiArKiAgIHZmaW8NCj4gKyogICB2Zmlv
LXBjaS1kZXZpY2Utc3BlY2lmaWMtZHJpdmVyLWFjY2VwdGFuY2UNCj4gKyogICB4aWxpbngvaW5k
ZXgNCj4gKyogICB4aWxseWJ1cw0KPiArKiAgIHpvcnJvDQo+ICsqICAgaHRlL2luZGV4DQo+ICsN
Cj4gKy4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KPiArDQo+ICsgICBJbmRpY2VzDQo+
ICsgICA9PT09PT09DQo+ICsNCj4gKyAgICogOnJlZjpgZ2VuaW5kZXhgDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QNCj4gaW5kZXggYmY4NWJhY2E4YjNlLi40
ZjA0MzY3YTRjNWUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9p
bmRleC5yc3QNCj4gQEAgLTEwOCw2ICsxMDgsNyBAQCBUT0RPTGlzdDoNCj4gICAgIDptYXhkZXB0
aDogMg0KPg0KPiAgICAgY29yZS1hcGkvaW5kZXgNCj4gKyAgIGRyaXZlci1hcGkvaW5kZXgNCj4g
ICAgIGxvY2tpbmcvaW5kZXgNCj4gICAgIGFjY291bnRpbmcvaW5kZXgNCj4gICAgIGNwdS1mcmVx
L2luZGV4DQo+IEBAIC0xMjMsNyArMTI0LDYgQEAgVE9ET0xpc3Q6DQo+DQo+ICBUT0RPTGlzdDoN
Cj4NCj4gLSogZHJpdmVyLWFwaS9pbmRleA0KPiAgKiBibG9jay9pbmRleA0KPiAgKiBjZHJvbS9p
bmRleA0KPiAgKiBpZGUvaW5kZXgNCj4gLS0NCj4gMi4zMS4xDQo+DQo=

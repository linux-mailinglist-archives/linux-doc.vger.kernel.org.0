Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED7A54DEA5
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jun 2022 12:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359846AbiFPKIc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Jun 2022 06:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376273AbiFPKI0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 06:08:26 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E17A85C86E
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 03:08:24 -0700 (PDT)
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Thu, 16 Jun 2022
 18:08:22 +0800 (GMT+08:00)
X-Originating-IP: [223.64.16.213]
Date:   Thu, 16 Jun 2022 18:08:22 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5ZGo5b2s5b2s?= <zhoubinbin@loongson.cn>
To:     "YanTeng Si" <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, chenhuacai@loongson.cn,
        bobwxc@email.cn, linux-doc@vger.kernel.org
Subject: Re: Re: [PATCH 3/9] docs/zh_CN: core-api: Update the translation of
 irq/irq-domain.rst to 5.19-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2022 www.mailtech.cn .loongson.cn
In-Reply-To: <4ec817f3-9c43-f1d6-9e2d-c45f376a8585@loongson.cn>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
 <1a25ec0beb2426cd7c711bc6a187aa3b3625fa13.1655258291.git.zhoubinbin@loongson.cn>
 <4ec817f3-9c43-f1d6-9e2d-c45f376a8585@loongson.cn>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: 6qKrjmZvb3Rlcl90eHQ9Mzg2Mzo2MTI=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6377d4bb.f0ac.1816bfc41d3.Coremail.zhoubinbin@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9CxT+YXAati39ZFAA--.6375W
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQATCF3QvPmoEgABsp
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CgoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R5Lu25Lq6OiAiWWFuVGVuZyBT
aSIgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4KJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjItMDYtMTYg
MTA6MTg6NTQgKOaYn+acn+WbmykKJmd0OyDmlLbku7bkuro6ICJCaW5iaW4gWmhvdSIgPHpob3Vi
aW5iaW5AbG9vbmdzb24uY24+LCBhbGV4c0BrZXJuZWwub3JnCiZndDsg5oqE6YCBOiBjb3JiZXRA
bHduLm5ldCwgY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbiwgYm9id3hjQGVtYWlsLmNuLCBsaW51eC1k
b2NAdmdlci5rZXJuZWwub3JnCiZndDsg5Li76aKYOiBSZTogW1BBVENIIDMvOV0gZG9jcy96aF9D
TjogY29yZS1hcGk6IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gb2YgaXJxL2lycS1kb21haW4ucnN0
IHRvIDUuMTktcmMyCiZndDsgCiZndDsgCiZndDsg5ZyoIDIwMjIvNi8xNSAxNzoyNCwgQmluYmlu
IFpob3Ug5YaZ6YGTOgomZ3Q7ICZndDsgU3luY2hyb25vdXMgdHJhbnNsYXRpb24gZnJvbSB0aGUg
Zm9sbG93aW5nIGNvbW1pdHMoTGF0ZXN0IGluIGZyb250KToKJmd0OyAmZ3Q7CiZndDsgJmd0OyBb
MV06IGNvbW1pdCAwOTUzZmIyNjM3MTQoImlycTogcmVtb3ZlIGhhbmRsZV9kb21haW5fe2lycSxu
bWl9KCkiKQomZ3Q7ICZndDsKJmd0OyAmZ3Q7IFsyXTogY29tbWl0IDBkZGM1ZTU1ZTZmMSgiRG9j
dW1lbnRhdGlvbjogRml4IGlycS1kb21haW4ucnN0IGJ1aWxkIHdhcm5pbmciKQomZ3Q7ICZndDsK
Jmd0OyAmZ3Q7IFszXTogY29tbWl0IDk5MTAwN2JhNmNjYSgiRG9jdW1lbnRhdGlvbjogVXBkYXRl
CiZndDsgJmd0OyAgICAgICBpcnFfZG9tYWluLnJzdCB3aXRoIG5ldyBsb29rdXAgQVBJcyIpCiZn
dDsgJmd0OwomZ3Q7ICZndDsgWzRdOiBjb21taXQgNDA1ZTk0ZTlhZWQyKCJpcnFkb21haW46IEtp
bGwgaXJxX2RvbWFpbl9hZGRfbGVnYWN5X2lzYSIpCiZndDsgJmd0OwomZ3Q7ICZndDsgU2lnbmVk
LW9mZi1ieTogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+CiZndDsgJmd0OyAt
LS0KJmd0OyAmZ3Q7ICAgLi4uL3poX0NOL2NvcmUtYXBpL2lycS9pcnEtZG9tYWluLnJzdCAgICAg
ICAgIHwgMjIgKysrKysrKysrKysrKysrLS0tLQomZ3Q7ICZndDsgICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKJmd0OyAmZ3Q7CiZndDsgJmd0OyBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2ly
cS1kb21haW4ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkv
aXJxL2lycS1kb21haW4ucnN0CiZndDsgJmd0OyBpbmRleCA3ZDA3Nzc0MmY3NTguLjg2M2U0NDg4
YzM2YiAxMDA2NDQKJmd0OyAmZ3Q7IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NvcmUtYXBpL2lycS9pcnEtZG9tYWluLnJzdAomZ3Q7ICZndDsgKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2lycS1kb21haW4ucnN0CiZndDsg
Jmd0OyBAQCAtNSw2ICs1LDcgQEAKJmd0OyAmZ3Q7ICAgOue/u+ivkToKJmd0OyAmZ3Q7ICAgCiZn
dDsgJmd0OyAgICDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPgom
Z3Q7ICZndDsgKyDlkajlvazlvawgQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+
CiZndDsgJmd0OyAgIAomZ3Q7ICZndDsgICAuLiBfY25faXJxLWRvbWFpbi5yc3Q6CiZndDsgJmd0
OyAgIAomZ3Q7ICZndDsgQEAgLTUyLDggKzUzLDE4IEBAIGlycV9kb21haW7lkozkuIDkuKpod2ly
ceWPt+S9nOS4uuWPguaVsOOAgiDlpoLmnpxod2lyceeahOaYoOWwhOi/mOS4jeWtmOWcqO+8jAom
Z3Q7ICZndDsgICDkuIDkuKrmlrDnmoRMaW51eCBpcnFfZGVzY++8jOWwhuWFtuS4jmh3aXJx5YWz
6IGU6LW35p2l77yM5bm26LCD55SoLm1hcCgp5Zue6LCD77yM6L+Z5qC36amx5YqoCiZndDsgJmd0
OyAgIOeoi+W6j+WwseWPr+S7peaJp+ihjOS7u+S9leW/heimgeeahOehrOS7tuiuvue9ruOAggom
Z3Q7ICZndDsgICAKJmd0OyAmZ3Q7IC3lvZPmjqXmlLbliLDkuIDkuKrkuK3mlq3ml7bvvIzlupTo
r6Xkvb/nlKhpcnFfZmluZF9tYXBwaW5nKCnlh73mlbDku45od2lyceWPt+S4reaJvuWIsAomZ3Q7
ICZndDsgLUxpbnV4IElSUeWPt+OAggomZ3Q7ICZndDsgK+S4gOaXpuW7uueri+S6huaYoOWwhO+8
jOWPr+S7pemAmui/h+WkmuenjeaWueazleajgOe0ouaIluS9v+eUqOWug++8mgomZ3Q7ICZndDsg
KwomZ3Q7ICZndDsgKy0gaXJxX3Jlc29sdmVfbWFwcGluZygp6L+U5Zue5LiA5Liq5oyH5ZCR57uZ
5a6a5Z+f5ZKMaHdpcnHnmoRpcnFfZGVzY+e7k+aehOaMh+mSiO+8jAomZ3Q7ICZndDsgKyAg5aaC
5p6c5rKh5pyJ5pig5bCE5YiZ6L+U5ZueTlVMTOOAggomZ3Q7ICZndDsgKwomZ3Q7ICZndDsgKy0g
aXJxX2ZpbmRfbWFwcGluZygp6L+U5Zue57uZ5a6a5Z+f5ZKMaHdpcnHnmoRMaW51eCBJUlHlj7fv
vIzlpoLmnpzmsqHmnInmmKDlsITliJnov5Tlm54w44CCCiZndDsgJmd0OyArCiZndDsgJmd0OyAr
LSBpcnFfbGluZWFyX3Jldm1hcCgp546w5LiOaXJxX2ZpbmRfbWFwcGluZygp55u45ZCM77yM5bey
6KKr5bqf5byD44CCCiZndDsgJmd0OyArCiZndDsgJmd0OyArLSBnZW5lcmljX2hhbmRsZV9kb21h
aW5faXJxKCnlpITnkIbkuIDkuKrnlLHln5/lkoxod2lyceaPj+i/sOeahOS4reaWreOAggomZ3Q7
IAomZ3Q7IGh3aXJx5Y+35o+P6L+w55qE5Lit5pat44CCCgpPSyxJIHNlZS4KClRoYW5rcywKQmlu
YmluCiZndDsgCiZndDsgCiZndDsgVGhhbmtzLAomZ3Q7IAomZ3Q7IFlhbnRlbmcKJmd0OyAKJmd0
OyAmZ3Q7ICsKJmd0OyAmZ3Q7ICvor7fms6jmhI/vvIxpcnHln5/nmoTmn6Xmib7lv4Xpobvlj5Hn
lJ/lnKjkuI5SQ1Xor7vkuLTnlYzljLrlhbzlrrnnmoTkuIrkuIvmlofkuK3jgIIKJmd0OyAmZ3Q7
ICAgCiZndDsgJmd0OyAgIOWcqOiwg+eUqGlycV9maW5kX21hcHBpbmcoKeS5i+WJje+8jOiHs+Ww
keimgeiwg+eUqOS4gOasoWlycV9jcmVhdGVfbWFwcGluZygp5Ye95pWw77yMCiZndDsgJmd0OyAg
IOS7peWFjeaPj+i/sOespuS4jeiDveiiq+WIhumFjeOAggomZ3Q7ICZndDsgQEAgLTExOSw3ICsx
MzAsOCBAQCBpcnFfZG9tYWluX2FkZF90cmVlKCnlkoxpcnFfZG9tYWluX2NyZWF0ZV90cmVlKCnl
nKjlip/og73kuIrmmK/nrYnku7fnmoTvvIzpmaQKJmd0OyAmZ3Q7ICAgTGludXggSVJR5Y+357yW
5YWl56Gs5Lu25pys6Lqr77yM6L+Z5qC35bCx5LiN6ZyA6KaB5pig5bCE5LqG44CCIOiwg+eUqGly
cV9jcmVhdGVfZGlyZWN0X21hcHBpbmcoKQomZ3Q7ICZndDsgICDkvJrliIbphY3kuIDkuKpMaW51
eCBJUlHlj7fvvIzlubbosIPnlKgubWFwKCnlm57osIPvvIzov5nmoLfpqbHliqjlsLHlj6/ku6Xl
sIZMaW51eCBJUlHlj7fnvJblhaXnoazku7bkuK3jgIIKJmd0OyAmZ3Q7ICAgCiZndDsgJmd0OyAt
5aSn5aSa5pWw6amx5Yqo56iL5bqP5LiN6IO95L2/55So6L+Z5Liq5pig5bCE44CCCiZndDsgJmd0
OyAr5aSn5aSa5pWw6amx5Yqo56iL5bqP5peg5rOV5L2/55So5q2k5pig5bCE77yM546w5Zyo5a6D
55SxQ09ORklHX0lSUV9ET01BSU5fTk9NQVDpgInpobnmjqfliLbjgIIKJmd0OyAmZ3Q7ICvor7fk
uI3opoHlvJXlhaXmraRBUEnnmoTmlrDnlKjmiLfjgIIKJmd0OyAmZ3Q7ICAgCiZndDsgJmd0OyAg
IOS8oOe7n+aYoOWwhOexu+WeiwomZ3Q7ICZndDsgICAtLS0tLS0tLS0tLS0KJmd0OyAmZ3Q7IEBA
IC0xMjgsNyArMTQwLDYgQEAgTGludXggSVJR5Y+357yW5YWl56Gs5Lu25pys6Lqr77yM6L+Z5qC3
5bCx5LiN6ZyA6KaB5pig5bCE5LqG44CCIOiwg+eUqGlycV9jcmVhdGUKJmd0OyAmZ3Q7ICAgCiZn
dDsgJmd0OyAgIAlpcnFfZG9tYWluX2FkZF9zaW1wbGUoKQomZ3Q7ICZndDsgICAJaXJxX2RvbWFp
bl9hZGRfbGVnYWN5KCkKJmd0OyAmZ3Q7IC0JaXJxX2RvbWFpbl9hZGRfbGVnYWN5X2lzYSgpCiZn
dDsgJmd0OyAgIAlpcnFfZG9tYWluX2NyZWF0ZV9zaW1wbGUoKQomZ3Q7ICZndDsgICAJaXJxX2Rv
bWFpbl9jcmVhdGVfbGVnYWN5KCkKJmd0OyAmZ3Q7ICAgCiZndDsgJmd0OyBAQCAtMTM3LDYgKzE0
OCw5IEBAIExpbnV4IElSUeWPt+e8luWFpeehrOS7tuacrOi6q++8jOi/meagt+WwseS4jemcgOim
geaYoOWwhOS6huOAgiDosIPnlKhpcnFfY3JlYXRlCiZndDsgJmd0OyAgIOS4gOe7hOeUqOS6jklS
UeWPt+eahOWumuS5ie+8iCNkZWZpbmXvvInvvIzov5nkupvlrprkuYnooqvkvKDpgJLnu5lzdHJ1
Y3Torr7lpIfms6jlhozjgIIg5Zyo6L+Z56eN5oOF5Ya15LiL77yMCiZndDsgJmd0OyAgIOS4jeiD
veWKqOaAgeWIhumFjUxpbnV4IElSUeWPt++8jOW6lOivpeS9v+eUqOS8oOe7n+aYoOWwhOOAggom
Z3Q7ICZndDsgICAKJmd0OyAmZ3Q7ICvpob7lkI3mgJ3kuYnvvIxcKl9sZWdhY3koKeezu+WIl+WH
veaVsOW3suiiq+W6n+W8g++8jOWPquaYr+S4uuS6huaWueS+v+WvueWPpOiAgeW5s+WPsOeahOaU
r+aMgeiAjOWtmOWcqOOAggomZ3Q7ICZndDsgK+S4jeW6lOivpeWinuWKoOaWsOeahOeUqOaIt+OA
guW9k1wqX3NpbXBsZSgp57O75YiX5Ye95pWw55qE5L2/55So5a+86Ie06YGX55WZ6KGM5Li65pe2
77yM5LuW5Lus5Lmf5piv5aaC5q2k44CCCiZndDsgJmd0OyArCiZndDsgJmd0OyAgIOS8oOe7n+aY
oOWwhOWBh+iuvuW3sue7j+S4uuaOp+WItuWZqOWIhumFjeS6huS4gOS4qui/nue7reeahElSUeWP
t+iMg+WbtO+8jOW5tuS4lOWPr+S7pemAmui/h+WQkWh3aXJx5Y+35re75Yqg5LiACiZndDsgJmd0
OyAgIOS4quWbuuWumueahOWBj+enu+adpeiuoeeul0lSUeWPt++8jOWPjeS5i+S6pueEtuOAgiDn
vLrngrnmmK/pnIDopoHkuK3mlq3mjqfliLblmajnrqHnkIZJUlHliIbphY3vvIzlubbkuJTpnIDo
poHkuLrmr48KJmd0OyAmZ3Q7ICAg5LiqaHdpcnHliIbphY3kuIDkuKppcnFfZGVzY++8jOWNs+S9
v+Wug+ayoeacieiiq+S9v+eUqOOAggo8L3pob3ViaW5iaW5AbG9vbmdzb24uY24+PC9zaXlhbnRl
bmdAbG9vbmdzb24uY24+PC96aG91YmluYmluQGxvb25nc29uLmNuPjwvemhvdWJpbmJpbkBsb29u
Z3Nvbi5jbj48L3NpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0K5pys6YKu5Lu25Y+K5YW26ZmE5Lu2
5ZCr5pyJ6b6Z6Iqv5Lit56eR55qE5ZWG5Lia56eY5a+G5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB
57uZ5LiK6Z2i5Zyw5Z2A5Lit5YiX5Ye655qE5Liq5Lq65oiW576k57uE44CC56aB5q2i5Lu75L2V
5YW25LuW5Lq65Lul5Lu75L2V5b2i5byP5L2/55So77yI5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo
5oiW6YOo5YiG5Zyw5rOE6Zyy44CB5aSN5Yi25oiW5pWj5Y+R77yJ5pys6YKu5Lu25Y+K5YW26ZmE
5Lu25Lit55qE5L+h5oGv44CC5aaC5p6c5oKo6ZSZ5pS25pys6YKu5Lu277yM6K+35oKo56uL5Y2z
55S16K+d5oiW6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu244CCIA0KVGhp
cyBlbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0
aW9uIGZyb20gTG9vbmdzb24gVGVjaG5vbG9neSAsIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9y
IHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkg
dXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1
ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJl
cHJvZHVjdGlvbiBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGVt
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcGhvbmUgb3IgZW1haWwg
aW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdC4g

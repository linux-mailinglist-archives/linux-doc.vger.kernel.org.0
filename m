Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB6E54EE7C
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 02:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378861AbiFQAcx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Jun 2022 20:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiFQAcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 20:32:52 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66FE1120B0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 17:32:50 -0700 (PDT)
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Fri, 17 Jun 2022
 08:32:47 +0800 (GMT+08:00)
X-Originating-IP: [223.64.16.213]
Date:   Fri, 17 Jun 2022 08:32:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5ZGo5b2s5b2s?= <zhoubinbin@loongson.cn>
To:     "Wu XiangCheng" <bobwxc@email.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: Re: [PATCH 7/9] docs/zh_CN: core-api: Update the translation of
 printk-format.rst to 5.19-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2022 www.mailtech.cn .loongson.cn
In-Reply-To: <Yqu+x95ngy68Vu0p@bobwxc.mipc>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
 <ebfda3a43afbfb5dd0186a6e68e080dd933a4883.1655258291.git.zhoubinbin@loongson.cn>
 <Yqu+x95ngy68Vu0p@bobwxc.mipc>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: sy6SsmZvb3Rlcl90eHQ9MjY5ODo2MTI=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1abbefb1.371.1816f13a56a.Coremail.zhoubinbin@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9Dx392vy6tiE11HAA--.154W
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQAACF3QvPm1TAAAs4
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

CgoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R5Lu25Lq6OiAiV3UgWGlhbmdD
aGVuZyIgPGJvYnd4Y0BlbWFpbC5jbj4KJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjItMDYtMTcgMDc6
Mzc6NDMgKOaYn+acn+S6lCkKJmd0OyDmlLbku7bkuro6ICJCaW5iaW4gWmhvdSIgPHpob3ViaW5i
aW5AbG9vbmdzb24uY24+CiZndDsg5oqE6YCBOiBhbGV4c0BrZXJuZWwub3JnLCBzaXlhbnRlbmdA
bG9vbmdzb24uY24sIGNvcmJldEBsd24ubmV0LCBjaGVuaHVhY2FpQGxvb25nc29uLmNuLCBsaW51
eC1kb2NAdmdlci5rZXJuZWwub3JnCiZndDsg5Li76aKYOiBSZTogW1BBVENIIDcvOV0gZG9jcy96
aF9DTjogY29yZS1hcGk6IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gb2YgcHJpbnRrLWZvcm1hdC5y
c3QgdG8gNS4xOS1yYzIKJmd0OyAKJmd0OyBPbiBXZWQsIEp1biAxNSwgMjAyMiBhdCAwNToyNDoz
MFBNICswODAwLCBCaW5iaW4gWmhvdSB3cm90ZToKJmd0OyAmZ3Q7IFN5bmNocm9ub3VzIHRyYW5z
bGF0aW9uIGZyb20gdGhlIGZvbGxvd2luZyBjb21taXRzKExhdGVzdCBpbiBmcm9udCk6CiZndDsg
Jmd0OyAKJmd0OyAmZ3Q7IFsxXTogY29tbWl0IDJmYmY1MjQxYTU2MSgidnNwcmludGY6IGFkZCBu
ZXcgYCVwQWAgZm9ybWF0IHNwZWNpZmllciIpCiZndDsgCiZndDsgXiB0aGlzIGNvbW1pdCBpcyBm
cm9tIHJ1c3QtbmV4dCBhbmQgbm90IGFwcGVhcmVkIGluIG1hc3RlciBvcgomZ3Q7IGpjL2RvY3Mt
bmV4dCB5ZXQsIHNvIHBsZWFzZSBkcm9wIGl0LgomZ3Q7IAomZ3Q7IFRoYW5rcywKJmd0OyAJV3UK
Ck9LLCBJIHNlZS4KClRoYW5rcywKQmluYmluCiZndDsgCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IFsy
XTogY29tbWl0IDZhN2NhODBmNDAzMygidnNwcmludGY6IFVwZGF0ZSAlcEdwIGRvY3VtZW50YXRp
b24KJmd0OyAmZ3Q7ICAgICAgYWJvdXQgdGhhdCBpdCBwcmludHMgaGV4IHZhbHVlIikKJmd0OyAm
Z3Q7IAomZ3Q7ICZndDsgU2lnbmVkLW9mZi1ieTogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9v
bmdzb24uY24+CiZndDsgJmd0OyAtLS0KJmd0OyAmZ3Q7ICAuLi4vdHJhbnNsYXRpb25zL3poX0NO
L2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdCAgfCAxMyArKysrKysrKysrKystCiZndDsgJmd0
OyAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKJmd0OyAm
Z3Q7IAomZ3Q7ICZndDsgZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdAomZ3Q7ICZndDsgaW5kZXggY2Uz
OWM3ODhjZjVhLi43ODU2MWMzNWU1MjggMTAwNjQ0CiZndDsgJmd0OyAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9wcmludGstZm9ybWF0cy5yc3QKJmd0OyAm
Z3Q7ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL3ByaW50
ay1mb3JtYXRzLnJzdAomZ3Q7ICZndDsgQEAgLTUsNiArNSw3IEBACiZndDsgJmd0OyAgOue/u+iv
kToKJmd0OyAmZ3Q7ICAKJmd0OyAmZ3Q7ICAg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVu
Z0Bsb29uZ3Nvbi5jbj4KJmd0OyAmZ3Q7ICsg5ZGo5b2s5b2sIEJpbmJpbiBaaG91IDx6aG91Ymlu
YmluQGxvb25nc29uLmNuPgomZ3Q7ICZndDsgIAomZ3Q7ICZndDsgIC4uIF9jbl9wcmludGstZm9y
bWF0cy5yc3Q6CiZndDsgJmd0OyAgCiZndDsgJmd0OyBAQCAtNTQ4LDcgKzU0OSw3IEBAIG5vZGVt
YXNrX3ByX2FyZ3MoKeadpeaWueS+v+aJk+WNsGNwdW1hc2vlkoxub2RlbWFza+OAggomZ3Q7ICZn
dDsgIAomZ3Q7ICZndDsgIDo6CiZndDsgJmd0OyAgCiZndDsgJmd0OyAtCSVwR3AJcmVmZXJlbmNl
ZHx1cHRvZGF0ZXxscnV8YWN0aXZlfHByaXZhdGV8bm9kZT0wfHpvbmU9MnxsYXN0Y3B1cGlkPTB4
MWZmZmZmCiZndDsgJmd0OyArCSVwR3AJMHgxN2ZmZmZjMDAwMjAzNihyZWZlcmVuY2VkfHVwdG9k
YXRlfGxydXxhY3RpdmV8cHJpdmF0ZXxub2RlPTB8em9uZT0yfGxhc3RjcHVwaWQ9MHgxZmZmZmYp
CiZndDsgJmd0OyAgCSVwR2cJR0ZQX1VTRVJ8R0ZQX0RNQTMyfEdGUF9OT1dBUk4KJmd0OyAmZ3Q7
ICAJJXBHdglyZWFkfGV4ZWN8bWF5cmVhZHxtYXl3cml0ZXxtYXlleGVjfGRlbnl3cml0ZQomZ3Q7
ICZndDsgIAomZ3Q7ICZndDsgQEAgLTU4OSw2ICs1OTAsMTYgQEAgVjRMMuWSjERSTSBGb3VyQ0Pk
u6PnoIEo5YOP57Sg5qC85byPKQomZ3Q7ICZndDsgIAklcDRjYwlZMTAgIGxpdHRsZS1lbmRpYW4g
KDB4MjAzMDMxNTkpCiZndDsgJmd0OyAgCSVwNGNjCU5WMTIgYmlnLWVuZGlhbiAoMHhiMjMxNTY0
ZSkKJmd0OyAmZ3Q7ICAKJmd0OyAmZ3Q7ICtSdXN0CiZndDsgJmd0OyArLS0tLQomZ3Q7ICZndDsg
KwomZ3Q7ICZndDsgKzo6CiZndDsgJmd0OyArCiZndDsgJmd0OyArICAgICAgICVwQQomZ3Q7ICZn
dDsgKwomZ3Q7ICZndDsgK+S7heeUqOS6jlJ1c3Tku6PnoIHmoLzlvI/ljJZgYGNvcmU6OmZtdDo6
QXJndW1lbnRzYGDjgIIKJmd0OyAmZ3Q7ICvkuI3og73nlKjkuo5D6K+t6KiA44CCCiZndDsgJmd0
OyArCiZndDsgJmd0OyAg6LCi6LCiCiZndDsgJmd0OyAgPT09PQomZ3Q7ICZndDsgIAomZ3Q7ICZn
dDsgLS0gCiZndDsgJmd0OyAyLjIwLjEKPC96aG91YmluYmluQGxvb25nc29uLmNuPjwvc2l5YW50
ZW5nQGxvb25nc29uLmNuPjwvemhvdWJpbmJpbkBsb29uZ3Nvbi5jbj48L3pob3ViaW5iaW5AbG9v
bmdzb24uY24+PC9ib2J3eGNAZW1haWwuY24+DQoNCuacrOmCruS7tuWPiuWFtumZhOS7tuWQq+ac
iem+meiKr+S4reenkeeahOWVhuS4muenmOWvhuS/oeaBr++8jOS7hemZkOS6juWPkemAgee7meS4
iumdouWcsOWdgOS4reWIl+WHuueahOS4quS6uuaIlue+pOe7hOOAguemgeatouS7u+S9leWFtuS7
luS6uuS7peS7u+S9leW9ouW8j+S9v+eUqO+8iOWMheaLrOS9huS4jemZkOS6juWFqOmDqOaIlumD
qOWIhuWcsOazhOmcsuOAgeWkjeWItuaIluaVo+WPke+8ieacrOmCruS7tuWPiuWFtumZhOS7tuS4
reeahOS/oeaBr+OAguWmguaenOaCqOmUmeaUtuacrOmCruS7tu+8jOivt+aCqOeri+WNs+eUteiv
neaIlumCruS7tumAmuefpeWPkeS7tuS6uuW5tuWIoOmZpOacrOmCruS7tuOAgiANClRoaXMgZW1h
aWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBm
cm9tIExvb25nc29uIFRlY2hub2xvZ3kgLCB3aGljaCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUg
cGVyc29uIG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4gQW55IHVzZSBv
ZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5IChpbmNsdWRpbmcs
IGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9zdXJlLCByZXByb2R1
Y3Rpb24gb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVk
aWF0ZWx5IGFuZCBkZWxldGUgaXQuIA==

Return-Path: <linux-doc+bounces-4266-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41780727E
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 15:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05AE5B20D42
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 14:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192CA3A8E3;
	Wed,  6 Dec 2023 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dragonos-org.20200927.dkim.feishu.cn header.i=@dragonos-org.20200927.dkim.feishu.cn header.b="2+u36rL9"
X-Original-To: linux-doc@vger.kernel.org
X-Greylist: delayed 1519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 06:33:45 PST
Received: from va-1-18.ptr.blmpb.com (va-1-18.ptr.blmpb.com [209.127.230.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F1A1BD
	for <linux-doc@vger.kernel.org>; Wed,  6 Dec 2023 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dragonos-org.20200927.dkim.feishu.cn; t=1701871701;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=w/fTSeVYJnCZiYAD22e6XTrJCZ/8A89eZY4RqcrszNA=;
 b=2+u36rL92+0arFq7v+3EBZ7/WQWxfFdgWKG4EYUdr9cn2BlMCRTaqXa3KQa4HNDgFYWqMF
 zbKrrH/bhstQ7A+TFeaoskCkhTHfo4gUD3IWx0KHBW4Wo112PQ4nFld5wg0tO927qlFRIL
 4bGARReZWXxU9/vH2xLWdy5Or7BbqygvRfF2+B4NHEYcr3eseYC/MZnRZQzAzktOum8l/h
 MS8Ogmy721dcEj2RxjodaCJNTvIGJxXjSVS1ULpqJyAzkGS5rYdpVVAr41wLvZY99g1CyV
 ZEQnbPDUx2Cp5N+lOgJ5n8XH6XzOPA73/xyaBqeHiV6Jb+gvbwziTNenXbCVEg==
From: "longjin" <longjin@dragonos.org>
Subject: [PATCH] Translated the RISC-V architecture boot documentation.
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
To: <siyanteng@loongson.cn>, <alexs@kernel.org>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, "longjin" <longjin@DragonOS.org>, 
	"longjin" <longjin@dragonos.org>
Date: Wed,  6 Dec 2023 14:07:48 +0000
X-Mailer: git-send-email 2.34.1
Message-Id: <20231206140748.1675409-1-longjin@DragonOS.org>
X-Original-From: longjin <longjin@DragonOS.org>
Received: from longjin-server.8.8.8.8 ([116.56.134.73]) by smtp.feishu.cn with ESMTPS; Wed, 06 Dec 2023 22:08:19 +0800
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+265708054+35bd53+vger.kernel.org+longjin@dragonos.org>

VGhlIHBhdGNoIGFkZHMgYSBuZXcgZmlsZSBib290LnJzdCB0byB0aGUgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vDQphcmNoL3Jpc2N2LyBkaXJlY3RvcnksIGFuZCBhZGRzIGEgcmVm
ZXJlbmNlIHRvIHRoZSBuZXcgZmlsZSANCmluIHRoZSBpbmRleC5yc3QgZmlsZS4NCg0KU2lnbmVk
LW9mZi1ieTogbG9uZ2ppbiA8bG9uZ2ppbkBkcmFnb25vcy5vcmc+DQoNCi0tLQ0KIC4uLi90cmFu
c2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9ib290LnJzdCAgICB8IDE0NCArKysrKysrKysrKysr
KysrKysNCiAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3YvaW5kZXgucnN0ICAgfCAg
IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9ib290LnJz
dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9y
aXNjdi9ib290LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlz
Y3YvYm9vdC5yc3QNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjBm
ZThmY2ZjNTYwMQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vYXJjaC9yaXNjdi9ib290LnJzdA0KQEAgLTAsMCArMSwxNDQgQEANCisuLiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKy4uIGluY2x1ZGU6OiAuLi8uLi9kaXNjbGFp
bWVyLXpoX0NOLnJzdA0KKw0KKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Jv
b3QucnN0DQorDQorOue/u+ivkToNCisNCisg6b6Z6L+bIEppbiBMb25nIDxsb25namluQGRyYWdv
bm9zLm9yZz4NCisNCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KK1JJU0MtVuWGheaguOWQr+WKqOimgeaxguWSjOe6puadnw0KKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQorDQorOkF1dGhvcjogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPg0KKzpEYXRlOiAyMyBNYXkgMjAyMw0KKw0K
K+i/meS7veaWh+aho+aPj+i/sOS6hlJJU0MtVuWGheaguOWvueW8leWvvOWKoOi9veeoi+W6j+WS
jOWbuuS7tueahOacn+acm++8jOS7peWPiuS7u+S9leW8gOWPkeiAheWcqOaOpeinpuaXqeacn+WQ
r+WKqOi/h+eoi+aXtuW/hemhuw0KK+eJouiusOeahOe6puadn+OAguWcqOi/meS7veaWh+aho+S4
re+8jCBgYOaXqeacn+WQr+WKqOi/h+eoi2BgIOaMh+eahOaYr+WcqOacgOe7iOiZmuaLn+aYoOWw
hOiuvue9ruS5i+WJjei/kOihjOeahOS7u+S9leS7o+eggeOAgg0KKw0KK+WGheaguOmihOWKoOi9
veeahOimgeaxguWSjOe6puadnw0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KKw0KK1JJU0MtVuWGheaguOWvueW8leWvvOWKoOi9veeoi+W6j+WSjOW5s+WPsOWbuuS7
tuacieS7peS4i+imgeaxgu+8mg0KKw0KK+WvhOWtmOWZqOeKtuaAgQ0KKy0tLS0tLS0tLS0tLS0t
DQorDQorUklTQy1W5YaF5qC45pyf5pyb77yaDQorDQorICAqIGBgJGEwYGAg5bqU5YyF5ZCr5b2T
5YmN5qC45b+D55qEaGFydGlk44CCDQorICAqIGBgJGExYGAg5bqU5YyF5ZCr5YaF5a2Y5Lit6K6+
5aSH5qCR55qE5Zyw5Z2A44CCDQorDQorQ1NSIOWvhOWtmOWZqOeKtuaAgQ0KKy0tLS0tLS0tLQ0K
Kw0KK1JJU0MtVuWGheaguOacn+acm++8mg0KKw0KKyAgKiBgYCRzYXRwID0gMGBg77yaIOWmguae
nOWtmOWcqE1NVe+8jOW/hemhu+WwhuWFtuemgeeUqOOAgg0KKw0KK+S4uuW4uOmpu+WbuuS7tuS/
neeVmeeahOWGheWtmA0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCisN
CitSSVNDLVblhoXmoLjlnKjnm7TmjqXmmKDlsITkuK3kuI3og73mmKDlsITku7vkvZXluLjpqbvl
hoXlrZjmiJbnlKhQTVBz5L+d5oqk55qE5YaF5a2Y77yMDQor5Zug5q2k5Zu65Lu25b+F6aG75qC5
5o2u6K6+5aSH5qCR6KeE6IyDIOWSjC/miJYgVUVGSeinhOiMg+ato+ehruagh+iusOi/meS6m+WM
uuWfn+OAgg0KKw0KK+WGheaguOeahOS9jee9rg0KKy0tLS0tLS0tLS0tLS0tLQ0KKw0KK1JJU0Mt
VuWGheaguOacn+acm+iiq+aUvue9ruWcqFBNROi+ueeVjO+8iOWvueS6jnJ2NjTkuLoyTULlr7np
vZDvvIzlr7nkuo5ydjMy5Li6NE1C5a+56b2Q77yJ44CCDQor6K+35rOo5oSP77yM5aaC5p6c5LiN
5piv6L+Z5qC377yMRUZJIHN0dWIg5bCG6YeN5a6a5L2N5YaF5qC444CCDQorDQor56Gs5Lu25o+P
6L+wDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0NCisNCivlm7rku7blj6/ku6XlsIborr7lpIfmoJHm
iJZBQ1BJ6KGo5Lyg6YCS57uZUklTQy1W5YaF5qC444CCDQorDQor6K6+5aSH5qCR5Y+v5Lul55u0
5o6l5LuO5YmN5LiA6Zi25q616YCa6L+HJGEx5a+E5a2Y5Zmo5Lyg6YCS57uZ5YaF5qC477yM5oiW
6ICF5Zyo5L2/55SoVUVGSeWQr+WKqOaXtu+8jOWPr+S7pemAmui/h0VGSemFjee9ruihqOS8oOmA
kuOAgg0KKw0KK0FDUEnooajpgJrov4dFRknphY3nva7ooajkvKDpgJLnu5nlhoXmoLjjgILlnKjo
v5nnp43mg4XlhrXkuIvvvIxFRkkgc3R1YiDku43nhLbkvJrliJvlu7rkuIDkuKrlsI/nmoTorr7l
pIfmoJHjgIINCivor7flj4LpmIXkuIvpnaLnmoQiRUZJIHN0dWIg5ZKM6K6+5aSH5qCRIumDqOWI
hu+8jOS6huino+i/meS4quiuvuWkh+agkeeahOivpue7huS/oeaBr+OAgg0KKw0KK+WGheaguOWF
peWPow0KKy0tLS0tLS0tLS0tLQ0KKw0KK+WcqFNNUOezu+e7n+S4re+8jOacieS4pOenjeaWueaz
leWPr+S7pei/m+WFpeWGheaguO+8mg0KKw0KK+WcqFNNUOezu+e7n+S4re+8jOacieS4pOenjeaW
ueazleWPr+S7pei/m+WFpeWGheaguO+8mg0KKw0KKy0gYGBSSVNDVl9CT09UX1NQSU5XQUlUYGDv
vJrlm7rku7blnKjlhoXmoLjkuK3ph4rmlL7miYDmnInnmoRoYXJ077yM5LiA5LiqaGFydOi1ouW+
l+aKveWlluW5tuaJp+ihjOaXqeacn+WQr+WKqOS7o+egge+8jA0KK+iAjOWFtuS7lueahGhhcnTl
iJnlgZzlnKjpgqPph4znrYnlvoXliJ3lp4vljJblrozmiJDjgILov5nnp43mlrnms5XkuLvopoHn
lKjkuo7mlK/mjIHmsqHmnIlTQkkgSFNN5omp5bGV5ZKMTeaooeW8j1JJU0MtVuWGheaguOeahOaX
p+WbuuS7tuOAgg0KKy0gYGDmnInluo/lkK/liqhgYO+8muWbuuS7tuWPqumHiuaUvuS4gOS4quWw
huaJp+ihjOWIneWni+WMlumYtuauteeahGhhcnTvvIznhLblkI7kvb/nlKhTQkkgSFNN5omp5bGV
5ZCv5Yqo5omA5pyJ5YW25LuW55qEaGFydOOAgg0KK+acieW6j+WQr+WKqOaWueazleaYr+WQr+WK
qFJJU0MtVuWGheaguOeahOmmlumAieWQr+WKqOaWueazle+8jOWboOS4uuWug+WPr+S7peaUr+aM
gUNQVeeDreaPkuaLlOWSjGtleGVj44CCDQorDQorVUVGSQ0KKy0tLS0NCisNCitVRUZJIOWGheWt
mOaYoOWwhA0KK35+fn5+fn5+fn5+fn5+fg0KKw0KK+S9v+eUqFVFRknlkK/liqjml7bvvIxSSVND
LVblhoXmoLjlsIblj6rkvb/nlKhFRknlhoXlrZjmmKDlsITmnaXloavlhYXns7vnu5/lhoXlrZjj
gIINCisNCitVRUZJ5Zu65Lu25b+F6aG76Kej5p6QIGBgL3Jlc2VydmVkLW1lbW9yeWBgIOiuvuWk
h+agkeiKgueCueeahOWtkOiKgueCue+8jOW5tumBteWuiOiuvuWkh+agkeinhOiMg++8jOWwhui/
meS6m+WtkOiKgueCueeahOWxnuaApw0KK++8iCBgYG5vLW1hcGBgIOWSjCBgYHJldXNhYmxlYGAg
77yJ6L2s5o2i5Li65YW25q2j56Gu55qERUZJ562J5Lu354mp77yI5Y+C6KeB6K6+5aSH5qCR6KeE
6IyDdjAuNC1yYzHnmoQiMy41LjQNCisvcmVzZXJ2ZWQtbWVtb3J55ZKMVUVGSSLpg6jliIbvvInj
gIINCisNCitSSVNDVl9FRklfQk9PVF9QUk9UT0NPTA0KK35+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQorDQor5L2/55SoVUVGSeWQr+WKqOaXtu+8jEVGSSBzdHViIOmcgOimgeW8leWvvGhhcnRpZOS7
peS+v+WwhuWFtuS8oOmAkue7mSBgYCRhMWBgIOS4reeahFJJU0MtVuWGheaguOOAgg0KK0VGSSBz
dHVi5L2/55So5Lul5LiL5pa55rOV5LmL5LiA6I635Y+W5byV5a+8aGFydGlk77yaDQorDQorLSBg
YFJJU0NWX0VGSV9CT09UX1BST1RPQ09MYGDvvIgqKummlumAiSoq77yJ44CCDQorLSBgYGJvb3Qt
aGFydGlkYGDorr7lpIfmoJHlrZDoioLngrnvvIgqKuW3suW8g+eUqCoq77yJ44CCDQorDQor5Lu7
5L2V5paw55qE5Zu65Lu26YO95b+F6aG75a6e546wIGBgUklTQ1ZfRUZJX0JPT1RfUFJPVE9DT0xg
YO+8jOWboOS4uuWfuuS6juiuvuWkh+agkeeahOaWueazleeOsOW3suiiq+W8g+eUqOOAgg0KKw0K
K+aXqeacn+WQr+WKqOeahOimgeaxguWSjOe6puadnw0KKz09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQ0KKw0KK1JJU0MtVuWGheaguOeahOaXqeacn+WQr+WKqOi/h+eoi+mB
teW+quS7peS4i+e6puadn++8mg0KKw0KK0VGSSBzdHViIOWSjOiuvuWkh+agkQ0KKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQorDQor5L2/55SoVUVGSeWQr+WKqOaXtu+8jEVGSSBzdHViIOS8mueU
qOS4jmFybTY055u45ZCM55qE5Y+C5pWw6KGl5YWF77yI5oiW5Yib5bu677yJ6K6+5aSH5qCR77yM
DQor6L+Z5Lqb5Y+C5pWw5ZyoRG9jdW1lbnRhdGlvbi9hcmNoL2FybS91ZWZpLnJzdOS4reeahCJV
RUZJIGtlcm5lbCBzdXBwb3J0IG9uIEFSTSLmrrXokL3kuK3mnInmj4/ov7DjgIINCisNCivomZrm
i5/mmKDlsITlronoo4UNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorDQor5ZyoUklT
Qy1W5YaF5qC45Lit77yM6Jma5ouf5pig5bCE55qE5a6J6KOF5YiG5Li65Lik5q2l6L+b6KGM77ya
DQorDQorMS4gYGBzZXR1cF92bSgpYGDlnKggYGBlYXJseV9wZ19kaXJgYOS4reWuieijheS4gOS4
quS4tOaXtueahOWGheaguOaYoOWwhO+8jOi/meWFgeiuuOWPkeeOsOezu+e7n+WGheWtmOOAgg0K
K+atpOaXtuWPquacieWGheaguOaWh+acrC/mlbDmja7ooqvmmKDlsITjgILlnKjlu7rnq4vov5nk
uKrmmKDlsITml7bvvIzkuI3og73ov5vooYzliIbphY3vvIjlm6DkuLrns7vnu5/lhoXlrZjov5jm
nKrnn6XvvInvvIzmiYDku6UNCitgYGVhcmx5X3BnX2RpcmBg6aG16KGo5piv6Z2Z5oCB5YiG6YWN
55qE77yI5q+P5Liq57qn5Yir5Y+q5L2/55So5LiA5Liq6KGo77yJ44CCDQorDQorMi4gYGBzZXR1
cF92bV9maW5hbCgpYGDlnKggYGBzd2FwcGVyX3BnX2RpcmBg5Lit5Yib5bu65pyA57uI55qE5YaF
5qC45pig5bCE77yM5bm25Yip55So5Y+R546w55qE57O757uf5YaF5a2YDQor5Yib5bu657q/5oCn
5pig5bCE44CC5Zyo5bu656uL6L+Z5Liq5pig5bCE5pe277yM5YaF5qC45Y+v5Lul5YiG6YWN5YaF
5a2Y77yM5L2G5LiN6IO955u05o6l6K6/6Zeu5a6D77yI5Zug5Li655u05o6l5pig5bCE6L+Y5LiN
5a2Y5Zyo77yJ77yMDQor5omA5Lul5a6D5L2/55SoZml4bWFw5Yy65Z+f55qE5Li05pe25pig5bCE
5p2l6K6/6Zeu5paw5YiG6YWN55qE6aG16KGo57qn5Yir44CCDQorDQor5Li65LqG6K6pIGBgdmly
dF90b19waHlzKClgYOWSjCBgYHBoeXNfdG9fdmlydCgpYGDog73lpJ/mraPnoa7lnLDlsIbnm7Tm
jqXmmKDlsITlnLDlnYDovazmjaLkuLrniannkIblnLDlnYDvvIwNCivlroPku6zpnIDopoHnn6Xp
gZNEUkFN55qE6LW35aeL5L2N572u44CC6L+Z5Y+R55Sf5Zyo5q2l6aqkMeS5i+WQju+8jOWwseWc
qOatpemqpDLlronoo4Xnm7TmjqXmmKDlsITkuYvliY0NCivvvIjlj4Lop4FhcmNoL3Jpc2N2L21t
L2luaXQuY+S4reeahCBgYHNldHVwX2Jvb3RtZW0oKWBg5Ye95pWw77yJ44CC5Zyo5a6J6KOF5pyA
57uI6Jma5ouf5pig5bCE5LmL5YmN5L2/55SoDQor6L+Z5Lqb5a6P5b+F6aG75LuU57uG5qOA5p+l
44CCDQorDQor6YCa6L+HZml4bWFw6L+b6KGM6K6+5aSH5qCR5pig5bCEDQorLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCisNCivnlLHkuo4gYGByZXNlcnZlZF9tZW1gYOaVsOe7hOaYr+eU
qCBgYHNldHVwX3ZtKClgYOW7uueri+eahOiZmuaLn+WcsOWdgOWIneWni+WMlueahO+8jOW5tuS4
lOS4jg0KK2Bgc2V0dXBfdm1fZmluYWwoKWBg5bu656uL55qE5pig5bCE5LiA6LW35L2/55So77yM
UklTQy1W5YaF5qC45L2/55SoZml4bWFw5Yy65Z+f5p2l5pig5bCE6K6+5aSH5qCR44CCDQor6L+Z
56Gu5L+d6K6+5aSH5qCR5Y+v5Lul6YCa6L+H5Lik56eN6Jma5ouf5pig5bCE6K6/6Zeu44CCDQor
DQorUHJlLU1NVeaJp+ihjA0KKy0tLS0tLS0tLS0tLS0tLS0tDQorDQor5Zyo5bu656uL56ys5LiA
5Liq6Jma5ouf5pig5bCE5LmL5YmN77yM6ZyA6KaB6L+Q6KGM5LiA5Lqb5Luj56CB44CC6L+Z5Lqb
5YyF5ous56ys5LiA5Liq6Jma5ouf5pig5bCE55qE5a6J6KOF5pys6Lqr77yM5pep5pyf5pu/5Luj
5pa55qGI55qE5L+u6KGl77yMDQor5Lul5Y+K5YaF5qC45ZG95Luk6KGM55qE5pep5pyf6Kej5p6Q
44CC6L+Z5Lqb5Luj56CB5b+F6aG76Z2e5bi45bCP5b+D5Zyw57yW6K+R77yM5Zug5Li677yaDQor
DQorLSBgYC1mbm8tcGllYGDvvJrov5nlr7nkuo7kvb/nlKhgYC1mUElFYGDnmoTlj6/ph43lrprk
vY3lhoXmoLjmmK/lv4XpnIDnmoTvvIzlkKbliJnvvIzku7vkvZXlr7nlhajlsYDnrKblj7fnmoTo
rr/pl67pg73lsIbpgJrov4cNCitHT1Tov5vooYzvvIzogIxHT1Tlj6rmmK/omZrmi5/lnLDph43m
lrDlrprkvY3jgIINCistIGBgLW1jbW9kZWw9bWVkYW55YGDvvJrku7vkvZXlr7nlhajlsYDnrKbl
j7fnmoTorr/pl67pg73lv4XpobvmmK9QQ+ebuOWvueeahO+8jOS7pemBv+WFjeWcqOiuvue9rk1N
VeS5i+WJjeWPkeeUn+S7u+S9lemHjeWumuS9jeOAgg0KKy0gKuaJgOaciSog55qE5Luq6KGo5YyW
5Yqf6IO95Lmf5b+F6aG76KKr56aB55So77yI5YyF5ousS0FTQU7vvIxmdHJhY2Xlkozlhbbku5bv
vInjgIINCisNCivnlLHkuo7kvb/nlKjmnaXoh6rkuI3lkIznvJbor5HljZXlhYPnmoTnrKblj7fp
nIDopoHnlKjov5nkupvmoIflv5fnvJbor5Hor6XljZXlhYPvvIzmiJHku6zlu7rorq7lsL3lj6/o
g73kuI3opoHkvb/nlKjlpJbpg6jnrKblj7fjgIINCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3YvaW5kZXgucnN0DQppbmRleCAzYjA0MWMxMTYx
NjkuLjk2NTczNDU5MTA1ZSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FyY2gvcmlzY3YvaW5kZXgucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9hcmNoL3Jpc2N2L2luZGV4LnJzdA0KQEAgLTE3LDYgKzE3LDcgQEAgUklTQy1W
IOS9k+ezu+e7k+aehA0KIC4uIHRvY3RyZWU6Og0KICAgICA6bWF4ZGVwdGg6IDENCiANCisgICAg
Ym9vdA0KICAgICBib290LWltYWdlLWhlYWRlcg0KICAgICB2bS1sYXlvdXQNCiAgICAgcGF0Y2gt
YWNjZXB0YW5jZQ0KLS0gDQoyLjM0LjENCgrigJTigJTku6XkuIvkv6Hmga/mnaXoh6pEcmFnb25P
U+ekvuWMuumCruS7tuezu+e7n+KAlOKAlApEcmFnb25PU+ekvuWMuumCruS7tuezu+e7n+aPkOmG
kuaCqO+8mgrmraTpgq7ku7bnlLFEcmFnb25PU+W8gOa6kOekvuWMuuaIkOWRmOWPkemAgee7meaC
qO+8jOS7heS7o+ihqOWFtuS4quS6uueri+WcuuS4juingueCueOAggroi6Xpgq7ku7bkuK3ljIXl
kKvkuI3pgILlrpznmoTlhoXlrrnvvIzov5jor7fmgqjkuI7miJHku6zogZTns7vvvJpjb250YWN0
QERyYWdvbk9TLm9yZwoKRHJhZ29uT1PmmK/kuIDkuKrph4fnlKhHUEx2MuWNj+iuruW8gOaUvua6
kOS7o+eggeeahO+8jOmdouWQkeacjeWKoeWZqOerr+iuvuiuoeeahOexu1VuaXjmk43kvZzns7vn
u5/jgILmiJHku6zlsIbmjIHnu63mjqjov5vlvIDmupDvvIzoh7Tlipvkuo7miJDkuLrlvIDmlL7n
moTjgIHnnJ/mraPni6znq4voh6rkuLvnmoTmk43kvZzns7vnu5/vvIzkuLrlm73lrrbmlbDlrZfl
n7rnoYDorr7mlr3lu7rorr7ms6jlhaXlrozlhajni6znq4voh6rkuLvnmoTlupXlsYLmoLjlv4Pl
iqjlipvvvIzmiZPpgKDlrozlhajni6znq4voh6rkuLvnmoTmlbDlrZfljJbmnKrmnaXvvIEKCkRy
YWdvbk9T5a6Y572R77yaRHJhZ29uT1Mub3JnPGh0dHA6Ly9kcmFnb25vcy5vcmcvPgrku6PnoIHk
u5PlupPvvJpodHRwczovL2dpdGh1Yi5jb20vRHJhZ29uT1MtQ29tbXVuaXR5L0RyYWdvbk9TCuek
vuWMuuWFrOWFsemCrueuse+8mmNvbnRhY3RARHJhZ29uT1Mub3Jn


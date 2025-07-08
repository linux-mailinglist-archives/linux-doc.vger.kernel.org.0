Return-Path: <linux-doc+bounces-52291-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93DAFC0F7
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jul 2025 04:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39CD4A5157
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jul 2025 02:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954E8224AFA;
	Tue,  8 Jul 2025 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="RmXiyTLX"
X-Original-To: linux-doc@vger.kernel.org
Received: from sg-1-11.ptr.blmpb.com (sg-1-11.ptr.blmpb.com [118.26.132.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F322259B
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 02:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942525; cv=none; b=ujnAyIsVa+s+4PgWzSd4wNVBn5WjbagQW8rqjr5DwmPwEcbGgHkcBS3387Es8DwmRqYBm96JCOpkd1SiwPG9dI5L6K9vXCRF20pmDB8n/OMiMfWgu3619m0v9/cApg11YDikg74KepVHW/90ZvMmEbeWYa2JXT/QJZPD5oCeB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942525; c=relaxed/simple;
	bh=lRRdlKx67rQi7sm230d5lyrnJebrM/5JCvZzdUtrtLQ=;
	h=From:Subject:Date:Mime-Version:Message-Id:Content-Type:To:Cc; b=gGoUUHy7Y4SEP+DhGoqC0/vrFz89P6hOZpKB+I5ZmI8NRlT1KxdwdgX1KXH3gJVxIxsQA0nW3MMZJySO28Jeq8o1C4qS7K7OUvNc4d9wvX742uWCIA+8DaopAIkgPcN6AnKgQKH7I+dNVwUWP6wowIAAYavfteEm9Tz99UIDOto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=RmXiyTLX; arc=none smtp.client-ip=118.26.132.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1751942506;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=lRRdlKx67rQi7sm230d5lyrnJebrM/5JCvZzdUtrtLQ=;
 b=RmXiyTLXN2ZslAMXbVSX6mfU7c4qwF7K0cxrDW2hO7hkZIOvBqz1SkXH2Bc/iyBawp4/Vm
 xweJqEZLirbfiEaw9DtENfPNAtE393j9XMH6aFelj078I0Tm2oGKVUN9Zc2HxSPCjpyc05
 2pAicKXFLEfVg2y8G9nfj+rrVhyIE/xd5VIT6c/LjUVY/zVI+UQC25PeIeZvQ6zD4WTjO/
 4XZB8ACkFW0M8bXz5UxqVVf28aPeGBbFsVzAqyg03MiS/uqP5TupodEM5DHc0CjEUlKyqH
 vtgxT5sRMVp0iSoIxR96I7hqyeNVAatjYzpbaAb61/TKKGMhgJ1aRohOBpKAIg==
From: "haodongdong" <doubled@leap-io.com>
Subject: [PATCH 2/7] docs/zh_CN: add scsi.rst translation
Received: from localhost.localdomain ([210.12.5.226]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 10:41:43 +0800
X-Lms-Return-Path: <lba+2686c8568+63ff7e+vger.kernel.org+doubled@leap-io.com>
Date: Tue,  8 Jul 2025 10:41:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1
X-Original-From: haodongdong <doubled@leap-io.com>
Message-Id: <20250708024139.848025-3-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8
To: <alexs@kernel.org>, <si.yanteng@linux.dev>
Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Content-Transfer-Encoding: base64

VHJhbnNsYXRlIC4uLi9zY3NpL3Njc2kucnN0IGludG8gQ2hpbmVzZS4NCkFkZCBzY3NpIGludG8g
Li4uL3Njc2kvaW5kZXgucnN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBoYW9kb25nZG9uZyA8ZG91Ymxl
ZEBsZWFwLWlvLmNvbT4NCi0tLQ0KIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS9pbmRleC5y
c3QgICAgICAgICB8IDk1ICsrKysrKysrKysrKysrKysrKysNCiAuLi4vdHJhbnNsYXRpb25zL3po
X0NOL3Njc2kvc2NzaS5yc3QgICAgICAgICAgfCA0OCArKysrKysrKysrDQogMiBmaWxlcyBjaGFu
Z2VkLCAxNDMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4LnJzdA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL3Njc2kucnN0DQoNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4LnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvaW5kZXgucnN0DQpuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi40ZTk1NzdmMmM5YzYNCi0tLSAvZGV2L251
bGwNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvaW5kZXgucnN0
DQpAQCAtMCwwICsxLDk1IEBADQorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
CisuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCisNCis6T3JpZ2luYWw6IERv
Y3VtZW50YXRpb24vc2NzaS9pbmRleC5yc3QNCisNCis657+76K+ROg0KKw0KKyDpg53moIvmoIsg
RG9uZ2RvbmcgSGFvIDxkb3VibGVkQGxlYXAtaW8uY29tPg0KKw0KKzrmoKHor5E6DQorDQorDQor
DQorPT09PT09PT09PQ0KK1NDU0nlrZDns7vnu58NCis9PT09PT09PT09DQorDQorLi4gdG9jdHJl
ZTo6DQorICAgOm1heGRlcHRoOiAxDQorDQor566A5LuLDQorPT09PQ0KKw0KKy4uIHRvY3RyZWU6
Og0KKyAgIDptYXhkZXB0aDogMQ0KKw0KKyAgIHNjc2kNCisNCitTQ1NJ6amx5Yqo5o6l5Y+jDQor
PT09PT09PT09PT09DQorDQorLi4gdG9jdHJlZTo6DQorICAgOm1heGRlcHRoOiAxDQorDQorVG9k
b2xpc3Q6DQorDQorKiBzY3NpX21pZF9sb3dfYXBpDQorKiBzY3NpX2VoDQorDQorU0NTSempseWK
qOWPguaVsA0KKz09PT09PT09PT09PQ0KKw0KKy4uIHRvY3RyZWU6Og0KKyAgIDptYXhkZXB0aDog
MQ0KKw0KK1RvZG9saXN0Og0KKw0KKyogc2NzaS1wYXJhbWV0ZXJzDQorKiBsaW5rX3Bvd2VyX21h
bmFnZW1lbnRfcG9saWN5DQorDQorU0NTSeS4u+acuumAgumFjeWZqOmpseWKqA0KKz09PT09PT09
PT09PT09PT09PQ0KKw0KKy4uIHRvY3RyZWU6Og0KKyAgIDptYXhkZXB0aDogMQ0KKw0KK1RvZG9s
aXN0Og0KKw0KKyogc2QtcGFyYW1ldGVycw0KKyogNTNjNzAwDQorKiBhYWNyYWlkDQorKiBhZHZh
bnN5cw0KKyogYWhhMTUyeA0KKyogYWljNzl4eA0KKyogYWljN3h4eA0KKyogYXJjbXNyX3NwZWMN
CisqIGJmYQ0KKyogYm54MmZjDQorKiBCdXNMb2dpYw0KKyogY3hnYjNpDQorKiBkYzM5NXgNCisq
IGRwdGkNCisqIEZsYXNoUG9pbnQNCisqIGdfTkNSNTM4MA0KKyogaHBzYQ0KKyogaHB0aW9wDQor
KiBsaWJzYXMNCisqIGxwZmMNCisqIG1lZ2FyYWlkDQorKiBuY3I1M2M4eHgNCisqIE5pbmphU0NT
SQ0KKyogcHBhDQorKiBxbG9naWNmYXMNCisqIHNjc2ktY2hhbmdlcg0KKyogc2NzaV9mY190cmFu
c3BvcnQNCisqIHNjc2ktZ2VuZXJpYw0KKyogc21hcnRwcWkNCisqIHN0DQorKiBzeW01M2M1MDBf
Y3MNCisqIHN5bTUzYzh4eF8yDQorKiB0Y21fcWxhMnh4eA0KKyogdWZzDQorKiB3ZDcxOXgNCisN
CisqIHNjc2lfdHJhbnNwb3J0X3NycC9maWd1cmVzDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS9zY3NpLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3Njc2kvc2NzaS5yc3QNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAw
MDAwMDAwMDAwMDAuLjg3NGFkMzRhZThhYQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS9zY3NpLnJzdA0KQEAgLTAsMCArMSw0OCBAQA0K
Ky4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLi4gaW5jbHVkZTo6IC4uL2Rp
c2NsYWltZXItemhfQ04ucnN0DQorDQorOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3Njc2kvc2Nz
aS5yc3QNCisNCis657+76K+ROg0KKw0KKyDpg53moIvmoIsgRG9uZ2RvbmcgSGFvIDxkb3VibGVk
QGxlYXAtaW8uY29tPg0KKw0KKzrmoKHor5E6DQorDQorDQorDQorPT09PT09PT09PT09PT0NCitT
Q1NJ5a2Q57O757uf5paH5qGjDQorPT09PT09PT09PT09PT0NCisNCitMaW51eOaWh+aho+mhueeb
ru+8iExEUO+8iee7tOaKpOS6huS4gOS7veaPj+i/sExpbnV45YaF5qC477yIbGvvvIkgMi405Lit
U0NTSQ0KK+WtkOezu+e7n+eahOaWh+aho+OAguivt+WPguiAg++8mg0KK2h0dHBzOi8vd3d3LnRs
ZHAub3JnL0hPV1RPL1NDU0ktMi40LUhPV1RPIOOAgkxEUOaPkOS+m+WNlemhteWSjA0KK+Wkmumh
teeahEhUTUzniYjmnKzvvIzku6Xlj4pQb3N0U2NyaXB05LiOUERG5qC85byP55qE5paH5qGj44CC
DQorDQor5ZyoU0NTSeWtkOezu+e7n+S4reS9v+eUqOaooeWdl+eahOazqOaEj+S6i+mhuQ0KKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQorTGludXjlhoXmoLjkuK3nmoRTQ1NJ5pSv
5oyB5Y+v5Lul5qC55o2u57uI56uv55So5oi355qE6ZyA5rGC5Lul5LiN5ZCM55qE5pa55byP5qih
5Z2XDQor5YyW44CC5Li65LqG55CG6Kej5L2g55qE6YCJ5oup77yM5oiR5Lus6aaW5YWI6ZyA6KaB
5a6a5LmJ5LiA5Lqb5pyv6K+t44CCDQorDQorc2NzaS1jb3Jl77yI5Lmf6KKr56ew5Li64oCc5Lit
6Ze05bGC4oCd77yJ5YyF5ZCrU0NTSeaUr+aMgeeahOaguOW/g+OAguayoeacieS7luS9oOWwhg0K
K+aXoOazleS9v+eUqOS7u+S9leWFtuS7llNDU0npqbHliqjnqIvluo/jgIJTQ1NJ5qC45b+D5pSv
5oyB5Y+v5Lul5piv5LiA5Liq5qih5Z2X77yIDQorc2NzaV9tb2Qub++8ie+8jOS5n+WPr+S7pee8
luivkei/m+WGheaguOOAguWmguaenFNDU0nmoLjlv4PmmK/kuIDkuKrmqKHlnZfvvIzpgqPkuYgN
Civku5blv4XpobvmmK/nrKzkuIDkuKrooqvliqDovb3nmoRTQ1NJ5qih5Z2X77yM5aaC5p6c5L2g
5bCG5Y246L296K+l5qih5Z2X77yM6YKj5LmI5LuW5b+FDQor6aG75piv5pyA5ZCO5LiA5Liq6KKr
5Y246L2955qE5qih5Z2X44CC5a6e6ZmF5LiK77yMbW9kcHJvYmXlkoxybW1vZOWRveS7pOWwhueh
ruS/nQ0KK1NDU0nlrZDns7vnu5/kuK3mqKHlnZfliqDovb3kuI7ljbjovb3nmoTmraPnoa7pobrl
uo/jgIINCisNCivkuIDml6ZTQ1NJ5qC45b+D5a2Y5Zyo5LqO5YaF5qC45Lit77yI5peg6K665piv
57yW6K+R6L+b5YaF5qC46L+Y5piv5L2c5Li65qih5Z2X5Yqg6L2977yJ77yMDQor54us56uL55qE
5LiK5bGC6amx5Yqo5ZKM5bqV5bGC6amx5Yqo5Y+v5Lul5oyJ54Wn5Lu75oSP6aG65bqP5Yqg6L29
44CC56OB55uY6amx5Yqo56iL5bqPDQor77yIc2RfbW9kLm/vvInjgIHlhYnnm5jpqbHliqjnqIvl
uo/vvIhzcl9tb2Qub++8ieOAgeejgeW4pumpseWKqOeoi+W6jyBbMV1fDQor77yIc3Qub++8ieS7
peWPilNDU0npgJrnlKjpqbHliqjnqIvluo/vvIhzZy5v77yJ5Luj6KGo5LqG5LiK5bGC6amx5Yqo
77yM55So5LqO5o6n5Yi2DQor55u45bqU55qE5ZCE56eN6K6+5aSH44CC5L6L5aaC77yM5L2g5Y+v
5Lul5Yqg6L2956OB5bim6amx5Yqo56iL5bqP5p2l5L2/55So56OB5bim6amx5Yqo5Zmo77yMDQor
54S25ZCO5Zyo5LiN6ZyA6KaB6K+l6amx5Yqo56iL5bqP5pe25Y246L295LuW77yI5bm26YeK5pS+
55u45YWz5YaF5a2Y77yJ44CCDQorDQor5bqV5bGC6amx5Yqo56iL5bqP55So5LqO5pSv5oyB5oKo
5omA6L+Q6KGM56Gs5Lu25bmz5Y+w5pSv5oyB55qE5LiN5ZCM5Li75py65Y2h44CC6L+Z5Lqb5LiN
5ZCMDQor55qE5Li75py65Y2h6YCa5bi46KKr56ew5Li65Li75py65oC757q/6YCC6YWN5Zmo77yI
SEJBc++8ieOAguS+i+Wmgu+8jGFpYzd4eHgub+mpseWKqA0KK+eoi+W6j+iiq+eUqOS6juaOp+WI
tkFkYXB0ZWPmiYDlsZ7nmoTmiYDmnInmnIDmlrDnmoRTQ1NJ5o6n5Yi25Zmo44CC5Yeg5LmO5omA
5pyJ55qE5bqVDQor5bGC6amx5Yqo6YO95Y+v5Lul6KKr57yW6K+R5Li65qih5Z2X5oiW55u05o6l
57yW6K+R6L+b5YaF5qC444CCDQorDQorLi4gWzFdIOejgeW4pumpseWKqOeoi+W6j+acieS4gOS4
quWPmOenjeeUqOS6juaOp+WItk9uU3RyZWFt56OB5bim6K6+5aSH44CC5YW25qih5Z2XDQorCSAg
IOWQjeensOS4um9zc3QubyDjgIINClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KLS0gDQoy
LjI1LjE=


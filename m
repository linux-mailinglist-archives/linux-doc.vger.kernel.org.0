Return-Path: <linux-doc+bounces-96667-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dw98O7veVWpyugAAu9opvQ
	(envelope-from <linux-doc+bounces-96667-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:01:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E9751B5B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:01:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=openatom-club.20200927.dkim.feishu.cn header.s=s1 header.b=UfNlTnzj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96667-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96667-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEBBA301DD19
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 07:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF10364049;
	Tue, 14 Jul 2026 07:01:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18EB2D7DEA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012470; cv=none; b=RCD36XqQoQ3DxJQVEdVkHVHuE228Q8sMF1gG7DKUYy4R21z1a+aedlFuZ9wkizW7Zpg8UPNv/XkK2Y0XRvHp/ODxKUTwBbcJigV5XwpLCvTLzy61/u6M0PEoYFVyaJvK6k2loOy8G5MBsB29SFSPjp4N08GFhiqrn9AYNe5O2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012470; c=relaxed/simple;
	bh=8bKN2T7o8mjazY65UHoRq6XvxOwc39LTpT/hafPbvo0=;
	h=Cc:Message-Id:References:Content-Type:Date:Mime-Version:
	 In-Reply-To:To:From:Subject; b=CUbpue027GotWmBmbjdsonT8jECNArqHpNQ3tgxrvQe+qfc13b+2XXDf9D16cRU8hPnMbX1aVlfBOgkcNQbg5hs7ZHkxHkj9yvUSJZZy5Kbr6hnpV/NUB/6wnuvp/c2a+7hRrCP5ua4Pu7OEL1p2z7+O5bEqn2gyGbZc5JpRwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=UfNlTnzj; arc=none smtp.client-ip=209.127.231.36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784012455;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8bKN2T7o8mjazY65UHoRq6XvxOwc39LTpT/hafPbvo0=;
 b=UfNlTnzj9UwI7ov+D3xL49xD4VO3c+h+sju4c2UiKHMv6m2oCYVPMbDltJHpjnmRBQAp5u
 yRWPHYDpppZt5hHSzfia2Ywe/7D6wGq9T5iCnUk9GJ5SjUXXogynPwwPmw1/JSHBaleh2r
 VHCAkNqxtshpqwf9sKeAu32Ur2Zc5rz5duoYXpyQue+1viMCQc3nOUPoIOv7fv+XlSi0vu
 E3NIcryb7lhtXhVrkmfX+mQA9TmRjQEYmEKj8is0axHZTvswAXqiVTlUaPbOqajyy1MPpb
 aBcMvOk4IJFCjwqUm3tWtae15a93Aq3EtMT4KpmJiFo4iWu5dUhzTCdhflhH3w==
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Message-Id: <1279f929325818db1dbce83f931dca25f4d51ae7.1784000217.git.ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a55dea5+4e6a40+vger.kernel.org+ben.guo@openatom.club>
References: <cover.1784000217.git.ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 15:00:51 +0800
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 15:00:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1784000217.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <siyanteng@loongson.cn>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v3 4/4] docs/zh_CN: Update rust/testing.rst translation
X-Mailer: git-send-email 2.53.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[openatom-club.20200927.dkim.feishu.cn:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:hust-os-kernel-patches@googlegroups.com,m:alexs@kernel.org,m:siyanteng@loongson.cn,m:dzm91@hust.edu.cn,m:corbet@lwn.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[openatom.club];
	FORGED_SENDER(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[openatom-club.20200927.dkim.feishu.cn:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96667-lists,linux-doc=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openatom-club.20200927.dkim.feishu.cn:dkim,vger.kernel.org:from_smtp,openatom.club:from_mime,openatom.club:email,openatom.club:mid,hust.edu.cn:email,garyguo.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893E9751B5B

VXBkYXRlIERvY3VtZW50YXRpb24vcnVzdC90ZXN0aW5nLnJzdCB0cmFuc2xhdGlvbi4NCg0KVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCAwOTY5OWIyNDE5OWENCigiRG9jdW1l
bnRhdGlvbjogcnVzdDogdGVzdGluZzogYWRkIEtjb25maWcgZ3VpZGFuY2UiKQ0KDQpSZXZpZXdl
ZC1ieTogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+DQpSZXZpZXdlZC1ieTogRG9uZ2xpYW5n
IE11IDxkem05MUBodXN0LmVkdS5jbj4NClNpZ25lZC1vZmYtYnk6IEJlbiBHdW8gPGJlbi5ndW9A
b3BlbmF0b20uY2x1Yj4NCi0tLQ0KIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1
c3QvdGVzdGluZy5yc3QgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L3Rl
c3RpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5n
LnJzdA0KaW5kZXggY2E4MWYxY2VmNmUuLjY3NDdkMDAxMjk5IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdA0KKysrIGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdA0KQEAgLTEyOCwxMCAr
MTI4LDEzIEBAIFJ1c3Qg5rWL6K+V5Lit5bi455So55qE5pat6KiA5a6P5piv5p2l6IeqIFJ1c3Qg
5qCH5YeG5bqT77yIIGBgY29yZWBgIO+8ieS4reeahCBgDQogDQog6L+Z5Lqb5rWL6K+V6YCa6L+H
IGBga3VuaXRfdGVzdHNgYCDov4fnqIvlro/lvJXlhaXvvIzor6Xlro/lsIbmtYvor5XlpZfku7bn
moTlkI3np7DkvZzkuLrlj4LmlbDjgIINCiANCivmr4/kuKrmtYvor5XlpZfku7bpg73lupTor6Xn
lLEgYGBydXN0L2tlcm5lbC9LY29uZmlnLnRlc3RgYCDkuK3nmoQgS2NvbmZpZyDpgInpobnkv53m
iqTjgIINCisNCiDkvovlpoLvvIzlgYforr7mg7PopoHmtYvor5XliY3pnaLmlofmoaPmtYvor5Xn
pLrkvovkuK3nmoTlh73mlbAgYGBmYGDvvIzmiJHku6zlj6/ku6XlnKjlrprkuYnor6Xlh73mlbDn
moTlkIzkuIDmlofku7bkuK3nvJblhpnvvJoNCiANCiAuLiBjb2RlLWJsb2NrOjogcnVzdA0KIA0K
KwkjW2NmZyhDT05GSUdfUlVTVF9NWU1PRF9LVU5JVF9URVNUKV0NCiAJI1trdW5pdF90ZXN0cyhy
dXN0X2tlcm5lbF9teW1vZCldDQogCW1vZCB0ZXN0cyB7DQogCSAgICB1c2Ugc3VwZXI6Oio7DQpA
QCAtMTU4LDYgKzE2MSw3IEBAIFJ1c3Qg5rWL6K+V5Lit5bi455So55qE5pat6KiA5a6P5piv5p2l
6IeqIFJ1c3Qg5qCH5YeG5bqT77yIIGBgY29yZWBgIO+8ieS4reeahCBgDQogDQogLi4gY29kZS1i
bG9jazo6IHJ1c3QNCiANCisJI1tjZmcoQ09ORklHX1JVU1RfTVlNT0RfS1VOSVRfVEVTVCldDQog
CSNba3VuaXRfdGVzdHMocnVzdF9rZXJuZWxfbXltb2QpXQ0KIAltb2QgdGVzdHMgew0KIAkgICAg
dXNlIHN1cGVyOjoqOw0KLS0gDQoyLjUzLjA=


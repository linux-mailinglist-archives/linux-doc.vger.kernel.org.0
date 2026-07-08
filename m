Return-Path: <linux-doc+bounces-95588-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 12AKAMffTWq8/QEAu9opvQ
	(envelope-from <linux-doc+bounces-95588-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:27:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F98721C8E
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=openatom-club.20200927.dkim.feishu.cn header.s=s1 header.b=sPyNXgNC;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95588-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95588-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7838430480F9
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 05:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4828C3B9949;
	Wed,  8 Jul 2026 05:25:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02973B8945
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488349; cv=none; b=fEXQ4T/bE50qYLfjL84J1GczjSJ0AnLmmnzpy+vBNiPfETCgzI49NkP6XfCXTYb5P2CGHREQ7ycqjr58dEDjOHYHg90t4VGs+Dq58x5VuxloQdgC2PlASXFBciw3fGjyCKKdQ1LcWNqJRZR66UH2U5o8fE/7Vl6U4bATey2Wm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488349; c=relaxed/simple;
	bh=97tnSu7WC0SRpla6ZdDqvxsFbW45pD1fTt+rTP/HBvc=;
	h=From:In-Reply-To:Cc:Date:Message-Id:Subject:Content-Type:To:
	 Mime-Version:References; b=dKhOfP2TpbcGmauE5leNFY2i2YEeprnHrNh60zplZZwejJUZRFhhtCJYZoZzdHh4yuKNMI8VhEI/Q1cAD6g12rei7fpbJIppQsV7CrVwn7wd5+HNXrd1rS6zVEIC1Gf9bOTqDMujG84BJZtKRWG1QRI3soo9Jx/z7XNwGfBHm0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=sPyNXgNC; arc=none smtp.client-ip=209.127.231.39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783488339;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=97tnSu7WC0SRpla6ZdDqvxsFbW45pD1fTt+rTP/HBvc=;
 b=sPyNXgNC1fjA7YHL4tg5LlmafarvbQ8APx2cPOOuYCmjJ5isx+PvfrDtHKvIb95Xe/8xeF
 G99tbu5P+iXSbcSlxFQqYh32mdPVJ9F3sypN8aFSfMEzs37+vJSH/U+PHA7w9XmuhvfTe7
 12fHZHqH9DuVSriEQQJLXiAHvr7npFlTbwBahebKKwvQBVqQFgNjA3OXToMRZEmrJqvFC6
 FtW3Dnh+27/8vUFA5LyJow7KOVPCBvsQWDX2m2qkQPess04n/9F5WOmzsWK5bYQN7scwN+
 BcvYS45Jbg0f0zEhyH2FPlnGHA/4M1cl2VgcEzzoeFpnOxg1bvtW10hPxcNRJw==
From: "Ben Guo" <ben.guo@openatom.club>
In-Reply-To: <cover.1783480076.git.ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Jul 2026 13:25:36 +0800
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Wed,  8 Jul 2026 13:25:27 +0800
Message-Id: <9984d07828b6eb2dc4a767cc87e02d76c739e1bb.1783480076.git.ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
Subject: [PATCH 4/4] docs/zh_CN: Update rust/testing.rst translation
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a4ddf51+27e9c5+vger.kernel.org+ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783480076.git.ben.guo@openatom.club>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[openatom-club.20200927.dkim.feishu.cn:s=s1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:hust-os-kernel-patches@googlegroups.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:corbet@lwn.net,s:lists@lfdr.de];
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
	TAGGED_FROM(0.00)[bounces-95588-lists,linux-doc=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openatom-club.20200927.dkim.feishu.cn:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,openatom.club:from_mime,openatom.club:email,openatom.club:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F98721C8E

VXBkYXRlIERvY3VtZW50YXRpb24vcnVzdC90ZXN0aW5nLnJzdCB0cmFuc2xhdGlvbi4NCg0KVXBk
YXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCAwOTY5OWIyNDE5OWENCigiRG9jdW1l
bnRhdGlvbjogcnVzdDogdGVzdGluZzogYWRkIEtjb25maWcgZ3VpZGFuY2UiKQ0KDQpTaWduZWQt
b2ZmLWJ5OiBCZW4gR3VvIDxiZW4uZ3VvQG9wZW5hdG9tLmNsdWI+DQotLS0NCiBEb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ydXN0L3Rlc3RpbmcucnN0IHwgNCArKysrDQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vcnVzdC90ZXN0aW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3J1c3QvdGVzdGluZy5yc3QNCmluZGV4IGNhODFmMWNlZjZlLi42NzQ3ZDAw
MTI5OSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3Qv
dGVzdGluZy5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3Qv
dGVzdGluZy5yc3QNCkBAIC0xMjgsMTAgKzEyOCwxMyBAQCBSdXN0IOa1i+ivleS4reW4uOeUqOea
hOaWreiogOWuj+aYr+adpeiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDvvInkuK3nmoQg
YA0KIA0KIOi/meS6m+a1i+ivlemAmui/hyBgYGt1bml0X3Rlc3RzYGAg6L+H56iL5a6P5byV5YWl
77yM6K+l5a6P5bCG5rWL6K+V5aWX5Lu255qE5ZCN56ew5L2c5Li65Y+C5pWw44CCDQogDQor5q+P
5Liq5rWL6K+V5aWX5Lu26YO95bqU6K+l55SxIGBgcnVzdC9rZXJuZWwvS2NvbmZpZy50ZXN0YGAg
5Lit55qEIEtjb25maWcg6YCJ6aG55L+d5oqk44CCDQorDQog5L6L5aaC77yM5YGH6K6+5oOz6KaB
5rWL6K+V5YmN6Z2i5paH5qGj5rWL6K+V56S65L6L5Lit55qE5Ye95pWwIGBgZmBg77yM5oiR5Lus
5Y+v5Lul5Zyo5a6a5LmJ6K+l5Ye95pWw55qE5ZCM5LiA5paH5Lu25Lit57yW5YaZ77yaDQogDQog
Li4gY29kZS1ibG9jazo6IHJ1c3QNCiANCisJI1tjZmcoQ09ORklHX1JVU1RfTVlNT0RfS1VOSVRf
VEVTVCldDQogCSNba3VuaXRfdGVzdHMocnVzdF9rZXJuZWxfbXltb2QpXQ0KIAltb2QgdGVzdHMg
ew0KIAkgICAgdXNlIHN1cGVyOjoqOw0KQEAgLTE1OCw2ICsxNjEsNyBAQCBSdXN0IOa1i+ivleS4
reW4uOeUqOeahOaWreiogOWuj+aYr+adpeiHqiBSdXN0IOagh+WHhuW6k++8iCBgYGNvcmVgYCDv
vInkuK3nmoQgYA0KIA0KIC4uIGNvZGUtYmxvY2s6OiBydXN0DQogDQorCSNbY2ZnKENPTkZJR19S
VVNUX01ZTU9EX0tVTklUX1RFU1QpXQ0KIAkjW2t1bml0X3Rlc3RzKHJ1c3Rfa2VybmVsX215bW9k
KV0NCiAJbW9kIHRlc3RzIHsNCiAJICAgIHVzZSBzdXBlcjo6KjsNCi0tIA0KMi41My4w


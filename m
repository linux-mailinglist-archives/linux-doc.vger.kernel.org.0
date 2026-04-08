Return-Path: <linux-doc+bounces-82777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF6IAIrj1Wm2+wcAu9opvQ
	(envelope-from <linux-doc+bounces-82777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 07:11:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E93B7156
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 07:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E381C3034557
	for <lists+linux-doc@lfdr.de>; Wed,  8 Apr 2026 05:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C1370830;
	Wed,  8 Apr 2026 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="t0c4f9Aa"
X-Original-To: linux-doc@vger.kernel.org
Received: from sg-3-26.ptr.tlmpb.com (sg-3-26.ptr.tlmpb.com [101.45.255.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55733339708
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624804; cv=none; b=l2Epz6gzqu8MjMokF7gvkAK7iHHmEawcc2C7RRyxQ2r4IOZpON+oiucXc9u2B3hr8vLUrIuo/8Kga81ksL1MKUuusuRiP2Kd09av3v5hWW33VEhpHu1SG+7lgdgPpmetAvUHt0cHaB4jsm48ha6o0SYBfBUqdFYm+SSu2cOfAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624804; c=relaxed/simple;
	bh=Enb3uvrvthI9bTVEYcux8gwe1zXQ4EUOi08+5cdQcVY=;
	h=Date:Subject:To:Cc:Message-Id:Mime-Version:From:Content-Type; b=qotjigGOQXV3zhA/01HJ2WIKaX849NJF/xhx/2rKH936jFzCxcuk4y585Ww2xbs2cJnKFzmZUoadynk0YoV7p8UHq8VkCquEfuejMJqx9PUE4PI/G06sqzI6RoBTinjANHan42WCyOUdi8/4m6z4fCGa1KuSoySs6+SWXAuW/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=t0c4f9Aa; arc=none smtp.client-ip=101.45.255.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775624752;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=dD4SF0rLvh3W6/fPySnpXg0/GdT0aVXS9tJATrGGpis=;
 b=t0c4f9AaloB8oLazI5xFtxcfHiX5oVNvB8VcqpBCGfx4eNi02rpEhrEMU88s165bpTj5Jy
 jfQi59p3z2TVTSRf+VbJ9W/ilYact7d9ywrVEJX25yRYoRN+IAdPnomX4t1gfWy5wAtikG
 Gh3dzTQmj73TA92sy4C7Ex8kZimfk5aNGLdlK/aKy1GCWtqOPbUH5mg92UhJbkSMKkoINe
 ATnMEIA+zYGot893fjQkbzuzwNmrMDTVZmwA9c66o2qTLreseiKg+aCZGp39UNFPNSerBv
 0jnz+aZiwBponYQwICcVAjLqNdtZVtzd2dcied0r4o4NzRtSy7YUr8+RYPNmaw==
Date: Wed,  8 Apr 2026 13:05:42 +0800
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269d5e22e+f97568+vger.kernel.org+ben.guo@openatom.club>
Subject: [PATCH 0/4] docs/zh_CN: update rust/ subsystem translations
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Apr 2026 13:05:49 +0800
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, "Ben Guo" <ben.guo@openatom.club>
Message-Id: <cover.1775619061.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: "Ben Guo" <ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[openatom-club.20200927.dkim.feishu.cn:s=s1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[openatom.club];
	TAGGED_FROM(0.00)[bounces-82777-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[openatom-club.20200927.dkim.feishu.cn:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openatom-club.20200927.dkim.feishu.cn:dkim,openatom.club:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D0E93B7156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
- coding-guidelines.rst: add imports formatting, private item docs,
  C FFI types, and Lints sections
- quick-start.rst: add distro-specific install instructions, update
  rustc/bindgen sections, remove cargo section
- index.rst: remove experimental notice and genindex

Ben Guo (4):
  docs/zh_CN: update rust/arch-support.rst translation
  docs/zh_CN: update rust/coding-guidelines.rst translation
  docs/zh_CN: update rust/quick-start.rst translation
  docs/zh_CN: update rust/index.rst translation

 .../translations/zh_CN/rust/arch-support.rst  |   9 +-
 .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
 .../translations/zh_CN/rust/index.rst         |  17 --
 .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
 4 files changed, 401 insertions(+), 77 deletions(-)

-- 
2.53.0


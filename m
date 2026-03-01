Return-Path: <linux-doc+bounces-77491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMGQHRaypGmIpQUAu9opvQ
	(envelope-from <linux-doc+bounces-77491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 22:39:34 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD31D1B04
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 22:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AE9E300A5A1
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 21:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76797311975;
	Sun,  1 Mar 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UR98z6G9"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070D32BF41;
	Sun,  1 Mar 2026 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401093; cv=pass; b=VKM9gWmLYPfeo0nmjpDC0MJEs2MR62OYVcgVHfATotSI+R1jpF8VcQ5MAk3KBfem252EJ+D++B+fnauklF+2sXr28wpGSe6zlXAhsaUoCLFI3R8UDa0fzAQqR96ga1OjM5UZtOrN+lYtdYqGkRtxaNRGFtE1yXeNgMRfR16tezU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401093; c=relaxed/simple;
	bh=93BcJKEa7weHV5+oiJ7vYIUaejRc41m2DGRjhII4XD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha3pQ2XfyWOm+r4z2VaYK5GvAQmRDEKqci0NhpRkSy50oOCb5RKJT6A//KFvqUt2d42mCu2T/Woe5pR58dyzAVhzjXwp2Ppbj7PjHNBHQbWGgzjl9SmCQSYQ2+4TVDIOPlvqxsFpJ94gl+/H5Q6hb9DFZD3q6aC2345g5dbrQI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UR98z6G9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772401074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G8v2O34kyUMuQMxqpFaVvvlSmILuUQIWCO/beVfD6xk9KL76sQJ4UW5R2lYmmkMBS/rZbpFAaI6Kpifort6xONl1msliZz7V0leIRDCPc3bdkmptp+JRiDUnT5FPWNkuBazVF6qfHQnUwwroHLVGTROx1hzhcLuKZ2XdbpmD4Sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401074; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3NnbcanYvL9rtxNc6BLLdiHQwPg1qzD0xRJGy28M5hI=; 
	b=RkXIuWbBPWIxVTm/OQusyhXb7PZbkVpSi6xxxhwYbSknXB74pzMaRj0tkpQyj/WQJkYr0++IfQPmItoNH76KPFTpOfLd7QSY06mG64LaFcyv2wONUds16n00LzHQLqfZhRRRlJU0O4OKxZiURiNw8EPmVQj3g03G64QAl3bM1AE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401074;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3NnbcanYvL9rtxNc6BLLdiHQwPg1qzD0xRJGy28M5hI=;
	b=UR98z6G9qvPutD2OIMDxDAKkH12+N6XvVVflM/8MPVmm2UKYgPuaKRBcIHtNUqPi
	wNryYIQVNzav+sYnzFpazse8pfYHIK/KL/UhjNbIN5PTSaL7o2vF9T/3aJFz2gwex7f
	IN7G4O/hiE5XEEWok0adMcbMCPIR4n5Q6BMrodu+JZVHN3oE/yLvaMukkh6LsxW79JW
	t3i2EGAr4VtdavZcPEBjCAbTwONbDx4sNc3e6jrN6QI6/Snsl65lLA8S+R+omu2bf46
	0/hiTBgnTJOvishz6rozsKMWMMy0QIVPW5tl0dm2F1ZyYQ5U8wtDwKcehsioFWjT+lv
	WpPJ01ABkw==
Received: by mx.zohomail.com with SMTPS id 1772401073863668.3313527377625;
	Sun, 1 Mar 2026 13:37:53 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 6/9] ALSA: doc: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP of snd-usb-audio
Date: Mon,  2 Mar 2026 05:37:22 +0800
Message-ID: <20260301213726.428505-7-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77491-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[rong.moe:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:email]
X-Rspamd-Queue-Id: 79DD31D1B04
X-Rspamd-Action: no action

QUIRK_FLAG_SKIP_IFACE_SETUP was introduced in commit 38c322068a26
("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP") without appropriate
documentation, so add it.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 0a4eaa7d66ddd..55b845d382368 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2372,6 +2372,10 @@ quirk_flags
           audible volume
         * bit 25: ``mixer_capture_min_mute``
           Similar to bit 24 but for capture streams
+        * bit 26: ``skip_iface_setup``
+          Skip the probe-time interface setup (usb_set_interface,
+          init_pitch, init_sample_rate); redundant with
+          snd_usb_endpoint_prepare() at stream-open time
 
 This module supports multiple devices, autoprobe and hotplugging.
 
-- 
2.51.0



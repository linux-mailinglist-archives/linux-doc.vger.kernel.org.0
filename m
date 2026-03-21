Return-Path: <linux-doc+bounces-80488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GcfJOavvmnEWwMAu9opvQ
	(envelope-from <linux-doc+bounces-80488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 15:49:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75B2E5E49
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 15:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB947301944A
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568E2C029C;
	Sat, 21 Mar 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="d03qkKbg"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B9277C81;
	Sat, 21 Mar 2026 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104546; cv=pass; b=ZO35CSJVwvZgBblIQLczxHscpsS26+2ILyTjOJiMGL3TL47kSrUihAD8o8yKnT2/PAEmqHmatECBHEzcbYLQV9I0RN0m5w1Ge9tIbcLW8FV+i+nL37lC62/xOogNqLK3XR03qFWHWjCd1AT1LfxwyES2dLZlrpZfd2B4DGnO9V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104546; c=relaxed/simple;
	bh=8CmstHOqCikIVfv2H635OhQsIP78qkiSVriNtxRr5Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gl4+wx9UTllpjpM/LJaBHmLHewfg74sHcr/aIsS8Ylg4MTaIrcS8uzQKhFwG3b31T2EcilPiA2wDbFCEfac7FR6+sMcB7okETuD9ucslvwFy/QX3G/tZULwa2QpVCx/r8/KbHFCNP+yqYwMTvjETT62FmHJ1RPoJmxVjf53s09E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=d03qkKbg; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774104540; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OyR1kyEeVsoHY2NZBI4CckzEn+IDbEsqJMNUAG8ZMFo4hdkilBHrCss7EuyFWxChiwoMrusuUGiYM2LQgmxwRv+ChEz2CSDOTNSYirIpL9wc6UZZ8RBrWlZAtnzVMM4VrbkSw3ybVfu28MV9KlKVSTz+afA8Y54P8SXqLSrMuzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774104540; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q4m97QkYl0JsXXOi/F0yG+0PO7L7lMioqjt+PREPlXk=; 
	b=iNE2yv/z7gXOyTggC0D4LZ4CFDPJUmSE003J2k+h/18WroRa91WF/3QhoauTc8fjptbgBWa/AP2Fog/Z/vt2nkRlmPk41sIp2gyn/BKFCJA3TX9Ne9SSbhXnI2QtrgC9qci449+1b5TD1k1MI6OgLFefd3SXlTZRJZLfUwl5Hto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774104540;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Q4m97QkYl0JsXXOi/F0yG+0PO7L7lMioqjt+PREPlXk=;
	b=d03qkKbgPIbdZBCli5vX99uZZJE9dAvVzxWFk1+t8WWfq6sP3iLc69Fwh3XcIUPC
	AJLVhcvVmlf54MqYRdOqIxguBmgkJij6kHqfZf1/IEs+onhxs7aeUQV4hcI/yNzrtAG
	fG29egky1S49uYGnBCfnYGMKONKITYWugGJuLDLw=
Received: by mx.zohomail.com with SMTPS id 1774104538991459.5298151543834;
	Sat, 21 Mar 2026 07:48:58 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/1] docs: examples of pages affected by heading overflow
Date: Sat, 21 Mar 2026 10:48:54 -0400
Message-ID: <20260321144855.30429-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80488-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ritovision.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E75B2E5E49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Examples of affected pages on docs.kernel.org this patch improves:
  userspace-api/gpio/gpio-handle-set-line-values-ioctl.html
  userspace-api/gpio/gpio-v2-get-lineinfo-watch-ioctl.html
  userspace-api/gpio/gpio-handle-get-line-values-ioctl.html
  userspace-api/gpio/gpio-get-lineinfo-unwatch-ioctl.html
  userspace-api/gpio/gpio-v2-lineinfo-changed-read.html
  userspace-api/gpio/gpio-get-lineinfo-watch-ioctl.html
  userspace-api/gpio/gpio-v2-line-set-config-ioctl.html
  userspace-api/gpio/gpio-v2-line-get-values-ioctl.html
  userspace-api/sysfs-platform_profile.html

Rito Rhymes (1):
  docs: allow long unbroken headings to wrap and prevent overflow

 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.51.0


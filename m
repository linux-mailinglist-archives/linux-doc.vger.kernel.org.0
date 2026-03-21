Return-Path: <linux-doc+bounces-80489-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNS/OfevvmnEWwMAu9opvQ
	(envelope-from <linux-doc+bounces-80489-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 15:49:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D32E5E5A
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 15:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49B0F3029613
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823E9391847;
	Sat, 21 Mar 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="gtdHTwt2"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F432391820;
	Sat, 21 Mar 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104549; cv=pass; b=MWxsaPNKg/J3qYqdjF/QBbkX8FYXFl5UpGv3trUo6IuKyE/MejeTBym/Gc7OuvDq8Jen+ZsD6/OEPVbS4jfAwnJ8vPinAkoK2eO7AnMmODFtMYg2s97CE0SCq6RGrcEtzm3roUwgNzthpBj6wMRnhqUujwY2AXgJ0d2FHYFB5wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104549; c=relaxed/simple;
	bh=aItZU+IvDgcn2ppDEzpMiy3YejpbbsfYwa5WJez32AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpdJcxilj50novWV2yI3vqW8MNlGl72stQbVxES2uGlEEownHj7tPmvOzTeZo5JDw4GWfjz+LhhNDqt0FdWmhYCiQII2xj1J+3bPAwmxvwzuPStpE2NeBRLpyKKmJfyQLrFQCikom1jegVlSdpcvRZabKCCY7yS3bLiJyl1H8NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=gtdHTwt2; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774104542; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L67O9yMqzas7ARnoJeCvSiFBN0msa0Vq5vOacPsnbLRofYO26mr4uYbSllqtI5dIHpe0KOcXhaoocQcVu3GnL4ecG0dZ+mXeHmsnLYa4gCGC2RdTZ+9+mfJho9NvWihTNPZqZG+G0l4zhCsYOqch2Xj+SZI46MZJepSaSHg13Xo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774104542; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sd/mqd92O4Q/Srd9ZhYTTteiJPO3GaXQhN5YFKLMGfg=; 
	b=BSXXMWFY8TgUeoCBmJ6GDv0PPAxmekGVvqIh0UeJtjgmB/EA+VugDOEGHRRRq2MnHl86n/rQ+JXbSHVG8WKSjJ5/audZo9uTXtujq4rcGnlDTQ93tPLFbfsKimLN4/wY8FUsIlh2IVCf7BIAF2T09JXR86dW9sq2XGWuFTvyMVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774104542;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sd/mqd92O4Q/Srd9ZhYTTteiJPO3GaXQhN5YFKLMGfg=;
	b=gtdHTwt2uc35u/TIy0Uhdgg7yg/LghKMHBWd0wMcjqmVKgb19t97sb6VAH/4JjkL
	PzgeczK6unB29JfpHQIuLaLJy6gk5b5GATby5QEAc65q3MO8p0tsndKXKDrVNipSMNN
	4tL2wLg2adAU4asDfI0/Cq410xf3u4TP58uEj+6o=
Received: by mx.zohomail.com with SMTPS id 1774104541130642.0490147126196;
	Sat, 21 Mar 2026 07:49:01 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/1] docs: allow long unbroken headings to wrap and prevent overflow
Date: Sat, 21 Mar 2026 10:48:55 -0400
Message-ID: <20260321144855.30429-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321144855.30429-1-rito@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
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
	TAGGED_FROM(0.00)[bounces-80489-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ritovision.com:dkim,ritovision.com:email,ritovision.com:mid]
X-Rspamd-Queue-Id: 860D32E5E5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some documentation pages contain long headings with unbroken strings
that can exceed the content width and cause page-wide horizontal
overflow.

Allow headings to wrap when needed so they stay within the content
column and do not break page layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..14711c7be 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -8,6 +8,13 @@ div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }
 div.body h3 { font-size: 130%; }
 div.body h4 { font-size: 110%; }
+/*
+ * Let long headings wrap before they overflow page layout.
+ */
+div.body h1, div.body h2, div.body h3, div.body h4,
+div.body h5, div.body h6 {
+    overflow-wrap: anywhere;
+}
 
 /* toctree captions are styled like h2 */
 div.toctree-wrapper p.caption[role=heading] { font-size: 150%; }
-- 
2.51.0



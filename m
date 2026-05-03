Return-Path: <linux-doc+bounces-85523-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJtxO5ud9mnBWwIAu9opvQ
	(envelope-from <linux-doc+bounces-85523-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 02:58:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5614B3EA6
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 02:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 041D3300C271
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 00:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B6F1F3BAC;
	Sun,  3 May 2026 00:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="DRPazX8U"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5893204C36
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 00:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769861; cv=none; b=W9g3zBbWeNnvnSf0KhpbZKsnm7l1WPuwRwu6GwbpjKoykYMO6sDkD/cMyhy5G7Xw+lLlv6SmvFL+uRMTAlzQsf/E3UYXyruDlbfTkwFtiT64b+IKx2f8pN97qqOtyAnOM6qwfIaL2YkOlS/Aj/ZFPmeWFLv+HQjAVsyUH/59SeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769861; c=relaxed/simple;
	bh=3i2DlzViyk0p16fbzABndRUIz9Briv7bcSW8RF9iqt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5O6vF2vl2TE6NPlVaVz5jhqiH1YXTV50LtMZmfOBzz3+oI2s8RkJA/i8HE4uhN298QS62XDWxisbyU5ehfXdZ1/JHeRrrsKJnB3q+5H/k7085gTNBRHjGC8PE8l2Llt9+mTpXbZ25qLj6HOs3SOTZLiU1zhkJaSIm1kYG+/l1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=DRPazX8U; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6120528b8b4so1016268137.0
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777769859; x=1778374659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hl0NK+MUV3aWIGSEg80ZpP+e1ygTELg5+PZ5Oxbl4PE=;
        b=DRPazX8UxhpV4jKhvcYQaJlerY49NGoZ9fP60VlRPtvoPnbOelMB22NAXajvya4F+0
         gH67i9wQDHQZnyeqcq9pxmkmUYlOy0iNvlyXOMGYN1QcEE60gX+IvjeCyDq6Ijs+3qbz
         LmTljaofebSoZkKcVaOZg+VnTELkXQVS6QAdHHpKH1cF5FfZlptq6g1bvFH+6b24clEW
         X9NQNmOxcnXB+NkGox4oXUCK2YzD2d/yN8cW+XO21C3rkOItG0uyRpGqHxDN7t6coXWM
         ksm71M8xJot18eVTQJQ86M0ZUl8AIWdnalrwrjGLCidT0PPDx01FXZ8wUjHwbuzFxtYO
         fryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777769859; x=1778374659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl0NK+MUV3aWIGSEg80ZpP+e1ygTELg5+PZ5Oxbl4PE=;
        b=q1X0QUw0rwv+HGwhwqePj+pcWElH20GgWlCNtYQ+AeTyN2qb3cDn59OlD4lwTSFS7e
         PE2PEQ3hPOOK5lgChnZ+gxgBAcDBL6uVNam4LeSQdKaSU6pWXkndx8F5retlhHDnyIrq
         Hw4lAyobLVFe2ZVHGIWgkdb9bBV9FR3nF4iCfdqxUMnGcy+08Ol7K4eOqCfV3Ohif9IT
         Wr1o3KYhv6nsftkicjcE+dwNMmfcWGBnoJOcEX/ocyDAptEx8Nno5NNU48YP1mcpJocz
         g4V+C5gB3e2kY5GnOR/0CDCnS/2/XBLf7NgZXpeOp1k9Tuzv74VwbBEofqNwEzaB7m45
         HgLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4ZLUhcGaertQaAoxbPEivhnWkxeFtsQYB3SjOKZ5YS+sDDUKiuOgGL5QKdX3J7fg/a/mNXRX6DTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5LJZzqWfOyHvogoFWL/QZkToGE/qiOO+k1E54l03UTK9WtTb/
	oikuSTv6NWYYuw5gdyvLCR1U/fEIqkxGtGStvHS5cPBs1da3DIpKgj8jxtcm3JYCvoQ=
X-Gm-Gg: AeBDieuSJf0ycLJv7n2STGlr+Cd0JdoRsgCuP23gypZa53PGoAySZTLT/Kbrs2NIBob
	2/7pNd3VNPZ2QhjzWw2LqDEI4ACd5MegLQ0W45Nj92hxCHs+MVTu+cX22c/zsOkEPH/WbZ80Poz
	uswdWj3XQirb0Ahc7zLhlcNtrqq45s/uxs/jbH+7nHNLMLG108Xsnu6XDr2jmahD07SXH7XnGTA
	RfV+Tgz06DZwfx8nKB7lsaASr3kopNaKhX2lDr1GkV8YabsV10gBfNBORHW8ANEKbG3LwiRA6ma
	sXUzgm1arkI/2LLZTly6EIspW0EEIOcQ6OW3lhHJ73n+2uqrwFCojoSrvVRFSPC4CndN4CjP63R
	SMt1HG5lYUKfW/Tlz4s1FAoq3eb8vOeKnhMlfJYHFcGHXI0eixE/svLxIC9aWYK+3CEc73xFCmN
	acRFCCC/Rb8y25Fcu5Rm4nsbMUORK/0+JI/mdxcuutb4w6PHjgooyJJCV4GXpBF/BeVS1jJk6Jx
	5e+71gsWr1gPFuuGxhs7NZpSu5p8AR/eGxuMg==
X-Received: by 2002:a05:6122:829f:b0:56a:fc35:9664 with SMTP id 71dfb90a1353d-5750c4acd6cmr1861099e0c.3.1777769858811;
        Sat, 02 May 2026 17:57:38 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6c6c582sm4009834e0c.9.2026.05.02.17.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:57:38 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH v2] Documentation: gpu: todo: fix typo 'themsevles' -> 'themselves'
Date: Sat,  2 May 2026 19:57:33 -0500
Message-ID: <20260503005733.68932-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9C5614B3EA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[maestretorreblanca.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85523-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[maestretorreblanca.com: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[maestretorreblanca.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[francisco@maestretorreblanca.com,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[maestretorreblanca.com:email,maestretorreblanca.com:dkim,maestretorreblanca.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Fix a spelling mistake in the panel-simple/panel-edp TODO section.

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
v2: Resend as individual patch, not part of an unrelated series.
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..e371134782f8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -456,7 +456,7 @@ be turned into a WARN_ON() or somehow made louder.
 At the moment, we expect that we may still encounter the warnings in the
 drm_panel core when using panel-simple and panel-edp. Since those panel
 drivers are used with a lot of different DRM modeset drivers they still
-make an extra effort to disable/unprepare the panel themsevles at shutdown
+make an extra effort to disable/unprepare the panel themselves at shutdown
 time. Specifically we could still encounter those warnings if the panel
 driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
 driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
-- 
2.50.1 (Apple Git-155)



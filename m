Return-Path: <linux-doc+bounces-83818-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JM8JZIM5WnRdwEAu9opvQ
	(envelope-from <linux-doc+bounces-83818-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 19:10:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F49424D49
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 19:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52415300E709
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 17:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA60283C83;
	Sun, 19 Apr 2026 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvnHDdfA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014791A9F9B
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776618633; cv=none; b=g6kEUnRQ6QYsnN26KaV0taCiUIEv6sgpqdVK3ukMxcHd+fOgOCFKtajbhdXdIlgKlJuDcU6EI4h1KMh54Jgz4/WLup0vDHiBzgrvE+ZmRjlpIFZkgXaU/OYpXogWOGasrHjNLxQTwXEkzQvJGS+YtGog7KDATMtN5DqguSR+EBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776618633; c=relaxed/simple;
	bh=g048MkCvqSOBynlchfJh57UY0Z1vzIEQS6EpQbM4rkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZXNq8yfyMNvE4blsyuIDQYZhFZHL0G/odAn6GLwyLVdYW8PJ3okyFlgeTp5Rofcxxv3V2c5+Cihlg6yerAuy4kPtq0q5c46aNhnvYJ0Km3FOdODYnA5x3x9OV2Ew6Rro3NVEc+QHNnkA+OAiE1efhmsSKAWnf4ILyxa7uUR76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvnHDdfA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3614826eca4so1632952a91.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776618631; x=1777223431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=JvnHDdfAwvt/p9TyZSefPy6/l/JzAoDj1+mwjgfHyeTGj9KzvkNJCHF9198zT2jPlY
         GIyHlXUK7WYSB7zT7OBurzRO1/JhF5IoiMEQRwJ4hQG3k9tK4/4igwg0Jah6Vd3ocMaq
         9rWcUrhwt0VXz76wqm/kKcNOVrmxoU7h3T1RuwxyJiwXnkrQA9AKQHRJuLPP9ODfs2db
         FaYTymonVMgfZkjq8pPwrb2TIzPYI0q45ewfNOFpT0dGw3BLJN87vesbNN6VE+iJh3X7
         cA8rfT2UFiMEVJ5DPtoqYA+RnZ8zDLPmwmYoCjYsY1mTC2fGpPrpDs0aiZHDIVR0Mt1x
         Jy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776618631; x=1777223431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=AQIKHoxPT5BBKlooj97o4KKaPaH87ovNZAE7F0DUGvLmKOZiOZBHht7ayIaE1POx1e
         lIfjQKGJ3L6GPhCUINhf27uKv7vhHYPwGgGGATrcKDbCM93Gl2EWH0XeWT1YJUOmU412
         eorG5VbZ9gw55nb+PtKQ3ZXGDfCGsM73V2WONTg2SvR/tsSDf6Xz1AlubZi67WIiP5dV
         Kml5gdvA9UW5570S4teJ/wkHIUyGQWkM37cUXRBz93ldbNg2pkkFfF+ww4m7cnZXQNtp
         UBTLWplZpZsP0MtyphgVg+TZ7y6SI/bxdCtUozgYhrJWweR0xCaZpNbAzVNZYk8JWn2/
         SJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+z4YVNU3I4fUMp02rWAhUVvFMwja08D80Hn24coYdFHpPirK/45dZMsb3bSJI99UwzirX7yGY3n40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyvdhx/lCCknu5UJl8Sx92LlZg8TAx+nG0B/FJ8vTrOZDmBY15
	R+uTl+jwyrcA344i9NCQdXpTztioFv/+k9+oMiar81KhQBuXxVBGGI0G
X-Gm-Gg: AeBDieuQ/qC32VSiEqSH51a0ayIbCciIzVHaH8iX+GyKn3cdZJopqipMpK45ivrjuRT
	afwBGO9ev4u+4URfr9pLJAq0osE6QWJ8MYvLdoqc4zxAS3nFjAm6mvgPh5d2nKQVYoYwp7ZAqCe
	Zz2AuCiWHrLRmg6K1Eec9hKmbqkXfTyMInHfgZ/mVWtApfzJg+3pJ2h6c9FF58OSpdHuxMxgKOi
	qS9MD7qTXcFzoYI7x5D+iA6FoI8e6n/0MUrDoNmGzfCwlWlhq+T/rS8nV7xynaxWpppi+gOU4SD
	G0lvohkzb4IBFhilGX1qmd7M6YuBTeiLuTePIbQd6CG7rLv8OCoN6H+tdMRFavuCiITnO1xVrII
	TTHOyWlTVs7aQopekhkVoJW0wPCa02MGhon3r33OAi4Y+V7nb4ecV0Ev7Xqf2wnyvD6r2eUllsB
	msgAmdED/G0zvhIcud7uGErFgZ+MHNnhMGPTegsFc1XIRLr1GX0RbgL9ZwjEGsEa4O9xF2BfDTC
	GG8+xHz/HJmEIpGPg==
X-Received: by 2002:a17:90b:4c52:b0:35c:30a8:31f with SMTP id 98e67ed59e1d1-361403bdd28mr11782171a91.2.1776618631255;
        Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3casm98158695ad.17.2026.04.19.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:10:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
Date: Sun, 19 Apr 2026 22:38:35 +0530
Message-ID: <20260419170835.347910-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,brighamcampbell.com,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-83818-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[squebb.ca,gmail.com,gmx.de,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ninadnaik07@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 03F49424D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-other.rst.
Fixing it.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..1d0410500d3f 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -144,5 +144,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };
-- 
2.53.0



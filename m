Return-Path: <linux-doc+bounces-88620-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JsFJ1GzDWo62AUAu9opvQ
	(envelope-from <linux-doc+bounces-88620-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 15:12:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1C258E90A
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 15:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18A133001192
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 13:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655083D7D6C;
	Wed, 20 May 2026 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Px8owTUf"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3923B61B;
	Wed, 20 May 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282614; cv=pass; b=Eh/OHgOQW0QqX8j294rQlRTEX6bKHKv90WvnhxMtgA3+LK3DCmUwJ+8A0YpzelkwmAbMReyHogq6ils6JXiwY3mdVCkQMRiPreYnCfUb8Ie8cfPUxeVM2bo1LD7yPH3krm7DaBjZuBx/MmyNOQEcOcOkCKa1WjxWOyzkEp8qE0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282614; c=relaxed/simple;
	bh=Tyu2KSJPBQMcKoJT7sD3b0JrwitaVGZwsbiCPgNqgw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPPvUDJI8RVp70Pt12xpjwyRccsVYMHdP/kDe2KTT9v9xLRGo+Ve+RU45TjGMbsQ3bmjneZHm4YVO7S+AQsbtFWL5MbrXfIcWxU1A/+pFr24hfKAHH/gXLs+FKw+gW1bmChSvT8Xx3H6m4E7kPE2PT44v61KNsglA7ptoXpLM3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Px8owTUf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779282342; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AwaEp24+s2sftsmDatkzZJ0XlJTFBidl+uCSKFJvGfW4Ts0It/VCgH8XpTI+U/jgYqNqNxCgqKtUn1s8AwINirUzyklFN2hCNqqnCRJV+hDCLwSlk408nJu0svOpy50TSDhrFvYUzOZnSuvXG0HI3DjLCZuGI8RG7scdAfn+4Hc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779282342; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vHYtuJkTlxfXJH+yWdY0F9pjJfmE67NG5NiI6sZ1UjQ=; 
	b=Zj+vSz+iMiSxw1CvPWoXuhNaFOun8eVub7qRDlE45eqej5ls373U9hntXDzRIDyLZA54gm2jAO0RwD2HupooWNRryfV3FqG4DKZW/ZqWWeoxZVrevjl6h/4bQSFirf0T4QgXT7rkbCslll2WgDxFvNjskApfJLn/6An2H+L3GO8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779282342;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vHYtuJkTlxfXJH+yWdY0F9pjJfmE67NG5NiI6sZ1UjQ=;
	b=Px8owTUf45qVTT8GQ4htdnJjAWopss4+ATsPahtUmwuHqIF8dLGuhzMISrju7YtV
	SkS78ZQ9b6y5VCSryTOHP9TtbZaevl2xJ664raJMFvt7qzBrFc4UW3b5+mFkffNvErj
	bu/hJxO2hFiSnxTgkKp5oNRQm6pfBcTH03sJDtfw=
Received: by mx.zohomail.com with SMTPS id 1779282340165991.2067256608152;
	Wed, 20 May 2026 06:05:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 20 May 2026 15:04:50 +0200
Subject: [PATCH v4 3/3] drm/panthor: Reduce padding in gems debugfs for
 refcount
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-panthor-bo-reclaim-observability-v4-3-a47ab61cb80d@collabora.com>
References: <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
In-Reply-To: <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lwn.net,linuxfoundation.org,ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88620-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: CA1C258E90A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "gems" debugfs file is getting a little too wide for comfort. While
a lot of this is unavoidable due to the theoretical upper limits of
numbers here (e.g. size needs to be 16 chars because 2**48-1 in decimal
is 15 digits, plus one space for separation), the refcount column has a
decent 5 characters to be saved, as it can only ever contain a 10-digit
decimal number.

Reduce the refcount column's width to 11, which fulfils this requirement
with an additional space for separation.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 068aa935c8fc..dfdcda3d0189 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1644,7 +1644,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 
 	snprintf(creator_info, sizeof(creator_info),
 		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
-	seq_printf(m, "%-32s%-16d%-16d%-11d%-16zd%-16zd0x%-16lx",
+	seq_printf(m, "%-32s%-16d%-11d%-11d%-16zd%-16zd0x%-16lx",
 		   creator_info,
 		   bo->base.name,
 		   refcount,
@@ -1681,8 +1681,8 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 
 	panthor_gem_debugfs_print_flag_names(m);
 
-	seq_puts(m, "created-by                      global-name     refcount        evictions  size            resident-size   file-offset       state      usage       label\n");
-	seq_puts(m, "---------------------------------------------------------------------------------------------------------------------------------------------------------\n");
+	seq_puts(m, "created-by                      global-name     refcount   evictions  size            resident-size   file-offset       state      usage       label\n");
+	seq_puts(m, "----------------------------------------------------------------------------------------------------------------------------------------------------\n");
 
 	scoped_guard(mutex, &ptdev->gems.lock) {
 		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
@@ -1690,7 +1690,7 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 		}
 	}
 
-	seq_puts(m, "=========================================================================================================================================================\n");
+	seq_puts(m, "====================================================================================================================================================\n");
 	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
 		   totals.size, totals.resident, totals.reclaimable);
 }

-- 
2.54.0



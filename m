Return-Path: <linux-doc+bounces-88615-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g5qAANGzDWoT2QUAu9opvQ
	(envelope-from <linux-doc+bounces-88615-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 15:14:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1C58E9AF
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 15:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA3C93070703
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 13:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9C73469E7;
	Wed, 20 May 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QJnZbjHR"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C668E3128B2;
	Wed, 20 May 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282373; cv=pass; b=S2Mi9BaTMwjJdKZ9XrWjqY5UPQx6lO/7x/Vr5Et/Ko0cmQzObJXNx/lFlORHx5yuf+XSKbOwrzbF3vzK42u70usqU36NzZArdhPQDPOr52b3iMwO1Y+0nZSCXEtvTrUfzU0lS/0Q6gBzF03Ke/mtDHXtZxqfLrZYoM+7VZlflAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282373; c=relaxed/simple;
	bh=Nb65uEoh/VwcK6QkgBlTGFw+gdd3HLw/D9sa9oj+vPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqYDWn/+wNKVMvlGzO2fD+m9OHrOV9VsF469WOb9YTPNQENRUm/JCYA/QQOfU2+NfvgMgRWPD5yGM5E7sssO4ysyFuEOBzfD7784eloP2ZNWmyd6We/rQnCmjMpHRk1lLEgW32aSYtFYwqLxyP0jFYp1py5eWR8h7WCxkaPlmiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=QJnZbjHR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779282334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m3EMSwy3hSG11zvKoGUa5VtCwBhBtp0/qi8DiDM28PEnXHzSWGUs+ffOkR3d38qj/hr6wT5t/7fOWlzSQitNbLvk9bMy/oRcNdyiluAOZaiOGoPF7qbiG7f7YaLzTMzA4fpzKyVR4U9n8UaMqWNytRZ3mOrHY7fzBbtmSrJPJTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779282334; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=31m7nkmQYDUOGoFy9g3jc9NCzZLMGg3gT01Xnk9NImU=; 
	b=mOKUX14oU36Wrnlnuxg6rLtcCmEHPK6sPGz5hfLQe4izt5TRGjf/JufD+NBD2Sg4jfXbQhF+rBIsCm7uiJcYf53RlCb5GQvoHye9jd17w8y/gbMPP231iZew3UQesazWnfy/Do8P434yI/jlJrcuUwJzv2UK4dC0GACKijcYLyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779282334;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=31m7nkmQYDUOGoFy9g3jc9NCzZLMGg3gT01Xnk9NImU=;
	b=QJnZbjHRh77umjzDUihSVj9GSlI81hfjWkgSJOJ7SfZ/LVCApNVKcpIkH/Ap8+Fo
	iB1ErZIFoOrlJ9YdtuSI6kYeitdPjk0UrJWeouXi6YIKL+GP2OLyfUWoSO9oVuT/cFz
	tVhSF8D1hwghYkuuiUabeiz7jw7wTeTD7RiTYxIQ=
Received: by mx.zohomail.com with SMTPS id 177928233219299.95530128510529;
	Wed, 20 May 2026 06:05:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 20 May 2026 15:04:48 +0200
Subject: [PATCH v4 1/3] drm/fdinfo: Add "evicted" memory accounting
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-panthor-bo-reclaim-observability-v4-1-a47ab61cb80d@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lwn.net,linuxfoundation.org,ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88615-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:email,collabora.com:mid,collabora.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 8EF1C58E9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, there's no way to know for certain how much GPU memory was
swapped out. The difference between total and resident memory would
include newly allocated pages, which are not resident, but also aren't
swapped out.

Add a new drm_gem_object_status so drivers can signal when an object has
been evicted to swap, and add a new "evicted" counter to
drm_memory_stats.

Due to how the supported_flags bitmask is determined, the "evicted"
count won't be printed to fdinfo if there's no swapped out pages.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/gpu/drm-usage-stats.rst | 6 ++++++
 drivers/gpu/drm/drm_file.c            | 8 ++++++++
 include/drm/drm_file.h                | 2 ++
 include/drm/drm_gem.h                 | 2 ++
 4 files changed, 18 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 70b7cfcc194f..ac1dbf52d96d 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -202,6 +202,12 @@ One practical example of this could be the presence of unsignaled fences in a
 GEM buffer reservation object. Therefore, the active category is a subset of the
 resident category.
 
+- drm-evicted-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that have been evicted and are no longer pinned by the
+device. Only present if there are buffers that are currently evicted, and if the
+driver implements reporting of this type of memory.
+
 Implementation Details
 ======================
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..5078172976c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -868,6 +868,7 @@ int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
 		stats->private == 0 &&
 		stats->resident == 0 &&
 		stats->purgeable == 0 &&
+		stats->evicted == 0 &&
 		stats->active == 0);
 }
 EXPORT_SYMBOL(drm_memory_stats_is_zero);
@@ -901,6 +902,10 @@ void drm_print_memory_stats(struct drm_printer *p,
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
 		drm_fdinfo_print_size(p, prefix, "purgeable", region,
 				      stats->purgeable);
+
+	if (supported_status & DRM_GEM_OBJECT_EVICTED)
+		drm_fdinfo_print_size(p, prefix, "evicted", region,
+				      stats->evicted);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
@@ -954,6 +959,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (s & DRM_GEM_OBJECT_PURGEABLE)
 			status.purgeable += add_size;
+
+		if (s & DRM_GEM_OBJECT_EVICTED)
+			status.evicted += add_size;
 	}
 	spin_unlock(&file->table_lock);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..7e4cb45a52c3 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -500,6 +500,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
  * @resident: Total size of GEM objects backing pages
  * @purgeable: Total size of GEM objects that can be purged (resident and not active)
  * @active: Total size of GEM objects active on one or more engines
+ * @evicted: Total size of GEM objects that have been evicted
  *
  * Used by drm_print_memory_stats()
  */
@@ -509,6 +510,7 @@ struct drm_memory_stats {
 	u64 resident;
 	u64 purgeable;
 	u64 active;
+	u64 evicted;
 };
 
 enum drm_gem_object_status;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 86f5846154f7..799588a2762a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -53,6 +53,7 @@ struct drm_gem_object;
  * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
  * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
  * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
+ * @DRM_GEM_OBJECT_EVICTED: object is evicted and no longer pinned by driver
  *
  * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
  * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
@@ -67,6 +68,7 @@ enum drm_gem_object_status {
 	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
 	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
 	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
+	DRM_GEM_OBJECT_EVICTED   = BIT(3),
 };
 
 /**

-- 
2.54.0



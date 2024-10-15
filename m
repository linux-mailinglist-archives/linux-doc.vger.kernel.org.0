Return-Path: <linux-doc+bounces-27629-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC999F8F0
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 23:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E7E282981
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 21:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983AD1FE0ED;
	Tue, 15 Oct 2024 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E94PCxDH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C01FBF7D
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027050; cv=none; b=qSserLpwCCBRk0b4cbjIAok9qB79uWfpr3cKRAWGfm1CMb3bO1AEOTFrxiHiB3fiSUfLD0ocLrY+43u7SEq3PHBLCr1PvYqv+M55yyp/qIQ9WtHdibsR/xQd5sbP0+ZtCxx5B9VOEqS8YObKPobQrwFsYU6qeTOohG/Tl4BZY54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027050; c=relaxed/simple;
	bh=kBpbcw1zYMMwWP/n8mwopVROyJozEpjDPvBdKUBkL5w=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=TOLhP8EEK+BXFhEXdis4A1Skj8Cvq2DOjKfAaH13mQIhh9Pla6J8qbwEYynbjc1XkSYh1Eil/TJ8whtYZ/XhlCqRJRtHeyarYuK1a9S/Vzh4Jj/vi69rXBa5kDdyAkzYz3R0xaqhyL4LwMxPtn5P3MdCeGPn44Sar7+mcA12PE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E94PCxDH; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-690404fd230so110187187b3.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 14:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729027048; x=1729631848; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKU5Ql8c4lOWuBE9mb5dgHxWXN25Z3UPK2tc2nBX/Hw=;
        b=E94PCxDHtENYiiEsiuWSjIqS/FxmIlkMyGe6OWanHoWBuzkwRtxadYyXrrqT7EBDlv
         Uyy5VC0c7SZXD7tMhAiqorZEJuEcMTjydD1Gl6D2dzVsOWUvnhMZMFYb6s5xBF7NuQ/Y
         TeyuvZHuFTtziM9R636JLXP4hsMRCQ069Yce6aFSDnV6lM8W3/VoMA3/+ojOc+o/7YM4
         0WKukLX1zD9et+pf9idLqDoRk69hPBwNlDUJ845fhWZZsh7Rn/L8ibIosKqeUPgAEpN8
         WCNzsYBiDlcNdkOm0qRzR/WKJznT3SKj6k6ScZnrmOCaBl78/T6JVx1RKwAIMi5ZL5Co
         BSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729027048; x=1729631848;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKU5Ql8c4lOWuBE9mb5dgHxWXN25Z3UPK2tc2nBX/Hw=;
        b=wErdmV1bPHtJ39zhc7AMD5IwtAecQeRYZmyMixOW6Jc7tjRKW79pqK2LQpPQmFfzW1
         vZYbOk+VDdUmEnXQynzR8mFesDu/5tXcXpgPcayzDTWTRVE2jq/aMx8jlwwLQcAp6kq/
         3wW45jetirvTOd3hjtntMQ4Yx00AbiOq6h0GEKagXoo8epi7mS8GGw6Qle2qXlo/dS2l
         cDr01AmPEEFf5X+mLP5dd9WsSd7HZkGNADQIuAkLGNa0aKQ4wns6x6aWy6bHYfjQHOBu
         Rh5gnPBUtB2nWUzWhaUAKfBv5D7jR+UnTM2BHFMxWYZta/FUqUC5cxHGsdYyVAEWdGXr
         Q92g==
X-Forwarded-Encrypted: i=1; AJvYcCUDBmFDpyXY0EWaTCRYlP+qVqKwjIHvBInPohXJwvUQiKMMqsyZUAjdAXmDoL13Nn3Ra5gnz4tscbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjthHaOOubvxcJGbMnWlMkRQFDvsbf6C/FZy8iVMjRzYMvUoX
	CtL8dQdFGv5+/jNMjefTBpmI8yiTFMyZSLFHcESkq5a/a17RhgaSuVylSf55oTIvVmWrmZuyxmn
	l1dHvgA==
X-Google-Smtp-Source: AGHT+IETvJtGSVidjurE+k5FibZOHgtYv0ZzxgqNHn8C/rHRsq8sjnXk5FCqfV1MPhDQwBmALvvUhYa1EhM9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:2fc9:b0:66a:764f:e57f with SMTP
 id 00721157ae682-6e3d41fb686mr13757b3.7.1729027047836; Tue, 15 Oct 2024
 14:17:27 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:17:19 -0700
In-Reply-To: <20241015211719.1152862-1-irogers@google.com>
Message-Id: <20241015211719.1152862-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015211719.1152862-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v2 3/3] proc_pid_fdinfo.5: Add DRM subsection
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add description of DRM fdinfo information based on the Linux kernel's
`Documentation/gpu/drm-usage-stats.rst`:
https://docs.kernel.org/gpu/drm-usage-stats.html

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 94 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 02eceac04..bb6c07527 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -300,5 +300,99 @@ fields contain the values that
 .BR timerfd_gettime (2)
 on this file descriptor would return.)
 .RE
+.SS Direct Rendering Manager
+.P
+DRM drivers can optionally choose to expose usage stats through
+/proc/pid/fdinfo/. For example:
+.P
+.in +4n
+.EX
+pos:    0
+flags:  02100002
+mnt_id: 26
+ino:    284
+drm-driver:     i915
+drm-client-id:  39
+drm-pdev:       0000:00:02.0
+drm-total-system0:      6044 KiB
+drm-shared-system0:     0
+drm-active-system0:     0
+drm-resident-system0:   6044 KiB
+drm-purgeable-system0:  1688 KiB
+drm-total-stolen-system0:       0
+drm-shared-stolen-system0:      0
+drm-active-stolen-system0:      0
+drm-resident-stolen-system0:    0
+drm-purgeable-stolen-system0:   0
+drm-engine-render:      346249 ns
+drm-engine-copy:        0 ns
+drm-engine-video:       0 ns
+drm-engine-capacity-video:      2
+drm-engine-video-enhance:       0 ns
+.EE
+.TP
+.IR drm-driver: " .+  (mandatory)"
+The name this driver registered.
+.TP
+.IR drm-pdev: " <aaaa:bb:cc.d>"
+For PCI devices this should contain the PCI slot address of the device
+in question.
+.TP
+.IR drm-client-id: " [0-9]+"
+Unique value relating to the open DRM file descriptor used to
+distinguish duplicated and shared file descriptors.
+.P
+GPUs usually contain multiple execution engines. Each shall be given a
+stable and unique name (<engine_name>), with possible values
+documented in the driver specific documentation.
+.TP
+.IR drm-engine-<engine_name>: " [0-9]+ ns"
+GPU engine utilization, time spent busy executing workloads for this client.
+.TP
+.IR drm-engine-capacity-<engine_name>: " [0-9]+"
+Capacity of the engine if not 1, cannot be 0.
+.TP
+.IR drm-cycles-<engine_name>: " [0-9]+"
+Contains the number of busy cycles for the given engine.  Values are
+not required to be constantly monotonic, but are required to catch up
+with the previously reported larger value within a reasonable
+period. Upon observing a value lower than what was previously read,
+userspace is expected to stay with that larger previous value until a
+monotonic update is seen.
+.TP
+.IR drm-total-cycles-<engine_name>: " [0-9]+"
+Contains the total number cycles for the given engine.  This is a
+timestamp in GPU unspecified unit that matches the update rate of
+drm-cycles-<engine_name>. For drivers that implement this interface,
+the engine utilization can be calculated entirely on the GPU clock
+domain, without considering the CPU sleep time between 2 samples.
+.P
+Each possible memory type which can be used to store buffer objects by
+the GPU in question shall be given a stable and unique name <region>.
+The name "memory" is reserved to refer to normal system memory.
+.TP
+.IR drm-memory-<region>: " [0-9]+ [KiB|MiB]"
+The amount of storage currently consumed by the buffer objects belong
+to this client, in the respective memory region.
+.IP
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+.TP
+.IR drm-shared-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are shared with another file (e.g., have more
+than a single handle).
+.TP
+.IR drm-total-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that including shared and private memory.
+.TP
+.IR drm-resident-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are resident in the specified region.
+.TP
+.IR drm-purgeable-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are purgeable.
+.TP
+.IR drm-active-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are active on one or more engines.
+
 .SH SEE ALSO
 .BR proc (5)
-- 
2.47.0.rc1.288.g06298d1525-goog



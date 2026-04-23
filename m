Return-Path: <linux-doc+bounces-84305-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKF7FvMR6mn4sgIAu9opvQ
	(envelope-from <linux-doc+bounces-84305-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 14:34:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F084520AC
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 14:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8560A300490F
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEFE3ED5CD;
	Thu, 23 Apr 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DHMjEIIm"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3D3E9594;
	Thu, 23 Apr 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947695; cv=pass; b=Dm7jpHyYxeBptouv8L29NHxSkrPjpV9LGSvcsYjL6ZL493Qr4B+qUh11m4xpVh/moQoXyXtlcNT5ywrje2W8nejObOEkbGFgEmWHakD/919BFPITWlM51dGKQ4n9AcpIp0wghdF+kEioh66Nf1yQ1lgQbJrKGhA6Nb/HtbZ/CCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947695; c=relaxed/simple;
	bh=6nyivaIttDd4ks0gFDzlvllHXW/4ALxqbiI3ohOmt+k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u+EvUdp7M/y8Z5jyNhrluCVO2T60+RZ1HwMgMeuuJphAHolhiIY7MI2eFuHxWOMxGw5ax4Iwi9uLHrkZu91j8u7Nx4u+Rh577EtyyYuhbEjpDxdXvmHQ2xiBCeg28PmWG1tZWYJSf8/qmDxZ2y2En51ut6o67yonzii2aUm7AZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=DHMjEIIm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776947658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XTmHN+tV0MIGK5aqaDPw8HcQyzWVYpLFsir0FYdJVsqv28qvTgWUctgTuPRE77vz2XB58PslObWzmXahJQTmOrV7iR+cFctYuA3qC+2GsbqGBYJL+tEhkG/FKCk6xAal1ikM7CXorYOSFC2tGi34a85xhn0nLqd6IKGDSR9wm50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776947658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CStP1DqQxTgYqx2BhlJgSeGhG6tXLv7gidRy1lV9Kak=; 
	b=Cy4dnzRKRqkTDKS2+b+FfoVUNArJVlqTPksR2xoH5sZKYCDQwS+ZuHqyo7l92zVhhbWN46jxcDiPRwGqfHK3DJjXnHptqEdDmVuFjOKfr2IFDwzSET/20gs87ksjY0M6QLs+SVMebPK00hHJ/RwnWc9GT3PKQEv6XbqsLdimCg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776947658;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=CStP1DqQxTgYqx2BhlJgSeGhG6tXLv7gidRy1lV9Kak=;
	b=DHMjEIIm5PMzd8lQjJOREHhc9M7R4CrD3Wi7zCgq+t9AK5PIWzkteIQ1wH0ViwIS
	+D6LDIAN1bKUAaz6XGH++EVUgtzQ9eLJ1MLk/+1tLnY2tQgE+GHPRnDTM3JHAJ6D6tT
	k0TBKub5/6tjGnmzFMhhXAR2PiiAbbwW9mQWxiWU=
Received: by mx.zohomail.com with SMTPS id 1776947656722924.679686641161;
	Thu, 23 Apr 2026 05:34:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/3] Let userspace know about swapped out panthor GEM
 objects
Date: Thu, 23 Apr 2026 14:33:53 +0200
Message-Id: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OS47CMBBErxJ5TY/8CYGwmnuMWNhOhzSKY7CNB
 UK5O06YxUizYdUqqfq9erKIgTCyQ/VkATNF8lMJalMxO+jphEBdyUxy2fBacrjoKQ0+gPEQ0I6
 aHHhTIFkbGik9oN3xZtfadquUZQVzCdjTfVX8HN853swZbVq4v42A11txp3eNGR0RrHeO0qHqg
 gNH0cKE9wTLEOB1uWyhDRSTD491fxbr8+dTswAOuu6EVg3ivu6/rR9HbXzQX8W+CrL8CxUfQGW
 B2laoLWLXm+YfdJ7nF+99uhJ3AQAA
X-Change-ID: 20260420-panthor-bo-reclaim-observability-970679c9533c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84305-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,msgid.link:url,linuxfoundation.org:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,lwn.net:email,arm.com:email]
X-Rspamd-Queue-Id: 58F084520AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Panthor has recently gained a GEM shrinker. It allows evicting memory
that backs unused GEM objects to swap.

In this series, both fdinfo and Panthor's gems debugfs are extended so
that information on evicted pages can be gathered by users through these
two methods.

---
Changes in v3:
- Add documentation for new "evicted" memory type in fdinfo
- Link to v2: https://patch.msgid.link/20260421-panthor-bo-reclaim-observability-v2-0-c9135eedfb6f@collabora.com

Changes in v2:
- Change reclaimed_count to saturate at INT_MAX
- Add "evictions" column to panthor gems debugfs which prints
  reclaimed_count
- Add a patch to reduce the padding of one panthor gems debugfs column a
  bit
- Link to v1: https://patch.msgid.link/20260420-panthor-bo-reclaim-observability-v1-0-a4d1a36ee84f@collabora.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
Cc: linux-doc@vger.kernel.org
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

---
Nicolas Frattaroli (3):
      drm/fdinfo: Add "evicted" memory accounting
      drm/panthor: Implement evicted status for GEM objects
      drm/panthor: Reduce padding in gems debugfs for refcount

 Documentation/gpu/drm-usage-stats.rst |  6 ++++++
 drivers/gpu/drm/drm_file.c            |  8 ++++++++
 drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++----
 drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
 include/drm/drm_file.h                |  2 ++
 include/drm/drm_gem.h                 |  2 ++
 6 files changed, 42 insertions(+), 4 deletions(-)
---
base-commit: ea61048876a7137897da26dac49ee234fb38a35a
change-id: 20260420-panthor-bo-reclaim-observability-970679c9533c

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>



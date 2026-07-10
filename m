Return-Path: <linux-doc+bounces-96264-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jcIeI2P4UGrw9AIAu9opvQ
	(envelope-from <linux-doc+bounces-96264-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:49:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0673B6A9
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DXrXk6Ms;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96264-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96264-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8381C3031933
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174982DB78C;
	Fri, 10 Jul 2026 13:47:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4528F949;
	Fri, 10 Jul 2026 13:47:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691227; cv=none; b=JfP/dTiOgCDo1dLQN20OZyfvMC3eNf9bp/+lErkIgVsYqZWgfyeQJ7BnqdshHUGgX+bb9v91EINqKBhsumRBRbF6f565W7mdPpu3U4Rc/aX4joBvEwceRD1yQF6b9/N7WWq+t0OJl4SVNKrWpsroC9tGbSi9Rxz+Fb+QaIDojS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691227; c=relaxed/simple;
	bh=kSvPkTqUMQuNngP9MOjUUXHc6wov0cmX2dXhh/hqB5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fxc3ZHn4c3NVk8JOXFidHDR1U+xfsfseGD+O6cbVHwiNcD9b/PRKCJJiSWETMtCUnCwSivLmRpH7zko/S+U6zTYpITRzkxHCxhP/JmIOXSBaQ5cvB+WdTv344oITBY8oVCBSR0wdfMXWSNFp7oRIAlMa7NCrZmux+7EZC4tdJAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXrXk6Ms; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2031F00A3D;
	Fri, 10 Jul 2026 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783691226;
	bh=8LCoQX0bHg1OYdjWEvzo4RN1ftxPbEZ5h4yD4yU742Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DXrXk6MsdFELcxNQ56FkZImn/zeom2zo3+oNJIEExxO5fnl51GzBBhviAI62KHZcS
	 VvKhN9dlzVqP19mmS/OrTcxeMvL+7RLl1qkRsTokHwUZPXEJvbeODKgQVAHr+iKUFG
	 HcDnzLI5hzMJ10+VBVk+tz3UUbptmOJmliAVAd2lh2+x8DEUtkVjysYRVL/9ndyxDo
	 frZnxii0FJ6AMG4yjpQjW/h3D4mvddEdzzspVLwNm8jn6ASMC8EZWkXmRu87fTze/Z
	 tKT9fp/HsjEIZj3qIOQlpnyw/JdNkx4enYM9V7RV5wm3aP92SWPPf29MpxABdUcfdF
	 Ab8/syLuxVcow==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 17/19] Docs/mm/damon/design: document attrs-only monitoring
Date: Fri, 10 Jul 2026 06:46:46 -0700
Message-ID: <20260710134651.18084-18-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710134651.18084-1-sj@kernel.org>
References: <20260710134651.18084-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96264-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:sj@kernel.org,m:liam@infradead.org,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DA0673B6A9

Update DAMON design document for the attributes only monitoring mode.

Signed-off-by: SJ Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 457d6e8bc7878..6d79e7d69be84 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -316,6 +316,26 @@ Another way to do this for higher accuracy is using :ref:`DAMOS filter
 information in page level.  But, because it is operated in page level, the
 overhead is proportional to the size of the memory.
 
+Data Attributes-only Monitoring
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Data access is the primary monitoring information for DAMON.  Hence it
+:ref:`adjusts <damon_design_data_attrs_monitoring>` regions using the access
+:ref:`counter <damon_design_region_based_sampling>` (``nr_accesses``).  In some
+use cases, however, users may want some of :ref:`attributes
+<damon_design_data_attrs_monitoring>` to be the primary information.
+
+Data attributes-only monitoring mode supports this use case.  For the mode,
+each attribute probe has their priority weight value.  Users can describe by
+what combination of the attributes the primary information is decided, by
+setting the priority weight value.  If the total sum of the weights is not
+zero, the mode is enabled.  The regions adjustment mechanism uses the weighted
+sum of the :ref:`probe hit counts <damon_design_data_attrs_monitoring>` instead
+of ``nr_accesses`` in the case.  When the mode is enabled, access monitoring is
+automatically turned off.  The access counter (``nr_accesses``) will always be
+zero and not updated.  Hence the mode is called Data Attributes "only"
+monitoring.
+
 Dynamic Target Space Updates Handling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.47.3


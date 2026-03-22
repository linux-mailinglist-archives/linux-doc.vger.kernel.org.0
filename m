Return-Path: <linux-doc+bounces-80542-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sImxN4oRwGnMDQQAu9opvQ
	(envelope-from <linux-doc+bounces-80542-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 16:58:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D62E9DA7
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 16:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E70583019F1F
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 15:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0AC36493A;
	Sun, 22 Mar 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rx5CvT34"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D33644DB;
	Sun, 22 Mar 2026 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195058; cv=none; b=FoM/F13NTcpkLZO1M5gxN7nrm2/9KJPohZRLIex0VkIK8YFwx/UBLz/z9xNlbxRyfCoAKcNA20Kw02mRCd9G8MsAfbMdtFMEspvRrFhmXc/lu+oW8qVYYdpibPygxs6OmCrXgou7ny2bjrkJjkFfFTWh7bvszESXXmpADDQmdng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195058; c=relaxed/simple;
	bh=qt20gza/ZGfZPnGlsbY2CkGg3eBlVlFouLw/z7b3qI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeVz1AfOSvNCTblK/uHXKcFwC7SydKSh9IJU+nU3oez9KV6x8xe+MHdMwprO5rubW45Ab82EZ31yO9CRdwjbZX5igpSGF1Fwj8mc3Ayk7PuftRsMU+peKctajYUtr+tyyf+MCDCNskoPcfNQ/eBNWO0ndNSOOKoDuycN3ll9nR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx5CvT34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB1DC2BCB2;
	Sun, 22 Mar 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774195058;
	bh=qt20gza/ZGfZPnGlsbY2CkGg3eBlVlFouLw/z7b3qI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rx5CvT34RmOppQtu6QxfqLWQzRWwbcWgOty3/B822ykfngK25Ar5ud10emwDWJIzS
	 xrEbTwTN4Mx+Ijeq6WJ6Cfopp16atDTZN0nQ/OHcImSj1OlTi2Zs31rLD9SSMvBOUP
	 erd9CvY3+Rt/aaYAN9stVROOuOWyOuRAVQRbrDGv/ac7nryJP42qaCjaRszDv9iYF7
	 a+VXzrHsDhX3ny7VVnAM5c/lM4uZqcHI8g5ll/L2LUGj4cD5ei4CiRjVPasL4mABVv
	 7o8+fEfU1WfOa0hEGojJo8HqcsfbDBMjUKChQJfl/1aCCoUVAD3/Ji8qlovGLWLuH2
	 DhGyAe/DjdiQw==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [RFC PATCH v4 03/10] Docs/mm/damon/design: update for context pause/resume feature
Date: Sun, 22 Mar 2026 08:57:17 -0700
Message-ID: <20260322155728.81434-4-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260322155728.81434-1-sj@kernel.org>
References: <20260322155728.81434-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80542-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 880D62E9DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update DAMON design document for the context execution pause/resume
feature.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index afc7d52bda2f7..510ec6375178d 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -19,6 +19,13 @@ types of monitoring.
 To know how user-space can do the configurations and start/stop DAMON, refer to
 :ref:`DAMON sysfs interface <sysfs_interface>` documentation.
 
+Users can also request each context execution to be paused and resumed.  When
+it is paused, the kdamond does nothing other than applying online parameter
+update.
+
+To know how user-space can pause/resume each context, refer to :ref:`DAMON
+sysfs context <sysfs_context>` usage documentation.
+
 
 Overall Architecture
 ====================
-- 
2.47.3


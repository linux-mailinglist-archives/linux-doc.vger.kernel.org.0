Return-Path: <linux-doc+bounces-80564-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF7eEjRBwGlQFQQAu9opvQ
	(envelope-from <linux-doc+bounces-80564-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:21:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B757C2EA789
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 590E1301F4A8
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 19:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2A935F196;
	Sun, 22 Mar 2026 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ZDM/VIyh"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979436E478;
	Sun, 22 Mar 2026 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207235; cv=pass; b=FZEz+KY/H1PkSa6YNwUvZgKHjBygTYs5ukHAe/o3+cb6Rn/k7+xOPcA38JUzyV0JI5wtv0LnW0NxjEShNfk9TQGPs70GCINl1FJKtnijBsigIyoA6dYOvhUS2c7dNXyXtbQkhT0ZkVf+ky5MUgEBsFLc2fHs/Z9SEqjS4VzQ1aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207235; c=relaxed/simple;
	bh=cDrNtXkyGSKmaY5MTB0Yq4tMBj16YCVkF2G8dSEMhCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i79LzLnklbFZdynxi0pjOYOmV7Z7ZIQQxSGona3yl4pgXc64ZgUmK1KnuyErUqnJG7ok7HL+q8LWXyryqhzwZlmSsdy/q+yTddd7BzUDHAI1bEL/FPLdmEC9fNDJArkcmP0PgsatWsMkhf8fsafjkub+0JpikHc8cajtwsHlDsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ZDM/VIyh; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774207227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ddoHh8xOYhY9GaKYNgl7bMGrni3irxNz0QcF1U2IO4xTWNpxn63O+KoxLNbMYIoE4dXouJexSyiW/IICRyQqQn9kruL5Rb6NXzmJw49NOFHAh3/+fBMY0/+D/Jb0rpGJyiiwgX8cPAowdbg4fFf9xH1HJ88J10c4IhhVa/KikeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774207227; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DvhpbCSIkJfqqs1DA/L/yqeXO2DxApuWDE/YjOpmHgY=; 
	b=YKsHwnMzzGX5LFEEpUfAkTGM/QMcuDgutYNEUgKjxJ7/Y59alQq74ZBMfFAzgVhwc3rBCYHv+0KdycAq6loIoY/9l6a4rDKHV57Rb5bGjPDiWdHDVJUPdpeqQUp7bhf+TjigNGYB/vTkQhh8zV5Zm64u2FR+ACDcEmqBeRWMkcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774207227;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DvhpbCSIkJfqqs1DA/L/yqeXO2DxApuWDE/YjOpmHgY=;
	b=ZDM/VIyhaCZzO9X/Q9nE1vN1SrCq+im8EvDa9DuOcAN1cfjZ+ENFGpXCIuo4vGSs
	WEqvk6lanN9IBXh+0jWeDbj7UdnIeUNnfGEjca7h6pLodzf7BKYBYTQg0aVf4oExdN/
	jvjVpFL5KuAS0J7hCy3VJrBPUdqYP8tuGgmtyMbI=
Received: by mx.zohomail.com with SMTPS id 1774207224178584.5786923698156;
	Sun, 22 Mar 2026 12:20:24 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 2/2] docs: allow long table reference links to wrap and prevent overflow
Date: Sun, 22 Mar 2026 15:20:20 -0400
Message-ID: <20260322192021.63859-3-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322192021.63859-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260322192021.63859-1-rito@ritovision.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80564-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ritovision.com:dkim,ritovision.com:email,ritovision.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B757C2EA789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some documentation pages contain docutils tables with reference links
that use long unbroken strings. Those strings can expand the table
width beyond the content column and cause page-wide horizontal
overflow.

Allow reference links in docutils tables in the main document body to
wrap when needed so the table stays within the content column and does
not break page layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution

 Documentation/sphinx-static/custom.css | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 4ec617d40..b41c54c71 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -154,6 +154,11 @@ a {
     overflow-wrap: anywhere;
 }
 
+/* Let rendered reference links in tables wrap when needed. */
+div.body table.docutils a.reference {
+    overflow-wrap: anywhere;
+}
+
 /* Make xrefs more universally visible */
 a.reference, a.reference:hover {
     border-bottom: none;
-- 
2.51.0


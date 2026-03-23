Return-Path: <linux-doc+bounces-80710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+XDnpzwWkQTQQAu9opvQ
	(envelope-from <linux-doc+bounces-80710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 18:08:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F42F97B7
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 18:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 039BE35B6E2C
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0510325393B;
	Mon, 23 Mar 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="MmSIv5vL"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D33283FE5;
	Mon, 23 Mar 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279490; cv=pass; b=c/P4ZHhozwe8mrzPTtk9QIpB7XLkD/MpPiUNLypsNID+aZIo53PJapPcN1OhNGPyB64ly0Z72IDeGveLpZ68ZVH7562hzMHL3Nq63KzS/BtxIJ25luViADdyH1ggBiUYd27WbyYbUtAAX/d+AL3HSaQymcWX1LUY3SSfQIQyKFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279490; c=relaxed/simple;
	bh=/aaNUmB6j1KlMaHLCf2ZBCw+qhT7kZak3VlBbufwaRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH3lFUV13vtF+0QdDdNNLXLWquLqw9n9Zm9nCCaYeU3ZJ/Ny3tolWFbiSAiYqb1JXXlD6k1AHAc9mf46kIsHC6CdUA9iA2Z6BtQ8n2rHds0Fxa60sWRnKL37v37g3CLIT8xuycu6ki2FJz3Wu22l+PKT7U1EwuUFrap0ubixR3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=MmSIv5vL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774279474; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B8TIN2xa/DGNmjVJpeeO8SqDWwdFGsnj5k534Gr2TVG3GwzD7pNHCobwuWsvi1kHHj4USl5Ih61nK8PIca72PWni8k/Nd8KfKm6d9iaKohqW1Lj1PjKAGe/cNVbjz9ndsXyaghYDqLcEuRzrBK57btGCXVozBFf2X3HSViRGhzo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774279474; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4kva+Q2/WqTp9lUr3JHsLiEZyjnVj8naYHRAhkFJ61U=; 
	b=iL9sid5g7RKvgfkvfyVELxpIgq0aEGL9PTbbvI47ZABCCVBdGH1AK4XMmTdf+o4FHpW4m988u6PqPTtK4qCSf0Xnw9DwjqcyE/GoKm3j0vbpq6ppCxH7kWUpgzfEaLrKqMNO+bnoSln+EmAdbwndY8uMvBJppMTjl3zFKfZnMdg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774279474;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4kva+Q2/WqTp9lUr3JHsLiEZyjnVj8naYHRAhkFJ61U=;
	b=MmSIv5vLNw1h6GlgCzeqzEYzagnPGwyeRKvHNVCFta1UEl+aAu9IvKrSzY3/UQ+h
	soaOKcQSKjHFHBMFGQ6Q1RourTR/orztq5pqvMeRAylsNM9LiR9UTksBfIAkUbpaFTo
	Sbi/1mCCH4dZjNVQcowMnm8tZ9WiCneYj+VrnCIc=
Received: by mx.zohomail.com with SMTPS id 1774279470970372.45836678383864;
	Mon, 23 Mar 2026 08:24:30 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3 2/2] docs: allow long table reference links to wrap and prevent overflow
Date: Mon, 23 Mar 2026 11:24:28 -0400
Message-ID: <20260323152428.30483-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260323152428.30483-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260323152428.30483-1-rito@ritovision.com>
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
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80710-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F8F42F97B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some documentation pages contain docutils tables with reference links
that use long unbroken strings. Those strings can expand the table
width beyond the content column and cause page-wide horizontal
overflow.

Allow reference links in docutils tables in the main document body to
wrap when needed so the table stays within the content column and does
not break page layout.

Examples:
  https://docs.kernel.org/6.15/arch/openrisc/openrisc_port.html
  https://docs.kernel.org/6.15/filesystems/ext2.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

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


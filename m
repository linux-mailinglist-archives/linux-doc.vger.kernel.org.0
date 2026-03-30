Return-Path: <linux-doc+bounces-81719-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LjjAM4Iymk64gUAu9opvQ
	(envelope-from <linux-doc+bounces-81719-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 07:23:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB33557AF
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 07:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415C73016499
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 05:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA4B390C90;
	Mon, 30 Mar 2026 05:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="CfhuKjUh"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2303392C3C;
	Mon, 30 Mar 2026 05:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848144; cv=pass; b=svJV783EG40bgICMNjT4vKpMDTl4eLPDrVIXqnJ52jqYoa0l89vKnG+exBOqewfHGRI0GNXVfmfaG6MGS9TLNeqnylGpEcJM9Hx9bYR1XsWxtQJ2HVx9Pc4h+/Ft23kXUiqc5iaEn/kiuPX7y0koohqrBXKuCfSDD4Zo4GUtx+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848144; c=relaxed/simple;
	bh=qu4rm+Ks2o34Kpj/nd1Ujsn82vestoF+hHUzBOpnI/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1SpQe+fs19IOoOdpU2lzDw0OblUq/gE9h8G4zK3Z20bt9k1q7bYTfS1pa3HKNXSfBAQ5XrC5u/MCLhUBmGfxqOcPs6lfMaNPah1vBSgwtb/N7vQISovtomWjCI9VJn0EQIsEw/Za83GCNy6BtOTWGYrfmjanLqgfEeyVf5qqew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=CfhuKjUh; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774848135; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9mBtuqZShUaYpR7nvUqVnCuNDdNiqZ25bsbSNINSg6o3fL5YfMuTWK5o3UGAg80T1sZxHO+Po97DQatB0QgixxkEDkwFiaWzzhLmCvRLIZJB7aaVmf6nm/mbJ4o8c/Dm4W4uFiOSNfBhAAs1I2miH8v88ZXU0YqQrVCgbLw7zc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774848135; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AnCI6klqqwA1JusfEK/RMJc1BBcuMfjifqR23IwVIqE=; 
	b=Jz4tAGVwRiUrpTDN//Zhux5v2kkQS6iURtMy/V6joYPR/WNaE5vxPx7YZVEhPlLwzjx2CWoFtckKy85o3Wb11KpbMnPf8cVPpRr5/Prj0VYg4jkpkOIK2MtMZ2a5PoFrwtwwoeAgCnPB6j+ryD2Ovs88/iGvg3qYRjidRuNuFgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774848135;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AnCI6klqqwA1JusfEK/RMJc1BBcuMfjifqR23IwVIqE=;
	b=CfhuKjUhBNnnTAcanfICC5ZpFvFWzilaqw5si7OawBLgzmrjONEaOIDRJfx/Uj7/
	bejYcnzMpXSzZ8+7/rIMBtsC/aO8rVb/xj3nVv8DIgtSHRyUOJ3RNYwcMcO3/kcdiZ4
	AnUE1izrD36LZh7pFAshHeiqq+jOIN4Ejzfu2jj8=
Received: by mx.zohomail.com with SMTPS id 1774848133603642.6330771192052;
	Sun, 29 Mar 2026 22:22:13 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 3/3] docs: add left padding to C API signature rows
Date: Mon, 30 Mar 2026 01:21:59 -0400
Message-ID: <20260330052159.11284-4-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260330052159.11284-1-rito@ritovision.com>
References: <20260330052159.11284-1-rito@ritovision.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81719-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8BAB33557AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a small amount of left padding to rendered C API signature
rows.

This improves readability because the signature row and its
container use different background colors, and when the first
character sits too close to that contrasting edge it is harder to
read.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
 Documentation/sphinx-static/custom.css | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 64ea94879..41413b683 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -40,6 +40,7 @@ li { text-indent: 0em; }
 dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
 /* indent lines 2+ of multi-line function prototypes */
 dl.function dt { margin-left: 10em; text-indent: -10em; }
+dl.c > dt { padding-left: 10px; }
 dt.sig-object { font-size: larger; }
 div.kernelindent { margin-left: 2em; margin-right: 4em; }
 
-- 
2.51.0



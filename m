Return-Path: <linux-doc+bounces-80562-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UQtbAQBBwGlQFQQAu9opvQ
	(envelope-from <linux-doc+bounces-80562-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:20:32 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CC2EA763
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF0983002B12
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 19:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5858135F196;
	Sun, 22 Mar 2026 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="GemY/d9e"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A96184;
	Sun, 22 Mar 2026 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207229; cv=pass; b=OYtfk1ji5NXn8eDrJVbFQ50x1JRYyjngKc53dkf1ZMHJuTgh3Xm6t+yJc1iSEa/DoUmMtiMtenm3kputAj6lOFv1MAb53ORm5AH+/n1rivflp7o141M/XAdIba5s97lTfHkRXMEy0xOD0SkapWGkOGTacKGRLTHXFsQiMA9kipQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207229; c=relaxed/simple;
	bh=iqECGmda+qDh61bJk5GVeOEIjs2i5mzQ9rM+O7dsf8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA1befsbbfKSVEPSFvwnoz8HUIuRavqtEbQduNd6GI881NLcwJce3HT4JqfssbqEg9fDpbsfbDuc08jSmxwKm26Vfdbrx45qzwLgsoFKBqwJDV5rx2OBuyjnLkIaSHZ9Ezjqi8IecnWY2xKeoe/wd9Q4G0GNQ5xu7lGRLfAxtPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=GemY/d9e; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774207224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gTDUzi/FG8KfFCwDnC/ENKx9Ai0cBl4iD7GUBLpATl1zP3gLFTWKiOuc4up4N8gY1HT4xCNbaqMWqzZ99P0MS/xVyysVYVhF0kqn7JpjSHMmb9EC1SSV34IIrd3i2eahj48VwBEtY6oMaLaavF1mTbVGv567fgQJNbr8O13QXZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774207224; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zme2o8WRnlfOC7PTflSSZ0BGzG26R0G9quZqT58R1Kk=; 
	b=mvbckRLyEYE7CY+KO/2mrXPtkkaq/UtktTLMxL2Guk6DaZKzf+6dGnmn/8KCAO+s5kZ3pa2ld53pQRE3k1aGWYmXYh6OmbKytc64mDV9XNEjAcHD9MNxGkIYbDIsVI3zDc5HT9eIrlS63M9DfE1TvnoAWT46orJYv98YQYr0Pn8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774207224;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zme2o8WRnlfOC7PTflSSZ0BGzG26R0G9quZqT58R1Kk=;
	b=GemY/d9e4tyZ1GcX3i7w2t4NZThnPxN32hitEiQvOxu347xTei94Fqkwv6981hOh
	kRzX3Bw477AhYw6YYEfqP0cbV47g4fENT0MbXuT19tmRUsQ0XgVRKzk8vcXN3nBlLy+
	iWtVDLfMA9+ZNUosjGDfckZMuPsAKGztVl04sarY=
Received: by mx.zohomail.com with SMTPS id 1774207222361438.9245357307981;
	Sun, 22 Mar 2026 12:20:22 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 0/2] docs: contain overflow from long links
Date: Sun, 22 Mar 2026 15:20:18 -0400
Message-ID: <20260322192021.63859-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321180841.10166-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80562-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ritovision.com:dkim,ritovision.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E8CC2EA763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Patch 1 allows long link text to wrap per character so unbroken links
in the main document body do not force page-wide horizontal scroll
overflow.

Patch 2 remains necessary for rendered reference links inside docutils
tables, where the affected table case still needs an explicit selector
to keep the table within the content column.

Some of these pages may also overflow for other reasons, but the
examples listed under [2/2] specifically include tables containing
long reference links that may still need a table-specific CSS rule
to keep the table within the content column.


Examples of affected pages on docs.kernel.org this patch improves:

[1/2]
  firmware-guide/acpi/non-d0-probe.html
  firmware-guide/acpi/lpit.html
  arch/arm/vlocks.html
  arch/arm/keystone/overview.html
  arch/arm/keystone/knav-qmss.html
  arch/loongarch/introduction.html
  arch/nios2/nios2.html
  arch/x86/earlyprintk.html
  arch/x86/orc-unwinder.html#etymology
  arch/x86/tdx.html
  arch/x86/sva.html
  driver-api/xilinx/eemi.html

[2/2]
  arch/openrisc/openrisc_port.html
  power/apm-acpi.html
  networking/devlink/stmmac.html
  filesystems/ext2.html
  networking/l2tp.html
  process/embargoed-hardware-issues.html
  arch/x86/boot.html
  networking/devlink/devlink-info.html
  admin-guide/sysctl/fs.html
  userspace-api/ioctl/ioctl-number.html

Rito Rhymes (2):
  docs: allow long links to wrap per character to prevent page overflow
  docs: allow long table reference links to wrap and prevent overflow

 Documentation/sphinx-static/custom.css | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.51.0


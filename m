Return-Path: <linux-doc+bounces-75830-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LcBMIxAjGlOkAAAu9opvQ
	(envelope-from <linux-doc+bounces-75830-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Feb 2026 09:40:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3159122536
	for <lists+linux-doc@lfdr.de>; Wed, 11 Feb 2026 09:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60DFD300E264
	for <lists+linux-doc@lfdr.de>; Wed, 11 Feb 2026 08:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FBF3502B0;
	Wed, 11 Feb 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WrHnwbT1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com [220.197.31.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5E34FF77;
	Wed, 11 Feb 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770799240; cv=none; b=FgImoZJ7KKfojLu66IgtSKYp/m+e/1x0lNbX6vQxL/2Vk8lPwWf3IJwE/TkKSqfgE9pnj2qplPfw2W1mU4flPOioef1a/07FJD/c5xVbIraF201bSb3MBZyXPbaJom/qClh8Epp92rrnEFlwNl9Zji8CCVDUNqwdL6Qboczoty8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770799240; c=relaxed/simple;
	bh=df7u2Qzcmi9LtE9iK1hJ4/WAuUKFUwnE5kZX8HKvz8E=;
	h=From:To:Cc:Subject:Date:Message-Id; b=IgFMUWHqbBFTImqHh7rZhKLow1SBz7KCeWoQX0qIzJfLyiZvAaz/2QU1V4zpZbQQXIzXE7fg4T2+BSb8O2Rokq49n8ynib58iNUM3cL/ajqJyZsAJBRg6jro/pRkExEmCEE0leozMwPim8VoZ10LA//IeewJi13kI2JeJJ/zz34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WrHnwbT1; arc=none smtp.client-ip=220.197.31.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33d869550;
	Wed, 11 Feb 2026 16:25:09 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 0/3] Clarify pci_free_irq_vectors() usage constraints
Date: Wed, 11 Feb 2026 16:24:56 +0800
Message-Id: <1770798299-202288-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0a9c4bcdde4409cckunm6cb3bb0ee1928
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhMGVYeGh4eTU9JSEoaGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WrHnwbT1au31RuZMDW9WXpge/f8TuRCERkI8Pt+l6AT8keaPQ6DMIhWd2xqMwHD5wLzl66n58NUsc6GJduj/53ZNC8s9InybHVpFrXSRlqkpQSModCJqNQeVnMmoCq74q54d9CRapuzneaZGOJLE3xANa7ySJG9TjV4JsgvNQPs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vW6bi5QtvyujZ1cYIV1ApMxkTvQkAASQb3AXOba9ifk=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75830-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rock-chips.com:mid,rock-chips.com:dkim]
X-Rspamd-Queue-Id: C3159122536
X-Rspamd-Action: no action

pcim_enable_device() automatically manages IRQ vectors, which can cause
double-free issues if drivers manually call pci_free_irq_vectors().

This series adds documentation and warnings to prevent this:
1. msi-howto.rst guidance
2. kernel-doc warning
3. TODO comment for future cleanup


Changes in v2:
- rework the commit message and documentation

Shawn Lin (3):
  Documentation: PCI: Clarify pci_free_irq_vectors() usage for managed
    devices
  PCI/MSI: Add warning to pci_free_irq_vectors() documentation
  PCI/MSI: Add TODO comment about legacy pcim_enable_device()
    side-effect

 Documentation/PCI/msi-howto.rst |  7 +++++--
 drivers/pci/msi/api.c           |  5 +++++
 drivers/pci/msi/msi.c           | 10 ++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.7.4



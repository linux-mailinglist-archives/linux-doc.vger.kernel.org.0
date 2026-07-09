Return-Path: <linux-doc+bounces-96075-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Op5lNfzuT2qBqgIAu9opvQ
	(envelope-from <linux-doc+bounces-96075-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:57:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D24734A10
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:57:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arista.com header.s=google header.b=ODbI0UNx;
	dmarc=pass (policy=reject) header.from=arista.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96075-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96075-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D5B304E571
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 18:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460754499B3;
	Thu,  9 Jul 2026 18:54:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CBA449992
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 18:54:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623294; cv=none; b=GdVSzBod+yKusVF+wfb3n2m4QjWBtiUkDgUAWoafj76yuz1Wwka/23fWZfe8pNxCviFDxhE3CA/Ok5OZOk7fpw7KbwGsl1vpPgpm7u8TBY/vf3qwhlA+Y2LQbUw8fmyuPiMe91/tgrX6y8vxGqBVeut+7aqf42FsL5ddgMfINeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623294; c=relaxed/simple;
	bh=r7l3sH9Ssf2UEleFSX2u+Zj+uzpSa4vwyq6ieakTVVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdDznFZ+f3S1zjPcoByp1waHnJ/4vxkLVHY4XN4fdoyb9Mg0mqOI2WJDxd//LYUYFIsu/JMogYjaoO3imVAgcHc1TNZgB9JXGdEXaGdhM4KmPU7DlC/dP4G7DWvpxs9sqxJXlffGLn8aTyXPdkTLTx3kVowwJPUzZ1Dh88Mb3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=ODbI0UNx; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so271747a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1783623291; x=1784228091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwAEOJfLknybTUfP/QNSK3Dc8aL5FOhkk5/YS6kTpG8=;
        b=ODbI0UNxA0Mtq+sFYnST9T3GLGjj7pey6pekYz/vzXQuU4sNCX3jP88EhagigDOKGo
         WwbEnmCsLjqT/3Vo0hqG71rleMqwMtIsxVx9hQJ7NVIlnKbK0DMRdgD7IkNpw+J1HdEK
         AI9YgGlthwwMZ/MB75sCMN/vg3XxGqvuXoTplV4g8GUPmK2+NiexLN/y8QCJl4gEJ8Xt
         C+CCTLRz9IjR0b7Gbjbp9OLoC25zDuVfG+qq8c9sI9r7PQpmIp2W4MyCrhKAPHHPjyce
         7AI7InCptJIUb5FgeNnuNR+oTea/aOMwE7/3DWgs5G+tvKx2eg/J6gLL91F4C/DffzH9
         EBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623291; x=1784228091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwAEOJfLknybTUfP/QNSK3Dc8aL5FOhkk5/YS6kTpG8=;
        b=VJl3M6h1vbQbkywD4aVKDU1+Af/QFciycKxHocjvvWarQevkK7zGudUvc90vspAaDd
         fj8xhO3pR1eKB/1xj19w2llIaZvPFIwKqvujauixHg1bbJcesvBar9PIR8igc52y3TFC
         xgRZ9SUgtxDIysV3aqDyFwDdzkDd3ykNZjy1Hbal4gcsFiM0LtSromDR43wkWeg7WTk4
         mymGA3pqKdg3Tl9Xo4y0X+2kFtC/r+rHH8lh7Bd7VnkASYrJxM7cWLe//hQHO8qI5q8W
         8c07o2yajfCW+ng90OH8oHxrxC8mdQxUAwCtNxAA/Zx6/6yLNU+OcZwP9regZmbBTcmH
         N25A==
X-Forwarded-Encrypted: i=1; AHgh+RrUYEm80dHTNKltHas5npOFEvL1luG1Nn/noVwYTQ5XjEiF/h//EJEcUlFXYiLFJhFU9SduhwF/82o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDtd9fBdUTkcLIz+PZ250+Vm+rraGR8tfy2o124hjkdNMRBzS
	bAy7j8IAft1Tp/7Whf8xFkWd3IRUw+HVs2E42fFnAY4/12/ssolY6IvTZ928YWDI8w==
X-Gm-Gg: AfdE7cmFGKFzG2f854dqILT3ITJqcYAbi+9HLpxIPV1zFOutfIccs/gq2xZTA21+uiM
	j3rYAl0IK3IZrnxBhc3mYIFW2t4oUQwMaGfZZckrq1xCpfBtU5N4qUEsDA091nEZ/sD8XYoS/MZ
	9g8Zlq25KcGOl8mEidzCT4NxOUBxE4DMT7rKDDAhxkfONtSEqsG2Z9jSF7wZ3AZBySJTTatgNu+
	983G6aZerf5TIvVTYyAmyJCLQwbMesdM4FKrIxyDLpkOkFQDBNy46jOHyidTGlR/1RxqigGJbNs
	aT7BqBLMtI3fK5CLRHeNY1yTm42SZUQpACTOBm4hCjCp/ogQW3VIphebpPo2+PwsuvTYP1+pBUj
	2YvRoVZ7kps2bZHhyScQa1TxruQUz1b/mCpHS/JnRa2oBfgr20e1ub1QKcFFHNzn4d0AC9V2gnM
	Gx37nA9vNv59+Ben9isRF0wu8uZ3wgzRBg90OsK7dsmYUT
X-Received: by 2002:a17:90b:56d0:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38941bce343mr8584552a91.31.1783623291109;
        Thu, 09 Jul 2026 11:54:51 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm31297642eec.4.2026.07.09.11.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:54:49 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Yury Murashka <yurypm@arista.com>
Subject: [PATCH v2 0/2] PCI: Add boot options to disable DPC and AER recovery
Date: Thu,  9 Jul 2026 18:54:27 +0000
Message-ID: <20260709185429.627968-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96075-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linux.ibm.com,gmail.com,vger.kernel.org,lists.ozlabs.org,arista.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[yurypm@arista.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:yurypm@arista.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurypm@arista.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[arista.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arista.com:from_mime,arista.com:dkim,arista.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45D24734A10

On large modular systems with a complex PCIe tree, the default kernel
AER recovery and DPC behavior could cause unexpected side effects.
Sometimes it would be nice to have the option to keep the system in an
unmodified state and be able to handle PCIe errors from userspace.

This series adds two new PCI kernel boot options:

  pci=noaer_recovery  - Disable AER error recovery while still logging
                        AER errors
  pci=nodpc           - Disable PCI Downstream Port Containment entirely

---
v1 -> v2:
  - Patch 1: Move disable check from pcie_do_recovery() in err.c to
    pci_aer_handle_error()/aer_recover_work_func() in aer.c for
    proper AER-specific scoping. AER error status bits are now
    preserved (not cleared) so userspace can inspect the error state
  - Patch 2: Also skip DPC port service driver registration in
    pcie_dpc_init() when disabled
  - Rebase onto v7.2-rc2

v1: https://lore.kernel.org/linux-pci/20260602105558.1799563-1-yurypm@arista.com/

Yury Murashka (2):
  PCI: Add pci=noaer_recovery kernel boot option
  PCI: Add pci=nodpc kernel boot option

 .../admin-guide/kernel-parameters.txt         |  9 ++++++
 drivers/pci/pci.c                             |  4 +++
 drivers/pci/pci.h                             |  4 +++
 drivers/pci/pcie/aer.c                        | 30 ++++++++++++-------
 drivers/pci/pcie/dpc.c                        | 19 ++++++++++--
 5 files changed, 53 insertions(+), 13 deletions(-)


base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.51.0



Return-Path: <linux-doc+bounces-91775-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKYVBL7BKGqCJAMAu9opvQ
	(envelope-from <linux-doc+bounces-91775-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:45:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 570236654B1
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:45:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=QIVfsdJd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91775-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91775-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1027730B5E01
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C93290BA;
	Wed, 10 Jun 2026 01:45:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F7631A045
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:45:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055930; cv=none; b=YYIBwWW7bhq1gYNEa1wSEoCx7TCrNx7e/2kcjEZOtjj3NMjQ+FGwbUrwtR1LQSBDyVJ7QVKmzqhlCEQTEpkdil1uzprUi8UOxHMhtQd3merrDQdxmouETdOGrFeU1YkNIBoBuIvkuHo6ZufxAiezPaqSkUCwHIKEpjCnT1u9OBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055930; c=relaxed/simple;
	bh=MJBp72SKMyjsUAzv3mWv2+ZOo0GNt4ALfKXaxFLidIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ob5pPBTgHJlL786pVhP1mlM4/UmMaj/duUrP0i7YLCjN0FM76o9NxWl6zmB9B9U0C4UxSMuzvh6bHr7/S2nawYYwM1DSxKuTGldYI/IA54azUTo6/xl7kyrCNw1Z/mDkd2Ub+q6bNTrlCHokQRc3IWDr2ySQWnu9p038UaWL62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QIVfsdJd; arc=none smtp.client-ip=209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51778069c31so49464671cf.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 18:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055926; x=1781660726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+GrVwUVnyXoJ3l/Ws8SD/JHytJBmijCAuGEqrIfnVw=;
        b=QIVfsdJdxRWb4Oy76ocNAdd0yvYcwrWH5A9XsF2lC8tFbL2vwY1D1hVcfrlgoLofRI
         EYwycpkhujwSGdjaOT25GTGEFuAL0SaaRxUaa8iZ/GzWHAYJSi0SUY2ihotN8ITcbMiF
         nIRQ4dZa2CO+llnHJTGqodzQ3LPVMNYTedaieYmnUm8pU7eAeuaZ11qlEGNLxRuXrxRx
         wycCnfcCTieT7z4Aed1zQMn/2vOV5Q8L5Tmv52Vo/fkJ41CdzL/LlKC+JWYTH716JtWk
         3ahNiOvmEBlYnAZUzJJJMnfiXhooV1X+ENefRC3mEgtnPEm3X08ZXzPRKYsB04f0RVNy
         YfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055926; x=1781660726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+GrVwUVnyXoJ3l/Ws8SD/JHytJBmijCAuGEqrIfnVw=;
        b=YUKIQ8FDHf0M91Z+ysk4gbBh0XJnKFZbszubRYghtW7KO+dS3wLusgtPoU2avNFnWt
         EGKrKkW/zLQMdAsrhtRAMRwEskepgsbphXHBhotJivTsAYdZgD8871buGnzk+Ufu5LZP
         sezCs1Js5VdJIRjcDup4r0UfBWW3Zdrqmlihl+k0xye7PYLSCWItGCFmdKB/Oitvlk3x
         oS/g5uclqWSQB0yI6Olf9IOf5gC7ZUSE5H3KkNz1ZfECMLTm08ATwKxVrip6ojMyjqGP
         6SXLwE1z2mGb2YA4r3YbhmaRBgMeCqOnYyXTzXgEBPqgZE7juzMSQyFfkwU0d1KuuT3S
         QuuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qp+7X0d88G2e/WiIglmByFay7ct386aoPzMx7Odf693Z/HO7dlGyuSiPEe7xjY3IFe08DOP+AEBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzop8l4bwV0cFAcmYjO/c9y+Y4tguhQzbFxKIQDZ1nquynJtx9b
	XhK2Hh9SSV+0mvhVkYeQBuKFN/TQx6vyzIQu4QqwI4QiGvTafKuPqQtkBguYeFP8fug=
X-Gm-Gg: Acq92OFPCAaWlefUysroyKWy3L6UrKYkRUMfDsz6m7yfkDYF9t1et6QERj6gpi0hwwQ
	6GJBNKKNw36Kdb/fpbS0/WY0Io+BlV7STB3D9SvD1cjMY8S/cdpH9x/FySNrCvDcyADZoZhXJSi
	qkxlnLmKsNeX3Vf5TtWrzdo8m0C0pqre0WYtFNU5/Vj6wreHREr0NCARGPYLY0FOrIF6/tUhyUs
	56DHkDw0AQFtIZsh0jLLx+WhdCO0dYmYoXd//FZLPKaLOAQVBZHb4LSMAaMQchT8Svo8Z0cAWcN
	kGc55fHc7xCwo+D+CkdGDMWmjLTdHfJmXKO5U9efKi8Q/Xf87Qixzpi1l/KEL3pBcuV+chv2/BT
	8kfQh9DIzmaMl2ACDQm89jQOzgfn8+OQrMfxge2UT3Ny3ECUzULQ+0Nqih/DlarsAQsQXh91xSK
	xp1X14JpFIZ/cqoMBD8P9Q2Qz+gjYdgHC05SyL/fqVq7YdilkaVKHMsPYLgYj9lHrdhF9WSDwmX
	EZcwfEP8xkjfGzN9JAbdeo=
X-Received: by 2002:ac8:7612:0:b0:517:a02f:171a with SMTP id d75a77b69052e-517a02f1d7bmr208979241cf.36.1781055925526;
        Tue, 09 Jun 2026 18:45:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:24 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	rafael@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	rdunlap@infradead.org,
	feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com,
	elver@google.com,
	kuba@kernel.org,
	ebiggers@kernel.org,
	lirongqing@baidu.com,
	paulmck@kernel.org,
	gourry@gourry.net,
	dave.jiang@intel.com,
	jic23@kernel.org,
	xueshuai@linux.alibaba.com,
	kai.huang@intel.com
Subject: [RFC PATCH 0/3] mm/numa: reserve standby NUMA nodes for runtime claiming
Date: Tue,  9 Jun 2026 21:45:14 -0400
Message-ID: <20260610014517.253609-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:rafael@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:paulmck@kernel.org,m:gourry@gourry.net,m:dave.jiang@intel.com,m:jic23@kernel.org,m:xueshuai@linux.alibaba.com,m:kai.huang@intel.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91775-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[gourry.net];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 570236654B1

A NUMA node must be "possible" at __init time to be usable later; a node
that is not described at boot cannot be brought online afterwards.

For memory tiering or isolation it is sometimes desirable to spread
hotplug memory (CXL, GPU, virtio-mem, ...) across more nodes than
firmware describes.  Additionally, some memory devices may provide
more than a single class of memory and need flexibility to redefine
the effective topology at runtime instead of depending on BIOS.

This series adds a way to reserve empty "standby" NUMA nodes at boot
so drivers can place hotplugged memory on distinct nodes later, at
runtime, without those nodes being described by BIOS.

Using the feature
=================
A standby node is an empty, offline-but-possible NUMA node: at boot it
has no memory and no CPUs.  A driver claims one at runtime, brings
memory online on it, and releases it when done.

This series adds 3 ways to reserve standby nodes.

  - numa=standby=N
      Boot parameter.  Reserve N extra empty nodes.  Platform
      independent; works with or without ACPI.

  - CONFIG_ACPI_NUMA_STANDBY_NODES=N
      Reserve N extra empty nodes on ACPI systems (honoured only when
      firmware produces a usable NUMA configuration).

  - CONFIG_ACPI_NUMA_ADD_CFMWS_NODES=K
      Reserve K extra empty nodes per CXL Fixed Memory Window (CEDT
      CFMWS), for CXL topologies that want several nodes behind one
      window.

All three default to off (0 / unset).

Reserved nodes show up in /sys/devices/system/node/possible but not
.../online until a driver claims one and onlines memory on it.

Testing
=======
Built and booted under QEMU (virtme-ng) across a matrix of boot
parameters and topologies:

  - Each reservation source, individually and combined: reserved nodes
    appear as possible-but-offline with no memory, claim/release
    round-trips correctly, and node distances are sane.

    The CFMWS path was exercised with an emulated CXL Type-3 device
    presenting a CEDT/CFMWS.

  - Fallback: when ACPI NUMA init does not produce a usable config,
    no standby nodes are reserved.

  - NUMA emulation (numa=fake): renumbers the node space.

    Standby nodes are created only after the (possibly emulated)
    topology is final, so their ids can never alias emulated nodes.

    numa=fake boots cleanly with the feature enabled and behaves
    identically to a baseline kernel without this series.

    Tested with CONFIG_NUMA_EMU both enabled and disabled, and with
    and without numa=fake on the command line.

  - Default-off builds behave identically to a baseline kernel.

Gregory Price (3):
mm/numa: add exclusive node pool and numa=standby boot parameter
acpi/numa: add CONFIG_ACPI_NUMA_STANDBY_NODES
acpi/numa: add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES

 .../admin-guide/kernel-parameters.txt         |   8 ++
 arch/x86/mm/numa.c                            |   2 +
 drivers/acpi/numa/Kconfig                     |  35 ++++++
 drivers/acpi/numa/srat.c                      |  14 ++-
 drivers/base/arch_numa.c                      |   2 +
 include/linux/numa.h                          |  14 +++
 include/linux/numa_memblks.h                  |   3 +
 mm/numa.c                                     |  90 +++++++++++++
 mm/numa_memblks.c                             | 118 +++++++++++++++++-
 9 files changed, 284 insertions(+), 2 deletions(-)

--
2.54.0



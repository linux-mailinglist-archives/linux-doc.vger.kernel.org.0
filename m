Return-Path: <linux-doc+bounces-96783-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BV5tF11TVmqx3QAAu9opvQ
	(envelope-from <linux-doc+bounces-96783-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:18:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15482756580
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:18:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=CNoqJHkl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96783-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96783-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 448853069ED4
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AB4C0429;
	Tue, 14 Jul 2026 15:15:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083232D97AA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042125; cv=none; b=U7DGALQzPzyzbcHwRK/fhiud7eyiA/Zc/Mk3qYSosybwXctpJXUA21E2Ru0HJVVI2MlVoXAy0LSbZpi7Ju5qJtkK1zTCFylXbyXmho9rqm5/cpeJLFjhLN3/V0jpUZuPHl1R5vff7lzaxfVAaXb6JscZ4WtO4wKuD/hTENcMang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042125; c=relaxed/simple;
	bh=CuAm2Qbad2+WXKfFJI+2wHhyeOkWA/h5aLdYHlm9P2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qxEOwuIOxNamdIv4bVd5mw15EhdKjm7oYoe6i0L7NiqZqDF2JgS5Z+5xdSBudzE+myxSNwt57kAkcucpecCkCWQziOem0mD8ct3Z3PYtoBdBiuLphImF8fwOzzfauCr8ODv5qSlBBumdj0Uh9PE1XFLO0TNcC3cheUSfKIGvavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNoqJHkl; arc=none smtp.client-ip=209.85.210.202
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-848860def2cso4614660b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042122; x=1784646922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14GlidItFhGsteVDeFZQr0b0Q8bnxkhoEthNZJCEcqI=;
        b=CNoqJHklWgUNa0uJQRa6gWAjbX7l5cQUpLhQUWBZedfLTgw5HSndhK8z9cg+T7fjTn
         T1VE89VifZbgnIeI9jQTOonfM7E94NhMiD8IIqdOcPMmVesd7KYP0FeA2wUkP9V8kNgZ
         a4Fz5TjqZB6lw5Gqz5FxlQI/qIanJf92Jfaeg0Kla6TETUaDvZlPKy4FECd5pbIQioE7
         bNJmQ8uKIhCx1OItAr7IrdVuA2F9XHfUIkc9uw36HE7SLGYxM7HNZ76DFz5Y7UgH62dR
         IiYcyLHfKjpnauK2CCCbAkuVlZ18dZk46swv8Lri5G6dUzcHK1TpCGYKIW9a/vQLN1xp
         03NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042122; x=1784646922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14GlidItFhGsteVDeFZQr0b0Q8bnxkhoEthNZJCEcqI=;
        b=CzIz2kPHrg7bnX0bz3B7DauvICaOBSc/nrui0lTGCYCzWpWKBYqjBXgigzVXtyk8sB
         AePgxW9QwYW/6GrYACn+UoA6IDSDMuj7tjLaHVUvvyXG7Lv9gwQGBCLi6Fk4p07midcf
         +59lc3qCIyqImLtaliHhvndnqeiXzjCLfiGzzRmqZ3yeCy+pXj/+egIuieBv9sX8ziYS
         YBKwwVgYMVOq56OvAtMDY1HK1/ra4JsECos6lp4+WaVB6Oy3K/jcIM7MRO0iy1P/yqsi
         F5RwqAUPRRf9yHi/1VIC9c1ZvCv82XovWai+0c2GF423Nc0SzKaQ4ybv+LAIWEwRvaJ4
         y8ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp6XgayxRMLCscVdFGcJhrqQhGhcSSnjGeA+RvoHq94xapiFrombo4Qcu1qBxHJeGd+kqdAl3AL1CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zYoU4YLSeMPmKagpfly8yuSfiefOrzGoyXCbYD/r7/K7wZjc
	ubT0C+XtzVZEJs/n8ri2FdYR0poPcB8VSQQgiyrypfAPe18IJtc+fKN9G0Jsu8waihcg20U0pra
	CoNAM168n7A==
X-Received: from pfoa23.prod.google.com ([2002:aa7:8657:0:b0:847:99d5:ef10])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca3:b0:845:d286:1fbe
 with SMTP id d2e1a72fcca58-848897aa414mr11307298b3a.60.1784042122068; Tue, 14
 Jul 2026 08:15:22 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:57 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-13-vipinsh@google.com>
Subject: [PATCH v5 12/20] docs: liveupdate: Add documentation for VFIO PCI
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96783-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:ajayachandra@nvidia.com,m:alex@shazbot.org,m:amastro@fb.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:bhelgaas@google.com,m:chrisl@kernel.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:dmatlack@google.com,m:graf@amazon.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:jgg@ziepe.ca,m:jrhilke@google.com,m:julianr@linux.ibm.com,m:kees@kernel.org,m:kevin.tian@intel.com,m:leon@kernel.org,m:leonro@nvidia.com,m:lukas@wunner.de,m:mattev@meta.com,m:michal.winiarski@intel.com,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:rananta@google.com,m:rientjes@google.com,m:rodrigo.vivi@intel.com,m:rppt@kernel.org,m:saeedm@nvidia.com,m:schnelle@linux.ibm.com,m:skhan@linuxfoundation.org,m:skhawaja@google.com,m:vipinsh@google.com,m:vivek.kasireddy@intel.com,m:witu@nv
 idia.com,m:yanjun.zhu@linux.dev,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15482756580

From: David Matlack <dmatlack@google.com>

Add documentation for preserving VFIO device files across a Live Update,
generated from the kernel-doc comments in the code.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 Documentation/core-api/liveupdate.rst         |  1 +
 .../driver-api/vfio_pci_liveupdate.rst        | 23 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 Documentation/driver-api/vfio_pci_liveupdate.rst

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 2bce2644eba2..20f1d2e20508 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -38,6 +38,7 @@ The following types of file descriptors can be preserved
    :maxdepth: 1
 
    ../mm/memfd_preservation
+   ../driver-api/vfio_pci_liveupdate
 
 Public API
 ==========
diff --git a/Documentation/driver-api/vfio_pci_liveupdate.rst b/Documentation/driver-api/vfio_pci_liveupdate.rst
new file mode 100644
index 000000000000..1098b84e5ecd
--- /dev/null
+++ b/Documentation/driver-api/vfio_pci_liveupdate.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================================
+VFIO PCI Device Preservation via LUO
+====================================
+
+.. kernel-doc:: drivers/vfio/pci/vfio_pci_liveupdate.c
+   :doc: VFIO PCI Preservation via LUO
+
+VFIO PCI Preservation ABI
+=========================
+
+.. kernel-doc:: include/linux/kho/abi/vfio_pci.h
+   :doc: VFIO PCI Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/vfio_pci.h
+   :internal:
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/core-api/kho/index`
diff --git a/MAINTAINERS b/MAINTAINERS
index 77a35742de0a..43b3165d1c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28328,6 +28328,7 @@ T:	git https://github.com/awilliam/linux-vfio.git
 F:	Documentation/ABI/testing/debugfs-vfio
 F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
 F:	Documentation/driver-api/vfio.rst
+F:	Documentation/driver-api/vfio_pci_liveupdate.rst
 F:	drivers/vfio/
 F:	include/linux/kho/abi/vfio_pci.h
 F:	include/linux/vfio.h
-- 
2.55.0.795.g602f6c329a-goog



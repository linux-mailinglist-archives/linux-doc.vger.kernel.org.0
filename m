Return-Path: <linux-doc+bounces-96343-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qlv2LThkUWpSDwMAu9opvQ
	(envelope-from <linux-doc+bounces-96343-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 23:29:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A22773EE9E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 23:29:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=RNKErh0j;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96343-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96343-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63B04305CAFE
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D649F3BC69D;
	Fri, 10 Jul 2026 21:26:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D333B9D83
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 21:26:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718789; cv=none; b=AAXxLYaoNlvizfLAGq7BDDglHOVTeFNO9EjPQPl5gwhjjthcs2ykXerkC414HC1Bj+Evt3H/QW9Ywuw+STYMueERq6x9TBJRGj2N6I97Pdg2C3RPokCbLmqJb4kTg05lBgxmEg774z/wsxfeiOL0S6oMNyNenu+rWjnxW4dh/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718789; c=relaxed/simple;
	bh=SLWJxUiNoHAtZnCZfKjICsopCm149nKp65AomgWi7OE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RQM1sqtAAapj38LmnQQFaXcefoda2QAd/WSAgKmwI/NWNggTTIcyY7GKQbBfPcxs9UJrArZiKWcbvS+Aust89o8yUCK2R4zO394sbcDrqCXGxDcFxG3O+j5rNtOEoT0UnswHfGO6qKpet51Vk1guJeTFA/IENs25WmS7LKaZIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNKErh0j; arc=none smtp.client-ip=209.85.215.201
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1406477a12.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783718787; x=1784323587; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGoZNXB/ZYxw+GyFT2bV+z2qLaGl3Mol8FyZ542tK3Y=;
        b=RNKErh0jJBlNC3kxoddKs1dJ57CXNnIHSoEcUQROY2oG4vButRCQlwhoA9iaFyAvrx
         9iXvR37eWrJRO2YKTxB+TAfCfFonBrLYMwN3n/KQfrOfoRAIejwEPbsyJfGZTP63EF0V
         yAFyLxUTQwDaRG9KChpQ0YJrvVpgkHzfnXJ/YH7P3YhuVFKAvvOwfs+psrvT+pDXXcJd
         YdpbZznmWjvvytd0tnrsX+o9ZjyBO4VuCk+MmYnm8tBi4aRH61/AARoXJEL3gbYPjUuD
         inhL9I3wA+XWGJOSXuruNHITsUcX6eg8Y4rE/EeSMdGTFJuTsGvV9ClnSTiTLoggRQ3x
         bxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718787; x=1784323587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGoZNXB/ZYxw+GyFT2bV+z2qLaGl3Mol8FyZ542tK3Y=;
        b=pPqEuidPzdDpYZdX/5wnQ3Wl0e0/eoAhpGEilZk2asJx6eY1+069potXCx4ADilvag
         nWxfCyCFfCE7RUiSwoN+hHESQBfFhqOWgfoedK6tBYFY1wvaEOoPOxU7ehibff+B6whX
         IppC7OsqR/ABN+KwwX1QkFUaUm3R+LKyYy29oIz9wt5s08RUG65oZ0yqwxMICZXMeQUV
         IemKs7wlRzsMHYZimeaE7WBdUcza3C1BVZbHRBEvmPIsGzg4eILgI+jdDRVJSHpWyLIV
         kC9C7O6JxaViJiri2fgcIK13kdDcHxINE8vf9Rw93NNtFotD2+ptGtd9zvrnYAtMWXJa
         ZMqw==
X-Forwarded-Encrypted: i=1; AHgh+RoC8oC60kI5dHK85WwRfAm67xUkvQDE1NWWDrY8wRlkEycLY8MwjjUywEQGFhOiVJ8FPzgMhfWCB5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvEpl5IrPqr0r6RcTd7ZGexSMlugcXm+/MxdvyVLL3CALVL8eR
	Ug7JN/beN1ExKeeQU7lhHveGd1LaK5Y4GMDeBlQbqMKhcVBBwiNtald2Q8NUjEdikiCqf4SlIKu
	1WiAA3HTi7UqHcA==
X-Received: from pghx9.prod.google.com ([2002:a63:f709:0:b0:c85:c772:c6a5])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4304:b0:3bf:bde7:d671 with SMTP id adf61e73a8af0-3c11060a6cbmr641192637.20.1783718786556;
 Fri, 10 Jul 2026 14:26:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:26:07 +0000
In-Reply-To: <20260710212616.1351130-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710212616.1351130-5-dmatlack@google.com>
Subject: [PATCH v7 04/12] PCI: liveupdate: Document driver binding responsibilities
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:dmatlack@google.com,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96343-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A22773EE9E

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users. Note that this is only a description
of the current division of responsibilities. These can change in the
future if we decide.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index df6a02240aa4..a067632e70d1 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -70,6 +70,22 @@
  * preserved. These may be relaxed in the future:
  *
  *  * The device cannot be a Virtual Function (VF).
+ *
+ * Driver Binding
+ * ==============
+ *
+ * In the outgoing kernel, it is the driver's responsibility to ensure that it
+ * does not release a device between pci_liveupdate_preserve() and
+ * pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, it is the driver's responsibility to ensure that it
+ * does not release a preserved device between probe() and
+ * pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. i.e. The PCI core does not protect against a
+ * device getting preserved by driver A in the outgoing kernel and then getting
+ * bound to driver B in the incoming kernel. This may change in the future.
  */
 
 #define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
-- 
2.55.0.795.g602f6c329a-goog



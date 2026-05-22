Return-Path: <linux-doc+bounces-89096-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEMzC6S7EGomdAYAu9opvQ
	(envelope-from <linux-doc+bounces-89096-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 22:25:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7105BA022
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 22:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9056F300B9C3
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 20:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2506385D71;
	Fri, 22 May 2026 20:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kti41HZI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62CA384253
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779481458; cv=none; b=dGxqQUvZ/NbHLRsYA9WI2JxSaug//kJ3uMX7Wa4dDrvI6F91b3pSbdWURWtXXwT5zNdHVyB/CeFh+VFZUp3OdcBC/UB6LzKY1xx1p7x4u/aEjN2BxYwUHwCtfcsraWRvDnFsRuwyLu/Cz1j5NkleqrT1IiiBnH1D6WmiesDhhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779481458; c=relaxed/simple;
	bh=YRZsIIO/eWIDHTrvcJinj7ZXVV78Jb+4bEPHJAE5AyU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FJJI4jONcwMJB/8iwOqDRD2TMX4BXc+2jP5O8d+6LqKIg2fTCx0KXia3p38qcrtluvNvoPhXZqlgUZS+SEyoYwEvsb6kN7VHgOyiJf++HQKSZACtcRDEIzUBFwCB45h3Xe5zK1c1yKf1nOIqQTPWILwQpF8j0HIw01tr4NVNvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kti41HZI; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so4682910a91.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779481456; x=1780086256; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lI5mS1q2qOObabKUBbKfb1QQJkZ/uNYoefmzXL5rBmg=;
        b=kti41HZIqxt2dZcw2LHqWpyzMDaystJ57HkAbu4dtrnm7ohTA9MnoQ0uUEjpXV7OvM
         KE+Jf9lZotZOwg5FoMZFVU7qJlWm6/i8Z0vcaNrpPSi3F7yNiRzqGtcMasvFKoVj4S8F
         njg98uUxLdVD8qOrn0RNgJcdlrDZFt1pcVkRsWPO18xcnvDSmSx/Acu6OcA3vIqyHseS
         b1NoCflQXVnYFCrSjnjaxVZVf8Y4qxioaMFojqB4ixhc0a8zC++txvhrnNBTHvN2NE/b
         cFAwQiH1kydblogUDCL2hbojgYtHnZW21A1BnmvI0AYF9HaoHPjaTptE8SVt3wTtTkvd
         XbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779481456; x=1780086256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lI5mS1q2qOObabKUBbKfb1QQJkZ/uNYoefmzXL5rBmg=;
        b=SOIxEZp+DjaIwxAvvedZRrmi9Jvk4S8dzKzsKSfptNdpf8qBEZUtNq0cAC1Q9weglX
         +6ZfQOpV8MkOm/GMlnht1JkkAOb7j62k5JexacVxvr5lYn8SQmChu8KAKJnIdKSGNdxO
         VDrqmiclnwYQfUPwxaKNUNEizqhrhB2cC8Bpng5F8aTLn8UnrPEDMRArHesLGKxfD713
         2P9cNgX4/Qd4fckqKa8eHr8FBAWaraFkVYWI7CPRqNbhLhUTPk5DEV/FO6DZ4KY4tarn
         jpSs5oXHybL4pT9jSz6aS0T2CZ5RSulsM3AIvDh66Q5yf67psC7t8jCBRFBiELWsFZGT
         20qg==
X-Forwarded-Encrypted: i=1; AFNElJ93av7C/Z2O87hfXn/03nT+m7goFhDpm9CC8M+EAcAazftPRX1ZJS+YU5dKoujFF4vYzs5o5e8q45A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKS2g5XdVAhudAiFoox4s6KxkkRlR6f1JQm6Svq9hMiH5kLCU4
	OkeP822kZ5/GjLFcllNBFII3atqN05E33lYBwjyWIPIYTHj5KXCMqoDVYqukoHnlutsocW5UbXz
	MdY6NozdAONJbpw==
X-Received: from pjyv15.prod.google.com ([2002:a17:90a:e98f:b0:365:ca4c:7afb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a8e:b0:368:78da:803 with SMTP id 98e67ed59e1d1-36a674f81fbmr5156953a91.12.1779481455496;
 Fri, 22 May 2026 13:24:15 -0700 (PDT)
Date: Fri, 22 May 2026 20:24:02 +0000
In-Reply-To: <20260522202410.3104264-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260522202410.3104264-5-dmatlack@google.com>
Subject: [PATCH v6 04/12] PCI: liveupdate: Document driver binding responsibilities
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89096-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C7105BA022
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users. Note that this is only a description
of the current division of responsibilities. These can change in the
future if we decide.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 96c43b84532c..4f2ec6ffdd16 100644
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
+ * bound to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.54.0.746.g67dd491aae-goog



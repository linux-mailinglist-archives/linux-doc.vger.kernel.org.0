Return-Path: <linux-doc+bounces-77457-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICq0L9z3o2ksTQUAu9opvQ
	(envelope-from <linux-doc+bounces-77457-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 09:25:00 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2141CECEA
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 09:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F0F2301751F
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DF932C928;
	Sun,  1 Mar 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiI89ZO6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA47175A8A
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772353153; cv=none; b=ZhfG41y51kMk7bUz2QDgPFslSLU0bi4wsChYjBeFtJ8B7+uiMqc6+y9tOTJ3I1EWve3ZNrMCK7QLSMDybuJBQAn/SfxFnVCzXk6dD9kKN/N6Av5wgeHjWVs50ezgHOdt0WZ3CG/hqd4VZJXMqpIi4C6Nf1kgZiGp17ecBT2RsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772353153; c=relaxed/simple;
	bh=HAn8Q0qD46S52DsoD8KOFk0HLdGDwh1bHqGsoxSYe94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLv6Vv1SXUEHMF8QTC8Gm/pDW27j/a9MdCg9nLgsDUTn5PHx3EYf4ZmRL9WxZ5beqHFfT/dUKmnHreEvNrzDh6/13GDMwc4lKfJs/5Wz1yBcF9ww4Au8vhzoo/ze+lW7jV1SQcDApupkxNLfcWdK8IpmsKYlpRkW/AZ3vk/zL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiI89ZO6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2addb31945aso25869135ad.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772353151; x=1772957951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=RiI89ZO6bf8DdzRa0ALwKekUUjpGzfR6pYCQ0aOfscu91SC4CRDyB089PXvo1eo5c8
         NRniHDOFUbuYgRaXbCfsfNlzlhvhpTeGV7qy43hjxViq9q/1XpL/8ZBNkLMrcHz08DQm
         RbtJUr09nl66HD5LwzD+Erdr7ayw2x7gcjKw7nX38rMTfX2Tzn0SVKyTey9sbnWuVChY
         kL6m7q9X287632eN4HvfjqMDpkE1ZhRQIR57m8lMb27Lc9CFeknSJECgQH3yRG9bMAuH
         XM2mT1SQgcb4DyJat8fZT+PeDhncadqRsBjpURxqWYmrV3JBqJ9+u9ObePwY9pvmUcq1
         LCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772353151; x=1772957951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=Mm9AX7vQltz1gmJzgxPxPdwvZPrdxFsvrFA/SbhdxBpZPaWUAuOrpl+JVaq3hKraX1
         54jwIAvoZNHRPBrqK076Uga+Kju+Gv0uRm4kIvizaTwb+U2EInhOCdL2KASXswmBdyQT
         lGQd8n9PYVM+YiHbImTcM3/v4GyItRtL3gJx16Sfq6bGzXVDTEzOHiTK3wGsTlPC7aET
         R6YaFWocJrCvVS+ycjlnOiLVzkFkmlley6tKWt7fx6lBqS42u5asE7RpdTcrR8TiLl5E
         MmrJ5o3f4G/v+O+Nr+X43BLmd093aoFDYEPHbUWfsPeNuT3pgsw7qlsX4mfZrXe7iq3p
         rePA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Cqg5aSqWyRAYR5NVhhTPnizOtfJXO8TP3yunuFXqsqCeNDxMXzqJ6FXBOkHFlDmqu5agD+HL+Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhXrGY0gQaTW6HBJ9kW3hIBurI6bPYsVyN8AXCMc1qwDb3jer
	hl+5Nojj0IVhWpDnvpvMvj3csryvPZBbY7yYXdXoyiuE4c3f4B+EQU7X
X-Gm-Gg: ATEYQzydiMI7M2t66GXlvtyXzD0Apm1vsppLzuxPQCjkNnepV5jZXNmfsLIA/Ofc4yK
	9FDBtWVOObUAA4h8nd7Qyyn0IMzoMo98AV1ZwRqjzKXULf1PXGgO3R7Arktzo0PGMtSqYUr8DyL
	7bna3MB0Rv8Hy7yXMnJQFYDCXyvyIr8pruuiBWvC6PwMPmlbbgWUtRe5aKJH9rqSRkpD3xB8iaQ
	xvinIqAkzH58Vk8wq6d0kWmCVBiFnb1ttrRw2Q7V1GNVq4N7mBAFXx5uFvLb4rbqFdKXtqsyGap
	lahuV1rcGeFVAulg3GJ9eAecln0cy45yHtPjMcMPD/1hhHZLmf830KT+Zros3CMaX18/TQjczX9
	esLjxNHxd34+3ct14SnCQEWRETSM9r5FM1kJqRYBiWBQYFjT9fqoMFvb0X6UNJwg8QnRC6FGHIe
	EL1zbPahiWzVon0qoJizFWYaTR70g=
X-Received: by 2002:a17:903:947:b0:2a3:bf9d:9399 with SMTP id d9443c01a7336-2ae2e47fee8mr81583175ad.35.1772353150536;
        Sun, 01 Mar 2026 00:19:10 -0800 (PST)
Received: from linux-dev.. ([104.28.153.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f277sm137489055ad.55.2026.03.01.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:19:10 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: pbonzini@redhat.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Date: Sun,  1 Mar 2026 08:18:51 +0000
Message-ID: <20260301081851.11533-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[104.28.153.21:received];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-77457-lists,linux-doc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[afkarizergaw12@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.786];
	TAGGED_RCPT(0.00)[linux-doc];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A2141CECEA
X-Rspamd-Action: no action

Add missing commas after "e.g." and "i.e." in the KVM API
documentation to improve readability and follow standard
punctuation usage.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 Documentation/virt/kvm/api.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fc5736839edd..c8500f0e913a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6346,12 +6346,12 @@ A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) an
 userspace_addr (shared memory).  However, "valid" for userspace_addr simply
 means that the address itself must be a legal userspace address.  The backing
 mapping for userspace_addr is not required to be valid/populated at the time of
-KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
+KVM_SET_USER_MEMORY_REGION2, e.g., shared memory can be lazily mapped/allocated
 on-demand.
 
-When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
+When mapping a gfn into the guest, KVM selects shared vs. private, i.e., consumes
 userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
-state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
+state.  At VM creation time, all memory is shared, i.e., the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
-- 
2.43.0



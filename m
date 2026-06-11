Return-Path: <linux-doc+bounces-92048-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pPJMOmAYK2pP2gMAu9opvQ
	(envelope-from <linux-doc+bounces-92048-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 22:19:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C6675129
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 22:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZAEMLVPV;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92048-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92048-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A844F3010DDE
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 20:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B28386423;
	Thu, 11 Jun 2026 20:15:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D739DBFF
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 20:15:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208913; cv=none; b=iJYNH3sWKr7N/SbqUBz422RC2AuHWkj1zMQEUKj1Zxu/k/qsXoe0RewnBZU33kFeIMy+8RM0oyWipgy2Y7+zAP0qqmtVPriisyUXgFI0EiGf3uuONR72eS/EN5esdZqU9k4zsAhSS9ZIuPVTbqeSik10AMClXNYD+8IueigY8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208913; c=relaxed/simple;
	bh=6uRwmcArNmpcYHUxfVzJ1KUTNe7nDEt3Iouczp4pFJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYOIjaTs0qoF/PaLJYviSL9BcrT/XnVEXRThlGcB8MEqQ7jZDAfqSeEBXp2DX61GOm9Q1jte0ZWQ3S2nE/FO8z5D84EFWH0Z8+B0vqC+dHF0BAa35MZb7Yzb1MN23W4uj5HAORT5rlh9mtqKUE4vd4uXJ+xg0P0+lRgzIvpRKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAEMLVPV; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so247744a91.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208911; x=1781813711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=ZAEMLVPV0UlbRsLIzNXCpfzYOHCBmWjUbVCtnKbKfqxxDwn8qqBrMmrXJVK7BoPQBk
         0Tt5vB20QtCmRMKcUNrhM6rjwlD+4hSSNQBQXnG6cxNmZ78g6fH8Z1nbLTFlSBdFjdtv
         cfiC5srGizBLOJ4FMgJvls1gubOw/ZUzRbwDL1XJrQtbjsaNjqvv2YQ2gtvihVrdWfax
         smVgQKX9TOn1EBd0HUpUD9sOCxGlHBf76hwfeleg+izX3pFrjyCEczXCdRPlJbh55hcN
         mu5ITCrANYOZ1eWgkO/RoLqDl+9QjKGxZgbpqrbqhL6Tj6bCi9O0gSZ46OOJGNavm/V5
         /jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208911; x=1781813711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=HTIgye/Eedu6miPebsfPrc0WE48DwYuj7Qkxn5gnhKaR83DMpYFqUI8KW104SlFSNo
         wmD74jPKQ64GEaDRWGg85FjE06oLEBXC+utMFFznrF+xTVWfvuKEV+1pTmsXGiNBlYoR
         5b7e0quTeSQ13vv/3/1xMkOr8Mg/BYMj5WC75IJQQf+Z9/JxZPIor8ynFpLJAq7S7V7/
         HPNsz+6LW/H7OShIcJhDalFt27NfXvOw+3CW3liD/IhxYLUGPEp7NWWM/UiEm2ZeprYY
         sHs4hdJ1nmNHg4n/TULXKEF5Hki/Ggvh9y4qhrGPhJ8RwgtdutHAw0PhJZ3zADuh4Lo2
         rfRg==
X-Gm-Message-State: AOJu0YzrxH7KudJbTDpXUxlIKuyiXi2R4Ij/BgRhLXIp0cszU1os3nqu
	JeV9H36T8U9iY5E8hOgiPFvCGR1qg4Wvs7do7d9+6iQazpx0Ar0vQDf7
X-Gm-Gg: Acq92OES/vVjg8vAV3sGK6cmtonA+C2U6zMg6lmODc6TeNm+2/pZU8N7tPMCa3hq/4L
	pAjamymVcr3ze8fxpX7flYf8FUpZNv2BnqmD5OexoiBUcHyq1bqQJHU/5ovSy1omx0AtrR0gEc9
	t3xkXNwxegqmajyM73aC8MU43TqKosYWqi+htroac2ta8hqX9ZhxUZK+QPjYqdaBpLfuQ8ymVlG
	s64NaoPAWODE7L/feK203K8sddESBXxInWLcZT+fhHioAW0oN0cbxyUlvONigFbhRxIh49/1XxH
	+Uy1IGbjt2zNEAsgLHjoqFUiDXxvWZsJjU2v2dAN5E5YhpWQmD85Ps7Di98Npvu2O1Hm/o23bfe
	TNlGY0DUDZHnvxIlWmjDVZFs7heChf+o3pv3cspb4L59ozNhOYFiYKNS5fLi0+eAj0aywR70prA
	==
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr48032165ad.20.1781208911134;
        Thu, 11 Jun 2026 13:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:52 -0400
Subject: [PATCH v4 15/16] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-15-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=6uRwmcArNmpcYHUxfVzJ1KUTNe7nDEt3Iouczp4pFJc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscP8W/I7a44KTu7eNGUm/x/V9O7U55x9jvfX8IaI1
 ssc8jHtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIloMTD8T3wWVc9/4Hm9Y7yr
 eVbGq8q1TtuvXvyga7K41THqj6TMdYb/nt9nPzbeIJA1uXnNe+Wgo6cy8mddueVw6fH5C27BBTP
 2cwAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92048-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:conor@kernel.org,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:palmer@sifive.com,m:docular.xu@gmail.com,m:andrew.jones@oss.qualcomm.com,m:krzk@kernel.org,m:docularxu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[docularxu@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,sifive.com,kernel.org,lists.linux.dev,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[docularxu@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F34C6675129

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0



Return-Path: <linux-doc+bounces-92046-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OHB5HCUYK2o72gMAu9opvQ
	(envelope-from <linux-doc+bounces-92046-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 22:18:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 810026750EF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 22:18:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=R25zVrp1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92046-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92046-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBD2E305453D
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 20:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DC53A3E98;
	Thu, 11 Jun 2026 20:14:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915A3A0EA2
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 20:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208896; cv=none; b=tTlt/22EL/en4Cj2f9/QiYr+8wZSsSr+mr8u+qhbgqA7kTFCUR9JZ0CHuNaFQVIvQZWGl4Z5mcM4GrWhdsmB7BZPbr5aQKO9ok6MNItvQixg0RPBLZYJwFx0KnGKMvjCY7fSvgwWn0teINqV11HDb6LCEqRH6MXVME0k6iUoIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208896; c=relaxed/simple;
	bh=KC+KeP2JowBZu3gamRptd0wuDLOAfNANiP0q+wCsnA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjP1RmQOeQDF4qVEaLw8fiIRr617y9VmN6CUnUOIYX0qjnoJmvXXULUqspDMUqKofagFPa9HCrI+HtXzWUNsK3X7ssWM+HgA80VrbIZN8WInqhQXeAhiLlkbbYerStm0HBoHiwPlGQbWqqCdvCzBFvmBFkJhsaHHxtn5HlsP9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R25zVrp1; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c3546924so1975875ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208894; x=1781813694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=R25zVrp17BCEqRvVoxi8QbpyhsuYRx2YZ5r//Ak6kUxL8XdBJ89lQ2egfQBazBcsZx
         NYwe7G6qlbQ0Dqz5qIPzI384UCHCMGgEpC+KJlAC/R3Xj8TIMME2ogeNhavkjQc5ReAy
         iStnfY/NuPdbhI02oJIey+HkAavNudVe3hwMSFEhpfDuZXDjH06e+9aWhuTXMDQ27U0d
         vhsGGSI23PRlsWFuQxmcCI9XmCORFP/+rc1FVKeWI7sWDi8WrKX7sn2nBR3xuRj0ZOOg
         f42hjcv9cxahcgR9XXgOYOsZcnwe6+Fjk82B2QY6gY+NoRyNEqqpDxADygBntVRSExj4
         4OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208894; x=1781813694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=rFMc+E5SE85iuH4ZK5INZ6HcidC6CxEmr+KScUQ0tqTTkiCgR6qUB4L8GL/A5o6uYh
         M7B29rOZwyje3KwYKCvSwkl9SAklcdaVCDYNCDF1sf6muykshMLZRZfISpO+LN4cJJu1
         jIVmtQUj4RjdAa6/uM5urvdBsWD2S/QbG289ixC33DKRDXMROsODJjdW9JcTCXmzU154
         VWoxoJMNwN7O/gtlXRwy2e/qOux28TBObMW66q63T9IOu7oxus2+VUYOXNKwhWdD7t4T
         yYGofvx5KYc4m/x+XJeWE7HRVPxb/NmsXGHEDT5tArvQDVV8n1aLs4bDQUmgOiPbDJ79
         FN3A==
X-Gm-Message-State: AOJu0YxjVMbu74jhrRHW39QD+/LlOkuYDALNNMufnDcY7qgzHLngA53F
	FHdp1TxqF1fmwUD/zPI+AjAMbrVwG9MXjVaHZKPVwd0nu9TL0ls6nc65
X-Gm-Gg: Acq92OFWfwwSzw2Fa1l9XRfZ1QymNDf/Ngc9Aaql/m5aTtuDtlFpT016VTNTUuPyIj3
	yDGX57ZDcRjvEMw+NCxnsocu4aMOp+TpF96JK0NstdB2s+0o26UIINF/c8tnVhcA4sSFaXxg4IN
	eDrxUAT7oRa5gvvdKUPq284dYn2IVukpoFxorExH2MENv88nnYYbFS82SXZqA+xcrdk3IeojxMi
	bQwCvR01RCg0CYt1ABZn86DraO/gO0CU4agju1DTxhZLwBxAV5gCfuX27fgDlrIs385eoRoej51
	NI7ODNT2YPXXHLqTPW98zN95vgib0d2knD4h/GCaAjdA+HqRA1Ei+Q6buPFDz8Y5iw0WfXz9mG7
	+wavq9FKPdfvGlpqNobTxutlBg4nMQOB1MtMvMJ/FcSVUtrMSWqu9z0KhctIubtkHU8jy1GdcpA
	==
X-Received: by 2002:a17:902:e78b:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c2f092ad9dmr52178155ad.9.1781208894311;
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:50 -0400
Subject: [PATCH v4 13/16] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-13-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=aIDENBFY4Tz1hqn0W61EOefEH19QM+HExbm6+TQTBeI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscO7srcsmPNoumimeNn3glenWfu11coN68yXLxOYZ
 /5uzdfPHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjAReV6G/yUubxnmvF/+6MZL
 l8/SJWbvGHYUuhnHuDRumFUzqUhm+xuG/wlJztWWR8uzsl2qWjYVRu3cF/DJ6M3TP4cnOldPNJr
 zmx0A
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
	TAGGED_FROM(0.00)[bounces-92046-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 810026750EF

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0



Return-Path: <linux-doc+bounces-93870-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CI9+BsyPQWq3sAkAu9opvQ
	(envelope-from <linux-doc+bounces-93870-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 23:19:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A139A6D4F97
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 23:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hA6ftf0j;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93870-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93870-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14D383013B61
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 21:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD23B7741;
	Sun, 28 Jun 2026 21:18:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6E3B71B3;
	Sun, 28 Jun 2026 21:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782681529; cv=none; b=O3KPa2nJ7K+ieu4zuyYUGLrimI3rOdLjaji4vO5GoC7s4uPkeaJzKdU3wxQzYWTfuqRezhKVWAFkwTD5BeIHyCNLx8TV7tRUmTpxkA6m7oWxDwmUGFEUZQYOPoHudsidAyqX1hojdIs/T3wuuEtNl/HP0Kyb/dF2MCexUfGnOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782681529; c=relaxed/simple;
	bh=gXhxU2VkYK59yFf9zOY6NFxDAzyh840CJktrIQQQrQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acrJ504S0wZKaZWNbTMajIstuxCrqfe2WfpUquJOhBiGp2hYrKtWneTW+om02E9dB4a7oMk93IRwP3phW5xX6eXDPaRg/+FzzBKPnTb0QOoyaGopqNSnPoQn67Pn9JRKXUwFEwrFv0Go83v02YtipBkY0JL6JcU3f7z2dukMDK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA6ftf0j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F5E1F00ADB;
	Sun, 28 Jun 2026 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782681528;
	bh=+tvwm90MVOaOiG5wcpHdQz/SS/6LBEj1aYW9iza5lLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hA6ftf0jcJ3EAIVXQ14i2lM/eIrMinPZtx1uZVursU7JGubnsp3fIQ0a0EYKr3fg1
	 MVgZQebrJQuPaVNkRKiNfBLjYzwhTrUkbn6XUpiaTrOQWfX6C7AKy4NFjO4RlGQP8p
	 /f/ZZ4laQlVnVrWeEBYMs/RkEmF+cQfkWXCOohIK3OCSLFEuX56skZ7jh+En6HHDF8
	 +RLlDI+ti3yDZavt7CAqepbJvptY5Z/ifzSf3Rg/VqEgsFVaZ6bXGXb9UTbYvR2dyS
	 26+cndilFRjBP0OWrvC6q0orVVOsZA0xn2I78LpuhH+v7AGeitwFzA6PZu70g9eNMC
	 2WfagiF0NmfrA==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 28 Jun 2026 14:18:17 -0700
Subject: [PATCH v3 6/8] riscv: Enable resctrl filesystem for Ssqosid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-dfustini-atl-sc-cbqri-dt-v3-6-c9c1342fe3cf@kernel.org>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
In-Reply-To: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=fustini@kernel.org;
 h=from:subject:message-id; bh=gXhxU2VkYK59yFf9zOY6NFxDAzyh840CJktrIQQQrQU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQ59m/eeKJETWrxFr11z9c+UE2anzJH9bfca4Z5Jzf9N
 XhRIJFV0VHKwiDGxSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYyISjjAx9rocY3hxNdBN9
 cKd55YODQaG2aWt9GD89Y+wPnL/LeYkuI0PXBF2/oqL7ju2F0bZH6tafzv2fYTr/wRaV76ExJ7d
 l1HMCAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93870-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghua.yu@intel.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:fustini@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger
 .kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,intel.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,sifive.com,linutronix.de,bytedance.com];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A139A6D4F97

RISCV_ISA_SSQOSID selects ARCH_HAS_CPU_RESCTRL and RISCV_CBQRI
unconditionally. ARCH_HAS_CPU_RESCTRL makes RESCTRL_FS available on
RISC-V, and RISCV_CBQRI builds the CBQRI core that backs it.

The resctrl filesystem integration is gated separately by
RISCV_CBQRI_RESCTRL_FS, a silent option that defaults to y when both
RISCV_CBQRI and RESCTRL_FS are enabled. Enabling the resctrl filesystem
itself stays a user choice via the standard fs/Kconfig MISC_FILESYSTEMS
menu.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee586925f972..9c28bcbc29dc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -594,6 +594,8 @@ config RISCV_ISA_SSQOSID
 	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
 	depends on 64BIT
 	default n
+	select ARCH_HAS_CPU_RESCTRL
+	select RISCV_CBQRI
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.43.0



Return-Path: <linux-doc+bounces-96855-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OMPoNi7TVmqJBgEAu9opvQ
	(envelope-from <linux-doc+bounces-96855-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:24:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C6759AC5
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iVE6HD3R;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96855-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96855-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FCA030B11CC
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 00:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69851248891;
	Wed, 15 Jul 2026 00:23:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BA1F4C96;
	Wed, 15 Jul 2026 00:23:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784075029; cv=none; b=c8o+oj+H5sYsDzBqTGcBccJ3Zr/37Vb2ZVCL4ej6ap8d+Ehzvbj8dwVtkxDztmrVP5OidpHerQAPSe6cP3ULFr4fwaQ50mQkb5vle/sTMUol83Pqu2NRsC4A37k1j1IIWffNWTQKvIbJT42u5G7ADlcvLwW8WWe/7HE6l7Y72cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784075029; c=relaxed/simple;
	bh=ebgjBWWGoiz8bFe8aM1k+b6Koj+oeRqpY3Kqeizgd4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruIBk/z3pPG1aQnBiAvFel+AKl9BQ9ySN8WdKB6YRm4OEmnCaKY1lgwZu/GPNxiwg1DHPmUvS6To923LT9V2GN+Ob/TJGmt1GxmFd0rRXnv7iMyuvfbsKHiX3d8RU+rz92lNRmuNRnv3VGWhZpuymqJtWRAzQ0OB2mRoUkSUTbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVE6HD3R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE11F00ACA;
	Wed, 15 Jul 2026 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784075026;
	bh=YDA0Kty7PQNT08Qk9i1E78Ah1lcxCYarON76a0LRZ+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iVE6HD3RFWcV/W8PADwEm6ZJVJoOB2cQii4UyA0zs+rpBSx7Wqb+fHFV/NVSKd+Qa
	 iFupWMYkZwrE/XRBjVypZz7QBnX7haRf+Bgb88540rU2wU1fgxkUs0Ge9u4G2Dh6Oz
	 7kZiHPlTtPafUHr51URy+WjpmLLh7JaQJnC/HqthkSDeofihvOnteB/vk7y+yjtHmz
	 IcCqrQNnNvF2BG+sFDb6haZy0DADu4hvy5yezCdZfAm8Ms6qg063gbCjYsXNaGeWtw
	 Qwrmj+zqZLSJ/gYl4jgY3YwzOmF2aoceoPHyxT12beK0tveZq/I0lxBRFseUGiK1mH
	 273QDOHTQj5YQ==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Jul 2026 17:23:23 -0700
Subject: [PATCH v5 1/8] dt-bindings: riscv: Add Ssqosid extension
 description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dfustini-atl-sc-cbqri-dt-v5-1-b0ae7e9c932e@kernel.org>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
In-Reply-To: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
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
 yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ebgjBWWGoiz8bFe8aM1k+b6Koj+oeRqpY3Kqeizgd4c=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSFXRYo8a/yDzd+sO3LC/Yqo977K8tizzE+9rApYgnaJ
 nJ9wuELHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJHLNg+KdvdO3V7hkbnQ/s
 LzBTk+XpsihetcPLMSztbPhOhnPS+v8ZfjGlSWaFCf/WSGRf1L197fec7giZsw8vVs0Iejd/3qV
 fm/gB
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghuay@nvidia.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:zhangzhanpeng.jasper@bytedance.com,m:fustini@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-de
 vel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_TO(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,nvidia.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,intel.com,sifive.com,linutronix.de,bytedance.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96855-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 404C6759AC5

Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
extension v1.0.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..c9dc5d80c0ea 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The standard Ssqosid extension for Quality of Service ID is
+            ratified as v1.0 in commit d9c616497fde ("Merge pull
+            request #7 from ved-rivos/Ratified") of riscv-ssqosid.
+
         - const: ssstateen
           description: |
             The standard Ssstateen extension for supervisor-mode view of the

-- 
2.43.0



Return-Path: <linux-doc+bounces-95640-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I5BnEpv9TWo7BQIAu9opvQ
	(envelope-from <linux-doc+bounces-95640-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 09:34:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 155AC722AE2
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 09:34:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KwqlhTDa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95640-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95640-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C47693002915
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 07:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E9A3ED11A;
	Wed,  8 Jul 2026 07:30:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7A3E1203;
	Wed,  8 Jul 2026 07:30:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495847; cv=none; b=GQusanU0HDUW8qVhByT+93qH1PsCb97z+A5kqiAMk88eN6umGEbeS1ZwRD8B8Xs9vcjUwqw2TJsiX6puSJqfM8sWHnPe5MfU3REZ/xXuCzJ1pTB3WNrq5uAqCxZOztxk4LmTB2uDx2q1AcPfXuVWULmYoZOsB0v5j+KC8EQ/24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495847; c=relaxed/simple;
	bh=N/ejXwA4KZO0DC2Z/HcSEn8yZfsKlTnk2ktXyvCQZtY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kW/MwQUGCd+9T2UGEgUWUCIz/NQKmbMutPSDhm+AwBxj62DsBdPqPP390AZE0ZvNHTvqUNYgUDjSAdM7bK5qJvg6+HnFrKCyqCBlMYh6sSxzRnGz9qbZfkY33KXL/DJLknYj+iWjCQtxk0IuwcUWTakvIX6UCXxL3p6C69JWh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwqlhTDa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D21F00A3A;
	Wed,  8 Jul 2026 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495828;
	bh=6XPCFtqPmjIBOfArNEHzU0v8CdudEoKzUfONk1mxyWs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KwqlhTDaQqRylyKDCQc64J/xr0ZZUKLtdJ0u//WfIwq01nHTSJc9ZbSmfhk+5Csmv
	 7PcMLRDYbGYCbJGFvsWGEIxgn6twSeIUnY/IVcHt/hqJFmsjV3B+Dw5xpxf1pjYB6P
	 yePp4LiNzte683pBkGJZ8dKsnoAP4ycLLk+bsnQc4MAu4kr/u1AwhDpvfR73nebWGG
	 Z5Gi6fYgoiDkKNDAMw/Bd3rXsHKZZXiP/m7kI03ynStt3Vw4jsOjwHGtDIMElfASLY
	 crnEPX04QPhKnEwnlAUlTYQ5pNiF04+Rdlf7/uQfbRhSBxahJDfA3pSJqT7wEkyYFZ
	 i0oLb+JsvykwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB53926257;
	Wed,  8 Jul 2026 07:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/17] riscv: hwprobe: Expose RVA23U64 base behavior
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <178349580738.2343578.10382638352162559486.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 07:30:07 +0000
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net,
 skhan@linuxfoundation.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, zong.li@sifive.com, debug@rivosinc.com,
 anup@brainfault.org, atish.patra@linux.dev, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@kernel.org,
 unicorn_wang@outlook.com, inochiama@gmail.com, chen.wang@linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, conor@kernel.org,
 jtaubepe@redhat.com, thecharlesjenkins@gmail.com,
 andrew.jones@oss.qualcomm.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, conor.dooley@microchip.com,
 charlie@rivosinc.com, jesse@rivosinc.com, qingwei.hu@bytedance.com,
 andybnac@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com,vger.kernel.org,redhat.com,oss.qualcomm.com,lists.linux.dev,microchip.com,bytedance.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95640-lists,linux-doc=lfdr.de,linux-riscv];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:docular.xu@gmail.com,m:linux-riscv@lists.infradead.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:chen.wang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:conor@kernel.org,m:jtaubepe@redhat.com,m:thecharlesjenkins@gmail.com,m:andrew.jones@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:conor.dooley@microchip.com,m:charlie@rivosinc.com,m:jesse@rivosinc.com,m:qingwei.hu@bytedance.com,m:andybnac@gmail.com,m:docularxu@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 155AC722AE2

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 01 Jul 2026 08:52:13 -0400 you wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
> check for RVA23U64 conformance in one call, instead of walking hwprobe +
> prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class bases (IMA
> and RVA23U64) from the kernel's ISA extension bitmap at init time, and
> surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
> can add RVA23S64, and backward RVA22 / RVA20 detection, to
> riscv_set_isa_bases() without changes to the surrounding code.
> 
> [...]

Here is the summary with links:
  - [v5,01/17] dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
    https://git.kernel.org/riscv/c/e0776dde101a
  - [v5,02/17] riscv: hwprobe.rst: Make indentation consistent
    https://git.kernel.org/riscv/c/dbff3646369c
  - [v5,03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
    https://git.kernel.org/riscv/c/a914034334c4
  - [v5,04/17] riscv: Standardize extension capitalization
    (no matching commit)
  - [v5,05/17] riscv: Add Zicclsm to cpufeature and hwprobe
    (no matching commit)
  - [v5,06/17] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
    (no matching commit)
  - [v5,07/17] riscv: Add B to hwcap and hwprobe
    (no matching commit)
  - [v5,08/17] dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
    (no matching commit)
  - [v5,09/17] dt-bindings: riscv: Add Zic64b extension description
    (no matching commit)
  - [v5,10/17] riscv: Add Zic64b to cpufeature and hwprobe
    (no matching commit)
  - [v5,11/17] riscv: dts: spacemit: k3: Add Zic64b ISA extension
    (no matching commit)
  - [v5,12/17] riscv: dts: spacemit: k1: Add Zic64b ISA extension
    (no matching commit)
  - [v5,13/17] riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
    (no matching commit)
  - [v5,14/17] riscv: Add a getter for user PMLEN support
    (no matching commit)
  - [v5,15/17] riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
    (no matching commit)
  - [v5,16/17] riscv: cpu: Output isa bases lines in cpuinfo
    (no matching commit)
  - [v5,17/17] riscv: hwprobe: Introduce rva23u64 base behavior
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




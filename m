Return-Path: <linux-doc+bounces-93837-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yB6kDoZHQGpfeQkAu9opvQ
	(envelope-from <linux-doc+bounces-93837-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 23:58:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD16D2BC1
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 23:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JogHNs31;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93837-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93837-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0ADB03007B3C
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 21:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E190C3603EB;
	Sat, 27 Jun 2026 21:58:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C042F3C37;
	Sat, 27 Jun 2026 21:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782597501; cv=none; b=EF4/SyovTBCwBhOg6jSUmbyYFLgJZnsff+kVgg+B9lbO5U6Sp2f3U7SRiprqqqo3V2E/Cz3lK2F3xgKsxJU3G9IGzxkLN720xg3BeL6wRMfwKFX9uGsnw6t8FsYnKelPCuUS6gVdCOUCurYGltJnXNILEFGs6TBhjJPdBIdW53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782597501; c=relaxed/simple;
	bh=tsvLHYLTP2MEfohLcsX7m8kz/tecI3JDLWgbvWMiWsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN3N6YGQRUq84fCuYzpDr93pBgTZLWJBmfDDZXRAmtKFCLmpgzoTvCuxXPU2BpWmqPH3PeMD6nbyqWgYaXEu0hGgBzGVVJ12pt+weLNjiKKZ3JnDNNLx82WnlXu9H4xQQFZ9ULmROKwOlzwrVZfrIiUjd1M76xeiXJ0D3lV61ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JogHNs31; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF02E1F000E9;
	Sat, 27 Jun 2026 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782597500;
	bh=uZXwtqYNMN/pWvO18BeaeKY5yndoYWWKV6GT+91H/4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JogHNs31si+WmhGKyhRfRw5b8Ct3uNp1lUblX4mn+NmJtK1bG+yhQKUhi2s9s3Xmy
	 nbvCiGtp9TaRpTk1dTHxXIbbBZH3xSlkI6t4G2IesjVQ6NIxWYhgNMmJojWNsHI7Ak
	 v1nY5Lmx9/9XfNJ23VWXgHqk6wGv4+NNryShajW7Rj7ZKS0XkbrE3dRxI/zjHcmXZv
	 DH+KPnZsy3qb8YgLSzNvlAwc8imXXK6KDbXE+Nyvhc6QxHHxvP61EwbHyoRa5mIY6B
	 hWIAwzVvVNrXVuod5mYgr+cvglnWNGgNOey3UfvyFHPSbQQ6TsxYNJ5aClN8PTwV+u
	 OiJcE3U3WiL2w==
Date: Sat, 27 Jun 2026 14:58:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v2 3/8] riscv: Add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <akBHesvINKE+nCXF@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
 <CAEEQ3wkhiE=TdFTzEn39GVWSgGnaN0raBpmd=6sYaoh304LNBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3wkhiE=TdFTzEn39GVWSgGnaN0raBpmd=6sYaoh304LNBg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cuiyunhui@bytedance.com,m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghua.yu@intel.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:conor@k
 ernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93837-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,intel.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,sifive.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23CD16D2BC1

On Sat, Jun 27, 2026 at 05:38:28PM +0800, yunhui cui wrote:
> Hi Drew,
> 
> On Thu, Jun 25, 2026 at 9:40 AM Drew Fustini <fustini@kernel.org> wrote:
[..]
> > +config RISCV_ISA_SSQOSID
> > +       bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> > +       depends on 64BIT
> 
> Why is 64BIT required here?

Sashiko raised many potential issues related to RV32 in reviews of my
RFC series: 

v3: https://sashiko.dev/#/patchset/20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a%40kernel.org
v4: https://sashiko.dev/#/patchset/20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683%40kernel.org
v5: https://sashiko.dev/#/patchset/20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe%40kernel.org
v6: https://sashiko.dev/#/patchset/20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a%40kernel.org

RV32 systems with CBQRI didn't seem likely to me so I decided requiring
64BIT would eliminate the potential issues that Sashiko raised. If there
is actually a 32-bit implementation that someone knows of, then I would
be happy to re-evaluate RV32 support.

Thanks,
Drew


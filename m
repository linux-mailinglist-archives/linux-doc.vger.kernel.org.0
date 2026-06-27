Return-Path: <linux-doc+bounces-93836-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SEYCFJFEQGoQeQkAu9opvQ
	(envelope-from <linux-doc+bounces-93836-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 23:45:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 927136D2B9A
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 23:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TWJCahDr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93836-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93836-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5332830151C7
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 21:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7F630569F;
	Sat, 27 Jun 2026 21:45:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C7273D9F;
	Sat, 27 Jun 2026 21:45:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782596748; cv=none; b=MCmDYAJLbh30UUvPFVFIY02DblfmG1hlw3G9DYrBDPJa+hTG+Q202RFuD8CeWGLr5zYiuPFQEAWaY+8KvLgXXsCKxrlFjdql2RJKXuUVNY78TYk8sfYm7IA0uUkiT6Jmer/ozZXJ3GxZl81PON+5VHwHsD/vvYr019i07j/nJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782596748; c=relaxed/simple;
	bh=oCfQpjZ269Bt9n6+wLPESthTEOvQtXcyGv20NZ2euOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYxkX14HIDRFVTohroY/2+yuWm7tdk/8B1ihlzHwtBQ39+aw3rUK4pAOdsTOtRjX4PlgQOCmEf9M+tDACncAS4ARKAy+O8WUeAiruNTa8gJDCVXMQGpLXttg/HbafKD2pJFRoWe0ZP4ym3fYljo8whplo9Rpgjyt/sSMDnyLFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWJCahDr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85D81F000E9;
	Sat, 27 Jun 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782596747;
	bh=hbIDoQbCyu+48Gjf06/wa5e+SiS3vEWCbdZXylWTfw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TWJCahDrcCyZy6Ld4YajnQr3ObTtrwXv54paCbdwkHGVoiL986RIWLDH3z5A2gHA/
	 hw22lHVKi9Rm9qVdXq+5M+PnAUifHeIAulwJoFYi3ccYKngRY4O3kEUs0UOiOrLFgw
	 3oROqrZoW5tCqxyVDYSk8mTkuQRWaHhyb0MUl8vhswZCL5Ls4TObx9KMCM85+7aDzJ
	 PWCt9DWc59aswLUNEbb8McPmIAcaJzrl1ASwByufNk+t78YaGF9Ye6/HSAhsLqtAzq
	 hYlM76Bey3YSGFAaNjftYugXBDGQ3XvHnt1ACu+feeKxeaqQlv3pZN5kbMgH0ya5lG
	 8FK8PrhKO302g==
Date: Sat, 27 Jun 2026 14:45:45 -0700
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
Subject: Re: [External] [PATCH v2 4/8] riscv_cbqri: Add capacity controller
 probe and allocation device ops
Message-ID: <akBEiXiiSPVnUWXM@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-4-2f8049fd902b@kernel.org>
 <CAEEQ3w=n6L3ugSL6_LTCQcw0CyUSSxpfEVV0Dp-CpQ_XkLUXPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3w=n6L3ugSL6_LTCQcw0CyUSSxpfEVV0Dp-CpQ_XkLUXPQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
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
	TAGGED_FROM(0.00)[bounces-93836-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 927136D2B9A

On Sat, Jun 27, 2026 at 05:19:44PM +0800, yunhui cui wrote:
> Hi Drew,
> 
> On Thu, Jun 25, 2026 at 9:41 AM Drew Fustini <fustini@kernel.org> wrote:
> >
> > Add support for the RISC-V CBQRI capacity controller. A platform driver
> > passes a cbqri_controller_info descriptor together with the cache level
> > to riscv_cbqri_register_cc_dt(), which probes the controller and adds it
> > to the controller list.
> >
> > Assisted-by: Claude:claude-opus-4-7
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  MAINTAINERS                      |   3 +
> >  drivers/resctrl/Kconfig          |  13 +
> >  drivers/resctrl/Makefile         |   3 +
> >  drivers/resctrl/cbqri_devices.c  | 520 +++++++++++++++++++++++++++++++++++++++
> >  drivers/resctrl/cbqri_internal.h | 107 ++++++++
> >  include/linux/riscv_cbqri.h      |  47 ++++
> >  6 files changed, 693 insertions(+)
[..]
> > +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> > +                            const struct cbqri_cc_config *cfg)
> > +{
[..]
> > +
> > +       /* Set capacity block mask (cc_block_mask) */
> > +       cbqri_set_cbm(ctrl, cfg->cbm);
> > +
> > +       /* Capacity config limit operation for the AT half implied by cfg->at */
> > +       err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT,
> > +                               closid, cfg->at);
> > +       if (err < 0)
> > +               goto out;
> 
> When CUNITS=1, CONFIG_LIMIT also consumes cc_cunits. If resctrl does not
> expose unit limits, the driver should still write cc_cunits=0 before
> CONFIG_LIMIT to avoid a hidden stale/implementation-defined unit limit.
> 
> Should we handle cc_cunits here?

That is a good that cc_units should be handled even though we can't yet
expose it to resctrl. I will change the code to set cc_cunits to 0
before a config limit operation on controllers that support capacity
units, so a stale unit limit does not constrain block-mask allocation.

Thanks,
Drew


Return-Path: <linux-doc+bounces-74858-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFguAyN6gGne8gIAu9opvQ
	(envelope-from <linux-doc+bounces-74858-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 11:19:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EBCAC78
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 11:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C5730D90B0
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 10:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0AB3563EE;
	Mon,  2 Feb 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OAUofdx+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IuL2Stt0"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1D30C60B;
	Mon,  2 Feb 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026866; cv=none; b=QL2fnhD/lspCB75eskUZqeHgH15iQFYcmXbp++bBKlem5ha2Ycnv3oh+SAA5lKlNGPnJX91J1qi3i0k9P4t5IXAVtqbUoO0L5DpOPQGfSHiZcFQ2OVnfqFPYsTyWHcXEGAFS/mTCvv3VucQ/sl0hvwbNsbfb2CD9xJFkCbR3Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026866; c=relaxed/simple;
	bh=KqSta0t4KQI/YyMLBT1daHemlSj1RPunMVE+rVW0+ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FONuNUJ9/CVfarVy+RGgvTR6vglHkZnJ+atqV2wujmbZrOvEWarxl8hE7l7Hqb14ADds4BuFlKkqAZImhJ1odtGrRsAl/zuBI5vxbGYOBtUM7sGUWTxp/ojfdN3kzulFpFFPw8393t3oMznBrw47c25+rMHSLnFsv2aSx10GuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OAUofdx+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IuL2Stt0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770026863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgKo/2Y7XNk0bqY+u6jsG6nT1KZIz5J+eZsVkaeHKFs=;
	b=OAUofdx+MLSj+Q5h6IdQ0jqKe42OEmwpvZGNthyHdhL/D//I6nyjhGbXmr3vmffYATpxgP
	S5vxbZKDO2QgXhOUE4aSDIgT2aMftHf7zpQR1SXvKfoKYhBDFMzWf6HQMOf9FNDy8ui30L
	CNz2iqIHKHc7Lv0uXEkN0HqqLauApE/W+7uoGpebhrBJ4a1EnSD25TqaNb7hp2OoTokjCk
	EgtZb7kwYmlVtb1afgYFiK5m1VmV+lvgWamofMaIciGLXh6fEu856PWGundM8nFkuwNiEo
	ji5D7sY9ZXxS8Cq58w25GZmR8CjZ72s0hzRnfNUqshB/56pZQQmUwAnUkey5ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770026863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vgKo/2Y7XNk0bqY+u6jsG6nT1KZIz5J+eZsVkaeHKFs=;
	b=IuL2Stt0IgwdBLnfud47oOlWK57jsSq1Xwt8qJjn2CRVYrZ95EHWLdW1nOs28oTchWMTiA
	NOKLvUz33cfekvBw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>,
 Liupu Wang <wangliupu@loongson.cn>
Subject: Re: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
In-Reply-To: <20260202091041.2278271-5-zhangtianyang@loongson.cn>
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-5-zhangtianyang@loongson.cn>
Date: Mon, 02 Feb 2026 11:07:42 +0100
Message-ID: <87ms1rfogh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74858-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:dkim]
X-Rspamd-Queue-Id: 634EBCAC78
X-Rspamd-Action: no action

On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:
> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
> +{
> +	return writeq(val, REDIRECT_REG(reg, node));

Again: What is this return for?

> +static int redirect_table_init(struct irde_desc *irde)
> +{
> +	struct redirect_table *ird_table = &irde->ird_table;
> +	unsigned long *bitmap;
> +	struct folio *folio;
> +	int node = irde->node;

It seems to be really hard to do a length based sort.

Oh well...


Return-Path: <linux-doc+bounces-75092-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MiRKU8ugmlFQAMAu9opvQ
	(envelope-from <linux-doc+bounces-75092-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:20:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A2DCB08
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D01EE301DD8B
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892BC26AAAB;
	Tue,  3 Feb 2026 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OqHk5hyO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OC/pWL+T"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E7B2580F3;
	Tue,  3 Feb 2026 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139180; cv=none; b=hA6NSsH9eco7Ooo/OG6hWE1fMVpz8HIzfW5ctq7T5eYQiHDQ6sfpi8LKY0p0YN8aRKu9KH0Mp47pWhMyw+fpUHsVsD+4MXHbdhc069vHsvst0AAp37LHzeuC3pU7NkeaRXSOhhAqeRnEvahseP4v1MDIi2GSlM40DfwTK+vm3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139180; c=relaxed/simple;
	bh=068q+WEaKVBQpgKtqArRWhZLAwjCRsSBKUXLKQtk484=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ekg7BNSIy5nQZLKvnnsCfCJzDX/LTjzF9t+nr7D5rSvaCCNnO46Fmu0jQaFPjeEG6AhjN+f3mN7rAaIiOmF65jNx4OQjhQbdtj6e/TX77M5WpLJI4mAeRg+1q6rUJnyXDOEO5W/2AP28KV7dhjjfUxzcq65ys7KHPLOtz6OyQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OqHk5hyO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OC/pWL+T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770139175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFrGXwN6F8p6wk/nPz+j8i59EGhguXJ0J84nAt84itY=;
	b=OqHk5hyOmMVSstPOdpgSMdmd1R80tEbiCpRjuX/FynIOC1QPpQVyHCcZkHmRduAQrUoGoV
	+dZbifQ74AgwJosDDgde65PZzukbu2qFN3Kri9bZoB23kvhXxtvg/aBkny8czGsPb4+bIt
	mAlcNuFDqIIIPHdFCDutRjZOkBhK+yOC6Jbfz6K3Ay2dX6ymuOVqtDjkuZSLLrNfAtzUnb
	JtM4R44OGynhWoyn1UCVa35ef0BfMLr0jK7obNPKPOJRhJrMMnKzuW2TRb8+wUDEchJLmU
	U325cmBjfRMccYXf/tMh+bmW9xhwsqIoxSAxROcz5vkPnQ+xKYKaxcTIgAZHxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770139175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFrGXwN6F8p6wk/nPz+j8i59EGhguXJ0J84nAt84itY=;
	b=OC/pWL+Ttl+X7MNn+OdVA+YpbYiiu7Iufz8vn5H0lyDsV6aP3HUCNJNZ0Q5T9qPSFp3G6c
	EQ3RFfGtu1EJpiBg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v11 2/4] irqchip/irq-loonarch-avec: Prepare for
 interrupt redirection support
In-Reply-To: <87tsvx3fxq.ffs@tglx>
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
 <20260203124522.2288900-3-zhangtianyang@loongson.cn> <87tsvx3fxq.ffs@tglx>
Date: Tue, 03 Feb 2026 18:19:35 +0100
Message-ID: <87qzr13ftk.ffs@tglx>
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
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75092-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 325A2DCB08
X-Rspamd-Action: no action

On Tue, Feb 03 2026 at 18:17, Thomas Gleixner wrote:
>
> Sigh. Though I have to admit that 'loonarch' gave me a good laugh at
> least.

Please resend it after the next rc1 as new features are not longer
applied this week.

Thanks,

        tglx


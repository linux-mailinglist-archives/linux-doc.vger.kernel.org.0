Return-Path: <linux-doc+bounces-75089-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPlzEHEugmlFQAMAu9opvQ
	(envelope-from <linux-doc+bounces-75089-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:20:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9DDCB25
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74682302AD37
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 17:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCA3264FBD;
	Tue,  3 Feb 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PrJJ3ziq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UumkOyCN"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0522417C2;
	Tue,  3 Feb 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139030; cv=none; b=N6mQl5B65BUT54Hdn6IQsCdxULarYT2bb9ybnwYSspRT4vjX2QjWAEJaEm6bvfO0u3Ufuk2UGdmn9AFUR++/2jr21Sq94Yzrb3yktCkx+dPUa2ZxaV1cEtq30vUDAjSYCUkpbbWGKyc+NVo2ltB5/4wVJ8ToVx+Dk6uECb2tWCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139030; c=relaxed/simple;
	bh=Gm8kju3BOv4fyZL2j7blSsoUCk+WswC7IUWaVy3D3Xo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JZZPdSvP3aD1RNbOj6/AdOEDsK3mVDTO/ru/D+q712x1zt4koK8y7rdC1OEw31wOeeaUaxy5rI+fB6JyCRnnWXLClLwT+wg3mFb7bj2L+fdgpd8cLO2dbovClQPFB4rGhq/FEELA5Tmk/70MpazLU1GsjDM8Ig0+0rfGPavQ/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PrJJ3ziq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UumkOyCN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770139026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdEhsEe5h/isdzof4SeNxyYxi9Xk2dUgTuqY/PU8TvM=;
	b=PrJJ3ziqM4pIXzHVgR+ykNcC/5neZEmmN4z6hSu93EzRMoObut77YH43IGv86Y1Z35B4ix
	f5I4xKQvdcatVZ1zKaiR65SZu0pl5n6L6cnO+hw8u0ncEMh1WTQoCH6Usv3ewwBW61dT/R
	T1ewmOJKf3/bhD1XTTDPrF3L2A88grnlkNdhf9kCk03bbp+LjT+7pDTmBzG0gXc0/9sI/Z
	0BxHuninN6/Am7JdLJbvATXZN6xyzU/xSnjV5gm1jOg98marmcLWL27kzNuTpd6jAXMUEC
	8bTYa0/KrRnUo2CDUBfSQkyN3k7Nn6s0H2GB4U80qEdocHn+kG9bUw1Y0hTAhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770139026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdEhsEe5h/isdzof4SeNxyYxi9Xk2dUgTuqY/PU8TvM=;
	b=UumkOyCNTeuwH5oo2/3zUyQdpyQSS0elEBGfcaf0aT55I7tuQvaJE72wSmxz+k+QPy7U2+
	Z/lD31LyavvyEmDw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v11 2/4] irqchip/irq-loonarch-avec: Prepare for
 interrupt redirection support
In-Reply-To: <20260203124522.2288900-3-zhangtianyang@loongson.cn>
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
 <20260203124522.2288900-3-zhangtianyang@loongson.cn>
Date: Tue, 03 Feb 2026 18:17:05 +0100
Message-ID: <87tsvx3fxq.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75089-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9DF9DDCB25
X-Rspamd-Action: no action

On Tue, Feb 03 2026 at 20:45, Tianyang Zhang wrote:

$Subject: irqchip/irq-loonarch-avec

I know you blindly copied my suggestion and obviously you failed to spot
the missing 'g'.

> Interrupt redirection support requires a new interrupt chip, which
> needs to share data structures, constants and functions with the AVEC
> code.
>
> Move them to the header file and make the required functions public.

But then you still keep this nonsense around, which has no place in the
change log as I explained to you before:

  "Enumerating the details of what is moved is a pointless exercise
   because that can bee seen from the diff itself."

What's so hard about that to understand?

Just in case I'm not able to express myself coherently, this means:

Remove the following 4 lines:

> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

Sigh. Though I have to admit that 'loonarch' gave me a good laugh at
least.

Thanks,

        tglx


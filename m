Return-Path: <linux-doc+bounces-74857-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGCbL+h1gGkV8gIAu9opvQ
	(envelope-from <linux-doc+bounces-74857-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 11:01:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55502CA615
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 11:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD443013243
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 10:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EDE3570DA;
	Mon,  2 Feb 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j09KHu8T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Aw5eyl5G"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B93570B8;
	Mon,  2 Feb 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026394; cv=none; b=pOv5O5ptyymHwj1G3aRBU2diPRM7dniAHLGbV28H7vyW/LrS+2HpP00ZA1q2mPn+pw2m/zFkFLTCtefM8Vun1gDmVbc3LfPRbRud5NbTj4YemV0+K7mE3KlL9nN4UJFCbvUAV2cN564MQrzkmUWAHimksKgsks97xqBATf2XlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026394; c=relaxed/simple;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NhDjCS/aUi7IyB4WbyE7u6P6+1MH5iFTTmaudzWX6b8ZmH1FelFSg9qgxpWq9id/W5oHgw9QY91GWOdCVhtfHSXEDU59CUBu9izDku10ZAyxl3p0NZDce+VY77NFLTLnxL85xucw7c5beUdLOMBKYlkbOganuELU0Pb00HIOY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j09KHu8T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Aw5eyl5G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770026390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	b=j09KHu8Tn7Bz/AZLA8PEOhERhnvJXV0tVVC/ZbMYr+hK6u4Co+AHmS1ATzksgBtTnHW5nP
	Ym/Z9Krm3cWiUigIbK39RpRp8VzhqXSPDFxN7SA8ktJDl9NkEKAE4I20uLUGEQbP+jEOEB
	/SzTEvDtcQK/aHssaFF4mjhXUSGfm7hhXUZApLjoEdqYWfsqlY2yhvlEeZUnR7nyrwarAc
	WIEMG4G/rjcIqMTyYqzu9UeBfgn4OxnRoqbv4XNRDSWfe8Sxef4i9ONV9022oJUxHy9hxh
	7UhmBqmCVqm/w71E/PC6aAfIJthAWGzQE/rZnIKdkXijlKFjCt9dOt9Jn/VZQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770026390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m14eH5SkrBikH5k6bFBD0mKCFteemijFiTMcA5d+3Tg=;
	b=Aw5eyl5GTkxGFlTH3CHG7a1CAY0eJl0kZwQrnljCFWOTTY08zXmFXbnadV5ME9rDy8B00V
	+iRkOQPZ5zXRC7Dw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v10 2/4] irqchip/irq-loongson.h: irq-loongson.h
 preparation for Redirect irqchip
In-Reply-To: <20260202091041.2278271-3-zhangtianyang@loongson.cn>
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-3-zhangtianyang@loongson.cn>
Date: Mon, 02 Feb 2026 10:59:50 +0100
Message-ID: <87pl6nfotl.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-74857-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 55502CA615
X-Rspamd-Action: no action

On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:

> Interrupt redirection support requires a new interrupt chip, which
> needs to share data structures, constants and functions with the AVEC
> code.
>
> Move them to the header file and make the required functions public.
>
> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

https://lore.kernel.org/all/875x8jmsa8.ffs@tglx/

still applies.


Return-Path: <linux-doc+bounces-75464-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC4xBNymhWmYEgQAu9opvQ
	(envelope-from <linux-doc+bounces-75464-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 09:31:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DFFB87A
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 09:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11CA3300CC2F
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 08:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D1C30E0F1;
	Fri,  6 Feb 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9VX0zCG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499B29A9FA
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366675; cv=none; b=T+VS18fbXpvzFFAQ780br/3T0luFqn3cMwrB+voLQh9sW1yIzGMnfbHGcfvTeGsz27otQHMyyT3fhtLDRIGQNjM5sBzNBplp0O1Aecg9ugNY38/i2POZz6DYQSf8qUB1nsUpTEDgrbTC9ftSJWxtNDmEvj2xKyBePSWk3G0EEfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366675; c=relaxed/simple;
	bh=RZuiCDy4/g9LV1rpngu3qNY+4nbVNkSvSeCbDiQVFW0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=the+7lG6POvXLRBbjVF4UFIsQr840/iEctaAlOKba0S8vmMGbJ7h4JiGVb9jp57Fd4K2Biz7G9onDX93BSjt72LR4XrjlxMuNp4ZMr3y8zmq0zs0vst3VFxVA/qrBsHMOTHlckMC+vo6N0+lTp+CxUXnoElH3vayN5l5YLg3NgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9VX0zCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129E8C116C6;
	Fri,  6 Feb 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770366675;
	bh=RZuiCDy4/g9LV1rpngu3qNY+4nbVNkSvSeCbDiQVFW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G9VX0zCGlZ5/oObf96dKPIrm4pcKz33GvJIf0ow0V3WHzqDH1NTz808KnqemdrSkS
	 JlFJLOE6vB6t/IOORHBUkmE1rJa0dCq+pezcVozPhQ7g4q4JjXbOQWkSLTSllUY28z
	 xdw+KYh86V+wN4uqdb8mviRf2aGN3dRfbKS2YC6wux7AWk44SZvgJt6nS5e2qjNt8u
	 R4lfEM+JR0YY68agazFZqDB7QT6uLAjFxqeFcRhDqXxb58dJq6lJhs4i9JDgaBN12+
	 /3lT5+0N49Ais8UJrEUvrIZ0HXoDT9O+1CIUOyzQYOmf3OYiV5fEbGYgApzAqqPAVk
	 oN8uwuaSKmknA==
Date: Fri, 6 Feb 2026 09:31:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] docs: kdoc_parser: allow __exit in function prototypes
Message-ID: <20260206093101.39c06f0d@foz.lan>
In-Reply-To: <20260206065440.2412185-1-rdunlap@infradead.org>
References: <20260206065440.2412185-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75464-lists,linux-doc=lfdr.de,huawei];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:email,infradead.org:email,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Queue-Id: 693DFFB87A
X-Rspamd-Action: no action

On Thu,  5 Feb 2026 22:54:40 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Handle functions that are marked with __exit to prevent warnings:
> 
> Documentation/networking/iucv:35: ../net/iucv/iucv.c:1918: WARNING: Error in declarator or parameters
> Invalid C declaration: Expecting "(" in parameters. [error at 12]
>   void __exit iucv_exit (void)
>   ------------^
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
>  tools/lib/python/kdoc/kdoc_parser.py |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20260204.orig/tools/lib/python/kdoc/kdoc_parser.py
> +++ linux-next-20260204/tools/lib/python/kdoc/kdoc_parser.py
> @@ -176,6 +176,7 @@ function_xforms  = [
>      (KernRe(r"^__FORTIFY_INLINE +"), ""),
>      (KernRe(r"__init +"), ""),
>      (KernRe(r"__init_or_module +"), ""),
> +    (KernRe(r"__exit +"), ""),
>      (KernRe(r"__deprecated +"), ""),
>      (KernRe(r"__flatten +"), ""),
>      (KernRe(r"__meminit +"), ""),



Thanks,
Mauro


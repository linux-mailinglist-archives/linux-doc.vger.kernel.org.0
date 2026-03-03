Return-Path: <linux-doc+bounces-77671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOcxFbaBpmmIQgAAu9opvQ
	(envelope-from <linux-doc+bounces-77671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 07:37:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DC1E9B10
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 07:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E50A300E1B9
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 06:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ADE3845CC;
	Tue,  3 Mar 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R9ldAOor";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jkl63XB8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R9ldAOor";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jkl63XB8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39902FBDE0
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519853; cv=none; b=UrrhGnYJJ8HLWT93+CXm0BC8Kpt2MfS/OsAwcedId5YOFhIdz//APpn9ticX+Xb00425Xl0NXwe2rVQDeuw6HSZO0EPkXsj1fsYzSrpDN5Im7JOwTyq27+DDlUt2z0J5dvT/Vi3gTrcGFlezcD+pU85gYdYzGbL7lmhHhFyuQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519853; c=relaxed/simple;
	bh=dmXSusKbWhhvHqikAM1aLVaMRkxr2+RJV2v5pdma0oY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GRVvd4NQZlNIwdIpzSmMRLrX0mzNTIt/FGhz1gqtEuGQ5De+m5vxFCffn34f35IfhckcDDaVM58q7GhKalL6JjCcuJwEVu8xe1ThV4FcVvUXiC4v+QA2u3XMJU9vQSiLXMMcnbQqmgGVtXMV5G0nsroIWEd9ln7hWKQq1zHkOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R9ldAOor; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jkl63XB8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R9ldAOor; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jkl63XB8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 121003F894;
	Tue,  3 Mar 2026 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772519850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHHYiRzT6lcWSpivE8j+UTKCBT7/LFeF5suAiuGzXSw=;
	b=R9ldAOorW0pXrXnDGgTdbF/RVGLsblhOYLKPLc0L00/bDx37yuDzwzhyEQ/GjRarFIdGPP
	3DOjfc45hUiwFu0dlbYujgHk6tZh7U0UZXWrGc41QKTp5yAQw6P2x/MIxsXtZJ/HCPNpVi
	moYtSd2OUEN4DcQZeTrHJzZ/fF8Wq78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772519850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHHYiRzT6lcWSpivE8j+UTKCBT7/LFeF5suAiuGzXSw=;
	b=Jkl63XB8embwLLD69IHjioP5ovmWn0jDbRlEx888J2v6fIS7W6LeGDpPiodJCw9fxcY0sa
	7SkCuFmJDAcN97Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772519850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHHYiRzT6lcWSpivE8j+UTKCBT7/LFeF5suAiuGzXSw=;
	b=R9ldAOorW0pXrXnDGgTdbF/RVGLsblhOYLKPLc0L00/bDx37yuDzwzhyEQ/GjRarFIdGPP
	3DOjfc45hUiwFu0dlbYujgHk6tZh7U0UZXWrGc41QKTp5yAQw6P2x/MIxsXtZJ/HCPNpVi
	moYtSd2OUEN4DcQZeTrHJzZ/fF8Wq78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772519850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHHYiRzT6lcWSpivE8j+UTKCBT7/LFeF5suAiuGzXSw=;
	b=Jkl63XB8embwLLD69IHjioP5ovmWn0jDbRlEx888J2v6fIS7W6LeGDpPiodJCw9fxcY0sa
	7SkCuFmJDAcN97Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D3B33EA69;
	Tue,  3 Mar 2026 06:37:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vQL7JKmBpml6EwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 06:37:29 +0000
Date: Tue, 03 Mar 2026 07:37:29 +0100
Message-ID: <87ecm1l8pi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 4/8] ALSA: usb-audio: Support string-descriptor-based quirk table entry
In-Reply-To: <20260302185900.427415-5-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
	<20260302185900.427415-5-i@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Rspamd-Queue-Id: 1C3DC1E9B10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77671-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,rong.moe:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 02 Mar 2026 19:58:55 +0100,
Rong Zhang wrote:
> 
> Some quirky devices do not have a unique VID/PID. Matching them using
> DEVICE_FLG() or VENDOR_FLG() may result in conflicts.
> 
> Add two new macros DEVICE_STRING_FLG() and VENDOR_STRING_FLG() to match
> USB string descriptors (manufacturer and/or product) in addition to VID
> and/or PID, so that we can deconflict these devices safely.
> 
> No functional change intended.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - Alloc string buffers with kmalloc() instead of on stack (thanks
>   Takashi Iwai)
> - Get string descriptors in a neater way (ditto)
> - Tiny differences compared to Takashi's sugeestion:
>   - Use `IS_ERR_OR_NULL() || strcmp()' instead of `!IS_ERR_OR_NULL() &&
>     strcmp()', so failure in getting the string descriptor won't
>     resulting in quirk flags being applied to irrelevant devices
>   - Use trivial goto cleanup patterns instead of `__free(kfree)' as the
>     latter can't handle ERR_PTR()

__free(kfree) can handle ERR_PTR() gracefully :)
In linux/slab.h, it's defined as:
  DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))


Takashi


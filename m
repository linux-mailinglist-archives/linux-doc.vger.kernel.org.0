Return-Path: <linux-doc+bounces-79355-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNfaMxlktWke0AAAu9opvQ
	(envelope-from <linux-doc+bounces-79355-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 14:35:21 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7028D541
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 14:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F27303CD09
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 13:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F98378830;
	Sat, 14 Mar 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W+KsUw8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LXdeMflM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W+KsUw8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LXdeMflM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE3736165B
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495301; cv=none; b=U8dQMM7G5CalCxbBZ+IiLkVCvLrrvB+LQtnBa8tt9ADg025ZOhoY/inxJW4NrLk8H2UrBKlhh+s1lpcUQWYz76dwNypJznRJpxvAGCxB4LF9QngqcqK4AwPT6/Iv2/BNWvcuz7ZAICpX6fyJMIFgQtQkJyxc3OqLaCHWz+fJuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495301; c=relaxed/simple;
	bh=/Qid3hkUBpASpuLf29wSkgrdvJStJoAAH5tTwsjosZo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfoy0GPTYcEG1q8Rlgf+BwIZWOU0bZlK7JKieq+QPPICPLhmCSeVwXeaqmCp5aaKuLHfRDjldQP/BgF+9XRn8mQLrbX3lVyFd79MTp1ozA+BphB1qf5ZmGOATxzMOzgxcNVIFarD/BEJPVPcNycgYz/Upu4+1UMaQwCEW+k9ULk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+KsUw8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LXdeMflM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+KsUw8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LXdeMflM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AF974D2C4;
	Sat, 14 Mar 2026 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=W+KsUw8estAzwHfs7c1yunKEkL0AhP65tvzHcohon+J5Bpdh1vCC05Xk6uOk8fg15E3DJL
	qivxSgoBnZr71SbnMYu22FHkUPjuZOlRcMFkVbCKTqp25sOSR2J1+6xAJbrkLQxreoRxZl
	ZIKuCdEjFrpHd7jbTyWSP/0COQA9hhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=LXdeMflMnq4JtEguRhPtm1JGXtCNnCE/6P6ow35SCL54s0SWEPakygULh7wnB+fAVZNad4
	KBwT/rIrpD2N/RBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W+KsUw8e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LXdeMflM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=W+KsUw8estAzwHfs7c1yunKEkL0AhP65tvzHcohon+J5Bpdh1vCC05Xk6uOk8fg15E3DJL
	qivxSgoBnZr71SbnMYu22FHkUPjuZOlRcMFkVbCKTqp25sOSR2J1+6xAJbrkLQxreoRxZl
	ZIKuCdEjFrpHd7jbTyWSP/0COQA9hhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21VmdXSryTgZznezmBom2DP/mK5xxTx1lnIUaZTTHlM=;
	b=LXdeMflMnq4JtEguRhPtm1JGXtCNnCE/6P6ow35SCL54s0SWEPakygULh7wnB+fAVZNad4
	KBwT/rIrpD2N/RBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4265C42724;
	Sat, 14 Mar 2026 13:34:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7K6hDgFktWmaDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:34:57 +0000
Date: Sat, 14 Mar 2026 14:34:56 +0100
Message-ID: <87tsuia60v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Myroslav Demchenko <myro@myromyro.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mirademche@gmail.com
Subject: Re: [PATCH] docs: sound: clarify PulseAudio and PipeWire configuration description
In-Reply-To: <20260313120140.45022-1-myro@myromyro.com>
References: <20260313120140.45022-1-myro@myromyro.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_FROM(0.00)[bounces-79355-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,myromyro.com:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 4AA7028D541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 13:01:40 +0100,
Myroslav Demchenko wrote:
> 
> Modern sound servers such as PulseAudio and PipeWire support dynamic
> configuration, so this feature is rarely needed today. However, it
> was useful in the past when audio setups relied on static configuration.

Hmm, I don't see much difference in the information you changed.
Is it just a rephrase of the same context?  The new text also doesn't
improve so significantly, honestly speaking.

Also the patch description is just a copy of the documentation, which
also doesn't help for understanding about your change.  It should
clarify what changed for which reason.


thanks,

Takashi


> 
> Signed-off-by: Myroslav Demchenko <myro@myromyro.com>
> ---
>  Documentation/sound/alsa-configuration.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
> index 55b845d38236..a3d8da5a3f6c 100644
> --- a/Documentation/sound/alsa-configuration.rst
> +++ b/Documentation/sound/alsa-configuration.rst
> @@ -142,9 +142,9 @@ in primary usage, and people would like to assign it as the first
>  appearing card. They can do it by specifying "index=1,0" module
>  parameter, which will swap the assignment slots.
>  
> -Today, with the sound backend like PulseAudio and PipeWire which
> -supports dynamic configuration, it's of little use, but that was a
> -help for static configuration in the past.
> +Today, sound servers such as PulseAudio and PipeWire support dynamic
> +configuration, so this feature is rarely needed. However, it was
> +useful in the past when audio setups relied on static configuration.
>  
>  Module snd-adlib
>  ----------------
> -- 
> 2.53.0
> 


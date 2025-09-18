Return-Path: <linux-doc+bounces-57919-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A52B3B52D
	for <lists+linux-doc@lfdr.de>; Fri, 29 Aug 2025 10:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37C33B66EA
	for <lists+linux-doc@lfdr.de>; Fri, 29 Aug 2025 08:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67127299ABF;
	Fri, 29 Aug 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zfN9+S3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rqvVfzTV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zfN9+S3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rqvVfzTV"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD62DAFA6
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454173; cv=none; b=JE1KeSivVYIh/YT3lUxY8j9VXkoq6iu7kWKbAGBDgJg0DekXMqM75msB8vJmFBIwMs1bfwcyK4UE/RfsZhY4mdQ41S+z5okEvdlhAYnstLdwIfvx19jx8TvhMhVv1ok7H3byPrDiNOLjx4VNHXEeue3ssiMAS/fP6TN91SaFv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454173; c=relaxed/simple;
	bh=0lZ8H3NWRy6vusu21/qPJvUYlDjNwkdiwUyvkOUcGfQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXM4jUYD5vD2MNCXxwFNMmAHr3e/FLrKuQWQx0JkhVrrbt54bu/NW1XS6X2r00FvnW8+RFPpThh5ADY/slj9nI6IWhK5DyaDJtmq7LNeW8VFD6h2YdIVU4s3aHaFJkZtFvUoRKc8Sq6L05bUY9tcEfhkHSIzZDm2m32+fG6Gz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zfN9+S3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rqvVfzTV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zfN9+S3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rqvVfzTV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E44095BF15;
	Fri, 29 Aug 2025 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756454169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLApp9xTvi0Kctll5NJeDdxkOg25GU4i3MTV3p65pOU=;
	b=zfN9+S3J3Gq3YupL5m2KQT9gijlWsmnrzKQrCFVCFWKH8UA/eTYtjnQAexKW32EU9FZ7im
	1AvFzLcWYRjiqyOcKGw4QsqVrRoETsq4E9fu5tzrHwqN+R/9aY65EPcAe3v9eTESp8jUFS
	AElyImc4m4NBcf0qorM/3x0aY/Dy3iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756454169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLApp9xTvi0Kctll5NJeDdxkOg25GU4i3MTV3p65pOU=;
	b=rqvVfzTV5cNGUii4Bl9JZUzn0yWrGPI+WnuZNRz6EOlRcnbeGTe6jsDI/zB/JDPKfCF2aM
	TlcFqLpd+SDSG6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756454169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLApp9xTvi0Kctll5NJeDdxkOg25GU4i3MTV3p65pOU=;
	b=zfN9+S3J3Gq3YupL5m2KQT9gijlWsmnrzKQrCFVCFWKH8UA/eTYtjnQAexKW32EU9FZ7im
	1AvFzLcWYRjiqyOcKGw4QsqVrRoETsq4E9fu5tzrHwqN+R/9aY65EPcAe3v9eTESp8jUFS
	AElyImc4m4NBcf0qorM/3x0aY/Dy3iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756454169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nLApp9xTvi0Kctll5NJeDdxkOg25GU4i3MTV3p65pOU=;
	b=rqvVfzTV5cNGUii4Bl9JZUzn0yWrGPI+WnuZNRz6EOlRcnbeGTe6jsDI/zB/JDPKfCF2aM
	TlcFqLpd+SDSG6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8702013A3E;
	Fri, 29 Aug 2025 07:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iBKGHxldsWjgEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 07:56:09 +0000
Date: Fri, 29 Aug 2025 09:56:09 +0200
Message-ID: <87a53iimsm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cryolitia@uniontech.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Wang Yuli <wangyuli@deepin.org>,
	Guan Wentao <guanwentao@uniontech.com>,
	Nie Cheng <niecheng1@uniontech.com>,
	Zhan Jun <zhanjun@uniontech.com>,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Guoli An <anguoli@uniontech.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: docs: Add documents for recently changes in snd-usb-audio
In-Reply-To: <20250829-sound-param-v1-2-3c2f67cd7c97@uniontech.com>
References: <20250829-sound-param-v1-0-3c2f67cd7c97@uniontech.com>
	<20250829-sound-param-v1-2-3c2f67cd7c97@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,vger.kernel.org,aosc.io,deepin.org,uniontech.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Fri, 29 Aug 2025 07:11:00 +0200,
Cryolitia PukNgae via B4 Relay wrote:
> 
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> Changed:
>   - ignore_ctl_error
>   - lowlatency
>   - skip_validation
>   - mixer_min_mute
>   - quirk_flags[19:24]

While I'm not going to take mixer_min_mute option addition, the others
in this patch look good.  Could you resubmit only for those?


thanks,

Takashi


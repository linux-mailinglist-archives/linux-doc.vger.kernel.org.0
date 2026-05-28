Return-Path: <linux-doc+bounces-89826-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFPLFq/zF2q5WAgAu9opvQ
	(envelope-from <linux-doc+bounces-89826-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 09:50:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69705EDF51
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 09:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E000320FC0A
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 07:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3897D348C67;
	Thu, 28 May 2026 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQhUvo0z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AEYWlW8x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQhUvo0z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AEYWlW8x"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02C32ED5C
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954254; cv=none; b=ALXIl+dZydILNemmjNe/q5HaLGYsnW7ae3B3iUgqksfTjUXVsdhyvPvMbnb0GjOgzqxeMDtk27UvcSSoOEOJRhe9zT5tZT/cw90X5suQCidDBth+W7Ai2VBFBpsMvCS3ImgRZHJsvoFxLFGwrr1LHZMkanv9eJ6t9J6Drx8fTLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954254; c=relaxed/simple;
	bh=enMwBe4asOCblkLkme8uofIrVwqh36VoRx/JBjAz3U4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ke6WNcvPb++dKvM/A+SHfeKJ+l8s4Zw9vSpbBI+RA1V20eyHx/XoEckn+0rKEgbjN+hox4zQtrqGpPW9nY8kLWhqdUeFgLpTXqHLnKv/OsFsfJP7tQXUtR10NfIlOAfycQ02QXiiL3j5b8SIvmBMnSZIqhT6uTezfPIZW7yQUGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQhUvo0z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AEYWlW8x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQhUvo0z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AEYWlW8x; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F76A6AA1A;
	Thu, 28 May 2026 07:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779954250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jrMqhZZLMZZ3ceg78QohX1isalpPNGX2PVF5jVBsgiM=;
	b=YQhUvo0zMeWR6jGmzq0lGzoxzBkI5bhrdNjHOZrmH4M1b4bintuZeT11Lxk0IROepLOhTR
	spDXQySCD7fdZs6z96Fwfk3qVUfM3UPLkloRRbXsFM/UinWnxWqdnXLhc4gxP9FwRbmgbl
	IzvOIEsQ3eWIro499JtsIhChZxv+6Oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779954250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jrMqhZZLMZZ3ceg78QohX1isalpPNGX2PVF5jVBsgiM=;
	b=AEYWlW8xc/E9GgKNysVzDd0HnbHW5OZf7slA2EoDaefIxHCJ1du8xv8S165NxD4t3PyVwH
	dCrTRwpvW+bNvsDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779954250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jrMqhZZLMZZ3ceg78QohX1isalpPNGX2PVF5jVBsgiM=;
	b=YQhUvo0zMeWR6jGmzq0lGzoxzBkI5bhrdNjHOZrmH4M1b4bintuZeT11Lxk0IROepLOhTR
	spDXQySCD7fdZs6z96Fwfk3qVUfM3UPLkloRRbXsFM/UinWnxWqdnXLhc4gxP9FwRbmgbl
	IzvOIEsQ3eWIro499JtsIhChZxv+6Oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779954250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jrMqhZZLMZZ3ceg78QohX1isalpPNGX2PVF5jVBsgiM=;
	b=AEYWlW8xc/E9GgKNysVzDd0HnbHW5OZf7slA2EoDaefIxHCJ1du8xv8S165NxD4t3PyVwH
	dCrTRwpvW+bNvsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C360F5AC8F;
	Thu, 28 May 2026 07:44:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qmQ+LknyF2oTXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 May 2026 07:44:09 +0000
Date: Thu, 28 May 2026 09:44:09 +0200
Message-ID: <877boougfq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
In-Reply-To: <20260528-uac-quirk-get-cur-vol-v2-1-84d3c8f48150@rong.moe>
References: <20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe>
	<20260528-uac-quirk-get-cur-vol-v2-1-84d3c8f48150@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89826-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: B69705EDF51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 20:56:27 +0200,
Rong Zhang wrote:
> 
> @@ -1258,6 +1261,16 @@ static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
>  			return 0;
>  	}
>  
> +	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
> +		usb_audio_warn(cval->head.mixer->chip,
> +			       "%d:%d: broken mixer GET_CUR (%d/%d/%d => %d)\n",
> +			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> +			       cval->min, cval->max, cval->res, saved);
> +

IMO, it's better to be usb_audio_info().  Otherwise it leads to an
unnecessary caution.  Basically the behavior is expected, so there is
nothing to worry about that.


thanks,

Takashi


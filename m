Return-Path: <linux-doc+bounces-43039-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045AA8818B
	for <lists+linux-doc@lfdr.de>; Mon, 14 Apr 2025 15:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E58916E448
	for <lists+linux-doc@lfdr.de>; Mon, 14 Apr 2025 13:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B132D3A9D;
	Mon, 14 Apr 2025 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oYpLlhzJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1J57K6y0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="faCewy3M";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="4ZO3LORf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2712C3774
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636637; cv=none; b=GPjMIi67Q+l++UGhjjp8SZISDUYUxk/sIVoof7y7L6SjKwvWFP/YNVJ61DsXwVvxl0TeX9TsD2bVqM2KAz+CjM/fX71WTzR3EdgwwUlzUK9LJL/FIkOrh2o6wHsxP2P4Lo03E7KRHpp0gvnmI9yUoePdAIfeRmGnV0X5XcmZCvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636637; c=relaxed/simple;
	bh=Yvdb84KGhfD8RftuDy8afJDf2UaldGJ/+fOXs5+9agI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IARBcIT/Ciws2gA6VlBT1Lmetx62EsgQODm0/nnnNzCbft5BNvx3nVmohb6QB+bP9TbLjnA5H7x6ZGMwQwwlTvGl2SPpPMTG/56uMnNIF8c22NPwsY8PxmwkT9nDKvs9gpxnmTGaT0khf6srYgKkTb4/pFxkyR6jbrcndKrcJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oYpLlhzJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1J57K6y0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=faCewy3M; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=4ZO3LORf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E18932191E;
	Mon, 14 Apr 2025 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744636633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM+ZrxSuFRmF6SXEMsjHD3apuRAkt3u0tvwXFP8z/sg=;
	b=oYpLlhzJuB/3kr5n8cudm33NEg3p/HJkEoRhN09el2tVCR8wZneqz/UxQzQNoYbI9qEz8P
	UGJym1ryVe9EetTHxuqSOcKcpxH6H8vh80CeLdG0QRdS6gecaU+wNbjqSvv0MjBUWp65LY
	SQk6xkPnwyVYIOJswXLZW3eR0C/DrCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744636633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM+ZrxSuFRmF6SXEMsjHD3apuRAkt3u0tvwXFP8z/sg=;
	b=1J57K6y0084XLAg93NyNyIZ0pC4iPGBDBrY4xIGdDNC6F0FHnfnOllPlabdPHyT1sqKi4V
	L1jE74aFvOvAZ6CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=faCewy3M;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=4ZO3LORf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744636632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM+ZrxSuFRmF6SXEMsjHD3apuRAkt3u0tvwXFP8z/sg=;
	b=faCewy3MmoJdOzYHxNjD7FMhJ1GhcmDFwNOS+j7Pc4vQzOu+JIbXYolgXMVvAv35sw7ouz
	KcTHbCBQmy5WeOef4L51RUNJX9Ryxd9Oo7qf93XqVIz7tzRQ313mLeGtaCUvQFXzmypUBi
	8qHtqMq8/qEKvCaz9dOny0+dln6wbug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744636632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM+ZrxSuFRmF6SXEMsjHD3apuRAkt3u0tvwXFP8z/sg=;
	b=4ZO3LORfYhWSjCrDyrFLsgRzeQ74C+ErZSZPf4cGK1xDB4gHHpPK8vjc+9w8gomzBqZnZA
	cUG+rFbz6Dbsy1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFB6A136A7;
	Mon, 14 Apr 2025 13:17:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GWKvMtgK/WeUeQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 14 Apr 2025 13:17:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 64587A094B; Mon, 14 Apr 2025 15:17:04 +0200 (CEST)
Date: Mon, 14 Apr 2025 15:17:04 +0200
From: Jan Kara <jack@suse.cz>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Howells <dhowells@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 1/2] fs/fs_parse: Delete macro fsparam_u32hex()
Message-ID: <iefk2k2sa4sf5xz3jmmtaxmul4q63cje7kotieyqddlqp6rodg@coasknffadh2>
References: <20250411-fix_fs-v2-0-5d3395c102e4@quicinc.com>
 <20250411-fix_fs-v2-1-5d3395c102e4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-fix_fs-v2-1-5d3395c102e4@quicinc.com>
X-Rspamd-Queue-Id: E18932191E
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[icloud.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[icloud.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Fri 11-04-25 23:31:40, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Delete macro fsparam_u32hex() since:
> 
> - it has no caller.
> 
> - it uses as type @fs_param_is_u32_hex which is never defined, so will
>   cause compile error when caller uses it.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  Documentation/filesystems/mount_api.rst | 1 -
>  include/linux/fs_parser.h               | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/mount_api.rst b/Documentation/filesystems/mount_api.rst
> index d92c276f1575af11370dcd4a5d5d0ac97c4d7f4c..47dafbb7427e6a829989a815e4d034e48fdbe7a2 100644
> --- a/Documentation/filesystems/mount_api.rst
> +++ b/Documentation/filesystems/mount_api.rst
> @@ -671,7 +671,6 @@ The members are as follows:
>  	fsparam_bool()		fs_param_is_bool
>  	fsparam_u32()		fs_param_is_u32
>  	fsparam_u32oct()	fs_param_is_u32_octal
> -	fsparam_u32hex()	fs_param_is_u32_hex
>  	fsparam_s32()		fs_param_is_s32
>  	fsparam_u64()		fs_param_is_u64
>  	fsparam_enum()		fs_param_is_enum
> diff --git a/include/linux/fs_parser.h b/include/linux/fs_parser.h
> index 53e566efd5fd133d19e313e494b975612a227b77..5057faf4f09182fa6e7ddd03fb17b066efd7e58b 100644
> --- a/include/linux/fs_parser.h
> +++ b/include/linux/fs_parser.h
> @@ -125,8 +125,6 @@ static inline bool fs_validate_description(const char *name,
>  #define fsparam_u32(NAME, OPT)	__fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
>  #define fsparam_u32oct(NAME, OPT) \
>  			__fsparam(fs_param_is_u32, NAME, OPT, 0, (void *)8)
> -#define fsparam_u32hex(NAME, OPT) \
> -			__fsparam(fs_param_is_u32_hex, NAME, OPT, 0, (void *)16)
>  #define fsparam_s32(NAME, OPT)	__fsparam(fs_param_is_s32, NAME, OPT, 0, NULL)
>  #define fsparam_u64(NAME, OPT)	__fsparam(fs_param_is_u64, NAME, OPT, 0, NULL)
>  #define fsparam_enum(NAME, OPT, array)	__fsparam(fs_param_is_enum, NAME, OPT, 0, array)
> 
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


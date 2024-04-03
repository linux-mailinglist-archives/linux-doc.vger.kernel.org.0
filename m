Return-Path: <linux-doc+bounces-13369-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59284896E03
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 13:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1444529146E
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147171420A3;
	Wed,  3 Apr 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="DDJfiSBR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="uoMMMBa/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF0A73506;
	Wed,  3 Apr 2024 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143344; cv=none; b=KO7SXcWzMr9YIU2iZTbL1FVGnGjxzEufu7w5ZLbdxWQxj3kyJVeZGSMafyOGEOcSCLA563yWoJ9FsWJIMjlAI21cAzoSxwiCm7c0iyCL6oeB2t2ntN2X3PmKBy+ylF/0iEfXYDh71yLtd/i9nMp4aGymVU/NaiBWduBOScwMpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143344; c=relaxed/simple;
	bh=flLoUByLGK4hXv0d7wMX/74B0BBNZZd/sIeSZIip6mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrP/dCrLBgf7l/6lE/EuK0Up6/WPomq78C/4Ad13BVbRfJV8Qn1wauK4DWHDpxWK/tPSwsn7A8mG4YYNPRuaFxsVLzEQYchGETztKsZKBVEeJY4VXWs5NsoCaeLQppu/3XFKUcubHo924T5jBw7f21o7KPnkmJOhSnCg47PAPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=DDJfiSBR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=uoMMMBa/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3841B35288;
	Wed,  3 Apr 2024 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1712143340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=;
	b=DDJfiSBRvnRvc0NSrGBWmcDhD8fe7TOALaFjEzp2fpBhtYpI4jGxQKLA3+l1QQzdMRimzX
	IQEap34DDcTzJQ9Yq3z062vzUdnUQNrGZf8I3Oe/jr3My0RIbNu6t7omRzXWMbpabspnLc
	PLp6IF8n+5lEVbD2mOAQMSJezSx2cBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1712143340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=;
	b=uoMMMBa/IrIQ9KZDERsDt9OoPPcUgK86+ANehXQPJPaMYhaZWnL43IEBU2MBLVQBwplHKn
	5oHScmosS95C5kAg==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 28DB813357;
	Wed,  3 Apr 2024 11:22:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id hubzCew7DWb0IAAAn2gu4w
	(envelope-from <jack@suse.cz>); Wed, 03 Apr 2024 11:22:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id CBB66A0814; Wed,  3 Apr 2024 13:22:04 +0200 (CEST)
Date: Wed, 3 Apr 2024 13:22:04 +0200
From: Jan Kara <jack@suse.cz>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 07/13] ext4: fiemap: return correct extent physical
 length
Message-ID: <20240403112204.l5zmyirxueod2o5l@quack3>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <20935230b7513031ac497e3afe8446650d20fb1e.1712126039.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20935230b7513031ac497e3afe8446650d20fb1e.1712126039.git.sweettea-kernel@dorminy.me>
X-Spam-Score: -1.03
X-Spamd-Result: default: False [-1.03 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWELVE(0.00)[20];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.23)[72.57%]
X-Spam-Level: 
X-Spam-Flag: NO

On Wed 03-04-24 03:22:48, Sweet Tea Dorminy wrote:
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  fs/ext4/extents.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 2adade3c202a..4874f757e1bd 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -2194,7 +2194,7 @@ static int ext4_fill_es_cache_info(struct inode *inode,
>  
>  	while (block <= end) {
>  		next = 0;
> -		flags = 0;
> +		flags = FIEMAP_EXTENT_HAS_PHYS_LEN;

OK, but we should then pass (__u64)es.es_len << blksize_bits as physical
extent length below, shouldn't we?

>  		if (!ext4_es_lookup_extent(inode, block, &next, &es))
>  			break;
>  		if (ext4_es_is_unwritten(&es))

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


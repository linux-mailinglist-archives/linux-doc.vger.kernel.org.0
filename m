Return-Path: <linux-doc+bounces-87172-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFufOQNZA2r75AEAu9opvQ
	(envelope-from <linux-doc+bounces-87172-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 18:44:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0648524F68
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 18:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0E6230690C1
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E5D3D0BED;
	Tue, 12 May 2026 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTTeSIYr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F823C415D;
	Tue, 12 May 2026 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604132; cv=none; b=ae9QBXNBp/1iC4yHMPfQt+nqt5eauVFmMTZVOm1P518ECUPoEXvU9t6Gt5reNOSaMiNnAJq/hlUWDUKVNOemaZi3TFeCmNbsFYZX19SoyFkp8sxYMDKM52sWKZbkE/ZEFDyqWBBBN37KcYLw6lg52aDLsxKEbOXQyrx93Uhckmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604132; c=relaxed/simple;
	bh=HoLO8a+vZpAtLOTBMM5s56bZzE6B2/xXip3V7gv1An8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pf/QgN7WAOqx8dF2L3V3uiwUpgMBC10AqdNMIgoo8vRxx1fNfRjDrVIGguM3VT2KEUAPyr/Q/Ac1O12M9Px7q7x74yyCMMYSPfMnUDMtISorsW3QjbCyEMWsWUl8oyU7LnEsp2EEjCgM2pOALqrvoSg3KEGRxGSq823VejR7TOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTTeSIYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A35C2BCC7;
	Tue, 12 May 2026 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604132;
	bh=HoLO8a+vZpAtLOTBMM5s56bZzE6B2/xXip3V7gv1An8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTTeSIYr0mdy8HmJYqjqcLWEHq0y8Zlb5+Bkj0i0AArnuJ7wbNWQRMMg/+jBX4e7l
	 DMqWrdAzfmyEdet2+8O3vETYUEeeqn+HB1x8V5oWp3B/dV8OYzwc7AiQ+4kpybNjeu
	 oXlammqPj2J4WUGQdZx5gTME6ga/ClckN0NU0hI7bwp362zNjXaD8zqd7sk5PtrP0Q
	 I6saHT3UM/tU5CEmUlfhbS35iXJrbw0AAOWn+6LoGkEM+4Ezqd4MYb6Z2cOe1iuf5v
	 X0x+S5CcTFnIhFy4dpdSpOQ5IspuYVG0Zf0k0TaC3AV6LVdFF6C+DXDWZy4rOp+aAH
	 FMfkMFkcQb+cg==
Date: Tue, 12 May 2026 09:42:11 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
	Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Carlos Maiolino <cem@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org
Subject: Re: [PATCH 04/12] swap: restrict to regular files or block devices
Message-ID: <20260512164211.GE9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-5-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512053625.2950900-5-hch@lst.de>
X-Rspamd-Queue-Id: C0648524F68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87172-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,kernel.dk,suse.com,mit.edu,gmail.com,samba.org,manguebit.org,wdc.com,vger.kernel.org,kvack.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djwong@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lst.de:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 07:35:20AM +0200, Christoph Hellwig wrote:
> Various swap code assumes it runs either on a block device or on a
> regular file.  Make this restriction explicit using checks right
> after opening the file.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes sense to me.
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  mm/swapfile.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index a183c9c95695..651c1b59ff9f 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3515,6 +3515,10 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  		error = -ENOENT;
>  		goto bad_swap_unlock_inode;
>  	}
> +	if (!S_ISBLK(inode->i_mode) && !S_ISREG(inode->i_mode)) {
> +		error = -EINVAL;
> +		goto bad_swap_unlock_inode;
> +	}
>  	if (IS_SWAPFILE(inode)) {
>  		error = -EBUSY;
>  		goto bad_swap_unlock_inode;
> -- 
> 2.53.0
> 
> 


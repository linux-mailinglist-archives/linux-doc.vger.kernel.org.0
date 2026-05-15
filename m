Return-Path: <linux-doc+bounces-87765-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EOsJwScB2oD+wIAu9opvQ
	(envelope-from <linux-doc+bounces-87765-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:19:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF5558BCD
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36BD430103BD
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 22:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6613A3EBF02;
	Fri, 15 May 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN7t2TQl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BF384CF3
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883534; cv=none; b=V3Wcm0Ik1QCdx/wFzQB3Ut9W0o6Oi7t27K78hmEMBc25ihXoCmDaqfPn341VygmFu1RMpFH1SyESeWtl6Weli/NzxEssIrL7bjqW6lWwszN3vQ4x20sF5qwUD6dIv7YrZAHOZnMZJXnWCZJF5mA0Riik6lXn2RvGK6+e/Qz3uwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883534; c=relaxed/simple;
	bh=1MhrEcqiffOJJ9gu4tKqW5/j2FFYBdwL8v/OjHOXbE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HARB9K3dRZb2gfRe8d5FUfiagGdyWTBkatxJ5N+/f2+1Imq0u1uwkFaqktCJN6HnJtsebMhF7VrD6LUA7s08WRBKxpF5TPlfXvbUGE2Ph/LJ31Zm9V36uexLBoXG3N7ztxcdAO4FYr7eTCzv0UF8EedXB6oOSwEaKKJFM7t0iT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN7t2TQl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E676DC2BCFD
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883533;
	bh=1MhrEcqiffOJJ9gu4tKqW5/j2FFYBdwL8v/OjHOXbE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aN7t2TQlvIKpOpLpTAz2wfX6CQ6XbvX05mrkq758bOwuZL3DcQxUPkBspNpyNZwSB
	 8N6exM7cKWsrm+qO/Ymk5JupgrPJib8W2rkAwUbgDMu2M2NgC1WTchypth9zoU0Cmd
	 9PqCdXk90Ih4xw4+8WVnRQ/o/kju7noeshM0lTjtkf4LbJoWKuX/qdbyaJZr0YPYVC
	 4UfUNcF11I55G8tX9v47+kEZsgxAGds3pvmfi4u/Rz8gJeEWhWjgwu+i8u5waM3Pr4
	 HBkN42OUZ9L9CpPoOSIe12RrK8EpRGaHMUVfA6f2bZyaH4its8xQ3X1F+91R84JFcv
	 dupiNxLvh8yrQ==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651bc83e74aso693074d50.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 15:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GQkWxLIQTeItGu5Yi+5a9Xnl8zX3nQ1vmMuwMyE1LgDvkfY4EoJXCTCazJhbAsHR6+XQ7kZZOjqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtLBt7zh0GMAFRz4AUWXTfMLvkmOj0xgqD0+RrQ2iA9c0Yy7O
	xoTdKxGCBtjiD8BauteIRjFmt+8xPE3cK3gPtgOtb/8jQW+LYMuApW3qrOpI4motySk6Fj8NZGt
	5DjX+xBplTp/80LmaBFfOjfa8X83pKR3erHaOfFHtJA==
X-Received: by 2002:a05:690e:2513:20b0:651:cd15:8c67 with SMTP id
 956f58d0204a3-65e226e2fb9mr5283044d50.15.1778883533149; Fri, 15 May 2026
 15:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de> <20260512053625.2950900-6-hch@lst.de>
In-Reply-To: <20260512053625.2950900-6-hch@lst.de>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 15 May 2026 15:18:42 -0700
X-Gmail-Original-Message-ID: <CACePvbUpuNF9VsFUnmGpSwA9mHERG9fAxqezO=gdLzU99gpEdw@mail.gmail.com>
X-Gm-Features: AVHnY4IEAMD4CIhbQwbpq5_x4qZkKrPnDwnZZ2hkgP66BNy2UiBnbzLNgfCVsSA
Message-ID: <CACePvbUpuNF9VsFUnmGpSwA9mHERG9fAxqezO=gdLzU99gpEdw@mail.gmail.com>
Subject: Re: [PATCH 05/12] swap: cleanup setup_swap_extents
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 40EF5558BCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87765-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,tencent.com,kernel.org,kernel.dk,suse.com,mit.edu,gmail.com,samba.org,manguebit.org,wdc.com,vger.kernel.org,kvack.org,lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrisl@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:37=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Reflow setup_swap_extents so that the flag checking is not conditional on
> a swap_activate method.  This is currently a no-op because the swapoff
> code still checks the presence of a swap_deactivate method, but it
> simplifies adding a new check, and also makes the SWP_ACTIVATED flag
> more consistent.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Chris Li <chrisl@kernel.org>

Chris

